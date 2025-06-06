#!/bin/bash
# install.sh

CONFIG_DIR=$(cd "$(dirname "$0")" && pwd)
ZSH_CUSTOM_DIR=~/.oh-my-zsh/custom

# 安装 Oh My Zsh（如果未安装）
if [ ! -d ~/.oh-my-zsh ]; then
  echo "安装 Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 备份现有配置
backup() {
  for file in .zshrc .zprofile; do
    if [ -f ~/$file ]; then
      cp ~/$file ~/${file}.bak
      echo "备份 $file 到 ${file}.bak"
    fi
  done
}

# 安装所有必要的插件
install_plugins() {
  echo "安装插件..."
  
  # 创建插件目录
  mkdir -p "$ZSH_CUSTOM_DIR/plugins"
  
  # 安装 zsh-autosuggestions
  if [ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions"
  fi
  
  # 安装 zsh-syntax-highlighting
  if [ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting"
  fi
  
  # 安装 conda-zsh-completion
  if [ ! -d "$ZSH_CUSTOM_DIR/plugins/conda-zsh-completion" ]; then
    git clone https://github.com/esc/conda-zsh-completion "$ZSH_CUSTOM_DIR/plugins/conda-zsh-completion"
  fi
}

# 安装主题
install_themes() {
  echo "安装主题..."
  
  # 创建主题目录
  mkdir -p "$ZSH_CUSTOM_DIR/themes"
  
  # 安装 Spaceship 主题
  if [ ! -d "$ZSH_CUSTOM_DIR/themes/spaceship-prompt" ]; then
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM_DIR/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM_DIR/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM_DIR/themes/spaceship.zsh-theme"
  fi
}

# 链接配置文件
link_config() {
  echo "链接配置文件..."
  ln -sf "$CONFIG_DIR/.zshrc" ~/.zshrc
  ln -sf "$CONFIG_DIR/.zprofile" ~/.zprofile
}

# 主函数
main() {
  backup
  install_plugins
  install_themes
  link_config
  echo "安装完成！请重启终端或执行 'source ~/.zshrc'"
}

main