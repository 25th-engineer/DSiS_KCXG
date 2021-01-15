import base64
from PIL import Image
import io


#with open('./picture/t1.png', "rb") as image:
image = open('./picture/t1.png', "rb")
b64string = base64.b64encode(image.read()) #base64 < image.png
print(type(b64string))

str_string = str(b64string, "utf-8")
str_string = 'b' + '\'' + str_string + '\''
print(type(str_string))
#print(b64string)

res = base64.b64encode(str_string.encode("utf-8"))
print(type(res))
#print(res)
print(res == b64string)

f = io.BytesIO(base64.b64decode(res))  #b64string
pilimage = Image.open(f) #base64 -D < "STRING" > recoveredimage.png
pilimage.save('./picture/t6.png') #t5