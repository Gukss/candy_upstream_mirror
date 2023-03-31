from selenium import webdriver
import pandas as pd
import time

### 리뷰수
# 곰표 2개 , 애플폭스 5개 , 베어비어 40개 ,베어비어 위트60개 , 싱하 1900개 1664로제 60개 ,  파울라너 1400개
# Jeju Pellong Ale 14개  , Jeju Geomeongale 5개
"""
에델바이스 피치
Edelweiss Pêche Blanche & Fleur de Génépi
https://www.ratebeer.com/beer/edelweiss-peche-blanche-and-fleur-de-genepi/580409/

크로넨버그 1664 블랑
Kronenbourg 1664 Blanc
https://www.ratebeer.com/beer/kronenbourg-1664-blanc/35424/

곰표밀맥주
 Gompyo Wheatbeer
https://www.ratebeer.com/beer/7braeu-gompyo-wheatbeer/1047618/

곰표썸머에일
7Bräu Gompyo Summer Ale Winter Edition
https://www.ratebeer.com/beer/7braeu-gompyo-summer-ale-winter-edition/1067818/

써머스비
Somersby Apple Cider
https://www.ratebeer.com/beer/somersby-apple-cider/86387/

애플폭스
Apple Fox
https://www.ratebeer.com/beer/apple-fox/614833/

bear beer 라거
Harboe Bear Beer Premium Lager
https://www.ratebeer.com/beer/harboe-bear-beer-premium-lager/271984/

bear beer 위트
Harboe Premium Bear Beer Wheat
https://www.ratebeer.com/beer/harboe-premium-bear-beer-wheat/469202/

bear beer 라거 다크
Harboe Dark Bear
https://www.ratebeer.com/beer/harboe-dark-bear/16919/

tiger radler graphfruit 
Tiger Radler Grapefruit
https://www.ratebeer.com/beer/tiger-radler-grapefruit/480225/

빅슬라이드 ipa
Big Slide IPA
https://www.ratebeer.com/beer/big-slide-ipa/428465/

싱하
Boon Rawd Singha
https://www.ratebeer.com/beer/boon-rawd-singha/1092/

크로넨버그 1664 rose
Kronenbourg 1664 Rosé
https://www.ratebeer.com/beer/kronenbourg-1664-rose/219343/

paulaner munchen hell
Paulaner Original Münchner Hell (Premium Lager)
https://www.ratebeer.com/beer/paulaner-original-muenchner-hell-premium-lager/2342/

제주펠롱에일 
Jeju Pellong Ale
https://www.ratebeer.com/beer/jeju-pellong-ale/784135/

제주거멍에일
Jeju Geomeongale
https://www.ratebeer.com/beer/jeju-geomeongale/1067519/

제주라거
Jeju Lager project 001
https://www.ratebeer.com/beer/jeju-lager-project-001/1046531/

대한ipa
Session IPA
https://www.ratebeer.com/beer/session-ipa/737577/

골목대장
Platinum Young Boss Gold Ale
https://www.ratebeer.com/beer/platinum-young-boss-gold-ale/801536/

에일의정석
Platinum Standard of Ale / 에일의 정석
https://www.ratebeer.com/beer/platinum-standard-of-ale/849015/

코젤 라거
Kozel Premium Lager 12°
https://www.ratebeer.com/beer/kozel-premium-lager-12/4692/
"""
beer_list =['Kronenbourg 1664 Blanc', ' Gompyo Wheatbeer' , 'Somersby Apple Cider' ,
            'Apple Fox' ,'Harboe Bear Beer Premium Lager' ,'Harboe Premium Bear Beer Wheat' ,'Boon Rawd Singha' ,
             'Kronenbourg 1664 Rosé' ,'Paulaner Original Münchner Hell (Premium Lager)']
driver = webdriver.Chrome(r'/Users/juran/tool/chromedriver')

