# This file signs a file with the owner's private key and
# verifies the signature with the owners public key
import rsa


# Open key file and return key data
def file_open(file):
    key_file = open(file, 'rb')
    key_data = key_file.read()
    key_file.close()
    return key_data


# Open private key file and load in key
privkey = rsa.PrivateKey.load_pkcs1(file_open('privatekey.key'))

# Open the secret message file and return data to variable
message = file_open('message')
hash_value = rsa.compute_hash(message, 'SHA-512')  # optional

# Sign the message with the owners private key
signature = rsa.sign(message, privkey, 'SHA-512')

s = open('signature_file','wb')
s.write(signature)


print(signature)
print(len(signature))

print(len(hash_value) * 8)  # to verify size of hash/output

