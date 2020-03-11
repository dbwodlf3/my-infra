# build
docker build -t imagename github.com/dbwodlf3/mine-docker-file#master:folder

# example
docker build -t myllvm github.com/dbwodlf3/mine-docker-file#master:llvm
docker run -it -e "TERM=xterm-256color" --name myllvm --privileged -p 9999:22 myllvm bash