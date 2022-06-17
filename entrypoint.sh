cd /v2raybin
sed -i "s/ID/$ID/g" config.json
./v2ray &
cd /argobin
wget --no-check-certificate -O argo https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
chmod 755 argo
echo $JSON > fb413372-568f-4019-9247-5b25c9c92927.json
wget -O cert.pem $CERT
sed -i "s/ID/$ID/g" config.yml
sed -i "s/DOM/$DOM/g" config.yml
./argo --loglevel info --origincert cert.pem  tunnel -config config.yml run $ID &
cd /caddybin
sed -i "s/PORT/$PORT/g" caddyfile
wget --no-check-certificate -O index.html $PAGE
./caddy run --config caddyfile --adapter caddyfile
