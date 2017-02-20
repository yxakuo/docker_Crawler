FROM python:3.5

MAINTAINER Allen tGuo

USER root

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#RUN mkdir -p ~/.pip && touch ~/.pip/pip.conf && echo "[global]" > ~/.pip/pip.conf && echo "index-url = https://pypi.douban.com/simple" >> ~/.pip/pip.conf

RUN pip install --upgrade pip
RUN pip install contextlib2 \
 && pip install raven \
 && pip install requests \
 && pip install lxml \
 && pip install redis \
 && pip install vine \
 && pip install amqp \
 && pip install kombu \
 && pip install six \
 && pip install pytz \
 && pip install tzlocal \
 && pip install apscheduler \
 && pip install numpy \
 && pip install python-dateutil \
 && pip install pandas \
 && pip install astropy \
 && pip install tushare

RUN mkdir /src
VOLUME /src
COPY /files/apps.py /src/
RUN chmod +x apps.py
WORKDIR /src/

ENTRYPOINT ["python"]
CMD ["apps.py"]
