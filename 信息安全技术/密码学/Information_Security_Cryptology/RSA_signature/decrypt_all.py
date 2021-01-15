import rsa

# Open key file and return key data
def file_open(file):
    key_file = open(file, 'rb')
    key_data = key_file.read()
    key_file.close()
    return key_data


# Open public key file and load in key
pubkey = rsa.PublicKey.load_pkcs1(file_open('publickey.key'))

message = file_open('message')
signature = file_open('signature_file')

# Verify the signature to show if successful or failed
try:
    rsa.verify(message,signature,pubkey)
    print("Signature successfully verified")

except:
    print("Warning!!!! Signature could not be verified")