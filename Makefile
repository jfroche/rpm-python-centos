build_python27:
	mv Dockerfile.27 Dockerfile
	docker build -t jfroche/python27-opt-centos .
build_python24:
	mv Dockerfile.24 Dockerfile
	docker build -t jfroche/python24-opt-centos .
