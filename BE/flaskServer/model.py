
import pandas as pd
import numpy as np

def rename(name):
    if '(' in name:
        return name[ :name.index('(')]
    else:
        return name

data = pd.read_csv('data/정제된데이터.csv', encoding='utf-8', index_col=0) # 맥주 리뷰 데이터 전처리 후
data['아이디'] = data['아이디'].apply(rename)
user_list = list(data['아이디'].unique())
# print(data.head())
unique_name_city_df = data[['아이디']].drop_duplicates().reset_index(drop=True)
n_rows = len(unique_name_city_df)
new_col = [f"{i+1}@review.com" for i in range(n_rows)]

unique_name_city_df['email'] = new_col
unique_name_city_df['created_at']= "2023-03-22 09:56:24.00000"
unique_name_city_df['updated_at']= "2023-03-22 09:56:24.00000"
unique_name_city_df['constructor']="admin@admin.com"
print(unique_name_city_df)

