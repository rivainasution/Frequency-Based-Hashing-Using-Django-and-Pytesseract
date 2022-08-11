from random import choice
from string import ascii_uppercase
from string import ascii_lowercase
from string import ascii_letters
from string import digits
from string import punctuation

def randStr(chars = ascii_uppercase + 
    ascii_lowercase+ascii_letters+digits+
    punctuation, N=10):
    return "".join(choice(chars) for _ in range(N))

def collision(text):
    n = len(text)
    Ch = chunkCalc(text,n)
    H = rollHash(Ch)
    return H

def chunkCalc(D, n):
    Ch = []            
    k = 7              

    for i in range(0, n - 8 ):  
        Ch.append(D[i: (i + 7)])
    return Ch

def rollHash(Ch):
    H = []          
    a = 255         
    n = 801385653117583579  
    h = 0           
    
    for Ci in Ch: 
        k = 7
        for elm in list(Ci):
            h +=  ord(elm)*pow(a, (k - 1))
            k = k - 1

        H.append(h % n)
    return H

msg_sama=[]
text1='I AM RIVAI'
hash_teks1=collision(text1)
hash_teks2={}
for i in range(50):
    teks2=randStr()
    h2=collision(teks2)
    hash_teks2[teks2]=h2


for rollHash in hash_teks2.values():
    n=len(rollHash)
    for hashing in range(n):
        if (rollHash[hashing]==hash_teks1[hashing]):
            msg_sama.append(rollHash(hashing))
            
print(hash_teks2)
m = len(msg_sama)
if (m==0):
    print("Tidak terjadi Collision")
else:
    print("Rolling hash yang sama : ")
    for i in range(m):
        print(msg_sama[i])