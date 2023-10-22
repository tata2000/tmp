##If you are looking at this code - let me know what you think :)

# Litecoin

### 1. Docker-ayes
Building litecoin on Alpine image to minimize the attack surface.
```
docker build -t mylitecoin:0.18.1
```

### 2. Statefullset
located in statefulset.yml
As this is executed on my local machine, i've used
storageClassName: hostpath

### 3. CI/CD - Jenkins pipeline
To reduce dependencies on Jenkins plugins, i've used local commands here
This is not the proper setup for other environments,
but on local installation it works and keeps the setup requirements minimal.

Jenkins image that will have docker and kubectl command installed
with mounted configuration from the local machine will do the work

### 4&5. Scripts
All scripts can be found in scripts folder.

All scripts accept filename as parameter.
Script will print the file contents, while
every word will be printed on a separate line
and empty lines are omitted.


### 6. Terraform
The code can be found in terraform folder.
To execute run
```
terraform init
terraform apply
```
