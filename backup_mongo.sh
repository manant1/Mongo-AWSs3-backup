#!/bin/bash

set -e

S3KEY="AWS_S3_KEY" 
S3SECRET="AWS_S3_SECRET_KEY"
BACKUP_NAME=$(date +%y%m%d_%H%M%S).gz
S3REGION="AWS_S3_REGION"
DB="MONGO_DATABASE_NAME_TO_EXPORT"

function putS3
{
  path=$1
  destination=$2
  bucket="aws-s3-bucket-to-place-backup"
  aws s3 mv "${path}" "s3://${bucket}${destination}"
}

echo "Backing up MongoDB database to S3"

echo "Dumping MongoDB $DB database to compressed archive"
mongodump --db $DB --archive=/root/backup/tmp_dump.gz --gzip

echo "Copying compressed archive to S3"
putS3 "/root/backup/tmp_dump.gz" "/mongo_dumps/${BACKUP_NAME}"

echo "Cleaning up compressed archive"
rm /root/backup/tmp_dump.g

echo 'Backup complete!'
