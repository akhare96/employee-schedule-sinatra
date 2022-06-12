a = User.create(name: "Mr. Krabs", email: "krabs@gmail.com", password: "password1")
b = User.create(name: "Sheldon Plankton", email: "plankton@gmail.com", password: "password2")

c = Business.create(name: "Krusty Krab", location: "124 Conch Street, Bikini Bottom, Pacific Ocean")
d = Business.create(name: "Krab Food Truck", location: "888 Seaweed Street, Bikini Bottom, Pacific Ocean")
e = Business.create(name: "Chum Bucket", location: "455 Conch Street, Bikini Bottom, Pacific Ocean")

f = Employee.create(name: "Spongebob SquarePants", address: "443 Pineapple Place, Bikini Bottom, Pacific Ocean", phone_number: "480-555-5456", business_id: "1")
f.monday_sched = "7AM - 3PM"
f.tuesday_sched = "7AM - 3PM"
f.wednesday_sched = "7AM - 4PM"
f.thursday_sched = "7AM - 3PM"
f.friday_sched = "7AM - 4PM"
f.saturday_sched = "7AM - 3PM"
f.sunday_sched = ""
f.save

g = Employee.create(name: "Squidward Tentacles", address: "477 Squid Drive, Bikini Bottom, Pacific Ocean", phone_number: "480-674-5786", business_id: "1")
g.monday_sched = "3PM - 11PM"
g.tuesday_sched = "3PM - 11PM"
g.wednesday_sched = "4PM - 11PM"
g.thursday_sched = "3PM - 11PM"
g.friday_sched = "4PM - 11PM"
g.saturday_sched = "3PM - 11PM"
g.sunday_sched = ""
g.save

h = Employee.create(name: "Karen Plankton", address: "1010 Computer Drive, Bikini Bottom, Pacific Ocean", phone_number: "110-1011-0010", business_id: "3")
h.monday_sched = "9AM - 2PM"
h.tuesday_sched = ""
h.wednesday_sched = ""
h.thursday_sched = "9AM - 12PM"
h.friday_sched = "9AM - 3PM"
h.saturday_sched = ""
h.sunday_sched = ""
h.save

UserBusiness.create(user_id: "1", business_id: "1")
UserBusiness.create(user_id: "1", business_id: "2")
UserBusiness.create(user_id: "2", business_id: "3")
