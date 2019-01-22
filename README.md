Tools
=====

To generate the RFC format we need `xml2rfc`. It can be installed using:

```
$ pip install xml2rfc
```

For details on `.xml` structure check [this link](chrome-extension://oemmndcbldboiebfnladdacbdfmadadm/https://www.ietf.org/slides/slides-edu-xml2rfc-01.pdf).

To generate the output files we can use:

```
$ xml2rfc --html --text --raw draft-brezorubio-wg-oblivion-00.xml
```

This will automatically generate the following files:

- `draft-brezorubio-wg-oblivion-00.html`. A HTML version of the file.
- `draft-brezorubio-wg-oblivion-00.txt`. An RFC-formatted and paginated text file.
- `draft-brezorubio-wg-oblivion-00.raw.txt`. A text file without the pagination.

To create a PDF we can use `enscript` to generate the PS file first and `ps2pdf` to build the PDF:

```
$ sudo apt install enscript -y
…
$ enscript -p draft-brezorubio-wg-oblivion-00.ps draft-brezorubio-wg-oblivion-00.txt
$ ps2pdf draft-brezorubio-wg-oblivion-00.ps draft-brezorubio-wg-oblivion-00.pdf
```
