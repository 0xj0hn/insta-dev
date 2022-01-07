#imports...
from fastapi import FastAPI , HTTPException
import core

#App...
app = FastAPI()

#Lets Code...

#Login
@app.get('/login/loader/{username},{password}')

async def HInfo(username: str , password: str):
    try:
        res = core.Login(username , password)
        return res
    except Exception as e :
        return e

#Page Followees
@app.get('/page/followees/{user},{password},{page}')
async def Followees(user: str,password: str, page: str) :
    try:
        res = core.Followees(page,user,password)
        return res
    except Exception as e :
        return e

#First Posts...
@app.get('/page/followees/first/{page},{user},{password}')
async def FirstPost(page: str, user: str, password: str):
    try:
        res = core.FirstPosts(page,user,password)
        return res
    except Exception as e :
        return e

#Follow Ids...
@app.get('/page/follow/{ids},{user},{password}')
async def FollowThem(ids: str, user: str, password: str) :
    try :
        res = core.FollowThem(ids,user,password)
        return res
    except Exception as e :
        return e

#Follow Ids...
@app.get('/page/unfollow/{ids},{user},{password}')
async def UnFollowThem(ids: str, user: str, password: str) :
    try :
        res = core.UnfollowThem(ids,user,password)
        return res
    except Exception as e :
        return e


#Hashtag Info...
@app.get('/tag/info/{tag}')
async def HInfo(tag: str) :
    try :
        res = core.HInfo(tag)
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
        res = await core.LikeSave(ids , username , password)
        return res
    except Exception as e :
        return e
#-----------------------------------------------
