# 进入用户目录
cd /home/wjh

# 在用户目录下创建miniconda3文件夹
mkdir -p ~/miniconda3
# 下载miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
# 安装miniconda
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
# 删除安装包
rm -rf ~/miniconda3/miniconda.sh
