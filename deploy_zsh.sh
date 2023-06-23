apt install zsh -y

export RUNZSH=yes CHSH=yes
# 检查 curl 是否存在
command -v curl >/dev/null 2>&1 || { echo >&2 "需要 curl 工具，但系统中未安装。尝试安装 curl 后再运行此脚本。"; exit 1; }
# 检查 git 是否存在
command -v git >/dev/null 2>&1 || { echo >&2 "需要 git 工具，但系统中未安装。尝试安装 git 后再运行此脚本。"; exit 1; }

# 从 GitHub 下载安装脚本并运行
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

chsh -s $(which zsh)


# download zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# change theme and plugins
sed -i.bak 's/ZSH_THEME="[^"]*"/ZSH_THEME="xiong-chiamiov-plus"/' ~/.zshrc
sed -i.bak 's/plugins=(\(.*\))/plugins=(\1 zsh-syntax-highlighting)/' ~/.zshrc
sed -i.bak 's/plugins=(\(.*\))/plugins=(\1 zsh-autosuggestions)/' ~/.zshrc

