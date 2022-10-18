function [P, t] = poincareMap(X, plane)
% given N-dimensional time-series data X,  
% find points of the time series that cross a given plane. 
%   X ( t, variables ) is a T x N matrix of N-dimensional states evolving over time
%   plane.norm = N-dim normal vector  (default [1,0,0,0...]
%   plane.dist = distance from origin (default 0)

if ~exist('plane','var')
  plane.norm = zeros(size(X,2),1);  % column vec
  plane.norm(1) = 1;
  plane.dist = 0.47;
end
plane.norm = plane.norm/norm(plane.norm); % ensure length = 1
% distance of each state point from the plane
% project the state onto the plane's normal vector (dot product)
projections = X * plane.norm - plane.dist;
  P = [] ; % keep a list of plane-crossing points
  t = [] ; % keep a list of the times of crossing
  for i=2:size(X,1) % for each timepoint
    p1 = projections(i-1); % previous state's distance from plane
    p2 = projections(i);   % current state's distance from plane
    % is this a plane-crossing?
    if (p2<0) && (p1>0)
      % linear interpolation to mix the two points, to estimate the crossing
      % point
      mix = -p1/(p2-p1); % how much of p2 to mix into p1?
      Xp = X(i-1,:) + mix * (X(i,:)-X(i-1,:)); % estimated plane crossing
      % add a row to P
      P = [ P;  Xp ];
      t = [ t;  i  ];
    end
  end
% note that, if you have some directions within the plane, you can 
% collapse P into a set of (N-1)-dimensional points
end