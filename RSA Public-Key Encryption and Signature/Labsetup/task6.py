#!/bin/python3

# https://www.rfc-editor.org/rfc/rfc3447#section-9.2

prefix = "0001"
hash = "5b41c136c7d265b08cbd8c137ebf63684aa211f6b1c06ba3c7bf5e9801b5e190"
A = "30 31 30 0D 06 09 60 86 48 01 65 03 04 02 01 05 00 04 20".replace(' ','')
total_len = 256
pad_len = total_len - 1 - (len(A)+len(prefix)+len(hash))//2
print(prefix + "FF" * pad_len + "00" + A + hash)
