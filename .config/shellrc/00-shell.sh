# tab == 4 spaces
tabs -4

umask 022

stty -ixon

unlimit

limit stack 8192
limit core 0
limit -s
