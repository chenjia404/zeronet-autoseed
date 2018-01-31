FROM nofish/zeronet
RUN apk update --update-cache --repository http://mirrors.aliyun.com/alpine/v3.6/main/ && apk add sqlite curl --update-cache --repository http://mirrors.aliyun.com/alpine/v3.6/main/ 
COPY autoseed.sh /root/autoseed.sh
RUN chmod a+x /root/autoseed.sh
RUN echo '*  *  *  *  *    /root/autoseed.sh >> /root/data/crontab.log' > /etc/crontabs/root
CMD  (! ${ENABLE_TOR} || tor&) && crond && python zeronet.py --ui_ip 0.0.0.0 