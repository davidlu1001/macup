#!/usr/bin/env bash

#########  BASIC  #########

# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew cask
brew tap caskroom/cask
brew tap homebrew/cask-fonts

# brew doctor
brew doctor

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# change default shell to zsh
chsh -s $(which zsh)


# iTerms2

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

# add syntax highlighting
brew install zsh-syntax-highlighting
echo '\n#[CUSTOM] zsh syntax highlight config\nsource /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc



# source zsh configuration
source ~/.zshrc

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
  alfred \                     # keyboard shortcut
  caffeine \                   # awake mac
  cheatsheet \                 # application shortcut
  chromium \                   # browser
  dropbox \                    # toolbox
  google-chrome \              # browser
  istat-menus \                # system monitoring
  keka \                       # zip & unzip utility
  pdf-expert \                 # pdf editor
  proxifier \                  # proxy
  wechat \                     # communication
  vlc \                        # video player
  1password                    # password management


# Application Toolkit
brew cask install \
  anaconda \                   # python environment
  docker \                     # docker
  intellij-idea-ce \           # ide
  iterm2 \                     # terminal
  keepassx \                   # store encrypted password locally
  sourcetree \                 # version control
  sublime-text \               # text editor
  virtualbox \                 # virtual envrionment
  visual-studio-code           # text editor


# Command Line Toolkit
brew install \
  aria2 \                      # download utility
  awscli \                     # aws cli
  coreutils \
  findutils \
  gawk \
  gnutls \
  gnu-getopt \
  gnu-indent \
  gnu-tar \
  gnu-sed \
  htop \                       # system monitoring
  imagemagick \                # image utility
  jq \                         # json parse utility
  mas \                        # mac app store in command line
  screen \                     # simulation
  tmux \                       # simulation
  tree \                       # directory / file
  wget \                       # download utility
  xclip \                      # clipboard utility
  you-get                      # video download utility


#########  MAC APP STORE  #########

mas install \
  497799835 \                   # Xcode
  540348655 \                   # Monosnap: Screenshot Utility
  1176895641 \                  # Spark: EMail Client

