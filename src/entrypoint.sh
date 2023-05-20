#!/bin/bash

# Exit on any non-zero return.
set -e

# Defining defaults
export status="true" PREFIX="/usr/share" DO="help" 
export SRCDIR="${PREFIX}/project"
# export PREFIX="${PWD}"
# export SRCDIR="${PREFIX}"

# Get libraries.
source "${SRCDIR}/lazyload.sh" "lib/core" "lib/utils"

# Optional variables.
export CWD="${PWD}"

# Parsing options.
while [[ "${#}" -gt 0 ]] ; do
    case "${1}" in
        "--"[hH][eE][lL][pP]|"-"[hH])
            export DO="help"
            shift
        ;;
        "--"[vV][eE][rR][sS][iI][oO][nN]|"-"[vV])
            export DO="version"
            shift
        ;;
        *)
            shift
        ;;
    esac
done

# Proccessing selected option.
case "${DO}" in
    "help")
        echo -e "There is X parameter(s) for ${0##*/}: 
--help:
\tprint this helper screen.

--version:
\tprint current version of ${0##*/}(${version})."
    ;;
    "version")
        echo "${version}"
    ;;
    *)
        echo "${0##*/}: there is no option like \"${DO}\"."
        exit 1
    ;;
esac