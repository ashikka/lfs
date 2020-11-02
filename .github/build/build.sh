docker build . --tag lfs:latest
docker run --privileged --name lfs lfs:latest
docker cp lfs:/dist/lfs.* .
zip lfs.zip lfs.iso lfs.bz2
