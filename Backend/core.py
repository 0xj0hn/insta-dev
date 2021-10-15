#Imports...
from instagram_private_api import Client
from time import sleep
import instaloader

#Lets Code...

#InstaLoader Login...
def Login(user , passw) :
    try :
        app = instaloader.Instaloader()
        app.login(user , passw)
        #res = app.save_session_to_file(user)
    except Exception as e :
        return e


#Hashtag Like...
def HInfo(Tag) :
    try :
        app = instaloader.Instaloader()
        #app.load_session_from_file(user,user)
        #app.login(user,passw)
        res = []
        sleep(2)
        tag = instaloader.Hashtag.from_name(app.context,Tag)
        sleep(2)
        tagall = tag.get_all_posts()
        for i in tagall :
            res.append(i.mediaid)
        return res
    except Exception as e:
        return e

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
            sleep(2.5)
            res2 = app.post_like(i)
            sleep(2.5)
            oks.append(i)
        except :
            errors.append(i)
    result = [oks , errors]
    return result
