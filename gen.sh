#!/usr/bin/bash

title_wrapper() {
    # remove extension
    # snake to title case
    echo "$1" | sed -E -e "s/\..+$//g"  -e "s/_(.)/ \u\1/g" -e "s/^(.)/\u\1/g"
}

read_time() {
    minu="$(eva -f 1 "$1"/150 | xargs)"
    echo "$minu"
}

length() {
    cm="$(eva -f 2 "$1"*18*0.0222 | xargs)"
    echo "$cm"
}

link_wrapper() {
    # 1 - id
    # 2 - title
    # 3 - date
	# 4 - words
    # 5 - sub dir
    echo -ne "
    <tr>
        <td class=\"table-post\">
            <div class=\"date\">
                $3
            </div>
            <a href=\"/compiled/$5/$1\" class=\"post-link\">
                <span class=\"post-link\">$2</span>
            </a>
        </td>
        <td class=\"table-stats\">
            <span class=\"stats-number\">
                $4
            </span>
            <span class=\"stats-unit\">words</span>
        </td>
    </tr>
    "
}

header() {
	echo -ne "
	<div class=\"header\">
		<h1>Luke McEldowney</h1>
		<hr>
		<p></p>
		<div class=\"link-line\">
			<a>Github</a>
		</div>
	</div>
	"
}

content_gen() {
	# 1 - raw filename
	# 2 - sub dir
	file=$1
	subdir=$2
	id="${file##*/}"

	# Generate
	stats=$(wc "$file")
	words="$(echo "$stats" | awk '{print $2}')"
	#lines="$(echo "$stats" | awk '{print $1}')"

	#read_time="$(read_time $words)"
	#height="$(length $lines)"

	title=$(title_wrapper "$id")
	echo "[~] $title"
	date=$(date -r "$file" "+%d %b %Y")
	#link=$(link_wrapper "${id%.*}" "$title" "$date" "$words" "$2")

	id="${id%.*}"
    mkdir -p "compiled/$subdir/$id"
    esh  \
        -o "compiled/$subdir/$id/index.html" \
        "./post.esh" \
        file="$file" \
        date="$date" \
        title="$title" \
		words="$words"

        #read_time="$read_time" \
        #height="$height"

	# TODO copy over assets to compiled
	# plus fix copied dirname (seems to be based on the title right now)
	src="$(dirname $file)"
	dest="${src//raw/compiled}"
	rsync --exclude="*.md" "$src"/* "$dest"

}

cat > ./index.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="./style.css">
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1">
<meta name="theme-color" content="#ffffff">
<meta name="HandheldFriendly" content="true">
<meta property="og:title" content="mceld">
<meta property="og:type" content="website">
<meta property="og:url" content="https://mceld.github.io/portfolio/">
<!-- <link rel="icon" type="image/x-icon" href="/favicon.png"> -->
<title>portfolio</title>
<body>
	"$(header)"
	<div class="posts">
	<div class="post">
EOF

#echo -ne "$(intro)<table>" >> ./index.html # intro

# File lists ordered by most recent

# Dir format - ./raw/(subdir)/*/*.md
# (subdir)/* should contain folders with md and asset files inside

projects=$(ls -t ./raw/projects/*/*.md)
art=$(ls -t ./raw/art/*/*.md)
text_posts=$(ls -t ./raw/text_posts/*/*.md)

# Clean
mkdir -p compiled/projects compiled/art compiled/text_posts
rm -rf "./compiled/projects"
rm -rf "./compiled/art"
rm -rf "./compiled/text_posts"

# Generate content for each of the sub-levels of the site
for p in $projects; do content_gen "$p" "projects"; done
for a in $art; do content_gen "$a" "art"; done
for t in $text_posts; do content_gen "$t" "text_posts"; done

# Finish wrapping the tags
cat >> ./index.html << EOF
    </table>
	<hr>
    <div class="footer">
        <a href="https://github.com/mceld">Github</a> ·
        <a href="mailto:mceldowneyluke@gmail.com">Mail</a> ·
    </div>
    </div>
</div>
</body>
</html>
EOF

# Directory (projects/art/posts) - no 'view raw'

# Individual post - same with breadcrumbs - w/ 'view raw'

# Footer gen function
# Individual post only - links? - 'view raw'

# Main page gen

# Name
# ---
