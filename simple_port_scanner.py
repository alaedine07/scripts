import socket
import sys
remote_server = input("enter a host to scan: ")
remote_IP = socket.gethostbyname(remote_server)
try:
	for port in range(1,65535):
		sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		result = sock.connect_ex((remote_IP,port))
		if result == 0:
			print("open port: " + str(port))
			sock.close
except socket.error:
	print("connection problem")
except KeyboardInterrupt:
	print("scan interrupted")
	sys.exit()	

print("scan completed")			