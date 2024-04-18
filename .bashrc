#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set a custom PATH by modifying the default one. However, keep a copy of the default one in order to not keep prefixing
# it when nesting shells etc.
[ -z "$MASTERPATH" ] && export MASTERPATH="$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/go/bin:$MASTERPATH"

# Patches
export WEBKIT_DISABLE_COMPOSITING_MODE=1

# If we have sway available...
if command -v sway &>/dev/null; then
	export XDG_CONFIG_HOME="$HOME/.config"
	export XDG_CACHE_HOME="$HOME/.cache"
	export XDG_DATA_HOME="$HOME/.local/share"
	export XDG_STATE_HOME="$HOME/.local/state"
	export MOZ_ENABLE_WAYLAND=1
	export QT_QPA_PLATFORM="wayland;xcb"

	# Also, if this is tty1, start sway instead.
	if [ "$(tty)" = '/dev/tty1' ]; then
		XDG_CURRENT_DESKTOP=sway dbus-run-session sway
	fi
fi

# If we're in Windows Terminal, advertise true-color support.
if [ -n "$WT_SESSION" ]; then
	export COLORTERM='truecolor'
fi

# Dark mode terminal
[ -z "$COLORFGBG" ] && export COLORFGBG='7;0'

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Reloading .bashrc.
alias rc=". '$HOME/.bashrc'"

PS1='[\u@\h \W]\$ '
