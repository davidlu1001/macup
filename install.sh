#!/usr/bin/env bash

#########  HELPER  #########

echo_with_date() {
  echo "[`date '+%H:%M:%S'`]" $1
}

# source zsh configuration
apply_zsh_config() {
  source ~/.zshrc
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
    wget \
    xclip \
    you-get
}



#########  ZSH  #########

install_zsh() {

  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # change default shell to zsh
  chsh -s $(which zsh)
}

config_zsh() {

  # add syntax highlighting
  brew install zsh-syntax-highlighting
  echo '\n#[CUSTOM] zsh syntax highlight config\nsource /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc

}



#########  ITERMS2  #########

config_iterm2() {

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

apply_zsh_config
