#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Robin Li GitHub 技术作品集目录生成脚本
#
# 技术路线：
# Infrastructure → DevOps → Cloud → DevSecOps → AI Infrastructure Security
#
# 本脚本只创建本地目录、README 和文档占位文件。
# 不创建 GitHub Repository，不执行 git push。
#
# 使用：
#   chmod +x create_github_portfolio.sh
#   ./create_github_portfolio.sh
#
# 指定目录：
#   ./create_github_portfolio.sh ~/github/robin-portfolio
# ============================================================

ROOT="${1:-robin-cloud-devops-portfolio}"

echo "开始创建 GitHub 技术作品集：${ROOT}"
mkdir -p "${ROOT}"
cd "${ROOT}"

# ------------------------------------------------------------
# 通用函数：创建文件
# ------------------------------------------------------------
create_file() {
    local file="$1"
    local content="$2"
    mkdir -p "$(dirname "${file}")"
    printf '%s\n' "${content}" > "${file}"
}

# ------------------------------------------------------------
# 通用函数：创建标准 Repository
# ------------------------------------------------------------
create_repo() {
    local repo="$1"
    local description="$2"

    mkdir -p "${repo}"

    create_file "${repo}/README.md" "# ${repo}

${description}

## 项目定位

本仓库属于 Robin Li Cloud / DevOps / DevSecOps / AI Infrastructure 技术作品集。

## 工程实践

每个项目尽量包含：

1. Architecture
2. Deployment
3. Automation
4. Security
5. Monitoring
6. Troubleshooting
7. Disaster Recovery
8. Performance
9. Lessons Learned
"

    create_file "${repo}/.gitignore" "# macOS
.DS_Store

# IDE
.idea/
.vscode/

# 日志
*.log

# 敏感信息
.env
.env.*
*.pem
*.key
*.crt

# Python
__pycache__/
*.py[cod]
.venv/
venv/

# Node.js
node_modules/
dist/

# Terraform
.terraform/
*.tfstate
*.tfstate.*

# 临时文件
tmp/
temp/
"
}

# ============================================================
# 01. 职业路线
# ============================================================

create_repo "robin-devops-roadmap" \
"记录从 Infrastructure Engineer → DevOps Engineer → Cloud Engineer → DevSecOps → AI Infrastructure Security 的技术成长路线。"

mkdir -p robin-devops-roadmap/{01-career-roadmap,02-skill-matrix,03-project-roadmap,04-interview,05-certifications}

create_file "robin-devops-roadmap/01-career-roadmap/README.md" "# 职业路线

## 长期路线

Infrastructure Engineer
→ DevOps Engineer
→ Cloud Engineer
→ DevSecOps
→ Cloud / AI Infrastructure Security

## Phase 1：DevOps

- Linux
- Docker
- Jenkins
- GitLab CI
- Ansible
- Kubernetes
- Prometheus
- Grafana

## Phase 2：Cloud Engineer

- AWS
- Azure
- Terraform
- IAM
- VPC
- CloudWatch
- Landing Zone

## Phase 3：DevSecOps

- SAST
- SCA
- Secret Scanning
- IaC Security
- Container Security
- Kubernetes Security
- Supply Chain Security

## Phase 4：AI Infrastructure

- GPU
- CUDA
- NVIDIA Container Toolkit
- Kubernetes GPU
- vLLM
- LLM Serving
- GPU Monitoring

## Phase 5：AI Infrastructure Security

- AI Workload Security
- Cloud Security
- Kubernetes Security
- Runtime Security
- Supply Chain Security
- IAM
- Data Security
- Model Security
"

create_file "robin-devops-roadmap/02-skill-matrix/README.md" "# 技能矩阵

| 技术领域 | 核心技术 | 目标能力 |
|---|---|---|
| Linux | Linux / systemd / Shell | 系统部署与故障排查 |
| 网络 | TCP/IP / DNS / HTTP | 网络故障定位 |
| 基础设施 | PostgreSQL / MySQL / Redis / Kafka / RabbitMQ / Nginx | 中间件部署与运维 |
| 自动化 | Ansible / Python / Shell | 基础设施自动化 |
| CI/CD | Jenkins / GitLab CI | 自动化交付 |
| 容器 | Docker / containerd | 容器生命周期管理 |
| Kubernetes | Kubernetes / Helm | 容器平台运维 |
| Cloud | AWS / Azure | 云架构与云运维 |
| IaC | Terraform | 基础设施即代码 |
| Security | IAM / KMS / Security Hub | 云安全 |
| DevSecOps | SAST / SCA / IaC Scan | 安全左移 |
| Observability | Prometheus / Grafana / Loki / Tempo | 可观测体系 |
| AI Infrastructure | GPU / CUDA / vLLM | AI 基础设施 |
| AI Security | Runtime / Supply Chain / IAM | AI 基础设施安全 |
"