def crawl(beer, idx):
    
    # 데이터 프레임 생성
    data = pd.DataFrame(data=[], columns=['맥주정보', '검색이름', '맥주이름'])
    
    url = 'https://www.ratebeer.com/search?tab=beer'
    
    # url open
    print('url_open... {0} 맥주 데이터를 수집합니다..'.format(beer))
    driver.get(url)
    driver.set_window_size(900, 900)
    
    # 맥주 검색
    time.sleep(2)
    element = driver.find_element_by_xpath('//*[@id="root"]/div[2]/header/div[2]/div[1]/div[2]/div/div/input')
    time.sleep(2)
    element.click()
    time.sleep(2)
    element.send_keys(beer)
    time.sleep(3)
    # 상품선택
    driver.find_element_by_xpath('//*[@id="root"]/div[2]/header/div[2]/div[1]/div[2]/div/div[2]/a[1]/div/div[2]').click()
    # 상품 이름 수집
    time.sleep(3)
    beer_name = driver.find_element_by_css_selector('.MuiTypography-root.Text___StyledTypographyTypeless-bukSfn.pzIrn.text-500.colorized__WrappedComponent-hrwcZr.hwjOn.mt-3.MuiTypography-h4').text
    error_cnt = 0
    while True:
        try :
            # 전체 리뷰 수
            time.sleep(3)
            string = driver.find_element_by_class_name('MuiTypography-root.Text___StyledTypographyTypeless-bukSfn.pzIrn.text-500.colorized__WrappedComponent-hrwcZr.hwjOn.MuiTypography-h6').text
            # ,가 포함되어 있는지에 대한 로직
            extract = re.compile('[0-9]*,*[0-9]+')
            str_num = extract.findall(string)
            str_num = str_num[0]
            print('성공... while문을 탈출합니다.')
            break
        except :
            print('오류 발생.. 다시 시작합니다.')
            error_cnt += 1
            if error_cnt == 5:
                print('연속된 오류로 다음 맥주로 넘어갑니다...')
                return
    if ',' in str_num:
        str_num = str_num.split(',')
        str_num = int(str_num[0]+str_num[1])
        num = str_num
    else:
        num = int(str_num)
    # Score breakdown
    time.sleep(3)
    element = driver.find_element_by_xpath('//*[@id="root"]/div[2]/div[2]/div/div/div/div[2]/div[4]/div/div[2]/div[1]/div[2]')
    time.sleep(3)
    # 해당 element로 이동
    driver.execute_script("arguments[0].click();", element)
    # 수집할 Page 수
    page_num = num // 15 + 1
    for i in range(page_num):
        print(i+1, '번째 페이지입니다.')
        # 맥주 정보를 통째로 수집
        time.sleep(3)
        beer_info = driver.find_elements_by_css_selector('.px-4.fj-s.f-wrap')
        tmp = []
        # 데이터프레임에 저장
        for i in range(len(beer_info)):
            tmp.append(beer_info[i].text)
        tmp = pd.DataFrame(data=tmp, columns=['맥주정보'])
        tmp['맥주이름'] = beer_name
        tmp['검색이름'] = beer
        data = pd.concat([data, tmp])
        # 다음 페이지
        try :
            element = driver.find_element_by_xpath('//button[@title="Next page"]/span[@class="MuiIconButton-label"]')
            time.sleep(3)
            driver.execute_script("arguments[0].click();", element)
        except:
            print('마지막 페이지입니다.')
    # 데이터가 중복 수집될 경우 리뷰 수 만큼만 Cut
    if num != len(data):
        data = data[:num]
    print('리뷰수 : ', num, '수집된 리뷰수 : ', len(data))
    
    # csv, excel 파일로 저장
    result = pd.merge(data, beer_list, on='검색이름', how='left')
    result.to_csv("beer_n_"+str(idx)+".csv", encoding='utf-8')
    result.to_excel("beer_n_"+str(idx)+".xlsx")
    driver.close()
    driver.quit()
    # return result

    # 맥주 리스트 개수만큼 데이터 수집
# for idx, beer_name in enumerate(beer_list['검색이름']):
#     crawl(beer_name, idx)
crawl('')
