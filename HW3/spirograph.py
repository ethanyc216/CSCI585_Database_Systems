import math

bovard = (-118.285582, 34.020852)
#bovard = (0.0, 0.0)
R=5
r=1
a=4
pi = math.pi

def spirograph(t, loc, R=5.0, r=1.0, a=4.0, s=0.0001):
    lon, lat = loc
    lat += ((R+r)*math.cos((r/R)*t)-a*math.cos((1+r/R)*t))*s
    lon += ((R+r)*math.sin((r/R)*t)-a*math.sin((1+r/R)*t))*s
    return lon, lat

f = open('spiro.kml', 'w')
f.write('\
<?xml version="1.0" encoding="UTF-8"?>\n\
<kml xmlns="http://earth.google.com/kml/2.0">\n\
<Document>\n\
<Style id="z1">\n\
<IconStyle><Icon><href>http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png</href></Icon></IconStyle>\n\
</Style>\n\n\
<Placemark><name>Bovard</name>\n\
<styleUrl>#z1</styleUrl><Point><coordinates>-118.285582,34.020852</coordinates></Point>\n\
</Placemark>\n\n\
<Placemark><name>The Spirograph</name>\n\
<LineString>\n\
<altitudeMode>absolute</altitudeMode>\n\
<coordinates>\n')

for t in range(int(2*R*pi*100+20)):
    t = t/100.0
    lon, lat = spirograph(t, bovard)
    f.write('%f,%f,100\n' % (lon, lat))
f.write('\
</coordinates>\n\
</LineString>\n\
</Placemark>\n\n\
</Document></kml>\n')
f.close()
