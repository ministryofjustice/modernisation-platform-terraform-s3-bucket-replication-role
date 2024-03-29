# How to run the tests

Run the tests from within the `test` directory

```
cd ../
go mod download
aws-vault exec mod -- go test -v
```

Upon successful run, you should see an output similar to the below

```
TestS3Creation 2022-06-08T14:29:22+01:00 logger.go:66: Destroy complete! Resources: 3 destroyed.
TestS3Creation 2022-06-08T14:29:22+01:00 logger.go:66: 
--- PASS: TestS3Creation (20.60s)
PASS
ok      github.com/ministryofjustice/modernisation-platform-terraform-s3-bucket-replication-role        20.897s
```

## References

1. https://terratest.gruntwork.io/docs/getting-started/quick-start/
2. https://github.com/ministryofjustice/modernisation-platform-terraform-s3-bucket-replication-role/blob/main/.github/workflows/go-terratest.yml
