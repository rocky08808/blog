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
time=$(date "+%Y-%m-%d-%H:%M:%S")
commit_name="build_${time}"
echo "=== time ${time} ==="
git commit -am "${commit_name}"
echo "=== git commit ${commit_name} === done"
git push origin master
echo '=== git push === done'

echo '=== finished ==='