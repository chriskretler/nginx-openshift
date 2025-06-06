# nginx-openshift
Sample nginx setup that successfully runs as a non-root user. Three example methods for allowing the application to run as a unique UID are shown. This is useful for running in multi-tenanted kubernetes and openshift clusters. 

## Does your application require modification
If your application runs locally, for example via the following command:

```
docker run nginx:1.27
```

it will run successfully on openshift as well if it also runs when using this command:

```
docker run -u 12345:0 nginx:1.27
```

This command specifies a high-number UID: `12345`, that is part of the root group: `0`. This emulates the conditions in which an application will run within openshift.


## The Three Examples
The three methods are:
- ubi-image: This method uses an nginx image based on Red Hat's UBI (universal base image). These images are designed to run within OpenShift. As such, no specific permission changes are required. This example is provided because Red Hat images often expect configuration and source file to be in different paths than debian or alpine distributions.

- directory-perms: This method modifies the permissions for certain directories and files such that the root group--of which the openshift unique UID is part--can write to them. This method is useful if you have knowledge of what directories/files require modification to allow the image to run successfully.

- etc-passwd: This method make the /etc/passwd file writeable by the root group--of which the openshift unique UID is part. A start-up script is then used to make recast the `nginx` user as this UID. This method is useful if your application image needs to run as a named user.


## Testing Locally
To test locally:

```
docker build -t nginx-user ./ubi-image
```

or:
```
docker build -t nginx-user ./directory-perms
```

or:
```
docker build -t nginx-user ./etc-passwd
```

then:
```
docker run -it -u 10001000 -p 8080:8080 nginx-user
```

The application logs should show successful start-up, and you should be able to access `localhost:8080` within a web browser.