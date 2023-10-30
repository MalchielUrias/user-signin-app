output "private_sub_id" {
  value = aws_subnet.private_sub[*].id
}

# output "private_sub_id1" {
#   value = aws_subnet.private_sub[0].id
# }

# output "private_sub_id2" {
#   value = aws_subnet.private_sub[1].id 
# }

# output "private_sub_id3" {
#   value = aws_subnet.private_sub[2].id 
# }