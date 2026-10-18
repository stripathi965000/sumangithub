
resource "azurerm_linux_virtual_machine" "vm" {
    depends_on = [ azurerm_resource_group.rgs, azurerm_virtual_network.vnet, azurerm_network_interface.nic, azurerm_network_security_group.nsg ]
    for_each = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password = "adminuser@123"
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.data-nic[each.key].id,
  ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

data "azurerm_network_interface" "data-nic" {
    depends_on = [ azurerm_network_interface.nic ]
    for_each = var.vms

  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}



# commands to setup nginx web server in the VM and application stabucks  using local laptop as source and vm as destination
#code directly clone to vm 

#PS C:\Users\hp\Desktop\Suman GitHub DevOps\sumangithub\17 TO DOapp by satya> ssh adminuser@4.247.141.191
#adminuser@todovm-be:~$ sudo apt update
#adminuser@todovm-be:~$ sudo apt install nginx -y
#adminuser@todovm-be:~$ sudo systemctl start nginx
#adminuser@todovm-be:/var/www/html$ sudo rm -rf *
#adminuser@todovm-be:/var/www/html$ sudo rm -rf *
#adminuser@todovm-be:/var/www/html$ ls
#adminuser@todovm-be:/var/www/html$ 
#sudo git clone https://github.com/devopsinsiders/starbucks-clone.git
#adminuser@todovm-be:/var/www/html$ ls
#starbucks-clone
#adminuser@todovm-be:/var/www/html$ cd starbucks-clone/
#adminuser@todovm-be:/var/www/html/starbucks-clone$ ls
#assets  index.html
#adminuser@todovm-be:/var/www/html/starbucks-clone$ sudo cp -r * /var/www/html
#adminuser@todovm-be:/var/www/html/starbucks-clone$ cd ..
#adminuser@todovm-be:/var/www/html$ ls
#assets  index.html  starbucks-clone
#adminuser@todovm-be:/var/www/html$ exit

# commands to setup nginx web server in the VM and application netflix clone using local copy and git clone
#cloned to local pc then to vm
# copy code to local pc path 
#go to vs code and run below command

#PS C:\Users\hp\Desktop\Suman GitHub DevOps\sumangithub\17 TO DOapp by satya> ssh adminuser@4.247.141.191
#adminuser@todovm-be:~$ sudo apt update
#adminuser@todovm-be:~$ sudo apt install nginx -y
#adminuser@todovm-be:~$ sudo systemctl start nginx

#adminuser@todovm-be:~$ cd var/www/html if directly dont come then use below command
#adminuser@todovm-be:~$ cd /var
#adminuser@todovm-be:/var$ cd www
#adminuser@todovm-be:/var/www$ cd html
#adminuser@todovm-be:/var/www/html$ ls
 #index.nginx-debian.html
#adminuser@todovm-be:/var/www/html$ pwd
 #/var/www/html

#aftercopy in tmp it show here:see below steps in previous terminal
#adminuser@todovm-be:/tmp/netflix$ ls
  #README.md  assets  avatar.png  favicon.ico  index.html  logo192.png  logo512.png  manifest.json  robots.txt


#in another terminal 
#PS C:\Users\hp\Desktop\Suman GitHub DevOps\sumangithub> ls
 #d-----        12-03-2026     10:22                17 TO DOapp by satya
 #d-----        26-02-2026     15:39                18 TODOAPP modular by satya
 #d-----        12-03-2026     10:47                StreamFlix

#PS C:\Users\hp\Desktop\Suman GitHub DevOps\sumangithub> cd .\StreamFlix\
#PS C:\Users\hp\Desktop\Suman GitHub DevOps\sumangithub\StreamFlix> ls 
 # Directory: C:\Users\hp\Desktop\Suman GitHub DevOps\sumangithub\StreamFlix


#Mode                 LastWriteTime         Length Name
#----                 -------------         ------ ----
#d-----        12-03-2026     10:47                assets
#-a----        12-03-2026     10:47           1330 avatar.png
#-a----        12-03-2026     10:47          15406 favicon.ico
#-a----        12-03-2026     10:47            816 index.html
#-a----        12-03-2026     10:47           9707 logo192.png
#-a----        12-03-2026     10:47          37636 logo512.png
#-a----        12-03-2026     10:47            517 manifest.json
#-a----        12-03-2026     10:47           1277 README.md
#-a----        12-03-2026     10:47             70 robots.txt

#adminuser@todovm-be:/tmp/netflix$ scp -r * adminuser@4.247.141.191:/var/www/html

#we will be getting error as permission denied bcoz we used sudo, for that we will copy in temp file
#go back to previous terminal

#adminuser@todovm-be:/$ ls
  #bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
#adminuser@todovm-be:/$ cd tmp
#adminuser@todovm-be:/tmp$ mkdir netflix
#adminuser@todovm-be:/tmp$ cd netflix
#adminuser@todovm-be:/tmp/netflix$ pwd
  #/tmp/netflix
# adminuser@todovm-be:/tmp/netflix$ ls
  #README.md  assets  avatar.png  favicon.ico  index.html  logo192.png  logo512.png  manifest.json  robots.txt

#adminuser@todovm-be:/tmp/netflix$ sudo cp -r * /var/www/html
#adminuser@todovm-be:/tmp/netflix$ cd /var/www/html
#adminuser@todovm-be:/var/www/html$ ls
  #README.md  assets  avatar.png  favicon.ico  index.html  logo192.png  logo512.png  manifest.json  robots.txt

  #it might not show netflix but logo will come

