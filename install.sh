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
  echo "brew path: `which brew`"

  # brew doctor
  brew doctor
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

  # add syntax highlighting
  brew install zsh-syntax-highlighting
}

config_zsh() {

  # backup zsh
  mv ~/.zshrc ~/.zshrc_bk_`date +%Y-%m-%d`

  ln -s ~/macup/dotfile/zshrc ~/.zshrc
}



#########  APPLY  #########

apply_config() {

  # iterm2

  # tmux

  # vim

  # zsh
  source ~/.zshrc
}



#########  MAIN WORKFLOW  #########

install_brew
check_brew

brew_install_productivity_app
brew_install_utility_app
brew_install_development_app
brew_install_commandline_toolkit

install_zsh

config_zsh

config_iterm2

config_git

apply_config
