#########################################################################
# File Name: pro.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: 2018年01月17日 星期三 22时31分33秒
# Version : 1.0
#########################################################################
#!/bin/bash

[ $# -ne 1 ] && echo "$0 project_name" && exit 1

wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
rm get-pip.py
sudo pip3 install sphinx
sudo pip3 install sphinx_rtd_theme
rm readme.md

sphinx-quickstart --sep --dot=_ \
    -p $1 -a Sues -v 1.0.0 -r 1.0.0 -l zh_CN \
    --suffix=.rst  --epub \
    --ext-imgmath  \
    --makefile --no-batchfile \
    -q

sed  '/^html_theme/s/alabaster/sphinx_rtd_theme/' source/conf.py -i

make html

echo "use your web brower open build/html/index.html"
echo "go https://readthedocs.org/ 注册Read the Docs，在Dashboard中创建一个新的Project，Repo中填入项目的git url"
echo "rm .git && git init && git add -A && git push origin master"

#--master=MASTER --ext-mathjax
