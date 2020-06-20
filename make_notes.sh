#! /usr/bin/fish

cd org
rm -r ./*

yes | cp -r ~/Dropbox/notes/* ./

for file in (ls | grep "[0-9]*.org")
	sed -i '1i\#+setupfile:./hugo_setup.org' "$file"
end

echo -e "#+hugo_base_dir: ..\n#+hugo_auto_set_lastmod: t\n#+options: H:2" > hugo_setup.org

for file in (ls | grep "[0-9]*.org")
	emacs -batch -l ~/.emacs.d/init.el $file --eval "(org-hugo-export-to-md)" --kill
end

rm ../content/posts/hugo_setup.md
