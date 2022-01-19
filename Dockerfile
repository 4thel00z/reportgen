FROM pandoc/latex:latest-ubuntu
RUN apt-get update; apt-get install -y texlive-latex-extra
ADD install.sh /usr/local/bin/install.sh
RUN /usr/local/bin/install.sh && rm /usr/local/bin/install.sh
ADD eisvogel.latex /usr/share/pandoc/data/templates/eisvogel.latex 
ADD generate_report.sh /usr/local/bin/reportgen
ENTRYPOINT ["sh","/usr/local/bin/reportgen"]
