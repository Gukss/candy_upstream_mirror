
from sklearn.metrics.pairwise import cosine_similarity
import pandas as pd
import numpy as np


def rename(name):
    if '(' in name:
        return name[ :name.index('(')]
    else:
        return name

def reccomend_beer_prefer_base(first , second , third , forth) :
    data = pd.read_csv('data/정제된데이터.csv', encoding='utf-8', index_col=0) 
    data['아이디'] = data['아이디'].apply(rename)
    df = pd.read_csv('data/맥주_종류별_평점.csv', encoding='utf-8', index_col=0) 
    beer_matrix = data.pivot_table(index='맥주', columns='아이디', values='평점')
    beer_matrix.fillna(0, inplace=True)
    print(beer_matrix.shape)
    beer_similarity = cosine_similarity(beer_matrix)
    beer_similarity = pd.DataFrame(data=beer_similarity, index=beer_matrix.index, columns=beer_matrix.index)
    print(beer_similarity.head(10))
    return "heell"

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
reccomend_beer_prefer_base('aroma','apperence' , 'flavor','mouthfeel')


