
import pandas as pd
import numpy as np
import pymysql
from urllib.parse import quote_plus
import sqlalchemy
from sqlalchemy import create_engine
# desc : 크롤링한 데이터를 가공하여 user테이블에 넣기 위한 py파일
#
#

def rename(name):
    if '(' in name:
        return name[ :name.index('(')]
    else:
        return name


data = pd.read_csv('data/정제된데이터.csv', encoding='utf-8', index_col=0) # 맥주 리뷰 데이터 전처리 후
data['아이디'] = data['아이디'].apply(rename)
beer_list = list(data['맥주'].unique())


unique_name_city_df = data[['아이디']].drop_duplicates().reset_index(drop=True)
unique_beer = data[['맥주']].drop_duplicates().reset_index(drop=True)
n_rows = len(unique_name_city_df)
new_col = [f"{i+1}@review.com" for i in range(n_rows)]

unique_name_city_df['email'] = new_col
unique_name_city_df['created_at']= "2023-03-22 09:56:24.00000"
unique_name_city_df['updated_at']= "2023-03-22 09:56:24.00000"
unique_name_city_df['constructor']="admin@admin.com"
unique_name_city_df['is_delete']=False
unique_name_city_df['updater']="admin@admin.com"
unique_name_city_df['birth']="2021-02-01"
unique_name_city_df['gender']="M"
unique_name_city_df.rename(columns={'아이디': 'nickName'} ,inplace=True)
unique_name_city_df['profile_image']="https://cdn.pixabay.com/photo/2016/09/14/11/35/beer-1669273_960_720.png"
unique_name_city_df['role']=0
print(" db에 넣을 값")
print(unique_name_city_df.shape)
addr = "D:\\workspace\\S08P22B105\\BE\\flaskServer\\"
unique_name_city_df.to_csv(path_or_buf=addr+'import_user_sql.csv')
## DB연결을 위한 정보######################################################
# conn = pymysql.connect(
#     host='j8b105.p.ssafy.io',
#     port=8306,
#     user='candy',
#     password='candy@b105',
#     db='candy',
#     charset="utf8"
# )
user="candy"
password = "candy@b105"
host = "j8b105.p.ssafy.io"
database = "candy"
port=8306
password = quote_plus(password)
engine = create_engine(f"mysql://{user}:{password}@{host}:{port}/{database}")
conn = engine.connect()

# # dtypesql = {'exclusive':sqlalchemy.types.VARCHAR(10), 
# #           'cost':sqlalchemy.types.VARCHAR(10), 
# #           'contractedAt':sqlalchemy.Date(), 
# #           'createdAt':sqlalchemy.DateTime(), 
# # }

unique_name_city_df.to_sql(
    name='user',
    con= engine,
    if_exists='append',
    index=False
    # dtype=dtypesql
)

conn.close()
################################################################
