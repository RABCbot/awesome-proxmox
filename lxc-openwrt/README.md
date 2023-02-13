## Create API user token

## API user permission
Click on datacenter node, permssion
Select add `/storage` set role PVEDarastoreUser
Select add `/` set role PVEVMAdmin

## Download container image
Copy link address of the image `rootfs.tar.xz` distribution/version desired from https://us.lxd.images.canonical.com/images/openwrt/
Click on datacenter, storage, add SMB/CIFS
On Content enable container template
Select datacenter, your SMD/CIFS share and select CT template, download from URL

## Terraform apply

## Install nano
open the console to the container
Run `passwd` command
Install nano (optional)
```
opkg update
opkg install nano
```

## Enable WAN access
Edit the firewall rules to allow access from the WAN port
```
nano /etc/config/firewall
```
add to the botom of file:
```
config rule                      
        option target 'ACCEPT'   
        option src 'wan'         
        option proto 'tcp'       
        option dest_port '80'    
        option name 'ext_web'
```
Restart the firewall service
/etc/init.d/firewall restart   

## Create LAN
Find the ip of your container, using command in the console `ip addr`
Open browser to the ip found
Click network menu, interfaces. Select continue to allow OpenWrt self configure.
Click add new interface...
Set name as LAN
Set protocol to static address
Set device to eth1
Click create interface
Once interface is created, click edit
Set IPv4 address: 10.0.1.1
Set IPv4 netmask: 255.255.255.0
Leave IPv4 gateway blank
Set IPv4 broadcast: 10.0.1.255
Click on the dhcp server
Click create dhcp server
Click save
Click save and apply