create_file "robin-devops-roadmap/03-project-roadmap/README.md" "# 项目路线

## Phase 1：Infrastructure + DevOps

- Infrastructure Lab
- DevOps Lab
- Jenkins CI/CD
- Kubernetes
- Observability

## Phase 2：Cloud

- Terraform AWS
- AWS Landing Zone
- IAM
- VPC
- CloudWatch

## Phase 3：DevSecOps

- Security Pipeline
- IaC Security
- Container Security
- Kubernetes Security

## Phase 4：AI Infrastructure

- GPU
- CUDA
- Kubernetes GPU
- vLLM
- LLM Serving

## Phase 5：AI Infrastructure Security

- AI Workload Security
- Runtime Security
- Supply Chain Security
- Model Security
- Cloud Security
"

touch robin-devops-roadmap/04-interview/README.md
touch robin-devops-roadmap/05-certifications/README.md

# ============================================================
# 02. 基础设施核心仓库
# ============================================================

create_repo "infrastructure-lab" \
"生产级基础设施工程实验室，覆盖 Linux、网络、数据库、Redis、Kafka、RabbitMQ、Nginx、容器、Kubernetes、自动化、监控、安全和灾备。"

mkdir -p infrastructure-lab/{architecture,linux/{systemd,kernel,storage,filesystem,performance},networking/{tcp-ip,dns,http,load-balancer,nginx,keepalived},database/{postgresql/{standalone,replication,backup,restore,performance,troubleshooting},mysql/{replication,backup,troubleshooting}},cache/{redis/{standalone,sentinel,cluster,backup,monitoring,troubleshooting}},message-queue/{kafka/{cluster,topic,producer,consumer,replication,monitoring,troubleshooting},rabbitmq/{cluster,ha,monitoring}},container/{docker,containerd,compose},kubernetes/{redis,postgresql,kafka,ingress},automation/{ansible,shell,python},monitoring/{prometheus,grafana,exporters},security/{tls,secrets,network-policy,hardening},disaster-recovery/{backup,restore,replication,disaster-scenarios},docs}

create_file "infrastructure-lab/README.md" "# Infrastructure Lab

生产级基础设施工程实验室。

## 项目定位

这是整个技术作品集的基础层。

重点不是简单安装软件，而是研究：

- 部署
- 高可用
- 数据持久化
- 性能
- 监控
- 故障排查
- 自动化
- 安全
- 灾难恢复
- 容量规划

## 基础设施范围

### Linux

- systemd
- Kernel
- Storage
- Filesystem
- Performance

### Networking

- TCP/IP
- DNS
- HTTP
- Load Balancer
- Nginx
- Keepalived

### Database

- PostgreSQL
- MySQL

### Cache

- Redis
- Redis Sentinel
- Redis Cluster

### Message Queue

- Kafka
- RabbitMQ

### Container

- Docker
- containerd
- Docker Compose

### Kubernetes

- Redis
- PostgreSQL
- Kafka
- Ingress

### Automation

- Ansible
- Shell
- Python

### Observability

- Prometheus
- Grafana
- Exporters

### Security

- TLS
- Secrets
- NetworkPolicy
- System Hardening

### Disaster Recovery

- Backup
- Restore
- Replication
- Disaster Scenarios

## 重点实践

### Redis

- Standalone
- Sentinel
- Cluster
- Backup
- Monitoring
- Troubleshooting

### Kafka

- Broker
- Topic
- Partition
- Replication
- Consumer Group
- Offset
- ISR
- Lag
- Monitoring
- Failure Recovery

### PostgreSQL

- Backup
- Restore
- Replication
- Performance
- Connection Management
- Troubleshooting
"

