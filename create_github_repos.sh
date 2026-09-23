#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Robin Li - GitHub DevOps / Cloud / DevSecOps / AI Infra
# Repository Scaffold Generator
#
# Usage:
#   chmod +x create_github_repos.sh
#   ./create_github_repos.sh
#
# The script creates local repository directories, README files,
# architecture/documentation placeholders, and .gitignore files.
#
# It does NOT create GitHub repositories or push code.
# ============================================================

ROOT="${1:-robin-cloud-devops-portfolio}"

echo "Creating GitHub portfolio structure under: ${ROOT}"

mkdir -p "${ROOT}"
cd "${ROOT}"

# ------------------------------------------------------------
# Helper functions
# ------------------------------------------------------------

create_file() {
    local file="$1"
    local content="$2"

    mkdir -p "$(dirname "${file}")"
    printf '%s\n' "${content}" > "${file}"
}

create_repo() {
    local repo="$1"
    local description="$2"

    mkdir -p "${repo}"
    create_file "${repo}/README.md" "# ${repo}

${description}

## Status

Planning / In Progress

## Repository Structure

This repository is part of my Cloud / DevOps / DevSecOps / AI Infrastructure engineering portfolio.

## Engineering Focus

- Linux
- Networking
- Automation
- Cloud Infrastructure
- Containers
- Kubernetes
- CI/CD
- Security
- Observability
- Infrastructure as Code
- AI Infrastructure

## Architecture

Architecture documentation will be added during implementation.

## Deployment

Deployment instructions will be added with the implementation.

## Security

Security controls and security considerations will be documented here.

## Observability

Metrics, logs, traces, alerts, and dashboards will be documented here.

## Troubleshooting

Production-style troubleshooting cases will be documented here.

## Lessons Learned

Engineering decisions, trade-offs, failures, and improvements will be documented here.
"

    create_file "${repo}/.gitignore" "# OS
.DS_Store

# IDE
.idea/
.vscode/

# Logs
*.log

# Secrets
.env
.env.*
*.pem
*.key

# Terraform
.terraform/
*.tfstate
*.tfstate.*
crash.log

# Python
__pycache__/
*.py[cod]
.venv/
venv/

# Node
node_modules/
dist/

# Temporary
tmp/
temp/
"
}

# ------------------------------------------------------------
# 00 - Profile / Roadmap
# ------------------------------------------------------------

create_repo "robin-devops-roadmap" \
"Career roadmap and engineering skill matrix for the transition from Infrastructure Engineer to DevOps Engineer, Cloud Engineer, DevSecOps, and ultimately Cloud / AI Infrastructure Security."

mkdir -p robin-devops-roadmap/{01-career-roadmap,02-skill-matrix,03-project-roadmap,04-interview,05-certifications}

create_file "robin-devops-roadmap/01-career-roadmap/README.md" "# Career Roadmap

## Career Direction

Infrastructure Engineer
→ DevOps Engineer
→ Cloud Engineer
→ DevSecOps
→ Cloud / AI Infrastructure Security

## Target Market

Primary target: Singapore

Indicative target compensation:

- DevOps Engineer: SGD 6K–9K
- Cloud Engineer: SGD 6.5K–10K
- Long-term specialization: DevSecOps / Cloud Security / AI Infrastructure Security

## Strategy

Build demonstrable engineering capability instead of collecting isolated technologies.

Core progression:

1. Infrastructure
2. Automation
3. CI/CD
4. Containers
5. Kubernetes
6. Cloud
7. Infrastructure as Code
8. Security
9. Observability
10. AI Infrastructure
11. AI Infrastructure Security
"

create_file "robin-devops-roadmap/02-skill-matrix/README.md" "# Skill Matrix

| Domain | Core Technologies | Target Capability |
|---|---|---|
| Linux | Linux, systemd, shell | Production operations |
| Networking | TCP/IP, DNS, HTTP, VPN | Troubleshooting |
| Automation | Ansible, Python, Shell | Infrastructure automation |
| CI/CD | Jenkins, GitLab CI | Automated delivery |
| Containers | Docker | Image and runtime management |
| Kubernetes | Kubernetes, Helm, containerd | Production platform operations |
| Cloud | AWS, Azure | Cloud architecture and operations |
| IaC | Terraform | Reproducible infrastructure |
| Security | IAM, KMS, Security Hub | Cloud security |
| DevSecOps | SAST, SCA, IaC Scan, Image Scan | Secure delivery |
| Observability | Prometheus, Grafana, Loki, Tempo | Metrics, logs, traces |
| AI Infra | GPU, CUDA, vLLM | AI workload infrastructure |
| AI Security | IAM, supply chain, runtime security | AI infrastructure protection |
"

