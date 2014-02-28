# Load npm_globals, add the default node into the path
source ~/.dotfiles/source/50_devel.sh

# Install Ruby.
# if [[ "$(type -P rbenv)" ]]; then
  # versions=(2.0.0-p247)

  # list="$(to_install "${versions[*]}" "$(rbenv whence ruby)")"
  # if [[ "$list" ]]; then
    # e_header "Installing Ruby versions: $list"
    # for version in $list; do rbenv install "$version"; done
    # [[ "$(echo "$list" | grep -w "${versions[0]}")" ]] && rbenv global "${versions[0]}"
    # rbenv rehash
  # fi
# fi

# Install Gems.
# if [[ "$(type -P gem)" ]]; then
  # gems=(bundler awesome_print pry lolcat)

  # list="$(to_install "${gems[*]}" "$(gem list | awk '{print $1}')")"
  # if [[ "$list" ]]; then
    # e_header "Installing Ruby gems: $list"
    # gem install $list
    # rbenv rehash
  # fi
# fi

