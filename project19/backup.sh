#!/bin/bash
aws s3 sync /home/clouduser/Capstone/project19/logs s3://anand-p19-backup-590507089733-20261126/logs/ >> /home/clouduser/Capstone/project19/backup.log 2>&1
