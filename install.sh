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

# 拉取开源主题（以 Spaceship 为例）
install_theme() {
  echo "安装 Spaceship 主题..."
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
}

# 安装自定义插件（非开源）
install_custom_plugins() {
  if [ -d "$CONFIG_DIR/plugins" ]; then
    echo "安装自定义插件..."
    mkdir -p "$ZSH_CUSTOM_DIR/plugins"
    cp -r "$CONFIG_DIR/plugins/"* "$ZSH_CUSTOM_DIR/plugins/"
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
  install_theme          # 自动拉取开源主题
  install_custom_plugins # 安装自定义插件（如有）
  link_config
  echo "安装完成！请重启终端或执行 'source ~/.zshrc'"
  echo "注意：首次使用 Spaceship 需运行 'spaceship configure' 配置字体"
}

main
