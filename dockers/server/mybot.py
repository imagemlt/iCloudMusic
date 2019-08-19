import re
import requests
import codecs
import chardet
import os
import time
import csv
import multiprocessing
import MySQLdb
from selenium import webdriver
from selenium.webdriver import DesiredCapabilities

DOMAIN='127.0.0.1'

def getNumberOfResults():
    conn = MySQLdb.connect(
            host='localhost',
            port=3306,
            user='web200',
            passwd='m3nxvrDSHq3cWYqP',
            db='web200',
            charset='utf8')
    cur = conn.cursor()
    query = u"SELECT count(*) FROM records WHERE isProcessed=FALSE "
    cur.execute(query)
    (result,) = cur.fetchone()
    cur.close()
    conn.close()
    return result

driver = webdriver.PhantomJS(executable_path='/usr/share/phantomjs')
driver.set_page_load_timeout(12)
driver.add_cookie({'name': 'admin',
                   'value': 'xman{eVEn_CSP_you_G37_mY_C00K1e}',
                   'path': '/',
                   'domain': DOMAIN})

url='http://'+DOMAIN+'/guestbook/admin.php'
Pool=multiprocessing.Pool(2)

def seeTheBoard():
    try:
        driver.get('http://'+DOMAIN+'/admin.php')
        print "process-"+str(os.getpid())+":"+str(time.ctime())+':'+driver.title
    except Exception,e:
        print(str(time.ctime())+"get an Exception in seeTheBoard:"+str(e))
        pass

while True:
    try:
        result=getNumberOfResults()
        print result
        if result>=1:
            for x in range(0,result):
                seeTheBoard()
        else:
            print(str(time.ctime())+"no new record sleeping...")
            time.sleep(3)
    except Exception,e:
        print(str(time.ctime())+"get an Exception outside:"+str(e))
        pass


