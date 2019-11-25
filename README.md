# DNATriangulation
A set of scripts for genome assembly


# dockers ...
```bash

# build image
docker build -t noam_image .
# run it ...
docker run -dit --name noam_container noam_image
# shell into it ...
docker exec -it noam_container bash
#stop it
docker stop noam_container
#rm container
docker rm noam_container
#rm image
docker image rm noam_image
```



# run stuff from inside
```bash
make
make  large_scaffolds
make  karyotype
make  scaffold
make  scaffold_wrap
```
