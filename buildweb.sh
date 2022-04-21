hexo g
echo '=== build === done'
rm -rf docs
echo '=== remove docs === done'
mkdir docs
echo '=== create docs === done'
cp -r public/* docs/
echo '=== copy to docs === done'