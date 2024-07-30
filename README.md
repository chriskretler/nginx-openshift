Sample nginx setup that successfully runs as a non-root user. This is useful for running in multi-tenanted kubernetes and openshift clusters.

To test locally:
```
docker build -t nginx-user ./method1
```
or:
```
docker build -t nginx-user ./method2
```
then:
```
docker run -it -u 10001000 -p 8080:8080 nginx-user
```