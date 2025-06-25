#!/bin/bash


if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <template_file> key1=value1 key2=value2 ..."
  exit 1
fi

template_file=$1
shift  


template_content=$(<"$template_file")


for pair in "$@"; do
  key="${pair%%=*}"       
  value="${pair#*=}"     
  
  template_content=${template_content//"{{${key}}}"/$value}
done


echo "$template_content"


