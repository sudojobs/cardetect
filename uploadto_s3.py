import boto3
s3_resource = boto3.resource('s3')
YOUR_BUCKET_NAME="moiiainew"
print(s3_resource)
s3_resource.create_bucket(Bucket=YOUR_BUCKET_NAME,
                          CreateBucketConfiguration={
                              'LocationConstraint': 'us-east-2'})

r=s3_resource.Object(YOUR_BUCKET_NAME, 'abcd.txt').upload_file(Filename='abcd.txt')
