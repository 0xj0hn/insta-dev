#imports...
from fastapi import FastAPI , HTTPException
import core

#App...
app = FastAPI()

#Lets Code...

#Login
@app.get('/login/loader/{username},{password}')
async def HInfo(tag: str , username: str , password: str) :
    try :
        res = core.Login(username , password)
        return res
    except Exception as e :
        return e


#Hashtag Info...
@app.get('/tag/info/{tag},{user}')
async def HInfo(tag: str , user: str) :
    try :
        res = core.HInfo(tag,user)
        return res
    except Exception as e :
        return e
#----------------------------------------------

#Hashtag Like...
@app.get('/posts/like/{ids},{username},{password}')
async def Like(ids: str , username: str , password: str) :
    try :
        res = core.Like(ids , username , password)
        return res
    except Exception as e :
        return e
#-----------------------------------------------

#Hashtag Like...
@app.get('/posts/save/{ids},{username},{password}')
async def save(ids: str , username: str , password: str) :
    try :
        res = core.Save(ids , username , password)
        return res
    except Exception as e :
        return e
#-----------------------------------------------

#Hashtag Like And Save...
@app.get('/posts/likesave/{ids},{username},{password}')
async def save(ids: str , username: str , password: str) :
    try :
        res = core.LikeSave(ids , username , password)
        return res
    except Exception as e :
        return e
#-----------------------------------------------
