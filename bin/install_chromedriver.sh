#!usr/bin/env bash
# download and install latest chromedriver for linux or mac.
# required for selenium to drive a Chrome browser.

install_dir="/usr/local/bin"
version=$(wget -qO- https://chromedriver.storage.googleapis.com/LATEST_RELEASE)
if [[ $(uname) == "Darwin" ]]; then
    zname=chromedriver_mac64.zip
elif [[ $(uname) == "Linux" ]]; then
    zname=chromedriver_linux64.zip
else
    echo "can't determine OS"
    exit 1
fi
url=https://chromedriver.storage.googleapis.com/$version/$zname
wget -N "$url" -P ~/
unzip ~/"$zname" -d ~/
rm ~/"$zname"
sudo mv -f ~/chromedriver "$install_dir/chromedriver"
sudo chown root:root "$install_dir/chromedriver"
sudo chmod 0755 "$install_dir/chromedriver"
echo "installed chromedriver binary in $install_dir"
