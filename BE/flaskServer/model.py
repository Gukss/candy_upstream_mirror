
from sklearn.metrics.pairwise import cosine_similarity
import pandas as pd
import numpy as np
import random
import pymysql
import datetime
from pytz import timezone
def rename(name):
    if '(' in name:
        return name[ :name.index('(')]
    else:
        return name

def reccomend_beer_similar() :
    conn = pymysql.connect(
    host='j8b105.p.ssafy.io',
    port=8306,
    user='candy',
    password='candy@b105',
    db='candy',
    charset="utf8"
    )
    sql = """
        select b.beer_en_name , r.overall ,u.nickname , u.user_id,u.email,r.beer_id
        from review r, beer b , user u
        where b.beer_id = r.beer_id and u.user_id = r.user_id"""
    
    review_sql  = pd.read_sql_query(sql,conn)
    review_beer = review_sql[['beer_en_name']].drop_duplicates().reset_index(drop=True)
    # print(" 리뷰 비어 : ",review_beer)
    sql = "select * from beer"
    beer_sql = pd.read_sql_query(sql,conn)
    # print(beer_sql.shape[0])

    # 리뷰에 없는 맥주는 따로 관리
    non_review_beer = beer_sql[~beer_sql['beer_en_name'].isin(review_beer['beer_en_name']) ]
    # print("논 리뷰 비어 : ",non_review_beer)
    for index, row in non_review_beer.iterrows() :
        print(row['beer_id'])
        cur_now=datetime.datetime.now(timezone('Asia/Seoul'))
        cur_now = cur_now.strftime("%Y-%m-%d %H:%M:%S")+".000000"
        # print(" cur _now :  ",cur_now)
        # print("user_id  :   ",user_id)
        cnt=0
        beer_id_list = ""
        while cnt < 10:
            random_int = random.randint(1, beer_sql.shape[0])
            if random_int != row['beer_id']:
                beer_id_list+=str(random_int)+" "
                cnt+=1
        sql ="INSERT INTO candy.recommendation_similarity(created_at, updated_at, constructor, is_delete, updater,beer_id_list , beer_id) VALUES("
        sql+="'"+cur_now+"',"
        sql+="'"+cur_now+"',"
        sql+="'"+"admin@admin.com"+"',"
        sql+="false"+","
        sql+="'"+"admin@admin.com"+"',"
        sql+="'"+beer_id_list+"',"
        sql+=str(row['beer_id'])+")"
        print(sql)
        conn.cursor().execute(sql)
    




    review_beer = beer_sql[beer_sql['beer_en_name'].isin(review_beer['beer_en_name']) ]
    beer_matrix = review_sql.pivot_table(index='beer_en_name', columns='email', values='overall')
    beer_matrix.fillna(0, inplace=True)
    beer_similarity = cosine_similarity(beer_matrix)
    beer_similarity = pd.DataFrame(data=beer_similarity, index=beer_matrix.index, columns=beer_matrix.index)
    for index , row in review_beer.iterrows():
        beer_rec = beer_similarity.loc[row['beer_en_name']].sort_values(ascending=False)[1:11]
        on_review_beer_id_list=""
        for i in beer_rec.index :
            on_review_beer_id_list+=str(int(beer_sql.loc[beer_sql['beer_en_name']==i]['beer_id']))+" "
        cur_now=datetime.datetime.now(timezone('Asia/Seoul'))
        cur_now = cur_now.strftime("%Y-%m-%d %H:%M:%S")+".000000"
        # print(" cur _now :  ",cur_now)
        # print("user_id  :   ",user_id)
        sql ="INSERT INTO candy.recommendation_similarity(created_at, updated_at, constructor, is_delete, updater,beer_id_list , beer_id) VALUES("
        sql+="'"+cur_now+"',"
        sql+="'"+cur_now+"',"
        sql+="'"+"admin@admin.com"+"',"
        sql+="false"+","
        sql+="'"+"admin@admin.com"+"',"
        sql+="'"+on_review_beer_id_list+"',"
        sql+=str(row['beer_id'])+")"
        print(sql)
        conn.cursor().execute(sql)
    conn.commit()
    conn.close()
    return "유사도 추천 종료"


