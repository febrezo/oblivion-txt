publish:
	xml2rfc --html --text --raw draft-brezorubio-wg-oblivion-00.xml && \
	enscript -p draft-brezorubio-wg-oblivion-00.ps draft-brezorubio-wg-oblivion-00.txt && \
	ps2pdf draft-brezorubio-wg-oblivion-00.ps draft-brezorubio-wg-oblivion-00.pdf
