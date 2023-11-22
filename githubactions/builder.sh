githubrepo="$1"
dockerrepo="$2"
git clone "https://github.com/$githubrepo"
cd "$(basename "$githubrepo")"
docker build . -t "$dockerrepo"
docker login
docker push "$dockerrepo"




# chmod +x builder.sh
# ./builder.sh mluukkai/express_app mluukkai/testing