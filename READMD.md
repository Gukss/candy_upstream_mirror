# README

![image 133 (1)](https://user-images.githubusercontent.com/61752860/230023148-af223e59-b308-4f92-803d-1a48a5dbb030.png)

## **📑** 주제

바코드로 맥주 찾기 및 맥주 추천 서비스

---

---

## **🎉** 프로젝트 소개

### 문제

현재 국내 출시하는 맥주의 종류가 많아지고 있다. 많은 맥주 중 어떤 맥주가 본인이 좋아하는 맛의 맥주일지 알 수 없는 문제가 있다. 

### 해결방안

1. 카메라로 맥주 바코드를 스캔해 해당 맥주의 정보와 리뷰를 바로 확인할 수 있다.
2. 사용자 정보와 리뷰를 기반으로 맥주를 추천해준다.

---

---

## **🔑** 주요 기능

1. 카메라로 바코드를 스캔해 맥주 정보와 리뷰 확인, 리뷰 남기기
2. 사용자 정보와 리뷰 기반으로 추천 알고리즘이 추천해주는 맥주 확인

---

---

## **🖥** 서비스 화면
<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230019029-ed1ad568-44a6-4944-aea7-a03f21716259.gif" height="650px" width="450px"></p>

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230019123-b98a29a1-5e8d-4133-96ba-7e58f423e85b.gif" height="650px" width="450px" ></p>

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230241919-a3e0419a-f449-413e-b7c1-a5c5f1f88925.gif" height="650px" width="450px"></p>

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230019368-cc4f6d37-6514-4e43-838d-b8478911804f.gif" height="650px" width="450px"></p>

---

---

## **🎨** 화면 설계서

### 메인페이지

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230019579-ba4e4a69-394a-42ed-af6a-ba868b2fd91a.png" height="650px" width="450px"></p>

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230019654-68191633-19b8-4ae4-afc9-b035e9b0fda6.png" height="650px" width="450px"></p>

### 맥주 검색

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230019747-f106b786-2beb-4c5b-86e9-3cd3b62c4f5e.png" height="650px" width="450px"></p>

### 바코드로 맥주 검색 or 인증

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230019845-091b2cb8-72df-44d5-b30e-e1f4a812d185.png" height="650px" width="450px"></p>

### 맥주 상세 페이지

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230019946-95ed7406-afdc-4a00-997f-9d04693461ba.png" height="650px" width="450px"></p>

### 마이 페이지 (음주 기록)

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230020049-44d0df09-aba2-46eb-a3c5-e790f8754e2f.png" height="650px" width="450px"></p>

### 마이페이지 (맥주 도감)

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230020307-9116d609-5ba9-4024-85f1-e3aeff47e8a9.png" height="650px" width="450px"></p>

### 마이페이지 (음주 내역)

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230020422-cfb569f4-26d1-44b2-8b3d-6355b6883f61.png" height="650px" width="450px"></p>

---

---

## **⚙** 아키텍처

![image 133 (1)](https://user-images.githubusercontent.com/61752860/230020529-a5c7f4b5-031f-40e6-898f-f0babe4e7d87.png)

---

---

## **📝** ERD

![image 133 (1)](https://user-images.githubusercontent.com/61752860/230021806-8dae1ae6-b612-4f99-9af2-8acab37778bb.png)

---

---

## **🛠** 주요 기술

### 백

- openJDK 11
- IntelliJ IDE
- Springboot 2.7.7
- Spring Data JPA
- Spring Web
- MySql: 8.0.32
- python: 3.11.2
- flask: 2.2.3
- redis: 5.0.7

### 프론트

## 프로젝트 빌드 (README에는 빼기)

### 백

### 프론트

## **🛠** 협업 툴

- Git
- Notion
- Jira
- Figma

## **🛠** 협업 환경

### Git

- 코드 버전을 관리

### Notion

- 회의가 있을 때 마다 회의록을 기록해 보관
- 기술 공부 시 문서를 작성해 팀원과 공유
- 같은 버그 발생 시 빠른 해결을 위해 디버깅 내역을 기록
- 기능명세서, ERD, REST API 등 모두가 공유해야하는 문서 관리
- 컨벤션 정리
- 간트차트 관리

### Jira

- 매주 목표량을 설정해 Sprint 진행
- 업무의 할당량을 정해 Story Point를 설정하고, In-Progress → Done 순으로 작업

### Figma

- 화면 설계서 작성

---

---

## 📄 시연 시나리오

### 맥주 추천

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230022134-24d4c5a5-019b-4c7f-8176-a02da341bb42.png" height="650px" width="450px"></p>

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230022192-cac8b4c1-0a0e-4b13-ba74-05823d8eee5b.png" height="650px" width="450px"></p>

1. 사용자가 로그인을 하고 메인페이지에 접속한다.
2. 사용자의 데이터를 기반으로 맥주를 추천해준다.
    
    2-1. candy 추천 
    
    1. 사용자가 선호하는 맥주를 남긴 리뷰를 기반으로 파악하여 해당 맥주와 비슷한 맥주를 추천한다.
    2. 리뷰가 없을 경우 회원가입 시 받아오는 맥주 선호도 데이터를 기반으로 추천한다.
    
    2-2. 비슷한 맥주 추천
    
    1. 사용자가 최근에 조회한 맥주와 비슷한 맥주를 추천한다.
    
    2-3. 유저 Pick
    
    1. 하루를 기준으로 좋아요를 많이 받은 리뷰의 맥주를 추천한다.

### 맥주의 자세한 정보를 위한 검색

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230019747-f106b786-2beb-4c5b-86e9-3cd3b62c4f5e.png" height="650px" width="450px"></p>

1. 맥주이름을 영문 or 한글로 검색한다.
2. 해당하는 맥주리스트가 나오며 클릭시 맥주 상세 페이지를 보여준다.

### 맥주 상세 페이지

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230019946-95ed7406-afdc-4a00-997f-9d04693461ba.png" height="650px" width="450px"></p>

1. 맥주 이미지를 클릭하거나 바코드 인식시 상세페이지로 넘어온다.
2. 맥주 상세페이지에는 다양한 정보가 나온다
    1. 맥주 이름 (영문,한글)
    2. 사용자들이 남긴 별점의 평균
    3. 맥주의 종류 (에일,페일 등등,,,)
    4. 맥주의 원산지와 도수가 나온다.
    5. 사용자가 해당 맥주에 좋아요를 눌렀는지 아이콘으로 표시된다.
    6. 해당 맥주의 색깔, 바디감, 맛, 향이 표시되며 사용자들이 남긴 리뷰의 평균치로 표시된다.

### 바코드를 이용하여 맥주 검색 및 맥주 인증

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230019845-091b2cb8-72df-44d5-b30e-e1f4a812d185.png" height="650px" width="450px"></p>

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230022483-4f1c9346-9f73-4eb0-80a3-e36fc8b377b4.png" height="650px" width="450px"></p>

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230022574-beed1670-1704-4343-a33e-abc8d1be0672.png" height="650px" width="450px"></p>

1. 스캐너를 이용하여 맥주 바코드를 찍으면 맥주 상세페이지가 나온다  
2. ‘오늘 마신 맥주가 맞으십니까?’라는 팝업창이 나오고 확인 시 음주 기록이 추가된다.
3. ‘리뷰를 등록 하시겠습니까’라는 팝업창이 나오고 확인 시 리뷰 페이지로 넘어간다. 

### 음주 기록

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230020049-44d0df09-aba2-46eb-a3c5-e790f8754e2f.png" height="650px" width="450px"></p>

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230020307-9116d609-5ba9-4024-85f1-e3aeff47e8a9.png" height="650px" width="450px"></p>

<p align="center"><img src="https://user-images.githubusercontent.com/61752860/230020422-cfb569f4-26d1-44b2-8b3d-6355b6883f61.png" height="650px" width="450px"></p>

1. 맥주를 인증한 날에는 음주 기록 달력에서 노란색상으로 날짜에 표시된다.
2. 마신 맥주는 색상으로 마시지 않은 맥주는 흑백으로 맥주 도감에 표시되며 다양한 정렬 리스트가 있다.
    1. 전체 : 모든 맥주가 나온다.
    2. 좋아요한 맥주 : 사용자가 좋아요한 맥주만 출력된다.
    3. 마신 맥주 , 마시지 않은 맥주 : 사용자가 마신 맥주와 마시지 않은 맥주만 나오게 된다.
3. 맥주 도감에서 총 맥주의 갯수 중 몇 개의 맥주를 마셨는지 퍼센트로 나오게 된다.
4. 음주 내역에는 음주 일 수, 연속 음주 일 수, 총 마신 캔 수, 상위 몇 퍼센트 애주가인지 나오게된다.
5. 또한 사용자가 마신 맥주의 종류와 맥주 원산지를 Pie 차트 형식으로 나타낸다.

## **🗓** 프로젝트 기간

`2023.02.20 ~ 2023.04.07 (약7주)`

## ❤️ ****팀원

### 프론트

[eunjijilong - Overview](https://github.com/eunjijilong)

[Taco-Developer - Overview](https://github.com/Taco-Developer)

### 백

[Gukss - Overview](https://github.com/Gukss)

[sksn12 - Overview](https://github.com/sksn12)

[cwelly - Overview](https://github.com/cwelly)

[yyh7750 - Overview](https://github.com/yyh7750)
