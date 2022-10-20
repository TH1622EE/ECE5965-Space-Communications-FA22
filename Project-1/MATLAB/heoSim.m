startTime = datetime(2022,10,1,12,30,0);
stopTime = startTime + days(7);
sampleTime = 30;
sc = satelliteScenario(startTime,stopTime,sampleTime);

sats = satellite(sc, "orbitalData\TLE\heotle.tle");

for idx = 1:numel(sats)
    name = sats(idx).Name + " Camera";
    conicalSensor(sats(idx), "Name", name, "MaxViewAngle", 65);
end

cam = [sats.ConicalSensors];

fov1 = fieldOfView(cam(1), "LineColor", 'r');
fov2 = fieldOfView(cam(2), "LineColor", 'g');
fov3 = fieldOfView(cam(3), "LineColor", 'b');

elements1 = orbitalElements(sats(1));
elements2 = orbitalElements(sats(2));
elements3 = orbitalElements(sats(3));

% Latitude & Longitude acquired from Google Maps
name = "UCCS Campus";
lat = 38.8886569787;
long = -104.793021161;
gs = groundStation(sc,"Name",name,"Latitude",lat, ...
    "Longitude", long);

for idx = 1:numel(cam)
    access(cam(idx), gs);
end

% Retrieve the access analysis objects
ac = [cam.Accesses];

% Properties of access analysis objects
ac(1);

for idx = 1:numel(ac)
    ac(idx).LineColor = 'g';
end

accessIntervals(ac);

v = satelliteScenarioViewer(sc, ShowDetails=true);
campos(v, 70, long, 9e7)