# 创建基础设施各模块说明文件
for d in \
    infrastructure-lab/linux/systemd \
    infrastructure-lab/linux/kernel \
    infrastructure-lab/linux/storage \
    infrastructure-lab/linux/filesystem \
    infrastructure-lab/linux/performance \
    infrastructure-lab/networking/tcp-ip \
    infrastructure-lab/networking/dns \
    infrastructure-lab/networking/http \
    infrastructure-lab/networking/load-balancer \
    infrastructure-lab/networking/nginx \
    infrastructure-lab/networking/keepalived \
    infrastructure-lab/database/postgresql/standalone \
    infrastructure-lab/database/postgresql/replication \
    infrastructure-lab/database/postgresql/backup \
    infrastructure-lab/database/postgresql/restore \
    infrastructure-lab/database/postgresql/performance \
    infrastructure-lab/database/postgresql/troubleshooting \
    infrastructure-lab/database/mysql/replication \
    infrastructure-lab/database/mysql/backup \
    infrastructure-lab/database/mysql/troubleshooting \
    infrastructure-lab/cache/redis/standalone \
    infrastructure-lab/cache/redis/sentinel \
    infrastructure-lab/cache/redis/cluster \
    infrastructure-lab/cache/redis/backup \
    infrastructure-lab/cache/redis/monitoring \
    infrastructure-lab/cache/redis/troubleshooting \
    infrastructure-lab/message-queue/kafka/cluster \
    infrastructure-lab/message-queue/kafka/topic \
    infrastructure-lab/message-queue/kafka/producer \
    infrastructure-lab/message-queue/kafka/consumer \
    infrastructure-lab/message-queue/kafka/replication \
    infrastructure-lab/message-queue/kafka/monitoring \
    infrastructure-lab/message-queue/kafka/troubleshooting \
    infrastructure-lab/message-queue/rabbitmq/cluster \
    infrastructure-lab/message-queue/rabbitmq/ha \
    infrastructure-lab/message-queue/rabbitmq/monitoring \
    infrastructure-lab/container/docker \
    infrastructure-lab/container/containerd \
    infrastructure-lab/container/compose \
    infrastructure-lab/kubernetes/redis \
    infrastructure-lab/kubernetes/postgresql \
    infrastructure-lab/kubernetes/kafka \
    infrastructure-lab/kubernetes/ingress \
    infrastructure-lab/automation/ansible \
    infrastructure-lab/automation/shell \
    infrastructure-lab/automation/python \
    infrastructure-lab/monitoring/prometheus \
    infrastructure-lab/monitoring/grafana \
    infrastructure-lab/monitoring/exporters \
    infrastructure-lab/security/tls \
    infrastructure-lab/security/secrets \
    infrastructure-lab/security/network-policy \
    infrastructure-lab/security/hardening \
    infrastructure-lab/disaster-recovery/backup \
    infrastructure-lab/disaster-recovery/restore \
    infrastructure-lab/disaster-recovery/replication \
    infrastructure-lab/disaster-recovery/disaster-scenarios
do
    create_file "${d}/README.md" "# $(basename "${d}")

该目录用于记录该基础设施组件的部署、配置、监控、故障排查和工程实践。

## 计划内容

- Architecture
- Deployment
- Configuration
- Monitoring
- Troubleshooting
- Security
- Backup / Restore
- Performance
"
done

touch infrastructure-lab/architecture/README.md
touch infrastructure-lab/docs/{capacity-planning.md,high-availability.md,disaster-recovery.md,performance-tuning.md,troubleshooting.md}

# ============================================================
# 03. DevOps 综合实验室
# ============================================================

create_repo "devops-lab" \
"完整 DevOps 工程实验室，将 GitHub、Jenkins、Docker、Ansible、Kubernetes、监控和自动化部署整合成完整交付链路。"

mkdir -p devops-lab/{architecture,application/{backend,frontend},docker,jenkins,ansible/{inventory,playbooks,roles},kubernetes,monitoring/{prometheus,grafana},scripts,docs}

create_file "devops-lab/README.md" "# DevOps Lab

## 核心流程

GitHub
→ Jenkins
→ Test
→ Security Scan
→ Docker Build
→ Registry
→ Kubernetes
→ Prometheus
→ Grafana

## 技术栈

- Linux
- Git
- Jenkins
- Docker
- Ansible
- Kubernetes
- Prometheus
- Grafana
- Python
- Shell

## 工程能力

