
from sklearn.metrics.pairwise import cosine_similarity
import pandas as pd
import numpy as np
import random
import pymysql

def rename(name):
    if '(' in name:
        return name[ :name.index('(')]
    else:
        return name

# 만약 해당 유저가 작성한 리뷰가 없다면
# 그유저가 회원가입때 사용한 선호도 기반으로 새로 추천
# 각각의 인자들은 'Aroma' 이런형식으로 스트링을 보낸다.
def reccomend_beer_prefer_base(conn , first , second , third , forth) :
    sql = "select * from beer"
    sql_beer = pd.read_sql_query(sql,conn)
    print(sql_beer.columns)
    old_cols = [first, second, third,forth]


    new_cols = []
    new_cols.append(first + '_new')
    new_cols.append(second + '_new')
    new_cols.append(third + '_new')
    new_cols.append(forth + '_new')

    weights = [1, random.uniform(0.85,0.95),random.uniform(0.75,0.8) , 0.7]
    print(weights)
    for i in range(0, 4):
        sql_beer[new_cols[i]] = sql_beer[old_cols[i]].apply(lambda x: x * weights[i])
        
    lenght = len(sql_beer)

    overall_list = []

    for i in range(0, lenght):
        overall = (format(sql_beer.loc[i, 'aroma_new'] + sql_beer.loc[i, 'flavor_new'] + sql_beer.loc[i, 'mouthfeel_new']+ sql_beer.loc[i, 'appearance_new']))
        overall_list.append(overall)
        
    sql_beer.insert(0, 'overall_new', overall_list)
    # beer_list = sql_beer.sort_values(by='overall_new')['beer_kr_name'][:10]
    beer_list = sql_beer.sort_values(by='overall_new').head(10)[['beer_kr_name','beer_id']]
    print(beer_list)
    # data = pd.read_csv('data/정제된데이터.csv', encoding='utf-8', index_col=0) 
    # data['아이디'] = data['아이디'].apply(rename)
    # df = pd.read_csv('data/맥주_종류별_평점.csv', encoding='utf-8', index_col=0) 
    # beer_matrix = data.pivot_table(index='맥주', columns='아이디', values='평점')
    # beer_matrix.fillna(0, inplace=True)
    # print(beer_matrix.shape)
    # beer_similarity = cosine_similarity(beer_matrix)
    # beer_similarity = pd.DataFrame(data=beer_similarity, index=beer_matrix.index, columns=beer_matrix.index)
    # print(beer_similarity.head(10))
    return beer_list

def del_rated_beer(df, user, i):
    # user: 추천을 원하는 사용자
    # i: 사용자와 유사한 취향을 가진 사용자
    
    # i 사용자가 마셔본 맥주 중 user 사용자가 마셔본 맥주 제외
    return df[df[user] == 0][['beer_en_name', user, i]]


# 협업 필터링 기반으로 추천해주는 메소드
def reccomend_cf (conn,email,cur_user_id):
    sql = """
        select b.beer_en_name , r.overall ,u.nickname , u.user_id,u.email
        from review r, beer b , user u
        where b.beer_id = r.beer_id and u.user_id = r.user_id"""
    
    review_sql  = pd.read_sql_query(sql,conn)
    print(review_sql.shape)
    beer_matrix = review_sql.pivot_table(index='beer_en_name', columns='email', values='overall')

    beer_matrix.fillna(0, inplace=True)
    id_matrix = beer_matrix.transpose()
    user_similarity = cosine_similarity(id_matrix)
    user_similarity = pd.DataFrame(data=user_similarity, index=id_matrix.index, columns=id_matrix.index)

    print(user_similarity.head())
    return "협업 필터링 작업완료"

# email 을 받으면 해당 유저에 대한 candy로직을 분기해주는 메소드
def reccomend_candy(conn,email) :
    
    sql = "select *  from candy.review r , candy.user u where r.user_id = u.user_id and u.email= "+'"'+email+'"' 
    review_beer = pd.read_sql_query(sql,conn)
    if review_beer.empty :
        reccomend_beer_prefer_base(conn , 'aroma','appearance' , 'flavor','mouthfeel')
    else :
        sql="select user_id , email from user"
        user = pd.read_sql_query(sql,conn)
        cur_user_id  = user.loc[user['email']==email]['user_id']
        print(reccomend_cf(conn,email,cur_user_id))
    return "분기완료"

# data = pd.read_csv('data/정제된데이터.csv', encoding='utf-8', index_col=0) # 맥주 리뷰 데이터 전처리 후
# data['아이디'] = data['아이디'].apply(rename)
# user_list = list(data['아이디'].unique())
# # print(data.head())
# unique_name_city_df = data[['아이디']].drop_duplicates().reset_index(drop=True)
# n_rows = len(unique_name_city_df)
# new_col = [f"{i+1}@review.com" for i in range(n_rows)]

# unique_name_city_df['email'] = new_col
# unique_name_city_df['created_at']= "2023-03-22 09:56:24.00000"
# unique_name_city_df['updated_at']= "2023-03-22 09:56:24.00000"
# unique_name_city_df['constructor']="admin@admin.com"
# print(unique_name_city_df)
conn = pymysql.connect(
    host='j8b105.p.ssafy.io',
    port=8306,
    user='candy',
    password='candy@b105',
    db='candy',
    charset="utf8"
)
reccomend_candy(conn, 'ac@naver.com')
# print(reccomend_beer_prefer_base(conn , 'aroma','appearance' , 'flavor','mouthfeel'))
conn.close()

