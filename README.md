# Mongo-AWSs3-backup
Script required AWS CLI to be installed. More info:

https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

Shell script to backup and upload MongoDb dump

Could be used in cron jobs. For example, <code>0 6,18 * * * /root/backup/backup_mongo.sh >>/var/log/mongo_backup/mongo_backup.log 2>&1</code>
