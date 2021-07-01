#!/bin/bash

print_usage () {
  echo "  Usage:"
  echo "      Build (no tag):   build.sh [--tag TAG]"
  echo "  Build & Tag & Push:   build.sh <--tag TAG> <--user USER> <--pat PAT> <--url URL>"
  exit 1
}

pn=0
while [ $# -gt 0 ]; do
   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
        ((pn=pn+1))
   fi
  shift
done

if [ $pn -eq 0 ]; then
  echo "Building docker image without tagging..." && sleep 2
  docker build .
elif [ $pn -eq 1 ]; then
  echo "Building docker image with tag '$tag'..." && sleep 2
  docker build . -t $tag
elif [ $pn -eq 4 ]; then
  if [ -z ${tag+x} ] || [ -z ${user+x} ] || [ -z ${pat+x} ] || [ -z ${url+x} ]; then
    echo "## ERROR | Tag, user, pat and URL are mandatory parameters when using second option! ##"
    print_usage
  else
    echo "Building docker with tag $tag, pushing as $url/$user/$tag..." && sleep 2
    docker build . -t $url/$user/$tag
    echo $pat | docker login $url --user $user --pat-stdin
    docker push $url/$user/$tag
  fi
else
  echo "## ERROR | Wrong number of parameters given! ##"
  print_usage
fi