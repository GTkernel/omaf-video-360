# MPEG-OMAF Video 360 

This repo covers both the client and server components for the Video 360 usecase in MEC Kubernetes environment

Two directories and two YAML files are the implementation and deployments:

- `./omaf-nginx-server` and `omaf-nginx.yml` are for the server-side applications
- Two client simulations by **httperf** and **GoReplay**
   - `./httperf-client` and `httperf-client.yml` are for httperf
   - `./goreply` covers the Dockerfile and the gor log for replaying. Run docker container with following entry command example:
   ```
      $ /opt/gor/gor --input-file $PATH_OMAF_GOR --output-http="$OMAF_SERVER:PORT"
   ``` 
