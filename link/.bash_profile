# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin:~/.dotfiles/bin:$PATH
export PATH

EDITOR=vim
export EDITOR
VISUAL=vim
export VISUAL
SVN_EDITOR=vim
export SVN_EDITOR

figlet -f smslant `hostname`

# Printing a calendar for the month
# cal $(date +"%m") $(date +"%Y")

# Display Historic events that happened on this day
sed = $(echo /usr/share/calendar/calendar*) | sed -n "/$(date +%m\\/%d\\\|%b\*\ %d)/p"

# Display a riddle, literature snippet, or fortune
/usr/games/fortune -s

# Display machine stats
echo -e "Machine stats"; uptime
procinfo|head -n 13|tail -n 11

export GREP_OPTIONS=--exclude-dir='.svn'
