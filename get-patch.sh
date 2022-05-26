#!/usr/bin/env bash
#
# usage: get-patch.sh <version> [ <patchtag> ]
#
# vim: set sw=2 ts=2 et ai si:

function patch_target {
  local branch=$1
  local patchtag=$2

  if [ -z "$patchtag" ]; then
    echo $branch
  else
    echo $patchtag
  fi
} # patch_target()

function main {
  local version=$1
  local patchtag=$2
  local branch="sf-${version}"
  local patchtarget=$(patch_target $branch $patchtag)
  local patchbase=$(git merge-base --fork-point sourceforge ${branch})
  git diff ${patchbase}..${patchtarget}
} # main()

main "$@"
