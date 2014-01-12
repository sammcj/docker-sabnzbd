Docker SABnzbd
==============

Builds a Docker image for SABnzbd based on Debian Jessie

```
docker build -t sabnzbd . 
```

```
docker run -d -h *your_host_name* -v /*your_config_location*:/config -v /*your_videos_location*:/data -p 8080:8080 -p 9090:9090 sabnzbd
```
