all:
	@echo "Usage: make [wgpu]"

.PHONY: wgpu

FILE=wgpu-macos-64-release.zip
wgpu:
	wget https://github.com/gfx-rs/wgpu-native/releases/download/v0.6.0/${FILE}
	unzip -dwgpu ${FILE}
	rm ${FILE}
