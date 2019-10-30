xcode-select --install
sudo xcodebuild -license
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
pip install ansible
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
export PATH=$PATH:~/Library/Python/2.7/bin
brew install git
git clone https://github.com/drewlander/configfiles.git
cd configfiles
ansible-playbook -i inventory playbook.yml  -vvv
