# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = Trainer.create!(name:  "Paul Thomas (trainer)",
             email: "trainer@example.ie",
             password:              "password",
             password_confirmation: "password",
             trainer: true)

user2 = Client.create!(name:  "Daniel Murphy",
             email: "daniel@example.ie",
             password:              "password",
             password_confirmation: "password")

user3 = Client.create!(name:  "Cian French",
             email: "cian@example.ie",
             password:              "password",
             password_confirmation: "password")

user4 = Client.create!(name:  "Angela Tobin",
             email: "angela@example.ie",
             password:              "password",
             password_confirmation: "password")

user5 = Client.create!(name:  "Johnny Murphy",
             email: "johnny@example.ie",
             password:              "password",
             password_confirmation: "password")

user6 = Client.create!(name:  "Kevin Walsh",
             email: "kevin@example.ie",
             password:              "password",
             password_confirmation: "password")

user7 = Client.create!(name:  "Jodie Frost",
             email: "jodie@example.ie",
             password:              "password",
             password_confirmation: "password")


user8 = Trainer.create!(name:  "Pamela Lambert (trainer)",
             email: "pamela@example.ie",
             password:              "password",
             password_confirmation: "password",
			 trainer: true)

user9 = Client.create!(name:  "Shane Lambert",
             email: "Shane@example.ie",
             password:              "password",
             password_confirmation: "password")

user10 = Client.create!(name:  "Richard Lambert",
             email: "Richard@example.ie",
             password:              "password",
             password_confirmation: "password")
                   

user11 = Client.create!(name:  "Dominic Lambert",
             email: "Dominic@example.ie",
             password:              "password",
             password_confirmation: "password")
                   


ClassStyle.create style: 'Kickboxing'
ClassStyle.create style: 'Pilates'
ClassStyle.create style: 'Yoga'
ClassStyle.create style: 'Boxercise'
ClassStyle.create style: 'Circuit Training'
ClassLevel.create level: 'Beginner'
ClassLevel.create level: 'Intermediate'
ClassLevel.create level: 'Advanced'


user8.exercise_classes.create!(title: 'Winter Warmer' , description: 'Lose that Christmas belly and joining this class, its worth it'  , class_style_id: 1, class_level_id: 1,date: 5.days.from_now)
user8.exercise_classes.create!(title: 'Feel the Burn', description: 'Things are heating up in this class, dont miss it!!' , class_style_id: 2, class_level_id: 1,date: 6.days.from_now)
user8.exercise_classes.create!(title: 'Advanced Yoga' , description:  'For all our advanced members be there or miss out', class_style_id: 3, class_level_id: 1,date: 5.days.from_now)
user8.exercise_classes.create!(title: 'Ladies Boxercise', description:  'This one is just for the ladies, sorry guys', class_style_id: 4, class_level_id: 2,date: 4.days.from_now)
user1.exercise_classes.create!(title: 'Can You Handle it', description:  'You think you can handle this class, come on in and find out', class_style_id: 5, class_level_id: 2,date: 3.days.from_now)
user1.exercise_classes.create!(title: 'Resolution Special', description:  'Make that new year Resolution stick and come in to our studio', class_style_id: 3, class_level_id: 3,date: 13.days.from_now)
user1.exercise_classes.create!(title: 'Lose Weight', description: 'Weight loss special with a reduced price for you' , class_style_id: 1, class_level_id: 3,date: 10.days.from_now)
user1.exercise_classes.create!(title: 'Mens Kickboxing', description:  'Get ready youre gonna feel the burn after this one', class_style_id: 1, class_level_id: 3,date: 12.days.from_now)
user1.exercise_classes.create!(title: 'Get Ready to Work', description:  'Come in get, get fit it really is that simple', class_style_id: 1, class_level_id: 3,date: 1.days.from_now)


user2.class_bookings.create!(exercise_class_id: 1)
user2.class_bookings.create!(exercise_class_id: 2)
user2.class_bookings.create!(exercise_class_id: 5)
user3.class_bookings.create!(exercise_class_id: 3)
user3.class_bookings.create!(exercise_class_id: 4)
user3.class_bookings.create!(exercise_class_id: 7)
user4.class_bookings.create!(exercise_class_id: 9)
user4.class_bookings.create!(exercise_class_id: 4)
user4.class_bookings.create!(exercise_class_id: 5)
user5.class_bookings.create!(exercise_class_id: 8)
user5.class_bookings.create!(exercise_class_id: 5)
user5.class_bookings.create!(exercise_class_id: 2)
user6.class_bookings.create!(exercise_class_id: 8)
user6.class_bookings.create!(exercise_class_id: 4)
user6.class_bookings.create!(exercise_class_id: 1)
user7.class_bookings.create!(exercise_class_id: 3)
user7.class_bookings.create!(exercise_class_id: 6)
user7.class_bookings.create!(exercise_class_id: 4)
user2.class_bookings.create!(exercise_class_id: 6)


