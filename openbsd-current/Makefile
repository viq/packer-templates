update-amd64:
	@vagrant box remove obsd-current-amd64 -f
	@vagrant box add obsd-current-amd64 packer_amd64_libvirt.box

update-i386:
	@vagrant box remove obsd-current-i386 -f
	@vagrant box add obsd-current-i386 packer_i386_libvirt.box

amd64: packer_amd64_libvirt.box


packer_amd64_libvirt.box:
	@packer build -only=amd64 template.json

i386: packer_i386_libvirt.box
	@packer build -only=i386 template.json

all: packer_amd64_libvirt.box packer_i386_libvirt.box
	@packer build template.json

.PHONY: update-all clean
update-all: update-amd64 update-i386

clean:
	@rm -rf packer_*