create_file "robin-devops-roadmap/03-project-roadmap/README.md" "# Project Roadmap

## Phase 1 — DevOps

- Docker
- Jenkins
- GitLab CI
- Ansible
- Kubernetes
- Observability

## Phase 2 — Cloud

- AWS
- Azure
- Terraform
- IAM
- VPC
- CloudWatch
- Landing Zone

## Phase 3 — DevSecOps

- SAST
- SCA
- Secret scanning
- Container scanning
- IaC scanning
- Kubernetes security
- Supply-chain security

## Phase 4 — AI Infrastructure

- GPU infrastructure
- CUDA
- NVIDIA Container Toolkit
- Kubernetes GPU workloads
- vLLM
- LLM serving
- GPU monitoring

## Phase 5 — AI Infrastructure Security

- AI workload isolation
- Model supply-chain security
- Runtime security
- Identity and access control
- Data protection
- Cloud security
"
touch robin-devops-roadmap/04-interview/README.md
touch robin-devops-roadmap/05-certifications/README.md

# ------------------------------------------------------------
# 01 - DevOps Lab
# ------------------------------------------------------------

create_repo "devops-lab" \
"End-to-end DevOps production-style laboratory covering Git, Jenkins, Docker, Ansible, Kubernetes, observability, deployment automation, rollback, and troubleshooting."

mkdir -p devops-lab/{architecture,application/{backend,frontend},docker,jenkins,ansible/{inventory,playbooks,roles},kubernetes,monitoring/{prometheus,grafana},scripts,docs}

create_file "devops-lab/README.md" "# DevOps Lab

End-to-end production-style DevOps environment.

## Architecture

GitHub
→ Jenkins
→ Test
→ Security Scan
→ Docker Build
→ Registry
→ Kubernetes
→ Prometheus / Grafana

## Core Technologies

- GitHub
- Jenkins
- Docker
- Ansible
- Kubernetes
- Prometheus
- Grafana
- Linux
- Python
- Shell

## Engineering Goals

- Automated build
- Automated testing
- Automated deployment
- Rollback
- Health checks
- Infrastructure automation
- Observability
- Security controls

## Documentation

- architecture/
- docs/deployment.md
- docs/troubleshooting.md
- docs/disaster-recovery.md
- docs/lessons-learned.md
"

touch devops-lab/{architecture/README.md,docker/README.md,jenkins/README.md,ansible/README.md,kubernetes/README.md,monitoring/README.md}
touch devops-lab/docs/{deployment.md,troubleshooting.md,disaster-recovery.md,lessons-learned.md}
touch devops-lab/scripts/{deploy.sh,rollback.sh,healthcheck.sh}

# ------------------------------------------------------------
# 02 - Jenkins
# ------------------------------------------------------------

create_repo "jenkins-cicd-lab" \
"Jenkins CI/CD laboratory demonstrating automated checkout, testing, security scanning, Docker image builds, registry publishing, Kubernetes deployment, health checks, and rollback."

mkdir -p jenkins-cicd-lab/{pipelines,docker,scripts,webhook,docs}

create_file "jenkins-cicd-lab/README.md" "# Jenkins CI/CD Lab

Production-style Jenkins pipeline.

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

## Key Engineering Topics

- Jenkins Pipeline
- Jenkinsfile
- Credentials management
- GitHub integration
- Docker
- Kubernetes
- Security gates
- Deployment strategies
- Rollback
"

touch jenkins-cicd-lab/{Jenkinsfile,pipelines/{build.groovy,test.groovy,security-scan.groovy,docker-build.groovy,deploy.groovy},docker/{Dockerfile,docker-compose.yml},scripts/{build.sh,test.sh,scan.sh,deploy.sh},webhook/README.md,docs/{pipeline.md,rollback.md,credentials.md,troubleshooting.md}}

# ------------------------------------------------------------
# 03 - Kubernetes
# ------------------------------------------------------------

