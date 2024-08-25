#ai #image 
## Info
- https://pixart-alpha.github.io/PixArt-sigma-project/

## Demo
- PixArt-Alpha 1024
	- https://openxlab.org.cn/apps/detail/PixArt-alpha/PixArt-alpha
- PixArt-LCM 1024px
	- https://huggingface.co/spaces/PixArt-alpha/PixArt-LCM
	- https://openxlab.org.cn/apps/detail/houshaowei/PixArt-LCM
- PixArt-Alpha 1024px
	- https://huggingface.co/spaces/PixArt-alpha/PixArt-alpha
- Colab
	- https://colab.research.google.com/drive/1jZ5UZXk7tcpTfVwnX33dDuefNMcnW9ME?usp=sharing
	- Install
		- `!pip install diffusers transformers sentencepiece accelerate`
	- Torch
		- `import torch`
		- `from diffusers import PixArtAlphaPipeline`
	- Pixart
		- `pipe = PixArtAlphaPipeline.from_pretrained("PixArt-alpha/PixArt-XL-2-1024-MS", torch_dtype=torch.float16)`
		- `pipe = pipe.to('cuda')`
	- Prompt
		- `prompt = "full-length beautiful and sexy girl with big boobs standing half-turned and looking at the camera in a open swimsuit with the sea in the background"`
		- `pipe(prompt).images[0]`