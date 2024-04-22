# infra-for-ansible-proyect
InfraCode for Ansible proyect
.
├── main.tf                # Archivo  que puede invocar módulos y configurar proveedores
├── variables.tf           ✅ Variables que se usarán en los archivos de configuración
├── outputs.tf             ✅ Salidas que Terraform proporcionará tras aplicar los cambios
├── providers.tf           ✅ Configuración de proveedores, como AWS
├── vpc.tf                 ✅ Configuración de la VPC y sus componentes
├── security_groups.tf     ✅ Configuración de los grupos de seguridad
├── ec2.tf                 ✅ Configuración de las instancias EC2
├── load_balancer.tf       # Configuración del balanceador de carga
├── database.tf            # Configuración de la base de datos RDS
├── efs.tf                 ✅ Configuración del sistema de archivos EFS
├── terraform.tfvars       ✅ Variables que se pasarán a Terraform en tiempo de ejecución
├── backend.tf             # Conf backend de Terraform, por ejemplo, estado (tfstate) en S3
