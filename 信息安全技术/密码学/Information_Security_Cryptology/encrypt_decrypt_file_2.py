# -*- coding: utf-8 -*-
#AES-demo #采用AES对称加密算法
import os
import time
import base64
from Crypto.Cipher import AES
#import struct
def add_to_16(value):# str不是16的倍数那就补足为16的倍数
    while len(value) % 16 != 0:
        value += '\0'
    return str.encode(value)  # 返回bytes
def decrypt_oralce():#解密方法
    key = input('\n请输入用于解密文件的秘钥：')
    time.sleep(1)
    print('\n当被解密文件与本程序不同目录时\n请输入要解密文件完整路径包括文件名以及后缀')
    time.sleep(3)
    print('\n\n当被解密文件与本程序同一目录时只需输入文件名以及后缀：')
    file_path = input('\n\n请输入：')
    filepath, tempfilename = os.path.split(file_path)
    filename, extension = os.path.splitext(tempfilename)
    try:
        text = open(file_path, 'rb').read()# 待加密文本
        open(file_path, 'rb').close()
    except:
        print('\n输入有误，请重新输入')
        decrypt_oralce()
    savefile = input('\n请输入解密后文件的名字包括后缀 请不要使用特殊符号：')
    text = str(open(file_path, 'r').read())# 密文文件
    open(file_path, 'r').close()


    aes = AES.new(add_to_16(key), AES.MODE_ECB)# 初始化加密器
    base64_decrypted = base64.decodebytes(text.encode(encoding='cp936'))#优先逆向解密base64成bytes
    decrypted_text = str(aes.decrypt(base64_decrypted),encoding='gbk').replace('\0','')#执行解密密并转码返回str
    decrypted_text2 = eval(decrypted_text)


    if filepath == "":
        logbat = open(savefile, 'wb')
        logbat.write(decrypted_text2) #encrypted_text
        logbat.close()
        print('\n文件解密成功 文件以保存为 ',savefile)
    else:
        logbat = open(filepath+'\\'+savefile, 'wb')
        logbat.write(decrypted_text2) #encrypted_text
        logbat.close()
        print('\n文件解密成功 文件保存在 ',filepath,'中 \n\n文件名为 ',savefile)
    print('\n软件将在 10 秒后自动退出\n')
    time.sleep(10)
if __name__ == '__main__':
    print("\n文件解密\n\n本软件可单独运行也可以放在被解密文件的所在目录运行\n\n")
    decrypt_oralce()
