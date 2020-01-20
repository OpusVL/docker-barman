FROM postgres

MAINTAINER Craig Barnes <craig.barnes@opusvl.com>

RUN apt-get update && apt-get install -y barman && apt-get clean

VOLUME /var/lib/barman

COPY barman.conf /etc/barman.conf

COPY weekly_backup.sh /etc/cron.weekly/weekly_backup

CMD chown -R barman:barman /var/lib/barman && /usr/sbin/cron -f
