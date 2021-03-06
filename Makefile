DWM=dwm
DEP=libX11-devel libXft-devel libXinerama-devel

.PHONY: setup build dep

build: setup
	@echo building...
	git apply --directory=${DWM} dwm-systray-20171101-6aa8e37.diff
	git apply --directory=${DWM} dwm.patch
	cd ${DWM}; make

setup:
	git submodule init
	git submodule update

dep:
	dnf install ${DEP}
