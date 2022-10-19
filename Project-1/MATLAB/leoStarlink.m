startTime = datetime(2022,10,1,12,30,0);
stopTime = startTime + days(7);
sampleTime = 60;
sc = satelliteScenario(startTime,stopTime,sampleTime);
sats = satellite(sc, "orbitalData\TLE\test.tle");

for idx = 1:numel(sats)
    name = sats(idx).Name + " Camera";
    conicalSensor(sats(idx), "Name", name, "MaxViewAngle", 90);
end

cam = [sats.ConicalSensors];
name = "UCCS Campus";
lat = 38.8886569787;
lon = -104.793021161;
gs = groundStation(sc,"Name",name,"Latitude",lat, ...
    "Longitude", lon);

for idx = 1:numel(cam)
    access(cam(idx), gs)
end

% Retrieve the access analysis objects
ac = [cam.Accesses];

% Properties of access analysis objects
% ac(1);

% fov1 = fieldOfView(cam(1), "LineColor", 'r');
% fov2 = fieldOfView(cam(2), "LineColor", 'g');
% fov3 = fieldOfView(cam(3), "LineColor", 'b');
% fov4 = fieldOfView(cam(4), "LineColor", 'r');
% fov5 = fieldOfView(cam(5), "LineColor", 'g');
% fov6 = fieldOfView(cam(6), "LineColor", 'b');
% fov7 = fieldOfView(cam(7), "LineColor", 'r');
% fov8 = fieldOfView(cam(8), "LineColor", 'g');
% fov9 = fieldOfView(cam(9), "LineColor", 'b');
% fov10 = fieldOfView(cam(10), "LineColor", 'r');
% fov11 = fieldOfView(cam(11), "LineColor", 'g');
% fov12 = fieldOfView(cam(12), "LineColor", 'b');
% fov13 = fieldOfView(cam(13), "LineColor", 'r');
% fov14 = fieldOfView(cam(14), "LineColor", 'g');
% fov15 = fieldOfView(cam(15), "LineColor", 'b');
% fov16 = fieldOfView(cam(16), "LineColor", 'r');
% fov17 = fieldOfView(cam(17), "LineColor", 'g');
% fov18 = fieldOfView(cam(18), "LineColor", 'b');
% fov19 = fieldOfView(cam(19), "LineColor", 'r');
% fov20 = fieldOfView(cam(20), "LineColor", 'g');
% fov21 = fieldOfView(cam(21), "LineColor", 'b');
% fov22 = fieldOfView(cam(22), "LineColor", 'r');
% fov23 = fieldOfView(cam(23), "LineColor", 'g');
% fov24 = fieldOfView(cam(24), "LineColor", 'b');
% fov25 = fieldOfView(cam(25), "LineColor", 'r');
% fov26 = fieldOfView(cam(26), "LineColor", 'g');
% fov27 = fieldOfView(cam(27), "LineColor", 'b');
% fov28 = fieldOfView(cam(28), "LineColor", 'r');
% fov29 = fieldOfView(cam(29), "LineColor", 'g');
% fov30 = fieldOfView(cam(30), "LineColor", 'b');
% fov31 = fieldOfView(cam(31), "LineColor", 'r');
% fov32 = fieldOfView(cam(32), "LineColor", 'g');
% fov33 = fieldOfView(cam(33), "LineColor", 'b');
% fov34 = fieldOfView(cam(34), "LineColor", 'r');
% fov35 = fieldOfView(cam(35), "LineColor", 'g');
% fov36 = fieldOfView(cam(36), "LineColor", 'b');
% fov37 = fieldOfView(cam(37), "LineColor", 'r');
% fov38 = fieldOfView(cam(38), "LineColor", 'g');
% fov39 = fieldOfView(cam(39), "LineColor", 'b');

for idx = 1:numel(ac)
    ac(idx).LineColor = 'green';
end

% accessIntervals(ac);

play(sc);
% hide([sats.Orbit])