# 만약 해당 유저가 작성한 리뷰가 없다면
# 그유저가 회원가입때 사용한 선호도 기반으로 새로 추천
# 각각의 인자들은 'Aroma' 이런형식으로 스트링을 보낸다.
def reccomend_beer_prefer_base(prefer_list, user_id) :
    conn = pymysql.connect(
    host='j8b105.p.ssafy.io',
    port=8306,
    user='candy',
    password='candy@b105',
    db='candy',
    charset="utf8"
    )

    first = prefer_list[0]
    second = prefer_list[1]
    third= prefer_list[2]
    forth = prefer_list[3]
    # print("first : " , first)
    # print("second : " , second)
    # print("third : " , third)
    # print("forth : " , forth)
    sql = "select * from beer"
    sql_beer = pd.read_sql_query(sql,conn)
    old_cols = [first, second, third,forth]
    new_cols = []
    new_cols.append(first + '_new')
    new_cols.append(second + '_new')
    new_cols.append(third + '_new')
    new_cols.append(forth + '_new')
    weights = [1, random.uniform(0.85,0.95),random.uniform(0.75,0.8) , 0.7]
    for i in range(0, 4):
        sql_beer[new_cols[i]] = sql_beer[old_cols[i]].apply(lambda x: x * weights[i])
    lenght = len(sql_beer)
    overall_list = []
    for i in range(0, lenght):
        overall = (format(sql_beer.loc[i, 'aroma_new'] + sql_beer.loc[i, 'flavor_new'] + sql_beer.loc[i, 'mouthfeel_new']+ sql_beer.loc[i, 'appearance_new']))
        overall_list.append(overall)
        
    sql_beer.insert(0, 'overall_new', overall_list)
    
    beer_list = sql_beer.sort_values(by='overall_new').head(10)[['beer_kr_name','beer_id']]
    
    beer_id_list = ""
    for i in range (beer_list.shape[0]) :
        beer_id_list+= str(beer_list.iloc[i]['beer_id'])+" "

    cur_now=datetime.datetime.now(timezone('Asia/Seoul'))
    cur_now = cur_now.strftime("%Y-%m-%d %H:%M:%S")+".000000"
    # print(" cur _now :  ",cur_now)
    # print("user_id  :   ",user_id)
    
    sql ="INSERT INTO candy.recommendation_candy(created_at, updated_at, constructor, is_delete, updater,beer_id_list , user_id) VALUES("
    sql+="'"+cur_now+"',"
    sql+="'"+cur_now+"',"
    sql+="'"+"admin@admin.com"+"',"
    sql+="false"+","
    sql+="'"+"admin@admin.com"+"',"
    sql+="'"+beer_id_list+"',"
    sql+=str(user_id)+")"
    print(sql)
    conn.cursor().execute(sql)
    conn.commit()
    conn.close()
    return beer_list


def get_similar_users(name, n,user_similarity):
    return user_similarity.loc[name].sort_values(ascending=False)[:n]

def del_rated_beer(df, user, i):
    # user: 추천을 원하는 사용자
    # i: 사용자와 유사한 취향을 가진 사용자
    
    # i 사용자가 마셔본 맥주 중 user 사용자가 마셔본 맥주 제외
    return df[df[user] == 0][['beer_en_name', user, i]]


