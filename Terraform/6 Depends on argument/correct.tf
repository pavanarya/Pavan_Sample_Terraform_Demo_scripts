resource "local_file" "sample1" {
  content = "This is sample 1 depending on Sample2.txt file creation"
  filename = "sample1.txt"
  depends_on = [
    local_file.sample2
  ]
}

resource "local_file" "sample2" {
  content = "This is sample 2"
  filename = "sample2.txt"
}