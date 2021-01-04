% Generated on: Dec 01, 2020
% Last modification: Dec 01, 2020
% Author: Suwon Lee from Seoul National University

function [new_control_points] = bezier_degree_elevation(control_points)
    new_control_points      = zeros(1,numel(control_points)+1); % Allocation
    new_control_points(1)   = control_points(1);                % Initial control point
    new_control_points(end) = control_points(end);              % Final control point
    for i = 2:numel(control_points)                             % Intermediate control points
        p1 = control_points(i-1);
        p2 = control_points(i);
        k  = i-1;
        N  = numel(control_points)-1;
        pk = k/(N+1)*p1 + (1-k/(N+1))*p2;
        new_control_points(i) = pk;
    end
end