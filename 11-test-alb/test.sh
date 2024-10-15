# Terraform 출력값을 변수에 저장
ALBDNS=$(terraform output -raw akbunalb_dns)

# curl 명령 실행 및 출력값 처리 (자세한 설명은 아래에)
for i in {1..100}; do
    curl -s http://$ALBDNS/
done
