#!/bin/sh
IP=$(hostname -i)
HOSTNAME=$(hostname)

cat <<EOF > /output/index.html
<!DOCTYPE html>
<html>
<head><title>Lab5</title></head>
<body>
  <h1>Informacje o serwerze</h1>
  <p><b>Adres IP:</b> ${IP}</p>
  <p><b>Hostname:</b> ${HOSTNAME}</p>
  <p><b>Wersja aplikacji:</b> ${VERSION}</p>
</body>
</html>
EOF