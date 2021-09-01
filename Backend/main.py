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
@app.get('/posts/like/{ids},{username},{password}')
def Like(ids: str , username: str , password: str) :
    res = core.Like(ids , username , password)
    return res
#-----------------------------------------------

#Hashtag Like...
@app.get('/posts/save/{ids},{username},{password}')
def save(ids: str , username: str , password: str) :
    res = core.Save(ids , username , password)
    return res
#-----------------------------------------------

#Hashtag Like And Save...
@app.get('/posts/likesave/{ids},{username},{password}')
def save(ids: str , username: str , password: str) :
    res = core.LikeSave(ids , username , password)
    return res
#-----------------------------------------------