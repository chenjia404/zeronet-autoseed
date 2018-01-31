FROM nofish/zeronet
RUN apk update && apk add sqlite curl
COPY ./autoseed.sh /root/autoseed.sh
RUN chmod a+x /root/autoseed.sh
RUN echo '*  *  *  *  *    /root/autoseed.sh' > /etc/crontabs/root
CMD  (! ${ENABLE_TOR} || tor&) && crond && python zeronet.py --ui_ip 0.0.0.0 