## Create API user token
...

## API user permission
1. Click on datacenter node, permssion
2. Select add `/storage` set role PVEDatastoreUser
3. Select add `/` set role PVEVMAdmin

## Download container image
1. Copy link address of the image `rootfs.tar.xz` distribution/version desired from https://us.lxd.images.canonical.com/images/openwrt/
2. Click on datacenter, storage, add SMB/CIFS
3. On Content enable container template
4. Select datacenter, your SMD/CIFS share and select CT template, download from URL

## Terraform apply

## Install nano
1. Open the console to the container
2. Run `passwd` command
3. Install nano (optional)
```
opkg update
opkg install nano
```

## Enable WAN access
1. Edit the firewall rules to allow access from the WAN port
```
nano /etc/config/firewall
```
2. Add to the botom of file:
```
config rule                      
        option target 'ACCEPT'   
        option src 'wan'         
        option proto 'tcp'       
        option dest_port '80'    
        option name 'ext_web'
```
3. Restart the firewall service
```
/etc/init.d/firewall restart   
```

## Create LAN
1. Find the ip of your container, using command in the console `ip addr`
2. Open browser to the ip found
3. Click network menu, interfaces. Select continue to allow OpenWrt self configure.
4. Click add new interface...
5. Set name as LAN
6. Set protocol to static address
7. Set device to eth1
8. Click create interface
9. Once interface is created, click edit
10. Set IPv4 address: 10.0.1.1
11. Set IPv4 netmask: 255.255.255.0
12. Leave IPv4 gateway blank
13. Set IPv4 broadcast: 10.0.1.255
14. Click on the dhcp server
15. Click create dhcp server
16. Click save
17. Click save and apply
