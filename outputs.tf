output "url" {
  value       = "${google_cloudfunctions_function.function.https_trigger_url}"
  description = "URL which triggers function execution"
}

output "region" {
  value       = "${google_cloudfunctions_function.function.region}"
  description = "Region of function. Currently can be only `us-central1`"
}
