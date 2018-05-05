# Google HTTP CloudFunctions

Compatible provider `1.8.0 - 1.12.0`

## Example

* 1 function, timeout 30s

```hcl
resource "google_storage_bucket" "bucket" {
  name = "test-bucket-cloudfunction"
}

module "cloudfunction" {
  source               = "github.com/google-terraform-modules/terraform-google-cloudfunctions-http"
  bucket_name          = "${google_storage_bucket.bucket.name}"
  bucket_archive_name  = "helloHttp.zip"
  local_path           = "${path.module}/code/helloHttp.zip"
  function_name        = "helloHttp"
  function_entry_point = "helloHttp"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| local_path | A path to the data you want to upload | string | - | yes |
| function_name | A user-defined name of the function. Function names must be unique globally | string | - | yes |
| function_description | Description of the function | string | `` | no |
| function_memory | Memory (in MB), available to the function. Allowed values are: 128MB, 256MB, 512MB, 1024MB, and 2048MB | string | `128` | no |
| function_timeout | Timeout (in seconds) for the function. Default value is 60 seconds. Cannot be more than 540 seconds | string | `30` | no |
| function_entry_point | Name of a JavaScript function that will be executed when the Google Cloud Function is triggered | string | - | yes |
| bucket_name | The name of the containing bucket | string | - | yes |
| bucket_archive_name | The name of the object | string | `index.zip` | no |

## Outputs

| Name | Description |
|------|-------------|
| region | Region of function. Currently can be only `us-central1` |
| url | URL which triggers function execution |