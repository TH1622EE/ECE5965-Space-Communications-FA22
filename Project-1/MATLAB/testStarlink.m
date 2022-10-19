% Create satellite scenario
startTime = datetime(2022,10,1,12,30,0);
stopTime = startTime + days(7);
sampleTime = 60;
sc = satelliteScenario(startTime,stopTime,sampleTime);

% Starlink Satellites Launched on 20220924 
sat1 = satellite(sc, "orbitalData\starlink\20220924\STARLINK-4765.tle");
sat2 = satellite(sc, "orbitalData\starlink\20220924\STARLINK-4772.tle");
sat3 = satellite(sc, "orbitalData\starlink\20220924\STARLINK-4775.tle");
sat4 = satellite(sc, "orbitalData\starlink\20220924\STARLINK-4782.tle");
sat5 = satellite(sc, "orbitalData\starlink\20220924\STARLINK-4787.tle");
sat6 = satellite(sc, "orbitalData\starlink\20220924\STARLINK-4791.tle");
sat7 = satellite(sc, "orbitalData\starlink\20220924\STARLINK-4796.tle");
sat8 = satellite(sc, "orbitalData\starlink\20220924\STARLINK-5000.tle");
sat9 = satellite(sc, "orbitalData\starlink\20220924\STARLINK-5001.tle");
sat10 = satellite(sc, "orbitalData\starlink\20220924\STARLINK-5002.tle");

% Starlink satellites launched on 20220919
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

sat21 = satellite(sc, "orbitalData\starlink\20220911\starlink4710.tle");
sat22 = satellite(sc, "orbitalData\starlink\20220911\starlink4712.tle");
sat23 = satellite(sc, "orbitalData\starlink\20220911\starlink4715.tle");
sat24 = satellite(sc, "orbitalData\starlink\20220911\starlink4720.tle");
sat25 = satellite(sc, "orbitalData\starlink\20220911\starlink4726.tle");
sat26 = satellite(sc, "orbitalData\starlink\20220911\starlink4727.tle");
sat27 = satellite(sc, "orbitalData\starlink\20220911\starlink4728.tle");
sat28 = satellite(sc, "orbitalData\starlink\20220911\starlink4763.tle");
sat29 = satellite(sc, "orbitalData\starlink\20220911\starlink4768.tle");
sat30 = satellite(sc, "orbitalData\starlink\20220911\starlink-B.tle");

sat31 = satellite(sc, "orbitalData\starlink\20220831\starlink4438.tle");
sat32 = satellite(sc, "orbitalData\starlink\20220831\starlink4467.tle");
sat33 = satellite(sc, "orbitalData\starlink\20220831\starlink4562.tle");
sat34 = satellite(sc, "orbitalData\starlink\20220831\starlink4569.tle");
sat35 = satellite(sc, "orbitalData\starlink\20220831\starlink4571.tle");
sat36 = satellite(sc, "orbitalData\starlink\20220831\starlink4572.tle");
sat37 = satellite(sc, "orbitalData\starlink\20220831\starlink4624.tle");
sat38 = satellite(sc, "orbitalData\starlink\20220831\starlink4625.tle");
sat39 = satellite(sc, "orbitalData\starlink\20220831\starlink4626.tle");
sat40 = satellite(sc, "orbitalData\starlink\20220831\starlink4630.tle");

sats = [sat1 sat2 sat3 sat4 sat5 sat6 sat7 sat8 sat9 sat10 ...
        sat11 sat12 sat13 sat14 sat15 sat16 sat17 sat18 sat19 sat20 ...
        sat21 sat22 sat23 sat24 sat25 sat26 sat27 sat28 sat29 sat30 ...
        sat31 sat32 sat33 sat34 sat35 sat36 sat37 sat38 sat39 sat40];

% Add cameras to scenario
for idx = 1:numel(sats)
    name = sats(idx).Name + " Camera";
    conicalSensor(sats(idx), "Name", name, "MaxViewAngle", 90);
end

% Retrieve the cameras
cam = [sats.ConicalSensors];

% Define groundstations
name = "UCCS Campus";
lat = 38.8886569787;
lon = -104.793021161;
gs = groundStation(sc,"Name",name,"Latitude",lat, ...
    "Longitude", lon);

% Add access analysis between cameras and groundstation
for idx = 1:numel(cam)
    access(cam(idx), gs)
end

% Retrieve the access analysis objects
ac = [cam.Accesses];

% Properties of access analysis objects
ac(1)

%fov = fieldOfView(cam([cam.Name] == "sat 4 Camera"))
fov1 = fieldOfView(cam(1));
fov2 = fieldOfView(cam(2));
fov3 = fieldOfView(cam(3));
fov4 = fieldOfView(cam(4));
fov5 = fieldOfView(cam(5));
fov6 = fieldOfView(cam(6));
fov7 = fieldOfView(cam(7));
fov8 = fieldOfView(cam(8));
fov9 = fieldOfView(cam(9));
fov10 = fieldOfView(cam(10));
fov11 = fieldOfView(cam(11));
fov12 = fieldOfView(cam(12));
fov13 = fieldOfView(cam(13));
fov14 = fieldOfView(cam(14));
fov15 = fieldOfView(cam(15));
fov16 = fieldOfView(cam(16));
fov17 = fieldOfView(cam(17));
fov18 = fieldOfView(cam(18));
fov19 = fieldOfView(cam(19));
fov20 = fieldOfView(cam(20));
fov21 = fieldOfView(cam(21));
fov22 = fieldOfView(cam(22));
fov23 = fieldOfView(cam(23));
fov24 = fieldOfView(cam(24));
fov25 = fieldOfView(cam(25));
fov26 = fieldOfView(cam(26));
fov27 = fieldOfView(cam(27));
fov28 = fieldOfView(cam(28));
fov29 = fieldOfView(cam(29));
fov30 = fieldOfView(cam(30));
fov31 = fieldOfView(cam(31));
fov32 = fieldOfView(cam(32));
fov33 = fieldOfView(cam(33));
fov34 = fieldOfView(cam(34));
fov35 = fieldOfView(cam(35));
fov36 = fieldOfView(cam(36));
fov37 = fieldOfView(cam(37));
fov38 = fieldOfView(cam(38));
fov39 = fieldOfView(cam(39));
fov40 = fieldOfView(cam(40));

% Hide the Orbital paths
% hide([sats.Orbit])

% Play the scenario
play(sc);
hide([sats.Orbit])