create_repo "kubernetes-production-lab" \
"Production-oriented Kubernetes laboratory covering cluster bootstrap, containerd, networking, storage, workloads, RBAC, NetworkPolicy, observability, disaster recovery, and troubleshooting."

mkdir -p kubernetes-production-lab/{architecture,cluster/{kubeadm,containerd,networking},workloads/{nginx,redis,postgresql,application},storage,networking,security/{rbac,pod-security,secrets},observability/{prometheus,grafana},disaster-recovery,troubleshooting}

create_file "kubernetes-production-lab/README.md" "# Kubernetes Production Lab

Production-oriented Kubernetes engineering laboratory.

## Scope

- kubeadm
- containerd
- CNI
- Scheduling
- Services
- Ingress
- Storage
- RBAC
- NetworkPolicy
- Secrets
- Prometheus
- Grafana
- Backup / Restore

## Troubleshooting Cases

- CrashLoopBackOff
- ImagePullBackOff
- Node NotReady
- DNS failure
- CNI failure
- Service unreachable
- PVC Pending
- OOMKilled
- CPU throttling
- Kubelet failure
- Control Plane failure
"

touch kubernetes-production-lab/architecture/README.md
touch kubernetes-production-lab/{cluster/{kubeadm,containerd,networking}/README.md,workloads/{nginx,redis,postgresql,application}/README.md,storage/README.md,networking/README.md,security/{rbac,pod-security,secrets}/README.md,observability/{prometheus,grafana}/README.md,disaster-recovery/README.md}
touch kubernetes-production-lab/troubleshooting/{pod-crashloopbackoff.md,networking.md,storage.md,node-notready.md}

# ------------------------------------------------------------
# 04 - Observability
# ------------------------------------------------------------

create_repo "observability-platform" \
"Full-stack observability platform covering metrics, logs, traces, alerting, dashboards, Kubernetes monitoring, and OpenTelemetry."

mkdir -p observability-platform/{architecture,metrics/{prometheus,node-exporter,kube-state-metrics},visualization/grafana,logs/{loki,promtail},tracing/{tempo,opentelemetry},alerting/{alertmanager,rules},dashboards,docs}

create_file "observability-platform/README.md" "# Observability Platform

Full-stack observability architecture.

## Architecture

Application
→ Metrics / Logs / Traces
→ Prometheus / Loki / Tempo
→ Grafana
→ Alertmanager

## Observability Models

### Golden Signals

- Latency
- Traffic
- Errors
- Saturation

### RED

- Rate
- Errors
- Duration

## Technologies

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

# ------------------------------------------------------------
# 05 - Terraform AWS
# ------------------------------------------------------------

create_repo "terraform-aws-infrastructure" \
"Terraform-based AWS infrastructure demonstrating VPC, IAM, EC2, ALB, RDS, S3, CloudWatch, security controls, remote state, environments, and reusable modules."

mkdir -p terraform-aws-infrastructure/{architecture,environments/{dev,staging,production},modules/{vpc,iam,ec2,alb,rds,s3,cloudwatch,security-group},networking,security,monitoring,backend,docs}

create_file "terraform-aws-infrastructure/README.md" "# Terraform AWS Infrastructure

Infrastructure as Code for AWS.

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

## Key Capabilities

- Terraform modules
- Environment separation
- Remote state
- VPC design
- IAM
- Security Groups
- CloudWatch
- Cost awareness
- Disaster recovery

## Repository Structure

- environments/
- modules/
- networking/
- security/
- monitoring/
- backend/
- docs/
"

touch terraform-aws-infrastructure/{architecture/README.md,networking/{vpc.tf,subnet.tf,route-table.tf,nat-gateway.tf},security/{iam.tf,kms.tf,security-group.tf},monitoring/{cloudwatch.tf,alarms.tf},backend/s3-dynamodb.tf,docs/{terraform-state.md,security.md,cost.md,disaster-recovery.md}}

# ------------------------------------------------------------
# 06 - AWS Landing Zone
# ------------------------------------------------------------

create_repo "aws-landing-zone" \
"AWS multi-account landing zone design covering Organizations, account strategy, IAM, networking, centralized logging, GuardDuty, Security Hub, Config, CloudTrail, and compliance controls."

mkdir -p aws-landing-zone/{architecture,organizations,security/{iam,guardduty,securityhub,cloudtrail,config},networking/{transit-gateway,vpc,dns},logging/{cloudtrail,centralized-logs},compliance/{policies,controls},docs}

