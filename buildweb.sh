hexo g
echo '=== build === done'
rm -rf docs
echo '=== remove docs === done'
mkdir docs
echo '=== create docs === done'
cp -r public/* docs/
echo '=== public copy to docs === done'