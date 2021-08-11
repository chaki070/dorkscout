# dorkscout
dokrscout is a tool to automate the finding of vulnerable applications or secret files around the internet throught google searches, dorkscout first starts by fetching the dorks lists from https://www.exploit-db.com/google-hacking-database and then it scans a given target or everything it founds

# Installation
dorkscout can be installed in different ways:

## **Go Packages**

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Go_Logo_Blue.svg/1200px-Go_Logo_Blue.svg.png" width=95 height=35>

 throught [Golang Packages](https://github.com/rust-lang/cargo) (golang package manager)
 
```bash
go get github.com/R4yGM/dorkscout
```
**this will work for every platform**

## **Docker**

<img src="https://cdn3.iconfinder.com/data/icons/logos-and-brands-adobe/512/97_Docker-512.png" width=35 height=35>

  if you don't have docker installed you can follow their [guide](https://docs.docker.com/engine/install/)
  
 first of all you have to pull the docker image (only **17.21 MB**) from the docker registry, you can see it [here](https://hub.docker.com/r/r4yan/dorkscout), if you don't want to pull the image you can also clone the repository and then build the image from the Dockerfile
 ```bash
docker pull r4yan/dorkscout:latest
  ```
 
  if you don't want to pull the image you can download or copy the dorkscout Dockerfile that can be found [here](https://github.com/R4yGM/dorkscout/blob/1.0/Dockerfile) and then build the image from the Dockerfile
  
  then if you want to launch the container you have to first create a volume to share your files to the container
  
  ```bash
  docker volume create --name dorkscout_data
  ``` 
 using docker when you launch the container it will automatically install the dork lists inside a directory called "dorkscout" :
   ```bash
-rw-r--r-- 1 r4yan r4yan   110 Jul 31 14:56  .dorkscout
-rw-r--r-- 1 r4yan r4yan 79312 Aug 10 20:30 'Advisories and Vulnerabilities.dorkscout'
-rw-r--r-- 1 r4yan r4yan  6352 Jul 31 14:56 'Error Messages.dorkscout'
-rw-r--r-- 1 r4yan r4yan 38448 Jul 31 14:56 'Files Containing Juicy Info.dorkscout'
-rw-r--r-- 1 r4yan r4yan 17110 Jul 31 14:56 'Files Containing Passwords.dorkscout'
-rw-r--r-- 1 r4yan r4yan  1879 Jul 31 14:56 'Files Containing Usernames.dorkscout'
-rw-r--r-- 1 r4yan r4yan  5398 Jul 31 14:56  Footholds.dorkscout
-rw-r--r-- 1 r4yan r4yan  5568 Jul 31 14:56 'Network or Vulnerability Data.dorkscout'
-rw-r--r-- 1 r4yan r4yan 49048 Jul 31 14:56 'Pages Containing Login Portals.dorkscout'
-rw-r--r-- 1 r4yan r4yan 16112 Jul 31 14:56 'Sensitive Directories.dorkscout'
-rw-r--r-- 1 r4yan r4yan   451 Jul 31 14:56 'Sensitive Online Shopping Info.dorkscout'
-rw-r--r-- 1 r4yan r4yan 29938 Jul 31 14:56 'Various Online Devices.dorkscout'
-rw-r--r-- 1 r4yan r4yan  2802 Jul 31 14:56 'Vulnerable Files.dorkscout'
-rw-r--r-- 1 r4yan r4yan  4925 Jul 31 14:56 'Vulnerable Servers.dorkscout'
-rw-r--r-- 1 r4yan r4yan  8145 Jul 31 14:56 'Web Server Detection.dorkscout'
  ```
  so that you don't have to install them
  
  then you can start scanning by doing :
  ```bash
sudo docker run -v Dorkscout:/dorkscout 0c73b2181edf scan -d="/dorkscout/Sensitive Online Shopping Info.dorkscout" -H="/dorkscout/a.html"
  ```
  replace the `<options>` with the options/arguments you want to give to stegbrute,
  once you did everything you don't have to pull/build the image again only if there are new updates or features
  
  **Always save your results inside the volume and not in the container because then the results will be deleted! you can save them by adding this option `-x /$VOLUME_NAME/results.txt` or `--extract-file /$VOLUME_NAME/results.txt`** 
 
 if you added this and did everything correctly at the end of every attack you'd find the results inside the folder `/var/lib/docker/volumes/stegbrute_data/_data`
  
  
  **this will work for every platform**
  
  ## Executable
  you can also download the already compiled programn and then execute it, example :
  ```bash
wget https://github.com/R4yGM/stegbrute/releases/download/0.1.1/stegbrute && chmod +x stegbrute
mv stegbrute /usr/local/bin/
```