create_file "aws-landing-zone/README.md" "# AWS Landing Zone

Multi-account AWS governance and security architecture.

## Scope

- AWS Organizations
- Organizational Units
- Account strategy
- IAM
- Centralized logging
- CloudTrail
- AWS Config
- GuardDuty
- Security Hub
- Transit Gateway
- VPC
- DNS
- Compliance controls

## Engineering Objective

Build a secure and governable AWS foundation for multiple environments and workloads.
"

touch aws-landing-zone/architecture/README.md
touch aws-landing-zone/{organizations/{organization.tf,accounts.tf,organizational-units.tf},compliance/{policies/README.md,controls/README.md,checklist.md}}
touch aws-landing-zone/docs/{account-strategy.md,iam-strategy.md,network-strategy.md,security-baseline.md}

# ------------------------------------------------------------
# 07 - DevSecOps
# ------------------------------------------------------------

create_repo "devsecops-pipeline" \
"DevSecOps pipeline integrating SAST, SCA, secret scanning, IaC scanning, container security, Kubernetes policy enforcement, and security gates into CI/CD."

mkdir -p devsecops-pipeline/{architecture,ci/{jenkins,gitlab},sast/{semgrep,sonarqube},dependency-scan/{trivy,osv},container-security/{trivy,docker-bench},infrastructure-security/{checkov,tfsec},secrets/gitleaks,kubernetes-security/{kyverno,networkpolicy},reports}

create_file "devsecops-pipeline/README.md" "# DevSecOps Pipeline

Security integrated into the software delivery lifecycle.

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

## Security Controls

- SAST
- SCA
- Secret scanning
- Container vulnerability scanning
- Terraform / IaC scanning
- Kubernetes policy enforcement
- Security gates
"

touch devsecops-pipeline/architecture/README.md
touch devsecops-pipeline/ci/{jenkins/Jenkinsfile,gitlab/.gitlab-ci.yml}
touch devsecops-pipeline/reports/README.md

# ------------------------------------------------------------
# 08 - AI Infrastructure
# ------------------------------------------------------------

create_repo "ai-infrastructure-lab" \
"AI infrastructure engineering laboratory covering GPU workloads, CUDA, NVIDIA Container Toolkit, Kubernetes GPU scheduling, vLLM, LLM serving, performance benchmarking, monitoring, and security."

mkdir -p ai-infrastructure-lab/{architecture,gpu/{gpu-monitoring,cuda,nvidia-container-toolkit},container,kubernetes/{gpu-device-plugin,gpu-workload,resource-management},inference/{vllm,ollama,model-serving},performance/{benchmark,throughput,latency},observability/{gpu-metrics,dashboards},security/{image-security,network-security,model-security,access-control},docs}

create_file "ai-infrastructure-lab/README.md" "# AI Infrastructure Lab

AI infrastructure engineering laboratory.

## Architecture

GPU
→ Container Runtime
→ Kubernetes
→ GPU Scheduling
→ Model Serving
→ Observability
→ Security

## Technologies

- NVIDIA GPU
- CUDA
- NVIDIA Container Toolkit
- Docker
- Kubernetes
- vLLM
- Ollama
- Prometheus
- Grafana

## Engineering Topics

- GPU resource management
- GPU monitoring
- Model serving
- Inference performance
- Throughput
- Latency
- Workload isolation
- Container security
- Access control
"

touch ai-infrastructure-lab/{architecture/README.md,container/{Dockerfile,docker-compose.yml},docs/{gpu-cluster.md,inference.md,performance.md,security.md}}

# ------------------------------------------------------------
# 09 - AI Infrastructure Security
# ------------------------------------------------------------

create_repo "ai-infra-security" \
"Long-term specialization project combining cloud security, Kubernetes security, GPU infrastructure, AI workloads, model security, supply-chain security, runtime security, identity, and data protection."

mkdir -p ai-infra-security/{threat-model,infrastructure/{kubernetes,docker,gpu,networking},cloud/{aws,azure},identity/{iam,rbac,workload-identity},data-security/{encryption,secrets,data-protection},model-security/{model-access,model-integrity,supply-chain},runtime-security/{falco,kyverno,network-policy},supply-chain/{sbom,signing,vulnerability},docs}

create_file "ai-infra-security/README.md" "# AI Infrastructure Security

Long-term specialization project combining AI Infrastructure and Security.

