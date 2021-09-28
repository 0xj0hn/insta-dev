#Imports...
#from instagram_private_api import Client
from instagram_web_api import Client

from time import sleep
import instaloader

#Lets Code...



#Hashtag Like...
def HInfo(Tag , user , passw) :
    app = Client(auto_patch=True, authenticate=True,username=user,password=passw)
    app = instaloader.Instaloader()
    app.login(user , passw)
    res = []
    sleep(2)
    tag = instaloader.Hashtag.from_name(app.context,Tag)
    sleep(2)
    tag = app.tag_feed(tag=Tag , rank_token=uuid)
#     return tag
    for i in tag.get_all_posts() :
        res.append(i.mediaid)
    return res

#Like
def Like(ids , user , passw) :
    app = Client(user , passw)
    oks = []
    errors = []
    sleep(2)
    ids = ids.split(',')
    for i in ids :
        try :
            res = app.post_like(i)
            oks.append(i)
        except :
            errors.append(i)
    result = [oks , errors]
    return result

#Save 
def Save(ids , user , passw) :
    app = Client(user , passw)
    oks = []
    errors = []
    sleep(2)
    ids = ids.split(',')
    for i in ids :
        try :
            res = app.save_photo(i)
            oks.append(i)
        except :
            errors.append(i)
    result = [oks , errors]
    return result

#Like & Save 
def LikeSave(ids , user , passw) :
    app = Client(user , passw)
    oks = []
    errors = []
    sleep(2)
    ids = ids.split(',')
    for i in ids :
        try :
            res = app.save_photo(i)
            sleep(5)
            res2 = app.post_like(i)
            oks.append(i)
        except :
            errors.append(i)
    result = [oks , errors]
    return result
