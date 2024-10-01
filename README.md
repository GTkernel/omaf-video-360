# MPEG-OMAF Video 360 

This project covers both the client and server components for the Video 360 usecase in MEC Kubernetes environment.

The server-side implementation is based on [this project](https://github.com/fraunhoferhhi/omaf.js). 
We add submofule of it, please get it on localhost before running the video360 server.
```
$ git submodule update --init --recursive
```

There are directories and YAML files for the implementation and K8s deployments:

- Server: for the server-side applications, related files are under `./omaf-nginx-server`.

    - First, building the Docker image, e.g.
        ```
        $ docker build -t video360-nginx .
        ```
    - For K8s deployment, before you run the YAML file, `omaf-nginx.yml`, remember to change all the directory names and image to fit your environment.
    - For running by docker, you can refer following command:
        ```
        $ docker run -d -v $GARAGE_GB2_PATH:/usr/share/nginx/html/Garage_gb2 -v $MAXOSX_PATH:/usr/share/nginx/html/__MAXOSX -v $JAVASCRIPT_PATH:/usr/share/nginx/html/omaf.js video360-nginx:latest 
        ```
        Mapping the three directories under `./omaf-nginx-server` to NGINX server container.

- Clients: Two client simulations by **httperf** and **GoReplay**
    
    - `./httperf-client` and `httperf-client.yml` are for httperf
    - `./goreplay` covers the Dockerfile and the gor log for replaying API requests. 
Currently, we don't support K8s client deployment. After you build the image, run docker container with following example command:
        ```
        $ docker run -it -v $GOR_PATH:/tmp/omaf.gor gor-tool:latest /opt/gor/gor --input-file /tmp/omaf.gor --output-http="$OMAF_SERVER:PORT"
        ``` 
