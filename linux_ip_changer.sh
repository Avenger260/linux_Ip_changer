echo "Enter the IP address to use (default 127.0.0.1):"
read -r IP
IP=${IP:-127.0.0.1}
echo "Enter the port to use (default 9050):"
read -r PORT
PORT=${PORT:-9050}
echo "Enter the IP address change time (in seconds) (default 120 = 2 minutes):"
read -r INTERVAL
INTERVAL=${INTERVAL:-120}
CONTROL_PORT=9051
CONTROL_PASS=""
echo "🚀 Starting TOR rotator (changes IP every ${INTERVAL}s)..."
echo "Press Ctrl+C to stop"
trap 'echo "🛑 TOR rotator stopped gracefully"; exit 0' INT
while true; do
    echo "🔄 Rotating TOR circuit..."
    echo -e 'AUTHENTICATE "'$CONTROL_PASS'"\r\nSIGNAL NEWNYM\r\nQUIT\r\n' | nc 127.0.0.1 $CONTROL_PORT >/dev/null 2>&1
    sleep 3
    IP1=$(curl -s --socks5 $IP:$PORT ifconfig.me 2>/dev/null)
    IP2=$(curl -s --socks5 $IP:$PORT icanhazip.com 2>/dev/null)
    echo "Ip changed"
    echo "⏳ Next rotation in ${INTERVAL} seconds... ($(($INTERVAL/60)) minutes)"
    sleep $INTERVAL
done
