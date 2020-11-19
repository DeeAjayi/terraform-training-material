resource "azurerm_linux_virtual_machine" "myterraformvm" {
    name                  = "myVM"
    location              = "eastus"
    resource_group_name   = azurerm_resource_group.myterraformgroup.name
    network_interface_ids = [azurerm_network_interface.myterraformnic.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "myvm"
    admin_username = "azureuser"
    admin_password = "azureuser123$"
    disable_password_authentication = false
    custom_data = base64encode(file("files/custom-data.sh"))

    # provisioner "file" {
    # source      = "./index.html"
    # destination = "./index.html"

    #     connection {
    #         type     = "ssh"
    #         user     = "azureuser"
    #         password = "azureuser123$"
    #         host     = azurerm_public_ip.myterraformpublicip.ip_address
    #     }
    # }

    # provisioner "file" {
    # source      = "./nginx.yaml"
    # destination = "./nginx.yaml"

    #     connection {
    #         type     = "ssh"
    #         user     = "azureuser"
    #         password = "azureuser123$"
    #         host     = azurerm_public_ip.myterraformpublicip.ip_address
    #     }
    # }

    # provisioner "remote-exec" {
    #     inline = [
    #       "sudo apt-get update",
    #       "sudo apt-get install docker.io -y",
    #       "git clone https://github.com/somepublicrepo.git",
    #       "cd Docker-sample",
    #       "sudo docker build -t mywebapp .",
    #       "sudo docker run -d -p 5000:5000 mywebapp"
    #     ]
    # }


    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
    }

    tags = {
        environment = "Terraform Demo"
    }
}