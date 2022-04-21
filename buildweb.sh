echo '=== start ==='

echo '=== clean ==='
hexo clean
echo '=== clean === done'

echo '=== build ==='
hexo g
echo '=== build === done'

echo '=== git push ==='
git add .
echo '=== git add === done'
git commit -am 'build'
echo '=== git commit === done'
git push origin master
echo '=== git push === done'

echo '=== finished ==='