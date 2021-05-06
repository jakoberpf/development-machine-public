# https://regex101.com/
ls | grep -P "^.*\.(enc|gpg)$" | xargs -d"\n" rm
# How it works:
# - ls lists all files (one by line since the result is piped).
# - grep -P "^.*\.(enc|gpg)$" filters the list of files and leaves only those that match the regular expression ^.*\.(enc|gpg)$
# - .* indicates any number of occurrences of ., where . is a wildcard matching any character.
# - [0-9]{2} indicates exactly two occurrences of [0-9], that is, any digit.
# - xargs -d"\n" rm executes rm line once for every line that is piped to it.