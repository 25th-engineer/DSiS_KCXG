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
message = file_open('symmetric_key') # message = file_open('symmetric_key','wb')
hash_value = rsa.compute_hash(message, 'SHA-512')  # optional

# Sign the message with the owners private key
signature = rsa.sign(message, privkey, 'SHA-256')





