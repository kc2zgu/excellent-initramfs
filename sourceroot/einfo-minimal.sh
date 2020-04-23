# Minimalist implementation of Gentoo's einfo/ebegin/eend/etc message functions
# Does not include: syslog support, any configuration settings, indentation, right-justified eend
# (C) Stephen Cavilia, 2020

# hard-coded standard color codes (skip tput detection)
GOOD=$(printf '\033[32;01m')
WARN=$(printf '\033[33;01m')
BAD=$(printf '\033[31;01m')
NORMAL=$(printf '\033[0m')

# Display an informational message
einfo()
{
    echo " ${GOOD}*${NORMAL} $*"
}

# Display a warning message
ewarn()
{
    echo " ${WARN}*${NORMAL} $*"
}

# Display an erorr message, and return failure
eerror()
{
    echo " ${BAD}*${NORMAL} $*"
    return 1
}

# Start an operation, displaying a message
ebegin()
{
    echo -n " ${GOOD}*${NORMAL} $* ... "
}

# Display the status of the operation started with ebegin
eend()
{
    if [ "${1:-0}" = "0" ]; then
        echo "${GOOD}[ ok ]${NORMAL}"
    else
        echo "${BAD}[ !! ]${NORMAL}"
    fi
}
