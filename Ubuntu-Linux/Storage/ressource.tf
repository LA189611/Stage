resource "vsphere_virtual_machine" "storage" {
  name             = "xstorage"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = data.vsphere_virtual_machine.Intern-Hashicorp-Ubuntu-Template.num_cpus
  memory   = data.vsphere_virtual_machine.Intern-Hashicorp-Ubuntu-Template.memory
  guest_id = data.vsphere_virtual_machine.Intern-Hashicorp-Ubuntu-Template.guest_id
  firmware = data.vsphere_virtual_machine.Intern-Hashicorp-Ubuntu-Template.firmware
  folder   = "Intern/Adrien/UbuntuLinux"

  network_interface {
    network_id   = data.vsphere_network.net.id
    adapter_type = data.vsphere_virtual_machine.Intern-Hashicorp-Ubuntu-Template.network_interface_types[0]
  }

  disk {
    label            = "disk_xstorage"
    size             = data.vsphere_virtual_machine.Intern-Hashicorp-Ubuntu-Template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.Intern-Hashicorp-Ubuntu-Template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.Intern-Hashicorp-Ubuntu-Template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.Intern-Hashicorp-Ubuntu-Template.uuid
    customize {
      linux_options {
        host_name = "xstorage"
        domain    = "mirahi"
      }
      network_interface {
        ipv4_address = var.network_address[0]
        ipv4_netmask = var.network_mask[2]
      }
      dns_server_list = var.network_dns
      dns_suffix_list = var.network_dns
      ipv4_gateway    = var.network_gateway[0]
    }
  }
}