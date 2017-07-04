build_python27:
	docker build -t jfroche/python27-opt-centos -f Dockerfile.27 .
build_python24:
	docker build -t jfroche/python24-opt-centos -f Dockerfile.24 .