- CI/CD
- 自动化部署
- Docker 镜像构建
- Kubernetes 部署
- Health Check
- Rollback
- Monitoring
- Troubleshooting
"

touch devops-lab/{architecture/README.md,docker/README.md,jenkins/README.md,ansible/README.md,kubernetes/README.md,monitoring/README.md}
touch devops-lab/docs/{deployment.md,troubleshooting.md,disaster-recovery.md,lessons-learned.md}
touch devops-lab/scripts/{deploy.sh,rollback.sh,healthcheck.sh}

# ============================================================
# 04. Jenkins CI/CD
# ============================================================

create_repo "jenkins-cicd-lab" \
"Jenkins CI/CD 工程实验室，覆盖构建、测试、安全扫描、Docker 构建、镜像发布、Kubernetes 部署和回滚。"

mkdir -p jenkins-cicd-lab/{pipelines,docker,scripts,webhook,docs}

create_file "jenkins-cicd-lab/README.md" "# Jenkins CI/CD Lab

## Pipeline

GitHub
→ Webhook
→ Jenkins
→ Checkout
→ Test
→ SAST
→ Dependency Scan
→ Docker Build
→ Image Scan
→ Registry
→ Kubernetes Deploy
→ Health Check
→ Rollback

## 核心技术

- Jenkins Pipeline
- Jenkinsfile
- GitHub Webhook
- Docker
- Kubernetes
- Credentials
- Security Gate
- Rollback
"

touch jenkins-cicd-lab/Jenkinsfile
touch jenkins-cicd-lab/pipelines/{build.groovy,test.groovy,security-scan.groovy,docker-build.groovy,deploy.groovy}
touch jenkins-cicd-lab/docker/{Dockerfile,docker-compose.yml}
touch jenkins-cicd-lab/scripts/{build.sh,test.sh,scan.sh,deploy.sh}
touch jenkins-cicd-lab/webhook/README.md
touch jenkins-cicd-lab/docs/{pipeline.md,rollback.md,credentials.md,troubleshooting.md}

# ============================================================
# 05. Kubernetes
# ============================================================

create_repo "kubernetes-production-lab" \
"Kubernetes 生产级实验室，覆盖 kubeadm、containerd、CNI、Storage、Ingress、RBAC、NetworkPolicy、监控、灾备和故障排查。"

mkdir -p kubernetes-production-lab/{architecture,cluster/{kubeadm,containerd,networking},workloads/{nginx,redis,postgresql,application},storage,networking,security/{rbac,pod-security,secrets},observability/{prometheus,grafana},disaster-recovery,troubleshooting}

create_file "kubernetes-production-lab/README.md" "# Kubernetes Production Lab

## 核心范围

- kubeadm
- containerd
- CNI
- Scheduling
- Service
- Ingress
- Storage
- RBAC
- NetworkPolicy
- Secrets
- Prometheus
- Grafana
- Backup
- Restore

## 故障排查

- CrashLoopBackOff
- ImagePullBackOff
- Node NotReady
- DNS Failure
- CNI Failure
- Service Unreachable
- PVC Pending
- OOMKilled
- CPU Throttling
- Kubelet Failure
- Control Plane Failure
"

touch kubernetes-production-lab/architecture/README.md
touch kubernetes-production-lab/cluster/{kubeadm,containerd,networking}/README.md
touch kubernetes-production-lab/workloads/{nginx,redis,postgresql,application}/README.md
touch kubernetes-production-lab/storage/README.md
touch kubernetes-production-lab/networking/README.md
touch kubernetes-production-lab/security/{rbac,pod-security,secrets}/README.md
touch kubernetes-production-lab/observability/{prometheus,grafana}/README.md
touch kubernetes-production-lab/disaster-recovery/README.md
touch kubernetes-production-lab/troubleshooting/{pod-crashloopbackoff.md,networking.md,storage.md,node-notready.md}

# ============================================================
# 06. 可观测性
# ============================================================

create_repo "observability-platform" \
"完整可观测性平台，覆盖 Metrics、Logs、Traces、Alerting、Dashboard 和 Kubernetes Monitoring。"

mkdir -p observability-platform/{architecture,metrics/{prometheus,node-exporter,kube-state-metrics},visualization/grafana,logs/{loki,promtail},tracing/{tempo,opentelemetry},alerting/{alertmanager,rules},dashboards,docs}

