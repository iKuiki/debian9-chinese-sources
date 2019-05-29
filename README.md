# debian9-chinese-sources

debian 9 stretch 换为国内阿里的apt源后的镜像

相比与原版镜像，做了如下修改：

- apt源修改为国内阿里云的源
- 通过apt多安装了curl zsh less locales git-flow vim这六个组件
- 安装了oh-my-zsh
- 生成了中文locale支持，在终端中中文的输入与输出都不会乱码了
- 时区设置为+0800
- 设置默认shell为zsh
