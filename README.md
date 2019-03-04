```
# get_radar_name
get radar name from Dias file
#calc equivalent potential temperature
#mizuno book p33(3.30b)
w=0
w1000=w/1000.
#mizuno book p46 (4.14c)
templ=1/(1/(temp-55)-ln(RH/100)/2840)+55.
thetae=temp*(1000/p)**(0.2854*(1-0.28*w1000)*exp(3.376/templ-0.00254)*w*(1+0.81*10**-3*2)
```
