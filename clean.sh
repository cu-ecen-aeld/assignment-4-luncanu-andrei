#!/bin/bash
# Script to clean the buildroot directory
cd $(dirname $0)/buildroot
make distclean
