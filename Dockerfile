FROM python:3.5

MAINTAINER Allen tGuo

USER root

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#RUN mkdir -p ~/.pip && touch ~/.pip/pip.conf && echo "[global]" > ~/.pip/pip.conf && echo "index-url = https://pypi.douban.com/simple" >> ~/.pip/pip.conf

RUN pip install --upgrade pip
RUN pip install contextlib2
RUN pip install raven
RUN pip install requests
RUN pip install lxml
RUN pip install redis
RUN pip install vine
RUN pip install amqp
RUN pip install kombu
RUN pip install six
RUN pip install pytz
RUN pip install tzlocal
RUN pip install apscheduler
RUN pip install numpy
RUN pip install python-dateutil
RUN pip install pandas
RUN pip install astropy
RUN pip install tushare

RUN mkdir /src
VOLUME /src
RUN cp /files/apps.py /src/
RUN chmod +x apps.py
WORKDIR /src/

ENTRYPOINT ["python"]
CMD ["apps.py"]
