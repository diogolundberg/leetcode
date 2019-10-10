# organize photos

# input
# 'photo.jpg, Warsaw, 2013-09-05 14:08:15\njohn.png, London, 2015-06-20 15:13:22\nmyFriends.png, Warsaw, 2013-09-05 14:07:13\nEiffel.jpg, Paris, 2015-07-23 08:03:02\npisatower.jpg, Paris, 2015-07-22 23:59:59\nBOB.jpg, London, 2015-08-05 00:02:03\nnotredame.png, Paris, 2015-09-01 12:00:00\nme.jpg, Warsaw, 2013-09-06 15:40:22\na.png, Warsaw, 2016-02-13 13:33:50\nb.jpg, Warsaw, 2016-01-02 15:12:22\nc.jpg, Warsaw, 2016-01-02 14:34:30\nd.jpg, Warsaw, 2016-01-02 15:15:01\ne.png, Warsaw, 2016-01-02 09:49:09\nf.png, Warsaw, 2016-01-02 10:55:32\ng.jpg, Warsaw, 2016-02-29 22:13:11' 

photos = [
'photo.jpg, Warsaw, 2013-09-05 14:08:15',
'john.png, London, 2015-06-20 15:13:22',
'myFriends.png, Warsaw, 2013-09-05 14:07:13',
'Eiffel.jpg, Paris, 2015-07-23 08:03:02',
'pisatower.jpg, Paris, 2015-07-22 23:59:59',
'BOB.jpg, London, 2015-08-05 00:02:03',
'notredame.png, Paris, 2015-09-01 12:00:00',
'me.jpg, Warsaw, 2013-09-06 15:40:22',
'a.png, Warsaw, 2016-02-13 13:33:50',
'b.jpg, Warsaw, 2016-01-02 15:12:22',
'c.jpg, Warsaw, 2016-01-02 14:34:30',
'd.jpg, Warsaw, 2016-01-02 15:15:01',
'e.png, Warsaw, 2016-01-02 09:49:09',
'f.png, Warsaw, 2016-01-02 10:55:32',
'g.jpg, Warsaw, 2016-02-29 22:13:11',
]

timestamps = [photo[-19:] for photo in photos]
for i in sorted(timestamps):
    print(i)
    print 



def solution(S):
    groups = dict()
    photos = S.split('\n')
    for index, photo in enumerate(photos):
        attributes = photo.split(', ')
        photos[index] = attributes
        name, city, timestamp = attributes

        group = groups.get(city, [])
        group.append(timestamp)
        groups[city] = group


    result = ''
    
    for name, city, timestamp in photos:
        extension = name.split('.')[1]
        timestamps = sorted(groups[city])
        digits = len(str(len(timestamps)))
        number = str(timestamps.index(timestamp) + 1).zfill(digits)
        result += f'{city}{number}.{extension}\n'
    print(S)
    return result