create_file "observability-platform/README.md" "# Observability Platform

## 架构

Application
→ Metrics / Logs / Traces
→ Prometheus / Loki / Tempo
→ Grafana
→ Alertmanager

## Golden Signals

- Latency
- Traffic
- Errors
- Saturation

## RED

- Rate
- Errors
- Duration

## 技术栈

- Prometheus
- Grafana
- Loki
- Tempo
- OpenTelemetry
- Alertmanager
- Node Exporter
- kube-state-metrics
"

touch observability-platform/dashboards/{linux.json,kubernetes.json,docker.json,application.json}
touch observability-platform/docs/{metrics.md,logs.md,tracing.md,alerting.md,troubleshooting.md}

# ============================================================
# 07. Terraform AWS
# ============================================================

create_repo "terraform-aws-infrastructure" \
"Terraform AWS 基础设施即代码项目，覆盖 VPC、IAM、EC2、ALB、RDS、S3、CloudWatch、安全控制、远程 State 和多环境。"

mkdir -p terraform-aws-infrastructure/{architecture,environments/{dev,staging,production},modules/{vpc,iam,ec2,alb,rds,s3,cloudwatch,security-group},networking,security,monitoring,backend,docs}

create_file "terraform-aws-infrastructure/README.md" "# Terraform AWS Infrastructure

## Architecture

Terraform
→ VPC
→ Subnets
→ Routing
→ Security Groups
→ IAM
→ Compute
→ Database
→ Monitoring

## 核心能力

- Terraform Module
- Environment
- Remote State
- VPC
- IAM
- Security Group
- CloudWatch
- Cost Management
- Disaster Recovery
"

touch terraform-aws-infrastructure/architecture/README.md
touch terraform-aws-infrastructure/networking/{vpc.tf,subnet.tf,route-table.tf,nat-gateway.tf}
touch terraform-aws-infrastructure/security/{iam.tf,kms.tf,security-group.tf}
touch terraform-aws-infrastructure/monitoring/{cloudwatch.tf,alarms.tf}
touch terraform-aws-infrastructure/backend/s3-dynamodb.tf
touch terraform-aws-infrastructure/docs/{terraform-state.md,security.md,cost.md,disaster-recovery.md}

# ============================================================
# 08. AWS Landing Zone
# ============================================================

create_repo "aws-landing-zone" \
"AWS 多账户 Landing Zone，覆盖 Organizations、OU、Account Strategy、IAM、CloudTrail、Config、GuardDuty、Security Hub、Transit Gateway、集中日志和合规控制。"

mkdir -p aws-landing-zone/{architecture,organizations,security/{iam,guardduty,securityhub,cloudtrail,config},networking/{transit-gateway,vpc,dns},logging/{cloudtrail,centralized-logs},compliance/{policies,controls},docs}

create_file "aws-landing-zone/README.md" "# AWS Landing Zone

## 核心范围

- AWS Organizations
- Organizational Units
- Account Strategy
- IAM
- CloudTrail
- AWS Config
- GuardDuty
- Security Hub
- Transit Gateway
- VPC
- DNS
- Centralized Logging
- Compliance

## 目标

建立安全、可治理、可扩展的 AWS 多账户基础设施。
"

touch aws-landing-zone/architecture/README.md
touch aws-landing-zone/organizations/{organization.tf,accounts.tf,organizational-units.tf}
touch aws-landing-zone/compliance/{policies/README.md,controls/README.md,checklist.md}
touch aws-landing-zone/docs/{account-strategy.md,iam-strategy.md,network-strategy.md,security-baseline.md}

# ============================================================
# 09. DevSecOps
# ============================================================

create_repo "devsecops-pipeline" \
"将安全能力集成到 CI/CD 生命周期中的 DevSecOps Pipeline，覆盖 SAST、SCA、Secret Scanning、IaC Scan、Container Scan 和 Kubernetes Policy。"

mkdir -p devsecops-pipeline/{architecture,ci/{jenkins,gitlab},sast/{semgrep,sonarqube},dependency-scan/{trivy,osv},container-security/{trivy,docker-bench},infrastructure-security/{checkov,tfsec},secrets/gitleaks,kubernetes-security/{kyverno,networkpolicy},reports}

create_file "devsecops-pipeline/README.md" "# DevSecOps Pipeline

