from flask import Flask ,   request # 서버 구현을 위한 Flask 객체 import
from flask_restx import Api, Resource  # Api 구현을 위한 Api 객체 import
from apscheduler.schedulers.background import BackgroundScheduler
import datetime
from pytz import timezone
import model
import logging 
import pymysql
app = Flask(__name__)  # Flask 객체 선언, 파라미터로 어플리케이션 패키지의 이름을 넣어줌.
api = Api(app)  # Flask 객체에 Api 객체 등록
schedule = BackgroundScheduler(daemon=True, timezone='Asia/Seoul')

def recommend_and_schedule():
    model.recommend_flow()
    print("오늘의 스케줄링 끝!")

def make_log():
    logger.info("hello world!")
    

schedule.add_job(recommend_and_schedule, 'cron', week='1-53', day_of_week='0-6', hour='4')
# schedule.add_job(recommend_and_schedule, 'cron', week='1-53', day_of_week='0-6',minute='30')
schedule.add_job(make_log, 'cron', week='1-53', day_of_week='0-6', hour='1-23')

schedule.start()

@api.route('/hello')  # 데코레이터 이용, '/hello' 경로에 클래스 등록
class HelloWorld(Resource):
    def get(self):  # GET 요청시 리턴 값에 해당 하는 dict를 JSON 형태로 반환
        return {"hello": "world!"}

@api.route('/checkTime')  # 데코레이터 이용, '/hello' 경로에 클래스 등록
class HelloWorld(Resource):
    def get(self):  # GET 요청시 리턴 값에 해당 하는 dict를 JSON 형태로 반환
        return {"curTime": str(datetime.datetime.now(timezone('Asia/Seoul')))}

@api.route('/make')  # 데코레이터 이용, '/hello' 경로에 클래스 등록
class HelloWorld(Resource):
    def get(self):  # GET 요청시 리턴 값에 해당 하는 dict를 JSON 형태로 반환
        model.recommend_flow()
        return {"result": "추천이 완료되었습니다"}

@api.route('/reccomand')
class ReccomandBeer(Resource):
    def post(self):
        email  = request.headers.get('email')
        print(email)
        conn = pymysql.connect(
        host='j8b105.p.ssafy.io',
        port=8306,
        user='candy',
        password='candy@b105',
        db='candy',
        charset="utf8"
        )
        model.reccomend_candy(conn, email)
        conn.close()
        return {"result": "success"}

LOG_FORMATTER = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s', datefmt='%Y-%m-%d:%H:%M:%S')
logger = logging.getLogger()
logger.setLevel(logging.INFO)

my_test_log_handler = logging.StreamHandler()
my_test_log_handler.setLevel(logging.INFO)

my_test_log_handler.setFormatter(LOG_FORMATTER)

logger.addHandler(my_test_log_handler)
if __name__ == "__main__":
    app.run(debug=False,use_reloader=False, host='0.0.0.0', port=90)