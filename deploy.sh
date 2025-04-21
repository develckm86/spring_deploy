#bash deploy.sh
PEM="/Users/som/Desktop/springbootstudykey.pem"
REMOTE="ubuntu@3.25.83.67"
REMOTE_DIR="/home/ubuntu/l08_spring_jpa_rest"
LOCAL_JAR="build/libs/l08_spring_jpa_rest-0.0.1-SNAPSHOT.jar"

echo "🔨 JAR 빌드 중..."
./gradlew clean build -x test

echo "📦 JAR 전송 중..."
scp -i $PEM $LOCAL_JAR $REMOTE:$REMOTE_DIR/app.jar

echo "🚀 서버에서 실행 중..."
ssh -i $PEM $REMOTE << EOF
    pkill -f "java -jar" || true
    sudo nohup java -jar $REMOTE_DIR/app.jar > $REMOTE_DIR/app.log 2>&1 &
EOF
# nohup : no hang up 터미널이 종료되도 실행되게 함
# java -jar $REMOTE_DIR/app.jar : 전송된 jar 파일 실행
# > : logger로 출력한 내역을 파일로 내보냄
# $REMOTE_DIR/app : 로그파일 경로
# 2>&1 : 에러를 로그로 저장하겠다
# & 지금 명령어를 백그라운드에서 처리(터미널 차지하지 않음)

echo "✅ 배포 및 실행 완료!"

#echo "📁 프로젝트 복사 중..."
#scp -i $PEM -r $LOCAL_DIR $REMOTE:/home/ubuntu
#
#echo "🛠 서버에서 빌드 및 실행 중..."
#ssh -i $PEM $REMOTE << EOF
#    cd $REMOTE_DIR
#    chmod +x ./gradlew
#    ./gradlew build -x test
#    pkill -f bootRun || true
#    nohup ./gradlew bootRun > log.out 2>&1 &
#EOF
#
#echo "✅ 배포 완료!"