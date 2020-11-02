docker build . --tag lfs:latest
docker run --privileged --name lfs lfs:latest
docker cp lfs:/lfs-10.0-systemd.iso ./lfs-10.0-systemd.iso
