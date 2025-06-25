#!/bin/bash

size=$1
type=$2

case $type in
  t1)
    for ((i=1; i<=size; i++)); do
      for ((j=1; j<=size-i; j++)); do echo -n " "; done
      for ((k=1; k<=i; k++)); do echo -n "*"; done
      echo
    done
    ;;

  t2)
    for ((i=1; i<=size; i++)); do
      for ((j=1; j<=i; j++)); do echo -n "*"; done
      echo
    done
    ;;

  t3)
    for ((i=1; i<=size; i++)); do
      for ((j=1; j<=size-i; j++)); do echo -n " "; done
      for ((k=1; k<=2*i-1; k++)); do echo -n "*"; done
      echo
    done
    ;;

  t4)
    for ((i=size; i>=1; i--)); do
      for ((j=1; j<=i; j++)); do echo -n "*"; done
      echo
    done
    ;;

  t5)
    for ((i=1; i<=size; i++)); do
      for ((j=1; j<i; j++)); do echo -n " "; done
      for ((k=1; k<=size-i+1; k++)); do echo -n "*"; done
      echo
    done
    ;;

  t6)
    stars=$((2*size - 1))
    for ((i=0; i<size; i++)); do
      for ((j=0; j<i; j++)); do echo -n " "; done
      for ((k=0; k<stars-2*i; k++)); do echo -n "*"; done
      echo
    done
    ;;

  t7)
    # Upper
    for ((i=1; i<=size; i++)); do
      for ((j=1; j<=size-i; j++)); do echo -n " "; done
      for ((k=1; k<=2*i-1; k++)); do echo -n "*"; done
      echo
    done
    # Lower
    for ((i=size-1; i>=1; i--)); do
      for ((j=1; j<=size-i; j++)); do echo -n " "; done
      for ((k=1; k<=2*i-1; k++)); do echo -n "*"; done
      echo
    done
    ;;

  *)
    echo "❌ Invalid type. Use t1 to t7"
    ;;
esac

