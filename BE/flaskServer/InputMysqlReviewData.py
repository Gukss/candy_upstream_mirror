
import pandas as pd
import numpy as np
import pymysql
from urllib.parse import quote_plus
import sqlalchemy
from sqlalchemy import create_engine
# desc : 크롤링한 데이터를 가공하여  review 테이블에 넣기 위한 py파일
#
#

def rename(name):
    if '(' in name:
        return name[ :name.index('(')]
    else:
        return name

data = pd.read_csv('data/정제된데이터.csv', encoding='utf-8', index_col=0) # 맥주 리뷰 데이터 전처리 후
data['아이디'] = data['아이디'].apply(rename)




## DB연결을 위한 정보######################################################
conn = pymysql.connect(
    host='j8b105.p.ssafy.io',
    port=8306,
    user='candy',
    password='candy@b105',
    db='candy',
    charset="utf8"
)
# user="candy"
# password = "candy@b105"
# host = "j8b105.p.ssafy.io"
# database = "candy"
# port=8306
# password = quote_plus(password)
# engine = create_engine(f"mysql://{user}:{password}@{host}:{port}/{database}")
# conn = engine.connect()
sql="select * from user"
sql_user = pd.read_sql_query(sql,conn)
sql = "select * from beer"
sql_beer = pd.read_sql_query(sql,conn)
# # dtypesql = {'exclusive':sqlalchemy.types.VARCHAR(10), 
# #           'cost':sqlalchemy.types.VARCHAR(10), 
# #           'contractedAt':sqlalchemy.Date(), 
# #           'createdAt':sqlalchemy.DateTime(), 
# # }
print('리얼 sql에 있는 값 : ')
print(sql_user.shape)
filttered_user= sql_user.loc[sql_user['constructor']=='admin@admin.com']
print("DB에 있는 유저 값 : ")
print(filttered_user.shape)
unique_name_city_df = data[['아이디']].drop_duplicates().reset_index(drop=True)
print("csv 에 있는 유저 값 : ")
print(unique_name_city_df.shape)

review_df = pd.DataFrame(columns=[
                                     'appearance',
                                     'aroma',
                                     'flavor',
                                     'mouthfeel',
                                     'overall',
                                     'beer_id',
                                     'user_id'
                                     ])
review_df.astype({'user_id':'int','beer_id':'int'}).dtypes
for  index, row in data.iterrows() :
    tmp_beer_id = sql_beer.loc[sql_beer['beer_en_name']==row['맥주']]['beer_id']
    tmp_user_id = filttered_user.loc[filttered_user['nickname']==row['아이디']]['user_id']
    tmp_appearance = row['Appearance']
    tmp_aroma = row['Aroma']
    tmp_flavor = row['Flavor']
    tmp_mouthfeel = row['Mouthfeel']
    tmp_overall=row['Overall']
    new_row = {'beer_id': tmp_beer_id, 'user_id': tmp_user_id, 'appearance':tmp_appearance ,
               'aroma':tmp_aroma , 'flavor':tmp_flavor , 'mouthfeel' : tmp_mouthfeel , 'overall':tmp_overall}
    review_df= pd.concat([review_df,  pd.DataFrame.from_dict(data=new_row, orient='columns')] , ignore_index=True)
    
print(review_df.head())
print(review_df.sample)
print(review_df.shape)

review_df['created_at']= "2023-03-22 09:56:24.00000"
review_df['updated_at']= "2023-03-22 09:56:24.00000"
review_df['constructor']="admin@admin.com"
review_df['is_delete']=False
review_df['updater']="admin@admin.com"
review_df['like_count']=0
review_df['contents']=' '
addr = "D:\\workspace\\S08P22B105\\BE\\flaskServer\\"
review_df.to_csv(path_or_buf=addr+'import_sql.csv')



# unique_name_city_df.to_sql(
#     name='user',
#     con= engine,
#     if_exists='append',
#     index=False
#     # dtype=dtypesql
# )
conn.close()
################################################################



# print(filttered_user.tail())
# print(filttered_user.shape)



