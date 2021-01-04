% Generated on: Jan. 04, 2020
% Last modification: Jan. 04, 2020
% Author: Suwon Lee from Seoul National University

% This code is for: A testbed for the algorithm

clear all; clc;
close all;

% Initialize
problem.output(1).degree = 5;

% Boundary conditions for the output and its derivatives
problem.boundary.output(1).ini(1) = 0; 			% initial value for the output
problem.boundary.output(1).fin(1) = 10; 		% final value for the output
problem.boundary.output(1).deriv.ini(1) = 0; 	% initial value for the 1st derivative of the output
problem.boundary.output(1).deriv.fin(1) = 0;	% final value for the 1st derivative of the output
problem.boundary.output(1).deriv.ini(2) = 0; 	% initial value for the 2nd derivative of the output
problem.boundary.output(1).deriv.fin(2) = 0;	% final value for the 2nd derivative of the output

% System dynamics : user-defined function handles
sys.state = @(output_vector) myfun_state;
sys.input = @(output_vector) myfun_input;

% Validation
evaluation(problem);

% Initial guess
problem.output(1).guess = guessInitSol(problem);

% Optimization
% soln = optimizer.optimize(problem);

% Plot
% [fig,plt] = plotSystem(soln);

% Functions
function [guess] = guessInitSol(p)

end
function [] = evaluation(p)
	% Mimimum degree check
	for i = 1:numel(p.boundary.output)
		num_bd_ini(i) = numel(p.boundary.output(i).deriv.ini) + numel(p.boundary.output(i).ini);
		num_bd_fin(i) = numel(p.boundary.output(i).deriv.fin) + numel(p.boundary.output(i).fin);
		min_degree(i) = num_bd_ini(i) + num_bd_fin(i) - 1;
		if p.output(i).degree < min_degree(i)
			error(['Please use higher degree for output number ',num2str(i)],'.');
		end
	end
end
function [x] = myfun_state(y)
	x = 2*y;
end
function [u] = myfun_input(y)
	x = myfun_state(y);
	u = -2*x;
end