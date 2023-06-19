#!/usr/bin/bash 



access="$(curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=$client_id&client_secret=$client_secret" \
     | jq -r '. | .access_token')"  
# echo $access
# curl "https://api.spotify.com/v1/artists/4Z8W4fKeB5YxbusRsdQVPb" \
#      -H "Authorization: Bearer $access"
#Only valid bearer
#bear=BQA3wjD0IR-ey81hCeloDQ9xQL_g5acIKNKyNrIuVvUXGnYyR3BarkcNWLC23PQdIHfmS9Y2PbbSIwesOBf9MNub51HTAiFBf36guONrj0ktpaOmalo
Artist="Shreya Ghosal"
echo "your artist you want to print album $Artist"
Artist=$(echo $Artist | tr ' ' '+')

id=`curl --request GET \
  --url "https://api.spotify.com/v1/search?q=$Artist&type=artist" \
  --header "Authorization: Bearer $access" \
  | jq -r '. | .artists.items[0].id'`

#id="0oOet2f43PA68X5RxKobEy"
curl --request GET \
  --url https://api.spotify.com/v1/artists/${id}/albums \
  --header "Authorization: Bearer $access" | jq '.items[] | .name'