## Pipeline

Developer
→ GitHub
→ Jenkins / GitLab CI
→ SAST
→ Dependency Scan
→ Secret Scan
→ IaC Scan
→ Container Scan
→ Policy Check
→ Deploy

## 安全控制

- SAST
- SCA
- Secret Scanning
- Container Vulnerability Scanning
- Terraform / IaC Scanning
- Kubernetes Policy
- Security Gate
"

touch devsecops-pipeline/architecture/README.md
touch devsecops-pipeline/ci/{jenkins/Jenkinsfile,gitlab/.gitlab-ci.yml}
touch devsecops-pipeline/reports/README.md

# ============================================================
# 10. AI Infrastructure
# ============================================================

create_repo "ai-infrastructure-lab" \
"AI 基础设施工程实验室，覆盖 GPU、CUDA、NVIDIA Container Toolkit、Kubernetes GPU、vLLM、LLM Serving、性能测试、监控和安全。"

mkdir -p ai-infrastructure-lab/{architecture,gpu/{gpu-monitoring,cuda,nvidia-container-toolkit},container,kubernetes/{gpu-device-plugin,gpu-workload,resource-management},inference/{vllm,ollama,model-serving},performance/{benchmark,throughput,latency},observability/{gpu-metrics,dashboards},security/{image-security,network-security,model-security,access-control},docs}

create_file "ai-infrastructure-lab/README.md" "# AI Infrastructure Lab

## Architecture

GPU
→ Container Runtime
→ Kubernetes
→ GPU Scheduling
→ Model Serving
→ Observability
→ Security

## 技术栈

- NVIDIA GPU
- CUDA
- NVIDIA Container Toolkit
- Docker
- Kubernetes
- vLLM
- Ollama
- Prometheus
- Grafana

## 核心能力

- GPU Resource Management
- GPU Monitoring
- Model Serving
- Inference Performance
- Throughput
- Latency
- Workload Isolation
- Container Security
- Access Control
"

touch ai-infrastructure-lab/architecture/README.md
touch ai-infrastructure-lab/container/{Dockerfile,docker-compose.yml}
touch ai-infrastructure-lab/docs/{gpu-cluster.md,inference.md,performance.md,security.md}

# ============================================================
# 11. AI Infrastructure Security
# ============================================================

create_repo "ai-infra-security" \
"最终专业方向项目，将 Cloud Security、Kubernetes Security、GPU Infrastructure、AI Workload、Model Security、Supply Chain Security 和 Runtime Security 结合。"

mkdir -p ai-infra-security/{threat-model,infrastructure/{kubernetes,docker,gpu,networking},cloud/{aws,azure},identity/{iam,rbac,workload-identity},data-security/{encryption,secrets,data-protection},model-security/{model-access,model-integrity,supply-chain},runtime-security/{falco,kyverno,network-policy},supply-chain/{sbom,signing,vulnerability},docs}

create_file "ai-infra-security/README.md" "# AI Infrastructure Security

## 专业方向

Cloud Security
→ DevSecOps
→ AI Infrastructure
→ AI Infrastructure Security

## Security Architecture

AI Workload
→ Kubernetes / Containers
→ Cloud Infrastructure
→ Identity
→ Network
→ Data
→ Supply Chain
→ Runtime Security

## Security Domains

- IAM
- RBAC
- Workload Identity
- NetworkPolicy
- Secrets Management
- Encryption
- SBOM
- Image Signing
- Vulnerability Management
- Runtime Security
- Model Integrity
- Model Access Control
- AI Workload Isolation
"

touch ai-infra-security/threat-model/{architecture.md,attack-surface.md,threat-model.md}
touch ai-infra-security/docs/{threat-model.md,security-baseline.md,incident-response.md,compliance.md}

# ============================================================
# 12. Technical Notes
# ============================================================

create_repo "technical-notes" \
"围绕真实工程问题编写的技术知识库，重点记录架构、部署、故障、根因分析、解决方案和工程经验。"

mkdir -p technical-notes/{linux,networking,infrastructure,docker,kubernetes,cicd,cloud,security,observability,ai-infrastructure}

create_file "technical-notes/README.md" "# Technical Notes

## 写作原则

不要只写：

> 什么是 Kubernetes？

而应该写：

> Kubernetes 某个生产问题是如何发现、定位、解决和预防的。

