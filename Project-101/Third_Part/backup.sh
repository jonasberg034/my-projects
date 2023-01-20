#!/bin/bash

# Check if we are root privilage or not
if [[ ${UID} -ne 0 ]]
then
   echo "Please run this script as root or with superuser privileges"
   exit 1
fi
 
# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file
DIRECTORIES=("/home/ec2-user/data")
# Where do we backup to. Please crete this file before execute this script
BACK_DIR="/mnt/backup"
# Create archive filename based on time
DATE=$(date +%F-%H-%M)
HOSTNAME=$(hostname)
# Create the backup directory if doe no exist.
if [[ ! -d ${BACKUP_DIR} ]]; then
   mkdir ${BACKUP_DIR}
fi
# Backup the files using tar.
echo "We will back up ${BACKUP_DIR}/${HOSTNAME}-{DATE}.tgz"

tar -zvcf ${BACKUP_DIR}/${FILENAME}/${DIRECTORIES}
# Print end status message.
echo "Gratulerer"
# Long listing of files in $dest to check file sizes.
ls -l ${BACK_DIR}
-------------

# To set this script for executing in every 5 minutes, we'll create cronjob



