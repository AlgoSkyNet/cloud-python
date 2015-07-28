#
# Python Installation (incl. Jupyter)
# (c) Dr Yves J Hilpisch
# The Python Quants GmbH
#

# A FEW SYSTEM TOOLS
# ADD THINGS YOU WANT TO USE (e.g. Git)
apt-get install htop unzip -y
apt-get autoremove

# INSTALL MINICONDA
wget -q http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O Miniconda.sh
bash Miniconda.sh -b
rm Miniconda.sh
export PATH="$HOME/miniconda/bin:$PATH"

cat >> ~/.profile <<EOF
export PATH="$HOME/miniconda/bin:$PATH"
EOF

# INSTALL PYTHON LIBRARIES --
# ADD LIBRARIES YOU WANT TO USE
conda install -y ipython-notebook
conda install -y matplotlib
conda install -y pandas
conda install -y seaborn

pip install plotly
pip install cufflinks
pip install flask-wtf

# COPYING FILES TO WORKING DIRECTORY
mkdir ${HOME}/notebook
mv ${HOME}/*.ipynb ${HOME}/notebook
rm ${HOME}/*.ipynb
unzip ${HOME}/stock_int.zip -d ${HOME}/notebook
rm ${HOME}/stock_int.zip
cd ${HOME}/notebook

# STARTING JUPYTER NOTEBOOK
ipython notebook --ip=0.0.0.0 --no-browser --notebook-dir=$HOME/notebook
