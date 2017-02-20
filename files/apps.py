#!/usr/bin/env python
# encoding: utf-8
from __future__ import absolute_import, unicode_literals, print_function

__author__ = 'yxakuo@hotmail.com'

"""
@version: _____
@author: Allen tGuo
@license: Apache Licence
@contact: yxakuo@hotmail.com
@site: http://www.bizrapid.com
@software: PyCharm
@file: app.py
@time: 2016-12-20 上午5:49
"""

from raven import Client

client = Client('http://2df063f096444105aa58954ecc8015aa:8ee9710f465542f6a1c0a55f8762f3ae@192.168.188.203:9000/2')

import os
import sys
import datetime

from apscheduler.schedulers.blocking import BlockingScheduler


def version():
    pass


def changelog():
    pass


def todo():
    pass


def help():
    pass


def testcase():
    pass


def job_exec():
    print('Process:', datetime.datetime.now())


if __name__ == '__main__':
    sys.path.append('/home/user')
    job_exec()

    scheduler = BlockingScheduler()
    scheduler.add_job(job_exec, 'interval', seconds=180)
    print('Press Ctrl+{0} to exit'.format('Break' if os.name == 'nt' else 'C'))
    try:
        scheduler.start()
    except (KeyboardInterrupt, SystemExit):
        pass
