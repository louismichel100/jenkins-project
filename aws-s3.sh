#/bin/bash

DB_HOST=$1
DB_PASS=$2
DB_NAME=$3
AWS_ACCESS=$4
AWS_SECRET=$5
BUCK_NAME=$6

export AWS_ACCESS_KEY_ID=$AWS_ACCESS
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET
export AWS_DEFAULT_REGION=us-east-1

DATE=$(date +%H-%M-%S)
mysqldump -u root -h $DB_HOST -p$DB_PASS $DB_NAME > db-$DATE.sql && \
aws s3 cp db-$DATE.sql s3://$BUCK_NAME/db-$DATE-miki.sql
