#! /bin/bash
[[ ! -f /usr/bin/google-chrome ]] && sudo apt install -y google-chrome
chrome_version=$(google-chrome --version)
chrome_version_num=${chrome_version##*[:space:]}
chrome_major_version_num=${chrome_version_num%%\.*}
chrome_major_version_num=${chrome_major_version_num// /}
echo ${#chrome_major_version_num}
echo ${chrome_major_version_num}
if [ $chrome_major_version_num == 77 ]; then
    chrome_driver_version="77.0.3865.40"
elif [ $chrome_major_version_num == 77 ]; then
    chrome_driver_version="78.0.3904.11"
fi

zip_file="chromedriver_linux64.zip"
[[ -f $zip_file ]] && rm $zip_file
cmd="wget https://chromedriver.storage.googleapis.com/${chrome_driver_version}/$zip_file"
echo $cmd
eval $cmd
unzip $zip_file
if [ ! -f "chromedriver" ]; then
    echo "can't find chromedriver"
    echo "fatal error"
    exit
fi
chmod +x chromedriver
local_bin="$HOME/bin/"
echo $local_bin
[[ ! -d "$local_bin" ]] && mkdir -p "$local_bin"
mv -f chromedriver $local_bin



