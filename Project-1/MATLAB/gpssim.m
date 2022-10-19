clear
close all

% Create and initialize a satellite scenario
startTime = datetime(2022,10,1,12,30,0);
stopTime = startTime + days(7);
sampleTime = 60;
sc = satelliteScenario(startTime,stopTime,sampleTime);

% Add a satellite to scenario
sat1 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\GPS-USA-266-TLE-DATA.tle");
sat2 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\GPS-USA-289-TLE-DATA.tle");
sat3 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\GPS-USA-293-TLE-DATA.tle");
sat4 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\GPS-USA-304-TLE-DATA.tle");
sat5 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\GPS-USA-309-TLE-DATA.tle");
sat6 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\GPS-USA-319-TLE-DATA.tle");
sats = [sat1 sat2 sat3 sat4 sat5 sat6];

% Show satellites in orbit and plot ground tracks
show(sats)
% groundTrack(sats, "LeadTime", 1200)
groundTrack(sats, "Viewer", 100)

% Display orbital elements of satellite
% ele1 = orbitalElements(sats(1))
% ele2 = orbitalElements(sats(2))
% ele3 = orbitalElements(sats(3))
% ele4 = orbitalElements(sats(4))
% ele5 = orbitalElements(sats(5))
% ele6 = orbitalElements(sats(6))

% Return the latitude, longitude, and altitude of satellite
% at time 02-June-2020 12:30:00 PM UTC
% time = datetime(2022,10,1,12,30,0);
% pos1 = states(sats(1),time,"CoordinateFrame","geographic")
% pos2 = states(sats(2),time,"CoordinateFrame","geographic")
% pos3 = states(sats(3),time,"CoordinateFrame","geographic")
% pos4 = states(sats(4),time,"CoordinateFrame","geographic")
% pos5 = states(sats(5),time,"CoordinateFrame","geographic")
% pos6 = states(sats(6),time,"CoordinateFrame","geographic")


% Add ground stations
name = "UCCS Campus";
lat = 38.8886569787;
lon = -104.793021161;
gs = groundStation(sc,"Name",name,"Latitude",lat, ...
    "Longitude", lon);


 % Return Azimuth Angle, Elevation Angle, and Range at Specified Time
% time = datetime(2020,6,02,12,30,0);
% [az,elev,r] = aer(gs(1),sats(1),time)

play(sc)
