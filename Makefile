
secret:
	voms-proxy-init2 --debug -cert /home/savchenk/cscs/certificate/syed/syed-user.cert -key /home/savchenk/cscs/certificate/syed/syed-user.key -voms dteam || true
	kubectl create secret generic x509up-u1000-$(shell voms-proxy-info2 -serial | tr '[:upper:]' '[:lower:]') --from-file=x509up_u1000=/tmp/x509up_u1000 || true
	sed -i 's/proxy_serial_lowercase:.*/proxy_serial_lowercase: "'$(shell voms-proxy-info2 -serial | tr '[:upper:]' '[:lower:]')'"/' charts/fts/values.yaml
