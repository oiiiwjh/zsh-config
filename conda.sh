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

conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge 
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
 
# 设置搜索时显示通道地址
conda config --set show_channel_urls yes

conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
