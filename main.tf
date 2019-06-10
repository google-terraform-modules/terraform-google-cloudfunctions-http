# Upload function (object) in Cloud Storage
# https://www.terraform.io/docs/providers/google/r/storage_bucket_object.html
resource "google_storage_bucket_object" "archive_function" {
  name   = "${var.bucket_archive_name}"
  bucket = "${var.bucket_name}"
  source = "${var.local_path}"
}

# Create new CloudFunction
# https://www.terraform.io/docs/providers/google/r/cloudfunctions_function.html
resource "google_cloudfunctions_function" "function" {
  name                  = "${var.function_name}"
  description           = "${var.function_description}"
  available_memory_mb   = "${var.function_memory}"
  source_archive_bucket = "${var.bucket_name}"
  source_archive_object = "${google_storage_bucket_object.archive_function.name}"
  trigger_http          = true
  timeout               = "${var.function_timeout}"
  entry_point           = "${var.function_entry_point}"
  runtime               = "${var.function_runtime}"s
}
