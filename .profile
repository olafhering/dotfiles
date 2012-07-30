# This file is read each time a login shell is started.
# All other interactive shells will only read .bashrc; this is particularly
# important for language settings, see below.

test -s ~/.shellrc -a -z "$olh_shell_rc" && source ~/.shellrc || :
