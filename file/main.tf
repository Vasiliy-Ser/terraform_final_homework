module "vpc" {
  source        = "./modules/vpc"
  name          = var.vpc_name
  default_zone  = var.default_zone
  zone          = var.zone
  default_cidr = var.default2_cidr

}

module "test-vm" {
  source         	 = "git::https://github.com/udjin10/yandex_compute_instance?ref=1.0.0"
  env_name       	 = "develop"
  network_id     	 = module.vpc.network_id
  subnet_zones   	 = ["ru-central1-a"]
  subnet_ids     	 = [module.vpc.subnet_id[0]]
#  security_group_ids = ["yandex_vpc_security_group.example.id"]
  instance_name  	 = "webs"
  instance_count 	 = 1
  image_family   	 = var.vm_image_id
  public_ip      	 = true
  preemptible    	 = true

  labels = {
    owner= "v.padeev"
    project = "marketing"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

data "template_file" "cloudinit" {
  template = templatefile("/home/vm30/homework/16.6/2/cloud-init.yml", {
     user            = var.vm_user
     ssh_public_key  = var.vms_ssh_root_key
     web_app_port    = var.web_app_port
  })

}

