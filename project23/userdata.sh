#!/bin/bash
export AWS_DEFAULT_REGION=ap-south-1
sleep 30
{
echo "=====P23-TEST-START====="
echo "--- whoami (sts get-caller-identity) ---"
aws sts get-caller-identity
echo "--- aws s3 ls ---"
aws s3 ls
echo "--- aws s3 ls s3://anand-p23-test-5647 ---"
aws s3 ls s3://anand-p23-test-5647
echo "--- download hello.txt ---"
aws s3 cp s3://anand-p23-test-5647/hello.txt /tmp/hello.txt
cat /tmp/hello.txt
echo "--- negative test: upload (expect AccessDenied) ---"
echo "write test" > /tmp/test.txt
aws s3 cp /tmp/test.txt s3://anand-p23-test-5647/
echo "=====P23-TEST-END====="
} > /dev/console 2>&1
