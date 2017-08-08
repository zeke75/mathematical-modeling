angle=5:5:85;
distance=[4.37 5.23 6.95 7.84 8.17 8.69 8.81 8.99 8.95 8.83 8.19 7.84 7.12 6.38 5.08 3.34 2.13];
distance2=[4.12 5.85 7.34 8.54 9.45 10.08 10.44 10.56 10.43 10.07 9.49 8.69 7.68 6.46 5.06 3.49 1.79];
plot(angle,distance,'o',angle,distance2,'*')

error=norm(distance-distance2)
