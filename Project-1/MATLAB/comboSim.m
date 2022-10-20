%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize Scenario
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
startTime = datetime(2022,10,1,12,30,0);
stopTime = startTime + days(7);
sampleTime = 30;
sc = satelliteScenario(startTime,stopTime,sampleTime);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create Geosynchronous Satellite Constellation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sats = satellite(sc, "orbitalData\TLE\combo.tle");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate Cameras for each Satellite
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for idx = 1:numel(sats)
    name = sats(idx).Name + " Camera";
    conicalSensor(sats(idx), "Name", name, "MaxViewAngle", 65);
end

cam = [sats.ConicalSensors];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define Field-of-View (FOV) for each Camera
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fov1 = fieldOfView(cam(1), "LineColor", 'r');
fov2 = fieldOfView(cam(2), "LineColor", 'g');
fov3 = fieldOfView(cam(3), "LineColor", 'b');
fov4 = fieldOfView(cam(4), "LineColor", 'm');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Display Orbital Element Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elements1 = orbitalElements(sats(1));
elements2 = orbitalElements(sats(2));
elements3 = orbitalElements(sats(3));
elements4 = orbitalElements(sats(4));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create Ground Station (GS) at UCCS Campus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
name = "UCCS Campus";
lat = 38.8886569787;
long = -104.793021161;
gs = groundStation(sc,"Name",name,"Latitude",lat, ...
    "Longitude", long);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create Access Intervals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Display Scenario Viewer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v = satelliteScenarioViewer(sc, ShowDetails=true);
campos(v, 12, long, 5e7)