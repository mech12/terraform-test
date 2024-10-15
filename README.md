# terraform-test
terraform test project

# 설치
```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

# 실행
```bash
terraform init 
terraform plan # 실행 전에 실행해야 함
terraform apply
terraform apply -auto-approve # 자동 승인
terraform plan && terraform apply -auto-approve
terraform state list
terraform state show <상태이름>
terraform destroy
```

