# #count -
# same se loop chalega ar pehle destroy krkeke naya bna dega
# resource "azurerm_resource_group" "rg0" { 

#     count =3 
#     name = "suman-rg"
#   location = "central india"
# }

#COUNT & count.index
# jitne count m number uthe rg bna dega but number m
# resource "azurerm_resource_group" "rg0" { 
#     count =3       #create 3 rgs
#     name = count.index      #0 ,1 ,2
#   location = "central india"
# }

#COUNT & count.index & interpolation ${s}
#interpolation ${s} example
# satya${prakash}  satyaprakash rightway
# satya-${prakash}  satya-prakash right way
#satya- + prakash   satya-prakash wrong way h ye

# jitne count m number uthe rg bna dega but with name 


# resource "azurerm_resource_group" "rg0" { 
#     count =3       #create 3 rgs
#     name = "suman-rg${count.index}"  # "satya-rg0", "satya-rg1","satya-rg2"
#   location = "central india"
# }

# #COUNT & count.index & interpolation ${s} & variable & list
# agr count m number jada h ar var m name km to 
# count m diye gye number bna kr aage error de dega 
# ar name jada h number km h to no error.loop count k according hi chlega

# resource "azurerm_resource_group" "rg0" { 
#     count =5   #create 3 rgs
#     name =  var.name[count.index]                         #"satya-rg${count.index}"  
#   location = "central india"
# }
# variable "name" {}

#COUNT & count.index & interpolation ${s} & variable & length
# resource "azurerm_resource_group" "rg0" { 
#     count = length(var.name)         #count =5 
#     name =  var.name[count.index]                         #"satya-rg${count.index}"  
#   location = "central india"
# }
# variable "name" {}

#COUNT & count.index & interpolation ${s} & variable & length
# var.name pr count krega ar jis number pr jo name ayega ,same name se length k according resources create kr dega
resource "azurerm_resource_group" "rg1" { 
    count = length(var.name)         #count =5 
    name =  var.name[0]                         #"satya-rg${count.index}"  
  location = "central india"
}
variable "name" {}