# 협업 필터링 기반으로 추천해주는 메소드
def reccomend_cf (email,cur_user_id):
    conn = pymysql.connect(
    host='j8b105.p.ssafy.io',
    port=8306,
    user='candy',
    password='candy@b105',
    db='candy',
    charset="utf8"
    )
    sql = """
        select b.beer_en_name , r.overall ,u.nickname , u.user_id,u.email
        from review r, beer b , user u
        where b.beer_id = r.beer_id and u.user_id = r.user_id"""
    
    review_sql  = pd.read_sql_query(sql,conn)
    # print(review_sql.shape)
    beer_matrix = review_sql.pivot_table(index='beer_en_name', columns='email', values='overall')

    beer_matrix.fillna(0, inplace=True)
    id_matrix = beer_matrix.transpose()
    user_similarity = cosine_similarity(id_matrix)
    user_similarity = pd.DataFrame(data=user_similarity, index=id_matrix.index, columns=id_matrix.index)
    users = get_similar_users(email, 2,user_similarity).index[1:2]
    
    beer_list = del_rated_beer(beer_matrix.reset_index(), email, users[0]).sort_values(users[0], ascending=False)['beer_en_name'][:10]
    sql = "select beer_id , beer_en_name  from  beer"
    sql_suer =pd.read_sql_query(sql , conn)

    # print("기존 beer list : ", beer_list)
    beer_id_list=""
    for i in beer_list :
        beer_id_list+=str(int(sql_suer.loc[sql_suer['beer_en_name']==i]['beer_id']))+" "
    
    cur_now=datetime.datetime.now(timezone('Asia/Seoul'))
    cur_now = cur_now.strftime("%Y-%m-%d %H:%M:%S")+".000000"
    # print(" cur _now :  ",cur_now)
    # print("user_id  :   ",user_id)
    
    sql ="INSERT INTO candy.recommendation_candy(created_at, updated_at, constructor, is_delete, updater,beer_id_list , user_id) VALUES("
    sql+="'"+cur_now+"',"
    sql+="'"+cur_now+"',"
    sql+="'"+"admin@admin.com"+"',"
    sql+="false"+","
    sql+="'"+"admin@admin.com"+"',"
    sql+="'"+beer_id_list+"',"
    sql+=str(cur_user_id)+")"


    conn.cursor().execute(sql)
    conn.commit()
    conn.close()
    return "협업 필터링 작업완료"

# email 을 받으면 해당 유저에 대한 candy로직을 분기해주는 메소드
def reccomend_candy(conn,email) :
    sql="select user_id , email from user"
    user = pd.read_sql_query(sql,conn)
    cur_user_id  = int(user.loc[user['email']==email]['user_id'])
    sql = "select *  from candy.review r , candy.user u where r.user_id = u.user_id and u.email= "+'"'+email+'"' 
    review_beer = pd.read_sql_query(sql,conn)
    if review_beer.empty :
        sql = "SELECT flavor , aroma , appearance , mouthfeel  FROM candy.preference where user_id ="+str(cur_user_id)
        prefer = pd.read_sql_query(sql ,conn)
        if prefer.empty :
            print('here!')
            prefer_list =['aroma','mouthfeel' , 'appearance' ,'flavor']
            reccomend_beer_prefer_base(  prefer_list,cur_user_id)    
        else :
            prefer = prefer.transpose()
            prefer_list=['','','','']
            for i in range(prefer.shape[0]) :
                prefer_list[prefer[0].iloc[i]-1] =prefer.index[i] 
            print(prefer_list)
            reccomend_beer_prefer_base( prefer_list ,cur_user_id)
    else :
        reccomend_cf(email,cur_user_id)
    return "분기완료"
# 컨트롤러에서 명령을 실행하면 한번에 모든 sql에다 추천값들을 
# 최신화 해주는 통제탑 같은 메소드
def recommend_flow() :
    conn = pymysql.connect(
    host='j8b105.p.ssafy.io',
    port=8306,
    user='candy',
    password='candy@b105',
    db='candy',
    charset="utf8"
    )
    
    #  테스트 코드
    # reccomend_candy(conn, '2700411378@candy.com')
    # reccomend_candy(conn, 'ac@naver.com')

    # 실전 코드
    # 모든 더미가 아닌 유저 데이터 최신화
    sql="select user_id , email from candy.user where updater != 'admin@admin.com'"
    user_emails = pd.read_sql_query(sql,conn)
    for i in range(user_emails.shape[0]) :
        cur_email =str(user_emails.iloc[i]['email'])
        reccomend_candy(conn, cur_email)
        print(str(user_emails.iloc[i]['email']))
    reccomend_beer_similar()

    # print(reccomend_beer_prefer_base(conn , 'aroma','appearance' , 'flavor','mouthfeel'))
    
    conn.close()
    return "전부 순회 완료!"
# print(recommend_flow())
# reccomend_beer_similar()
# conn = pymysql.connect(
# host='j8b105.p.ssafy.io',
# port=8306,
# user='candy',
# password='candy@b105',
# db='candy',
# charset="utf8"
# )
# reccomend_candy(conn ,'ttt@naver.com')

# conn.close()
# print(datetime.datetime.now(timezone('Asia/Seoul')))