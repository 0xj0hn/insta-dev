#imports...
from fastapi import FastAPI
import core

#App...
app = FastAPI()

#Lets Code...

#Hashtag Info...
@app.get('/tag/info/{tag},{username},{password}')
def HInfo(tag: str , username: str , password: str) :
    res = core.HInfo(tag , username , password)
    return res

#----------------------------------------------

#Hashtag Like...
@app.get('/tag/like/{username},{password}')
def HLike(username: str , password: str) :
    pass

#-----------------------------------------------