## 标准文章结构

1. Problem
2. Background
3. Architecture
4. Implementation
5. Failure
6. Diagnosis
7. Root Cause
8. Solution
9. Prevention
10. Lessons Learned

## 技术领域

- Linux
- Networking
- Infrastructure
- Database
- Redis
- Kafka
- Docker
- Kubernetes
- CI/CD
- AWS
- Azure
- Terraform
- Security
- DevSecOps
- Observability
- GPU Infrastructure
- LLM Infrastructure
- AI Infrastructure Security
"

touch technical-notes/linux/{systemd.md,kernel.md,performance.md,troubleshooting.md}
touch technical-notes/networking/{tcp.md,dns.md,http.md,load-balancing.md,troubleshooting.md}
touch technical-notes/infrastructure/{database.md,redis.md,kafka.md,rabbitmq.md,nginx.md}
touch technical-notes/docker/{image-layer.md,networking.md,production.md}
touch technical-notes/kubernetes/{architecture.md,scheduling.md,networking.md,storage.md,troubleshooting.md}
touch technical-notes/cicd/{jenkins.md,gitlab-ci.md,deployment-strategy.md}
touch technical-notes/cloud/{aws.md,azure.md,iam.md,vpc.md,landing-zone.md}
touch technical-notes/security/{devsecops.md,cloud-security.md,kubernetes-security.md,compliance.md}
touch technical-notes/observability/{prometheus.md,grafana.md,logging.md,tracing.md}
touch technical-notes/ai-infrastructure/{gpu.md,cuda.md,vllm.md,llm-serving.md,ai-security.md}

# ============================================================
# Portfolio 总说明页
# ============================================================

create_file "README.md" "# Robin Li — Cloud / DevOps / DevSecOps / AI Infrastructure Portfolio

## 技术路线

Infrastructure
→ DevOps
→ Cloud
→ DevSecOps
→ AI Infrastructure Security

## Repository

| Repository | 定位 |
|---|---|
| robin-devops-roadmap | 职业路线与技能矩阵 |
| infrastructure-lab | 基础设施核心能力 |
| devops-lab | DevOps 综合工程 |
| jenkins-cicd-lab | CI/CD |
| kubernetes-production-lab | Kubernetes |
| observability-platform | 可观测性 |
| terraform-aws-infrastructure | AWS IaC |
| aws-landing-zone | Cloud Architecture |
| devsecops-pipeline | DevSecOps |
| ai-infrastructure-lab | AI Infrastructure |
| ai-infra-security | AI Infrastructure Security |
| technical-notes | 技术知识库 |

## 基础设施层

Infrastructure Lab 是整个作品集的底层。

Linux
→ Network
→ Database
→ Redis
→ Kafka
→ RabbitMQ
→ Nginx
→ Docker
→ Kubernetes

## DevOps 层

Infrastructure
→ Automation
→ CI/CD
→ Container
→ Kubernetes
→ Observability

## Cloud 层

AWS
→ VPC
→ IAM
→ Terraform
→ CloudWatch
→ Landing Zone

## Security 层

DevSecOps
→ SAST
→ SCA
→ IaC Security
→ Container Security
→ Kubernetes Security

## AI 层

GPU
→ CUDA
→ Kubernetes GPU
→ vLLM
→ LLM Serving
→ AI Infrastructure Security

## 作品集原则

每个核心项目尽量证明：

- 能部署
- 能自动化
- 能监控
- 能排障
- 能保障安全
- 能进行容量规划
- 能做备份恢复
- 能解释架构设计
- 能解释故障根因
- 能说明工程取舍
"

echo
echo "=============================================="
echo "GitHub 技术作品集目录创建完成"
echo "=============================================="
echo
echo "根目录：${ROOT}"
echo
echo "仓库："
find . -mindepth 1 -maxdepth 1 -type d | sort | sed 's#^\./#  - #'
echo
echo "建议实施顺序："
echo "1. infrastructure-lab"
echo "2. devops-lab"
echo "3. jenkins-cicd-lab"
echo "4. kubernetes-production-lab"
echo "5. observability-platform"
echo "6. terraform-aws-infrastructure"
echo "7. aws-landing-zone"
echo "8. devsecops-pipeline"
echo "9. ai-infrastructure-lab"
echo "10. ai-infra-security"
echo
