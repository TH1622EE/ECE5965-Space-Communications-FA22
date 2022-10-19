% Create satellite scenario
startTime = datetime(2022,10,1,12,30,0);
stopTime = startTime + days(7);
sampleTime = 60;
sc = satelliteScenario(startTime,stopTime,sampleTime);

% Add satellites to scenario
sat1 = satellite(sc, "orbitalData\TLE\AEHF1-TLE-Data.tle");
sat2 = satellite(sc, "orbitalData\TLE\AEHF2-TLE-Data.tle");
sat3 = satellite(sc, "orbitalData\TLE\AEHF3-TLE-Data.tle");
sat4 = satellite(sc, "orbitalData\TLE\AEHF4-TLE-Data.tle");
sat5 = satellite(sc, "orbitalData\TLE\AEHF5-TLE-Data.tle");
sat6 = satellite(sc, "orbitalData\TLE\AEHF6-TLE-Data.tle");
sats = [sat1 sat2 sat3 sat4 sat5 sat6];

% Add cameras to scenario
for idx = 1:numel(sats)
    name = sats(idx).Name + " Camera";
    conicalSensor(sats(idx), "Name", name, "MaxViewAngle", 30);
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
% fov1 = fieldOfView(cam(1), "LineColor", 'r');
fov2 = fieldOfView(cam(2), "LineColor", 'g');
fov3 = fieldOfView(cam(3), "LineColor", 'b');
fov4 = fieldOfView(cam(4), "LineColor", 'c');
% fov5 = fieldOfView(cam(5), "LineColor", 'm');
% fov6 = fieldOfView(cam(6), "LineColor", 'y');

% Hide the Orbital paths
hide([sats.Orbit])

% Play the scenario
play(sc);