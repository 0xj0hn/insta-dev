#Imports...
from instagram_private_api import Client
from time import sleep
import instaloader

#Lets Code...

#InstaLoader Login...
def Login(user , passw) :
    try :                                                                      
        app = instaloader.Instaloader()
        app.login(user , passw)                                                #res = app.save_session_to_file(user)
    except Exception as e :
        return e


#Hashtag Like...
def HInfo(Tag) :                                                           
    try :
        app = instaloader.Instaloader()
        #app.load_session_from_file(user,user)
        #app.login(user,passw)                                                 res = []
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


#Get Followees First Posts...
def FirstPosts(page,user,passw) :
    app = instaloader.Instaloader()
    app.login(user,passw)
    Followees = []
    Ids = []
    target = instaloader.Profile.from_username(app.context,page)
    flws = target.get_followees()
    num = 0
    for i in flws :
        try :
            Followees.append(i.userid)
            t1 = i.get_posts()
            user = []
            for i in t1 :
                user.append(i.mediaid)
            Ids.append(user[0])
        except Exception as e :
            print(i.username,'error',e)
    result = [Ids,Followees]
    return result


#Follow Ids...
def FollowThem(ids,user,passw) :
    ids = ids.split(",")
    app = Client(user,passw)
    errors = []
    for i in ids :
        try :
            app.friendships_create(i)
        except :
            errors.append(i)
    result = [ 'ok',errors]
    return result



#Unfollow Ids...
def UnfollowThem(ids,user,passw) :
    ids = ids.split(",")
    app = Client(user,passw)
    errors = []
    for i in ids :
        try :
            app.friendships_destroy(i)
        except :
            errors.append(i)
    result = [ 'ok',errors]
    return result


#Get Followees...
def Followees(page,user,passw) :
    app = instaloader.Instaloader()
    app.login(user,passw)
    users = []
    ids = []
    errors = []
    target = instaloader.Profile.from_username(app.context,page)
    flws = target.get_followees()
    for i in flws :
        try :
            users.append(i.username)
            ids.append(i.userid)
        except :
            errors.append(i.username)
    result = [ids,users,errors]
    return result

#print(Followees("farzin.dev","mohammad_mahdii_bonyadi","mhdmhdmhd82@#"))

