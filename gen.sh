#!/usr/bin/bash

title_wrapper() {
    # remove extension
    # snake to title case
    echo "$1" | sed -E -e "s/\..+$//g"  -e "s/_(.)/ \u\1/g" -e "s/^(.)/\u\1/g"
}

# Header gen function
# Directory (projects/art/posts) - no 'view raw'
# Individual post - same with breadcrumbs - w/ 'view raw'

# Footer gen function
# Individual post only - links? - 'view raw'

# Main page gen

# Name
# ---
