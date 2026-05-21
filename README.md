# Zero-Cost Automated Web Stack Pipeline (Native K3s & Ansible)

A production-ready, $0-cost CI/CD deployment pipeline designed to containerize, test, and automatically deploy a web application onto a highly resource-constrained host environment.

##  The Architecture ($0 Ecosystem)

================================================================================
                    ZERO-COST DEVOPS PIPELINE ARCHITECTURE
================================================================================

 [ Developer Git Push ]
           │
           ▼
┌───────────────────────┐
│     GitHub Actions    │ ──( Builds & Packages Container Engine )
└───────────────────────┘
           │
           ├──► [ Public Docker Hub Registry ] (Stores App Layers)
           │
           ▼ (Secure SSH Handshake)
┌──────────────────────────────────────────────────────────────────────────────┐
│ ROCKY LINUX 9 HOST MACHINE (1.5GB RAM VM)                                    │
│                                                                              │
│  ┌────────────────────────────────────────────────────────────────────────┐  │
│  │ NATIVE K3s SERVICE (Single-Node Engine)                                │  │
│  │                                                                        │  │
│  │  • Ansible Automated Playbook triggers zero-downtime rolling update    │  │
│  │  • Custom resource footprint: Traefik & local-storage stripped (~500MB)│  │
│  │                                                                        │  │
│  │   ┌──────────────────────────────────────────────────────────────────┐ │  │
│  │   │ KUBERNETES POD NAMESPACE                                         │ │  │
│  │   │                                                                  │ │  │
│  │   │  [krs-web-app-pod] ◄── Accessible Globally via NodePort:30080    │ │  │
│  │   └──────────────────────────────────────────────────────────────────┘ │  │
│  └────────────────────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────────────────────┘
