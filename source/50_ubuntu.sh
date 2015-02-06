# Ubuntu-only stuff. Abort if not Ubuntu.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1

# Package management
alias update="sudo apt-get -qq update && sudo apt-get upgrade"
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias search="apt-cache search"

# Make 'less' more.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Switch between already-downloaded node versions.
function node_ver() {
  (
    ver="${1#v}"
    nodes=()
    if [[ ! -e "/usr/local/src/node-v$ver" ]]; then
      shopt -s extglob
      shopt -s nullglob
      cd "/usr/local/src"
      eval 'for n in node-v*+([0-9]).+([0-9]).+([0-9]); do nodes=("${nodes[@]}" "${n#node-}"); done'
      [[ "$1" ]] && echo "Node.js version \"$1\" not found."
      echo "Valid versions are: ${nodes[*]}"
      [[ "$(type -P node)" ]] && echo "Current version is: $(node --version)"
      exit 1
    fi
    cd "/usr/local/src/node-v$ver"
    sudo make install >/dev/null 2>&1 &&
    echo "Node.js $(node --version) installed." ||
    echo "Error, $(node --version) installed."
  )
}

# Install puppet
function install_puppet() {
    echo "Installing Puppet"
    wget http://apt.puppetlabs.com/puppetlabs-release-stable.deb
    sudo dpkg -i puppetlabs-release-stable.deb
    sudo apt-get -qy update
    sudo apt-get -qy install puppet-common ruby1.9.1 libaugeas-ruby

    sudo apt-get -qy install ruby1.9.1 ruby1.9.1-dev
    sudo gem install librarian-puppet
}

# Install python-*client
function install_clients() {
    echo "Installing Clients"
    cd ~ && virtualenv venv
    . venv/bin/activate
    pip install -U 'pip==1.4.1' 'distribute'
    git clone https://github.com/openstack/python-keystoneclient.git
    git clone https://github.com/openstack/python-novaclient.git
    git clone https://github.com/openstack/python-glanceclient.git
    git clone https://github.com/openstack/python-cinderclient.git
    git clone https://github.com/openstack/python-neutronclient.git
    # eachdir *client -- sudo python setup.py develop
    eachdir *-keystoneclient *-novaclient -- python setup.py develop
}
