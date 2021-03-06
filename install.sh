#!/usr/bin/env bash

#########  HELPER  #########

echo_with_date() {
  echo "[`date '+%H:%M:%S'`]" $1
}



#########  BASIC  #########

install_brew() {
  # brew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # brew cask
  brew tap caskroom/cask
  brew tap homebrew/cask-fonts
}

check_brew() {

  # Check for Homebrew, install bew if we don't have it
  if test ! $(which brew); then
    echo "Installing homebrew..."
    install_brew
  fi

  # brew doctor
  brew doctor

  # cleanup
  brew cleanup
}



#########  APPLICATION  #########

# Common Productivity App
brew_install_productivity_app() {

  brew cask install \
    chromium \
    dropbox \
    google-chrome \
    keka \
    pdf-expert \
    wechat \
    vlc
}

# Common Utility App
brew_install_utility_app() {

  brew cask install \
    aerial \
    alfred \
    caffeine \
    ccleaner \
    cheatsheet \
    fantastical \
    istat-menus \
    keka \
    proxifier \
    zoomus \
    1password

    brew_install_quicklook_plugins
}

# Quick Look plugins
brew_install_quicklook_plugins() {

  brew cask install \
    qlcolorcode \
    qlstephen \
    qlmarkdown \
    quicklook-json \
    qlprettypatch \
    quicklook-csv \
    webpquicklook \
    suspicious-package
}

# Common Development App
brew_install_development_app() {

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
}

# Command Line Toolkit
brew_install_commandline_toolkit() {

  brew install \
    aria2 \
    awscli \
    coreutils \
    findutils \
    gawk \
    git-lfs \
    gnutls \
    gnu-getopt \
    gnu-indent \
    gnu-tar \
    gnu-sed \
    htop \
    imagemagick \
    jq \
    mas \
    moreutils \
    openssh \
    screen \
    tmux \
    tree \
    tmux \
    wget \
    xclip \
    you-get
}



#########  MACUP  #########

clone_macup() {
  git clone https://github.com/yan9yu/macup.git ~/macup
}



#########  ALIAS  #########

config_alias() {

  # backup alias
  mv -rf ~/.alias ~/.alias_bk_`date +%Y-%m-%d`

  ln -s ~/macup/dotfile/alias ~/.alias
}



#########  GIT  #########

config_git() {

  git config --global user.name "yan9yu"
  git config --global user.email dev.eric.young@gmail.com
  git config --global core.editor vim
  git config --global credential.helper cache
  git config --global credential.helper 'cache --timeout=3600'
}



#########  ITERMS2  #########

config_iterm2() {

  # add Solarized Dark theme

  # add powerline font
  brew cask install font-meslo-for-powerline

  # add powerlevel9k
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
}



#########  TMUX  #########

config_tmux () {

  # backup tmux
  mv ~/.tmux.conf ~/.tmux.conf_bk_`date +%Y-%m-%d`

  ln -s ~/macup/dotfile/tmux.conf ~/.tmux.conf
}



#########  VIM  #########

config_vim () {

  # backup vim
  mv ~/.vimrc ~/.vimrc_bk_`date +%Y-%m-%d`

  ln -s ~/macup/dotfile/vimrc ~/.vimrc
}



#########  ZSH  #########

install_zsh() {

  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # change default shell to zsh
  chsh -s $(which zsh)
}

install_zsh_addons() {

  # add syntax highlighting
  brew install zsh-syntax-highlighting

}


config_zsh() {

  # Check for zsh, install bew if we don't have it
  if test ! $(which zsh); then
    echo "Installing zsh..."
    install_zsh
    install_zsh_addons
  fi

  # backup zsh
  mv ~/.zshrc ~/.zshrc_bk_`date +%Y-%m-%d`

  ln -s ~/macup/dotfile/zshrc ~/.zshrc
}



#########  APPLY  #########

apply_config() {

  # iterm2

  # tmux
  source ~/.tmux.conf

  # vim
  source ~/.vimrc

  # zsh
  source ~/.zshrc
}



#########  MAIN WORKFLOW  #########

echo "------------------------------"
echo "Installing brew"
install_brew
check_brew

echo "------------------------------"
echo "Brew Installing Productivity Application"
brew_install_productivity_app

echo "------------------------------"
echo "Brew Installing Utility Application"
brew_install_utility_app

echo "------------------------------"
echo "Brew Installing Development Application"
brew_install_development_app

echo "------------------------------"
echo "Brew Installing Command Line Toolkit"
brew_install_commandline_toolkit

echo "------------------------------"
echo "Cloning macup project"
clone_macup

echo "------------------------------"
echo "Configing alias"
config_alias

echo "------------------------------"
echo "Configing Git"
config_git

echo "------------------------------"
echo "Configing iTerms2"
config_iterm2

echo "------------------------------"
echo "Configing tmux"
config_tmux

echo "------------------------------"
echo "Configing zsh"
config_zsh

echo "------------------------------"
echo "Applying configuration"
apply_config

echo "------------------------------"
echo "Script completed. Enjoy 🙌"
