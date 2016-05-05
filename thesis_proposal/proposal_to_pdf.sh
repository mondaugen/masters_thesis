#!/bin/bash
echo "<html><p>" > /html/proposal.html
cat proposal.txt| gsed 's/^$/<\/p><p>/' >> /tmp/proposal.html
echo "</p></html>" >> /tmp/proposal.html
wkhtmltopdf /tmp/proposal.html proposal.pdf
