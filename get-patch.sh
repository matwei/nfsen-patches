#!/usr/bin/env bash
#
# usage: get-patch.sh <version> [ <patchtag> ]
#
# vim: set sw=2 ts=2 et ai si:

function patch_name {
  local branch=$1
  local patchtag=$2

  if [ -z "$patchtag" ]; then
    echo "nfsen-${branch}-last.patch"
  else
    echo "nfsen-${branch}-${patchtag}.patch"
  fi
} # patch_name()

function patch_target {
  local branch=$1
  local patchtag=$2

  if [ -z "$patchtag" ]; then
    echo $branch
  else
    echo "${branch}-${patchtag}"
  fi
} # patch_target()

function main {
  local version=$1
  local patchtag=$2
  local branch="sf-${version}"
  local patchtarget=$(patch_target $branch $patchtag)
  local patchbase=$(git merge-base --fork-point sourceforge ${branch})
  local patchname=$(patch_name $branch $patchtag)
  git diff ${patchbase}..${patchtarget} > ${patchname}
} # main()

main "$@"