## Security Architecture

AI Workloads
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

## Long-Term Direction

Cloud Security
→ DevSecOps
→ AI Infrastructure
→ AI Infrastructure Security
"

touch ai-infra-security/{threat-model/{architecture.md,attack-surface.md,threat-model.md},docs/{threat-model.md,security-baseline.md,incident-response.md,compliance.md}}

# ------------------------------------------------------------
# Technical Notes
# ------------------------------------------------------------

create_repo "technical-notes" \
"Engineering knowledge base focused on production troubleshooting, architecture decisions, DevOps, Cloud, Security, Observability, and AI Infrastructure."

mkdir -p technical-notes/{linux,networking,docker,kubernetes,cicd,cloud,security,observability,ai-infrastructure}

create_file "technical-notes/README.md" "# Technical Notes

Engineering notes written around real operational problems.

## Topics

- Linux
- Networking
- Docker
- Kubernetes
- CI/CD
- AWS
- Azure
- Terraform
- Cloud Security
- DevSecOps
- Observability
- GPU Infrastructure
- LLM Infrastructure
- AI Infrastructure Security

## Writing Principle

Do not document only what a technology is.

Focus on:

1. Problem
2. Architecture
3. Implementation
4. Failure
5. Diagnosis
6. Root Cause
7. Solution
8. Prevention
9. Lessons Learned
"

touch technical-notes/linux/{systemd.md,kernel.md,performance.md,troubleshooting.md}
touch technical-notes/networking/{tcp.md,dns.md,http.md,load-balancing.md,troubleshooting.md}
touch technical-notes/docker/{image-layer.md,networking.md,production.md}
touch technical-notes/kubernetes/{architecture.md,scheduling.md,networking.md,storage.md,troubleshooting.md}
touch technical-notes/cicd/{jenkins.md,gitlab-ci.md,deployment-strategy.md}
touch technical-notes/cloud/{aws.md,azure.md,iam.md,vpc.md,landing-zone.md}
touch technical-notes/security/{devsecops.md,cloud-security.md,kubernetes-security.md,compliance.md}
touch technical-notes/observability/{prometheus.md,grafana.md,logging.md,tracing.md}
touch technical-notes/ai-infrastructure/{gpu.md,cuda.md,vllm.md,llm-serving.md,ai-security.md}

# ------------------------------------------------------------
# Portfolio index
# ------------------------------------------------------------

create_file "README.md" "# Robin Li — Cloud / DevOps / DevSecOps / AI Infrastructure Portfolio

## Career Direction

Infrastructure Engineer
→ DevOps Engineer
→ Cloud Engineer
→ DevSecOps
→ Cloud / AI Infrastructure Security

## Portfolio Repositories

| Repository | Purpose |
|---|---|
| robin-devops-roadmap | Career roadmap and skill matrix |
| devops-lab | End-to-end DevOps engineering |
| jenkins-cicd-lab | Jenkins CI/CD |
| kubernetes-production-lab | Production Kubernetes |
| observability-platform | Metrics, logs, traces, alerting |
| terraform-aws-infrastructure | AWS Infrastructure as Code |
| aws-landing-zone | AWS governance and security |
| devsecops-pipeline | Security-integrated CI/CD |
| ai-infrastructure-lab | GPU and LLM infrastructure |
| ai-infra-security | AI Infrastructure Security |
| technical-notes | Engineering knowledge base |

## Engineering Progression

Infrastructure
→ Automation
→ CI/CD
→ Containers
→ Kubernetes
→ Cloud
→ IaC
→ Security
→ Observability
→ AI Infrastructure
→ AI Infrastructure Security

## Portfolio Principle

Each project should demonstrate:

- Architecture
- Automation
- Deployment
- Security
- Observability
- Troubleshooting
- Reliability
- Documentation
- Engineering trade-offs
"

echo
echo "=============================================="
echo "GitHub portfolio scaffold created successfully."
echo "=============================================="
echo
echo "Root directory:"
echo "  ${ROOT}"
echo
echo "Repositories:"
find . -mindepth 1 -maxdepth 1 -type d | sort | sed 's#^\./#  - #'
echo
echo "Next steps:"
echo "1. cd ${ROOT}"
echo "2. Review README.md"
echo "3. Implement repositories in roadmap order"
echo "4. Create matching GitHub repositories"
echo "5. Add remote origins and push each repository"
echo
