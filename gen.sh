#!/usr/bin/bash

PREVIEW_LIMIT=2
PREVIEW_COUNT=0

more_links() {
    # 1 - sub page
    cat << EOF
    <tr><td><a href="./compiled/$1/index.html" class="post-end-link more-link">More ⟶ </a></td></tr>
EOF
}

sub_section_link() {
    # 1 - sub page
    cat << EOF
    <tr><td class="recent-heading"><span class="recent-heading">$1</span></td></tr>
EOF
}

image_block() {
    # 1 - filename
    # 2 - title
    # 3 - date
    echo -ne "
    <tr>
        <td class="table-post">
            <div class=\"date\">
                $3
            </div>
            <a href=\"./compiled/art/$1\" class=\"post-link\">
                <span class=\"post-link\">$2</span>
            </a>
        </td>
        <td class=\"table-stats\">
            <a href=\"./compiled/art/$1\">
                <img src=\"./compiled/art/$1\" height=\"50px\">
            </a>
        </td>
    </tr>
    "
}

breadcrumbs() {
    # 1 - path
    cat << EOF
    <a href="./" class="post-end-link">Home</a>
    <span>/</span>
    <a class="post-end-link">$1</a>
EOF
}

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
            <a href=\"./compiled/$5/$1/index.html\" class=\"post-link\">
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
		<div class="separator"></div>
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
	date=$(date -r "$file" "+%d %b %Y")
	link=$(link_wrapper "${id%.*}" "$title" "$date" "$words" "$2")

	echo "[+] $subdir/$title"

	# Previews
	if [[ $PREVIEW_COUNT -lt $PREVIEW_LIMIT ]]; then
		echo -ne "$link" >> ./index.html
	fi
	((PREVIEW_COUNT+=1))
	
	# Projects / art / posts generator
	id="${id%.*}" # art/jone => subdir=art, id=jone
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

	# Assets
	src="$(dirname $file)/"
	dest="${src//raw/compiled}"

	rsync -r --exclude="*.md" "$src" "$dest"

	# Generate the 'directory' page
	echo -ne "$link" >> ./compiled/"$subdir"/index.html

}

cat > ./index.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
<base href="https://mceld.github.io/portfolio/" />
<link rel="stylesheet" href="./style.css">
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1">
<meta name="theme-color" content="#ffffff">
<meta name="HandheldFriendly" content="true">
<meta property="og:title" content="mceld">
<meta property="og:type" content="website">
<meta property="og:url" content="https://mceld.github.io/portfolio/">
<!-- <link rel="icon" type="image/x-icon" href="./favicon.png"> -->
<title>portfolio</title>
<body>
	<div class="posts">
	<div class="post">
	$(header)
    <table>
EOF

#echo -ne "$(intro)<table>" >> ./index.html # intro

# File lists ordered by most recent

# Dir format - ./raw/(subdir)/*/*.md
# (subdir)/* should contain folders with md and asset files inside

projects=$(ls -t ./raw/projects/*/*.md)
art=$(ls -t ./raw/art/*/*.md)
posts=$(ls -t ./raw/posts/*/*.md)

# Clean
rm -rf "./compiled/projects"
rm -rf "./compiled/art"
rm -rf "./compiled/posts"
mkdir -p compiled/projects compiled/art compiled/posts


for p in Projects Art Posts; do
    esh  \
        -o "./compiled/${p,,}/index.html" \
        "./dir.esh" \
        title="$p" \

    cat >> ./compiled/${p,,}/index.html << EOF
	$(breadcrumbs $p)
EOF
done

# Generate content for each of the sub-levels of the site
echo -ne $(sub_section_link "Projects") >> ./index.html
echo -ne "
    <h1>Projects</h1>
    <div class=\"separator\"></div>
    <table>
    " >> ./compiled/projects/index.html
for p in $projects; do content_gen "$p" "projects"; done
PREVIEW_COUNT=0
echo -ne $(more_links "projects") >> ./index.html

echo -ne $(sub_section_link "Art") >> ./index.html
echo -ne "
    <h1>Art</h1>
    <div class=\"separator\"></div>
    <table>
    " >> ./compiled/art/index.html
for a in $art; do content_gen "$a" "art"; done
PREVIEW_COUNT=0
echo -ne $(more_links "art") >> ./index.html

echo -ne $(sub_section_link "Posts") >> ./index.html
echo -ne "
    <h1>Posts</h1>
    <div class=\"separator\"></div>
    <table>
    " >> ./compiled/posts/index.html
for t in $posts; do content_gen "$t" "posts"; done
echo -ne $(more_links "posts") >> ./index.html

# Finish wrapping the tags
cat >> ./index.html << EOF
    </table>
	<div class="separator"></div>
    <div class="footer">
        <a href="https://github.com/mceld">Github</a> ·
        <a href="mailto:mceldowneyluke@gmail.com">Mail</a> ·
		<a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">
            <img class="footimgs" src="https://d33wubrfki0l68.cloudfront.net/94387e9d77fbc8b4360db81e72603ecba3df94a7/632bc/static/cc.svg">
        </a>
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
