#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

mkdir tmp
git clone git@github.com:jakoberpf/development-machine.git tmp
rm -rf tmp/.git
mv tmp/* .
rm -rf tmp

# https://regex101.com/
ls -RA | awk '/:$/&&f{s=$0;f=0}/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}NF&&f{ print s"/"$0 }' | grep -E "^.*\.(enc|gpg|vault_pass)$" | xargs -d"\n" rm
ls -RA | awk '/:$/&&f{s=$0;f=0}/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}NF&&f{ print s"/"$0 }' | grep 'vault.yaml' | xargs -d"\n" rm
# How it works:
# - ls lists all files (one by line since the result is piped).
# - grep -P "^.*\.(enc|gpg)$" filters the list of files and leaves only those that match the regular expression ^.*\.(enc|gpg)$
# - .* indicates any number of occurrences of ., where . is a wildcard matching any character.
# - [0-9]{2} indicates exactly two occurrences of [0-9], that is, any digit.
# - xargs -d"\n" rm executes rm line once for every line that is piped to it.