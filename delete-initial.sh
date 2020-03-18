#!/bin/bash

find . -name '.initialized' -type f -delete
find . -name '.restored' -type f -delete
find . -name '.DS_Store' -type f -delete
find . -name 'access.log' -type f -delete
find . -name 'error.log' -type f -delete