cd ~
#get the platform
platform=$(uname -s)

#install miniconda
if [ $platform == "Linux" ]; then
    if [ $(uname -m) == "aarch64" ]; then
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh
    else
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    fi
elif [ $platform == "Darwin" ]; then
    if [ $(uname -m) == "arm64" ]; then
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
    else
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    fi
fi

bash Miniconda3-latest*.sh -b -p $HOME/miniconda
rm Miniconda3-latest*.sh

# initialize conda
$HOME/miniconda/bin/conda init

