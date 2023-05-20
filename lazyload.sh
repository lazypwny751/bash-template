#!/bin/bash

# Lazyload script for the project under GPLv3 License.

export status="true" CWD="$(cd -- "$(echo "${BASH_SOURCE[0]%/*}")" &> /dev/null ; echo ${PWD})" LIBLAZYLOAD=()

if [[ -n "${@}" ]] ; then
    for i in "${@}" ; do
        if [[ -f "${CWD}/${i}.sh" ]] ; then
            export LIBLAZYLOAD+=("${CWD}/${i}.sh")
        elif [[ -f "${CWD}/${i}" ]] ; then
            export LIBLAZYLOAD+=("${CWD}/${i}")
        else
            echo -e "==> library \"${i}\" not doesn't exists."
            export status="false"
        fi
    done
else
    echo "nothing to do."
    export status="false"
fi

if ${status} ; then
    for x in "${LIBLAZYLOAD[@]}" ; do
        if [[ "${BASH_SOURCE[@]}" != *"${x}"* ]] ; then
            source "${x}"
        fi
    done
else
    exit 1
fi