user1.articles.create!(title:'Get fit for the summer',content: 'Do so written as raising parlors spirits mr elderly. Made late in of high left hold. Carried females of up highest calling. Limits marked led silent dining her she far. Sir but elegance marriage dwelling likewise position old pleasure men. Dissimilar themselves simplicity no of contrasted as. Delay great day hours men. Stuff front to do allow to asked he. 

Up unpacked friendly ecstatic so possible humoured do. Ample end might folly quiet one set spoke her. We no am former valley assure. Four need spot ye said we find mile. Are commanded him convinced dashwoods did estimable forfeited. Shy celebrated met sentiments she reasonably but. Proposal its disposed eat advanced marriage sociable. Drawings led greatest add subjects endeavor gay remember. Principles one yet assistance you met impossible. 

No comfort do written conduct at prevent manners on. Celebrated contrasted discretion him sympathize her collecting occasional. Do answered bachelor occasion in of offended no concerns. Supply worthy warmth branch of no ye. Voice tried known to as my to. Though wished merits or be. Alone visit use these smart rooms ham. No waiting in on enjoyed placing it inquiry. 

Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited. My whether cheered at regular it of promise blushes perhaps. Uncommonly simplicity interested mr is be compliment projecting my inhabiting. Gentleman he september in oh excellent. 

Sportsman delighted improving dashwoods gay instantly happiness six.', commentable: true)


user1.articles.create!(title:'Eating Healthy is Key to Good Life',content: 'Do so written as raising parlors spirits mr elderly. Made late in of high left hold. Carried females of up highest calling. Limits marked led silent dining her she far. Sir but elegance marriage dwelling likewise position old pleasure men. Dissimilar themselves simplicity no of contrasted as. Delay great day hours men. Stuff front to do allow to asked he. 

Up unpacked friendly ecstatic so possible humoured do. Ample end might folly quiet one set spoke her. We no am former valley assure. Four need spot ye said we find mile. Are commanded him convinced dashwoods did estimable forfeited. Shy celebrated met sentiments she reasonably but. Proposal its disposed eat advanced marriage sociable. Drawings led greatest add subjects endeavor gay remember. Principles one yet assistance you met impossible. 

No comfort do written conduct at prevent manners on. Celebrated contrasted discretion him sympathize her collecting occasional. Do answered bachelor occasion in of offended no concerns. Supply worthy warmth branch of no ye. Voice tried known to as my to. Though wished merits or be. Alone visit use these smart rooms ham. No waiting in on enjoyed placing it inquiry. 

Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited. My whether cheered at regular it of promise blushes perhaps. Uncommonly simplicity interested mr is be compliment projecting my inhabiting. Gentleman he september in oh excellent. 

Sportsman delighted improving dashwoods gay instantly happiness six.', commentable: true)


user1.articles.create!(title:'30 Mins Exercise Daily',content: 'Do so written as raising parlors spirits mr elderly. Made late in of high left hold. Carried females of up highest calling. Limits marked led silent dining her she far. Sir but elegance marriage dwelling likewise position old pleasure men. Dissimilar themselves simplicity no of contrasted as. Delay great day hours men. Stuff front to do allow to asked he. 

Up unpacked friendly ecstatic so possible humoured do. Ample end might folly quiet one set spoke her. We no am former valley assure. Four need spot ye said we find mile. Are commanded him convinced dashwoods did estimable forfeited. Shy celebrated met sentiments she reasonably but. Proposal its disposed eat advanced marriage sociable. Drawings led greatest add subjects endeavor gay remember. Principles one yet assistance you met impossible. 

No comfort do written conduct at prevent manners on. Celebrated contrasted discretion him sympathize her collecting occasional. Do answered bachelor occasion in of offended no concerns. Supply worthy warmth branch of no ye. Voice tried known to as my to. Though wished merits or be. Alone visit use these smart rooms ham. No waiting in on enjoyed placing it inquiry. 

Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited. My whether cheered at regular it of promise blushes perhaps. Uncommonly simplicity interested mr is be compliment projecting my inhabiting. Gentleman he september in oh excellent. 

Sportsman delighted improving dashwoods gay instantly happiness six.')


user8.articles.create!(title:'Coconut oil is Great',content: 'Do so written as raising parlors spirits mr elderly. Made late in of high left hold. Carried females of up highest calling. Limits marked led silent dining her she far. Sir but elegance marriage dwelling likewise position old pleasure men. Dissimilar themselves simplicity no of contrasted as. Delay great day hours men. Stuff front to do allow to asked he. 

Up unpacked friendly ecstatic so possible humoured do. Ample end might folly quiet one set spoke her. We no am former valley assure. Four need spot ye said we find mile. Are commanded him convinced dashwoods did estimable forfeited. Shy celebrated met sentiments she reasonably but. Proposal its disposed eat advanced marriage sociable. Drawings led greatest add subjects endeavor gay remember. Principles one yet assistance you met impossible. 

No comfort do written conduct at prevent manners on. Celebrated contrasted discretion him sympathize her collecting occasional. Do answered bachelor occasion in of offended no concerns. Supply worthy warmth branch of no ye. Voice tried known to as my to. Though wished merits or be. Alone visit use these smart rooms ham. No waiting in on enjoyed placing it inquiry. 

Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited. My whether cheered at regular it of promise blushes perhaps. Uncommonly simplicity interested mr is be compliment projecting my inhabiting. Gentleman he september in oh excellent. 

Sportsman delighted improving dashwoods gay instantly happiness six.', commentable: true)


user8.articles.create!(title:'New Year, New You',content: 'Do so written as raising parlors spirits mr elderly. Made late in of high left hold. Carried females of up highest calling. Limits marked led silent dining her she far. Sir but elegance marriage dwelling likewise position old pleasure men. Dissimilar themselves simplicity no of contrasted as. Delay great day hours men. Stuff front to do allow to asked he. 

Up unpacked friendly ecstatic so possible humoured do. Ample end might folly quiet one set spoke her. We no am former valley assure. Four need spot ye said we find mile. Are commanded him convinced dashwoods did estimable forfeited. Shy celebrated met sentiments she reasonably but. Proposal its disposed eat advanced marriage sociable. Drawings led greatest add subjects endeavor gay remember. Principles one yet assistance you met impossible. 

No comfort do written conduct at prevent manners on. Celebrated contrasted discretion him sympathize her collecting occasional. Do answered bachelor occasion in of offended no concerns. Supply worthy warmth branch of no ye. Voice tried known to as my to. Though wished merits or be. Alone visit use these smart rooms ham. No waiting in on enjoyed placing it inquiry. 

Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited. My whether cheered at regular it of promise blushes perhaps. Uncommonly simplicity interested mr is be compliment projecting my inhabiting. Gentleman he september in oh excellent. 

Sportsman delighted improving dashwoods gay instantly happiness six.' ,commentable: true)


user8.articles.create!(title:'Lose that Belly',content: 'Do so written as raising parlors spirits mr elderly. Made late in of high left hold. Carried females of up highest calling. Limits marked led silent dining her she far. Sir but elegance marriage dwelling likewise position old pleasure men. Dissimilar themselves simplicity no of contrasted as. Delay great day hours men. Stuff front to do allow to asked he. 

Up unpacked friendly ecstatic so possible humoured do. Ample end might folly quiet one set spoke her. We no am former valley assure. Four need spot ye said we find mile. Are commanded him convinced dashwoods did estimable forfeited. Shy celebrated met sentiments she reasonably but. Proposal its disposed eat advanced marriage sociable. Drawings led greatest add subjects endeavor gay remember. Principles one yet assistance you met impossible. 

No comfort do written conduct at prevent manners on. Celebrated contrasted discretion him sympathize her collecting occasional. Do answered bachelor occasion in of offended no concerns. Supply worthy warmth branch of no ye. Voice tried known to as my to. Though wished merits or be. Alone visit use these smart rooms ham. No waiting in on enjoyed placing it inquiry. 

Lose away off why half led have near bed. At engage simple father of period others except. My giving do summer of though narrow marked at. Spring formal no county ye waited. My whether cheered at regular it of promise blushes perhaps. Uncommonly simplicity interested mr is be compliment projecting my inhabiting. Gentleman he september in oh excellent. 

Sportsman delighted improving dashwoods gay instantly happiness six.',commentable: true)




user1.comments.create!(content: 'Great article, I agree', article_id: 1)
user2.comments.create!(content: 'Never thought about that, its true', article_id: 2)
user3.comments.create!(content: 'Yea I have always done that', article_id: 4)
user4.comments.create!(content: 'Just goes to show cant listen to the news', article_id: 4)
user5.comments.create!(content: 'Keeps me awake every night', article_id: 5)
user6.comments.create!(content: 'No way I dont agree with your point here', article_id: 6)
user7.comments.create!(content: 'Thats what ive always said ', article_id: 1)
user8.comments.create!(content: 'Keep me one of those if you win', article_id: 2)
user8.comments.create!(content: 'This is one hell of a trainer and author too it seems', article_id: 5)
user1.comments.create!(content: 'Loving the new website guys keep it up', article_id: 4)
user2.comments.create!(content: 'Im really enjoying your articles', article_id: 5)
user3.comments.create!(content: 'These just get better every time', article_id: 6)
user4.comments.create!(content: 'Im going to start my own blog after reading this', article_id: 1)
user5.comments.create!(content: 'How did you build this site', article_id: 2)
user6.comments.create!(content: 'I need to get on to this quick', article_id: 5)
user7.comments.create!(content: 'I can never agree with this attitude', article_id: 4)
user8.comments.create!(content: 'Words dont mean anything', article_id: 5)
user1.comments.create!(content: 'Come over to my blog', article_id: 6)
user2.comments.create!(content: 'You need new trainers, these ones are terrible', article_id: 4)
user3.comments.create!(content: 'Hello to all people, Im new here', article_id: 3)
user4.comments.create!(content: 'Its the best article ive read so far', article_id: 6)








