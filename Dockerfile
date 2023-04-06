FROM ubuntu:latest

WORKDIR /data

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y ttf-wqy-zenhei \
    && apt install -y texlive texlive-latex-extra texlive-latex-recommended texlive-xetex pandoc

ENTRYPOINT [ "pandoc","-t","latex","--pdf-engine","xelatex","-V","mainfont=WenQuanYi Zen Hei" ]
CMD ["sourceFile.md", "-o", "target.pdf"]

# build image:
# docker build -t pandoc:latest .

# run container:
# docker run -it --rm -v $(pwd):/data pandoc:latest sourceFile.md -o target.pdf
