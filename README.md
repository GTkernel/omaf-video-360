# MPEG-OMAF Video 360 

This project covers both the client and server components for the Video 360 usecase in MEC Kubernetes environment.

The server-side implementation is based on [this project](https://github.com/fraunhoferhhi/omaf.js).

There are directories and YAML files for the implementation and deployments:

- Server: `./omaf-nginx-server` and `omaf-nginx.yml` are for the server-side applications
```
$ git submodule update --init --recursive
```
    

- Two client simulations by **httperf** and **GoReplay**
   - `./httperf-client` and `httperf-client.yml` are for httperf
   - `./goreply` covers the Dockerfile and the gor log for replaying. 
    After you build the image, run docker container with following example command:
   ```
      $ docker run -it -v $GOR_PATH:/tmp/omaf.gor gor-tool:latest /opt/gor/gor --input-file /tmp/omaf.gor --output-http="$OMAF_SERVER:PORT"
   ``` 
