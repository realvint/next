# git describe --abbrev=0 > VERSION

parse_git_branch() { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* .*\/\(.*\)/\1/' ; }

ver=$(parse_git_branch)

echo $ver > VERSION

git add VERSION
git add CHANGELOG.md

git commit -m "bump version to $ver"
