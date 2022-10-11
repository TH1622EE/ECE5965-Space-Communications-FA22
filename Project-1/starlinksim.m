clear
close all

% Create and initialize a satellite scenario
startTime = datetime(2022,10,1,12,30,0);
stopTime = startTime + days(7);
sampleTime = 60;
sc = satelliteScenario(startTime,stopTime,sampleTime);

% Add a satellite to scenario
sat1 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-4765.tle");
sat2 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-4772.tle");
sat3 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-4775.tle");
sat4 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-4782.tle");
sat5 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-4787.tle");
sat6 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-4791.tle");
sat7 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-4796.tle");
sat8 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5000.tle");
sat9 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5001.tle");
sat10 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5002.tle");
% sat11 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5003.tle");
% sat12 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5004.tle");
% sat13 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5005.tle");
% sat14 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5008.tle");
% sat15 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5009.tle");
% sat16 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5010.tle");
% sat17 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5011.tle");
% sat18 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5012.tle");
% sat19 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5014.tle");
% sat20 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5015.tle");
% sat21 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5017.tle");
% sat22 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5018.tle");
% sat23 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5021.tle");
% sat24 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5022.tle");
% sat25 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5023.tle");
% sat26 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5024.tle");
% sat27 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5025.tle");
% sat28 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5028.tle");
% sat29 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5029.tle");
% sat30 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5031.tle");
% sat31 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5032.tle");
% sat32 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5034.tle");
% sat33 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5035.tle");
% sat34 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5036.tle");
% sat35 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5037.tle");
% sat36 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5040.tle");
% sat37 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5041.tle");
% sat38 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5042.tle");
% sat39 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5043.tle");
% sat40 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5044.tle");
% sat41 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5045.tle");
% sat42 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5046.tle");
% sat43 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5048.tle");
% sat44 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5050.tle");
% sat45 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5051.tle");
% sat46 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5052.tle");
% sat47 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5053.tle");
% sat48 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5054.tle");
% sat49 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5056.tle");
% sat50 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5057.tle");
% sat51 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5059.tle");
% sat52 = satellite(sc, "ECE5695-Project-1\orbitalData\TLE\STARLINK-5063.tle");

sat11 = satellite(sc, "orbitalData\starlink\20220919\starlink4703.tle");
sat12 = satellite(sc, "orbitalData\starlink\20220919\starlink4732.tle");
sat13 = satellite(sc, "orbitalData\starlink\20220919\starlink4740.tle");
sat14 = satellite(sc, "orbitalData\starlink\20220919\starlink4762.tle");
sat15 = satellite(sc, "orbitalData\starlink\20220919\starlink4779.tle");
sat16 = satellite(sc, "orbitalData\starlink\20220919\starlink4781.tle");
sat17 = satellite(sc, "orbitalData\starlink\20220919\starlink4788.tle");
sat18 = satellite(sc, "orbitalData\starlink\20220919\starlink4790.tle");
sat19 = satellite(sc, "orbitalData\starlink\20220919\starlink4792.tle");
sat20 = satellite(sc, "orbitalData\starlink\20220919\starlink4798.tle");
% sat63 = satellite(sc, "orbitalData\starlink\20220919\starlink4800.tle");
% sat64 = satellite(sc, "orbitalData\starlink\20220919\starlink4809.tle");
% sat65 = satellite(sc, "orbitalData\starlink\20220919\starlink4810.tle");

sat21 = satellite(sc, "orbitalData\starlink\20220911\starlink-B.tle");
sat22 = satellite(sc, "orbitalData\starlink\20220911\starlink4710.tle");
sat23 = satellite(sc, "orbitalData\starlink\20220911\starlink4712.tle");
sat24 = satellite(sc, "orbitalData\starlink\20220911\starlink4715.tle");
sat25 = satellite(sc, "orbitalData\starlink\20220911\starlink4720.tle");
sat26 = satellite(sc, "orbitalData\starlink\20220911\starlink4726.tle");
sat27 = satellite(sc, "orbitalData\starlink\20220911\starlink4727.tle");
sat28 = satellite(sc, "orbitalData\starlink\20220911\starlink4728.tle");
sat29 = satellite(sc, "orbitalData\starlink\20220911\starlink4763.tle");
sat30 = satellite(sc, "orbitalData\starlink\20220911\starlink4768.tle");

sat31 = satellite(sc, "orbitalData\starlink\20220905\starlink4589.tle");
sat32 = satellite(sc, "orbitalData\starlink\20220905\starlink4612.tle");
sat33 = satellite(sc, "orbitalData\starlink\20220905\starlink4614.tle");
sat34 = satellite(sc, "orbitalData\starlink\20220905\starlink4637.tle");
sat35 = satellite(sc, "orbitalData\starlink\20220905\starlink4645.tle");
sat36 = satellite(sc, "orbitalData\starlink\20220905\starlink4656.tle");
sat37 = satellite(sc, "orbitalData\starlink\20220905\starlink4657.tle");
sat38 = satellite(sc, "orbitalData\starlink\20220905\starlink4669.tle");
sat39 = satellite(sc, "orbitalData\starlink\20220905\starlink4670.tle");
sat40 = satellite(sc, "orbitalData\starlink\20220905\starlink4680.tle");

sat41 = satellite(sc, "orbitalData\starlink\20220831\starlink4438.tle");
sat42 = satellite(sc, "orbitalData\starlink\20220831\starlink4467.tle");
sat43 = satellite(sc, "orbitalData\starlink\20220831\starlink4562.tle");
sat44 = satellite(sc, "orbitalData\starlink\20220831\starlink4569.tle");
sat45 = satellite(sc, "orbitalData\starlink\20220831\starlink4571.tle");
sat46 = satellite(sc, "orbitalData\starlink\20220831\starlink4572.tle");
sat47 = satellite(sc, "orbitalData\starlink\20220831\starlink4624.tle");
sat48 = satellite(sc, "orbitalData\starlink\20220831\starlink4625.tle");
sat49 = satellite(sc, "orbitalData\starlink\20220831\starlink4626.tle");
sat50 = satellite(sc, "orbitalData\starlink\20220831\starlink4630.tle");

sats = [sat1 sat2 sat3 sat4 sat5 sat6 sat7 sat8 sat9 sat10 ...
    sat11 sat12 sat13 sat14 sat15 sat16 sat17 sat18 sat19 sat20 ...
    sat21 sat22 sat23 sat24 sat25 sat26 sat27 sat28 sat29 sat30 ...
    sat31 sat32 sat33 sat34 sat35 sat36 sat37 sat38 sat39 sat40 ...
    sat41 sat42 sat43 sat44 sat45 sat46 sat47 sat48 sat49 sat50];

% Show satellites in orbit and plot ground tracks
show(sats)
groundTrack(sats, "LeadTime", 1200)

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
% time = datetime(2022,10,4,12,30,0);
% [az,elev,r] = aer(gs(1),sats(1),time)

play(sc)
