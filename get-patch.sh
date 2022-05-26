#!/usr/bin/env bash
#
# usage: get-patch.sh <version>
#
# vim: set sw=2 ts=2 et ai si:

function main {
  local version=$1
  local branch="sf-${version}"
  local patchbase=$(git merge-base --fork-point sourceforge ${branch})
  git diff ${patchbase}..${branch}
} # main()

main "$@"
