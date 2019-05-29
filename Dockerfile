#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

FROM debian:9

# Configure apt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils 2>&1 \
# Install git, process tools, lsb-release (common in install instructions for CLIs)
    && apt-get -y install git procps lsb-release \
# Install curl zsh, locales, git-flow vim
    && apt-get -y install curl zsh less locales git-flow vim \
# Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
# Add zh_CN locale support
    && echo 'zh_CN.UTF-8 UTF-8' >> /etc/locale.gen \
    && locale-gen
ENV DEBIAN_FRONTEND=dialog

# Set APT sources to aliyun
COPY sources.list /etc/apt/sources.list

# Set time zone
ENV TZ=Asia/Shanghai

# Install Oh-My-Zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set the default shell to zsh instead of sh
ENV SHELL /bin/zsh
