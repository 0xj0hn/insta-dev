#Imports...
from instagram_private_api import Client
from time import sleep

#Lets Code...



#Hashtag Like...
def HInfo(Tag , user , passw) :
    app = Client(user , passw)
    sleep(2)
    uuid = app.generate_uuid()
    sleep(2)
    tag = app.feed_tag(tag=Tag , rank_token=uuid)
    return tag
