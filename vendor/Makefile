all:
	@echo "Usage: make [wgpu|shaderc]"

.PHONY: wgpu shaderc nvim

WGPU=wgpu-macos-64-release.zip
wgpu:
	wget https://github.com/gfx-rs/wgpu-native/releases/download/v0.6.0/${WGPU}
	unzip -dwgpu ${WGPU}
	rm ${WGPU}

SHADERC=install.tgz
shaderc:
	wget https://storage.googleapis.com/shaderc/artifacts/prod/graphics_shader_compiler/shaderc/macos/continuous_clang_release/347/20200903-075048/${SHADERC}
	tar -xvzf ${SHADERC}
	rm ${SHADERC}
	mv install shaderc

nvim:
	git clone --depth 1 --branch v0.4.4 git@github.com:neovim/neovim
	cd neovim && make libnvim
