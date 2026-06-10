# 🌐 Azure Highly Available & Secure Architecture with Terraform

![Terraform CI](https://github.com/camoreti-99/azure-terraform-secure-architecture/actions/workflows/terraform.yml/badge.svg)

Este repositorio contiene la infraestructura como código (IaC) para desplegar un entorno web seguro, altamente disponible y escalable en Azure utilizando **Terraform**, estructurado bajo estándares profesionales de la industria (GitOps).

---

## 🗺️ Arquitectura Desplegada

El diseño sigue una topología Zero-Trust y de alta disponibilidad:

```mermaid
graph TD
    subgraph Azure Cloud
        subgraph Resource Group: rg-laboratorio-maestro
            subgraph VNet: vnet-laboratorio
                subgraph AzureBastionSubnet
                    Bastion[Azure Bastion Host]
                end

                subgraph snet-publica
                    LB[Load Balancer Estándar]
                end

                subgraph snet-privada
                    VM1[VM Linux 0]
                    VM2[VM Linux 1]
                    NSG[Network Security Group]
                end
            end

            subgraph Storage Layer
                ST[Storage Account <br> HTTPS / TLS 1.2]
            end
        end
    end

    %% Flujos de tráfico
    Internet_User((Usuario Internet)) -->|Puerto 80/HTTP| LB
    LB -->|Balanceo de Carga| VM1
    LB -->|Balanceo de Carga| VM2
    
    Admin((Administrador SysAdmin)) -->|SSH Seguro| Bastion
    Bastion -->|Gestión interna| VM1
    Bastion -->|Gestión interna| VM2

    %% Estilos
    style Bastion fill:#2b579a,stroke:#fff,stroke-width:2px,color:#fff
    style LB fill:#00a300,stroke:#fff,stroke-width:2px,color:#fff
    style NSG fill:#e3a21a,stroke:#fff,stroke-width:2px,color:#fff
    style ST fill:#7e51a5,stroke:#fff,stroke-width:2px,color:#fff