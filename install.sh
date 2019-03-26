#!/usr/bin/env bash

#########  BASIC  #########

# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew cask
brew tap caskroom/cask
brew tap homebrew/cask-fonts

# brew doctor
brew doctor


#########  APPLICATION  #########

# Quick Look plugins
brew cask install \
  qlcolorcode \
  qlstephen \
  qlmarkdown \
  quicklook-json \
  qlprettypatch \
  quicklook-csv \
  betterzip \
  webpquicklook \
  suspicious-package


# Common Application
brew cask install \
  alfred \
  caffeine \
  cheatsheet \
  chromium \
  dropbox \
  google-chrome \
  istat-menus \
  keka \
  pdf-expert \
  proxifier \
  wechat \
  vlc \
  1password


# Application Toolkit
brew cask install \
  anaconda \
  docker \
  intellij-idea-ce \
  iterm2 \
  keepassx \
  sourcetree \
  sublime-text \
  virtualbox \
  visual-studio-code


# Command Line Toolkit
brew install -with-default-names 
  aria2 \
  awscli \
  coreutils 
  findutils 
  gawk 
  gnutls 
  gnu-getopt 
  gnu-indent 
  gnu-tar 
  gnu-sed 
  htop \
  imagemagick \
  jq \
  mas \
  screen \
  tmux \
  tree \
  wget \
  xclip \
  you-get


#########  MAC APP STORE  #########

mas install 
  497799835 \
  540348655 \
  1176895641 \


#########  ZSH  #########

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# change default shell to zsh
chsh -s $(which zsh)


# add syntax highlighting
brew install zsh-syntax-highlighting
echo '\n#[CUSTOM] zsh syntax highlight config\nsource /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc


#########  ITERMS2  #########

# add Solarized Dark theme
#curl -o /tmp/solarized-dark-patched.itermcolors https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Solarized%20Dark%20-%20Patched.itermcolors

## TODO
# need manual load solarized-dark-patched.itermcolors into iTerms2


# add powerline font
brew cask install font-meslo-for-powerline


# add powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

## TODO
#sed -i '/ZSH_THEME=robbyrussell/b;n;cZSH_THEME="powerlevel9k/powerlevel9k"' ~/.zshrc


# specify brew path
echo '\n#[CUSTOM] specify brew path\nexport PATH="/usr/local/bin:$PATH"' >> ~/.zshrc


# ZSH




# source zsh configuration
source ~/.zshrc