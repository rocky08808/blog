echo '=== clean ==='
hexo clean
echo '=== clean === done'

echo '=== build ==='
hexo g
echo '=== build === done'

echo '=== git push ==='
git add .
git commit -am 'build'
git push origin master
echo '=== git push === done'