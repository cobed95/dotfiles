# Install homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Making sure I've got git.
git --version

# Setup git.
git config --global user.name "Eundo Lee"
git config --global user.email "cobed95@gmail.com"

# Clone into important repositories.
git clone git@github.com:cobed95/snu-2018-1.git ../
git clone git@github.com:cobed95/learning-ps.git ../

# Install Oh My Zsh using wget.
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install Amix's awesome vimrc.
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Install Source Code Pro.
brew tap caskroom/fonts && brew cask install font-source-code-pro

# Install Vim syntax highlighting for Bluespec System Verilog.
git clone https://github.com/hanw/vim-bluespec.git ../.vim_runtime/sources_non_forked

