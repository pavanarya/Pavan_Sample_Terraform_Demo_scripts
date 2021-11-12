resource "local_file" "sample" {
  content = "This is sample file 1"
  filename = "sample1.txt"
}

resource "local_file" "sample2" {
  content = "This is sample file 2"
  filename = "sample2.txt"
}