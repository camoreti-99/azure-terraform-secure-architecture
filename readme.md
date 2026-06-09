# Azure Highly Available & Secure Infrastructure with Terraform

Este repositorio contiene la infraestructura como código (IaC) para desplegar un entorno web seguro, altamente disponible y escalable en Azure utilizando **Terraform**.

## 🏗️ Arquitectura Desplegada

El diseño sigue las mejores prácticas de arquitectura en la nube:

* **Aislamiento de Red:** Una VNet con tres subredes: `snet-privada` (para servidores de aplicaciones), `snet-publica` (para servicios expuestos) y `AzureBastionSubnet` (para gestión segura).
* **Seguridad (Zero Trust):** Las máquinas virtuales no tienen IPs públicas. Todo el acceso administrativo (SSH) se realiza de forma segura mediante **Azure Bastion**.
* **Alta Disponibilidad:** Un **Load Balancer Estándar** distribuye el tráfico HTTP (puerto 80) entre un número dinámico de máquinas virtuales Linux (Ubuntu 22.04 LTS).
* **Control de Tráfico (NSG):** Reglas de seguridad estrictas que solo permiten tráfico web entrante y conexiones SSH exclusivamente originadas desde la subred de Bastion.
* **Persistencia y Estado Remoto:** Configuración de un Storage Account para backups independientes y almacenamiento del estado de Terraform (`tfstate`) securizado en un backend remoto de Azure.

## 🛠️ Componentes Técnicos

* **Proveedor:** AzureRM (~> 4.0)
* **Región por defecto:** Spain Central (`spaincentral`)
* **Backend:** Azure Blob Storage (`sttfstatepro2026`)
* **Cómputo:** `Standard_B1s` con discos Standard_LRS

## 🚀 Cómo Desplegar este Laboratorio

### Prerrequisitos
1. Tener instalado [Terraform](https://www.terraform.io/downloads.html).
2. Tener una cuenta de Azure y la [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) instalada.
3. Un Azure Storage Account preconfigurado para el backend remoto (`sttfstatepro2026`).

### Pasos para la ejecución

1. **Clonar el repositorio:**
   ```bash
   git clone [https://github.com/camoreti-99/azure-terraform-secure-architecture.git](https://github.com/camoreti-99/azure-terraform-secure-architecture.git)
   cd azure-terraform-secure-architecture