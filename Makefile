version = latest
arch = arm32v6
local_rev = 0

build:
	docker build -t "paulseward/tftp-hpa:$(arch)-$(version)-$(local_rev)" \
		--build-arg VERSION=$(version) \
		--build-arg ARCH=$(arch)

push:
	docker push "paulseward/tftp-hpa:$(arch)-$(version)-$(local_rev)"


