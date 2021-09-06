#imports...
from fastapi import FastAPI , HTTPException
import core

#App...
app = FastAPI()

#Lets Code...

#Hashtag Info...
@app.get('/tag/info/{tag},{username},{password}')
async def HInfo(tag: str , username: str , password: str) :
    try :
        res = core.HInfo(tag , username , password)
        return res
    except Exception as e :
        raise HTTPException(status_code=404, detail=e)
#----------------------------------------------

#Hashtag Like...
@app.get('/posts/like/{ids},{username},{password}')
async def Like(ids: str , username: str , password: str) :
    try :
        res = core.Like(ids , username , password)
        return res
    except :
        raise HTTPException(status_code=404, detail="error, maybe your given informations are incorrect")
#-----------------------------------------------

#Hashtag Like...
@app.get('/posts/save/{ids},{username},{password}')
async def save(ids: str , username: str , password: str) :
    try :
        res = core.Save(ids , username , password)
        return res
    except :
        raise HTTPException(status_code=404, detail="error, maybe your given informations are incorrect")
#-----------------------------------------------

#Hashtag Like And Save...
@app.get('/posts/likesave/{ids},{username},{password}')
async def save(ids: str , username: str , password: str) :
    try :
        res = core.LikeSave(ids , username , password)
        return res
    except :
        raise HTTPException(status_code=404, detail="error, maybe your given informations are incorrect")
#-----------------------------------------------
