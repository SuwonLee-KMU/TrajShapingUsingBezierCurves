% Generated on: 191211
% Last modification: 191211
% Author: Suwon Lee from Seoul National University

classdef Bernstein
    properties
        coefficients
    end
    methods
        % Constructor
        function obj = Bernstein(varargin) 
            if ~isempty(varargin)
                obj.coefficients = varargin{1};
            end
        end
        function value = feval(obj,x)
            n = numel(obj.coefficients)-1;
            value = zeros(1,numel(x));;
            for ii = 1:n+1
                v = ii-1;
                value = value + obj.basis(n,v,x).*obj.coefficients(ii);
            end
        end
        function value = derivative(obj,x)
            n = numel(obj.coefficients)-1;
            value = zeros(1,numel(x));;
            for ii = 1:n+1
                v = ii-1;
                value = value + obj.basisPthDerivative(n,v,1,x).*obj.coefficients(ii);
            end
        end
        function value = Pthderivative(obj,x,P)
            n = numel(obj.coefficients)-1;
            value = zeros(1,numel(x));;
            for ii = 1:n+1
                v = ii-1;
                value = value + obj.basisPthDerivative(n,v,P,x).*obj.coefficients(ii);
            end
        end
    end
    methods (Static)
        function Bin = basis(n,i,x)
            Bin = nchoosek(n,i).*x.^i.*(1-x).^(n-i);
        end
        function DpBin = basisPthDerivative(n,i,p,x)
            DpBin_ = 0;
            for k = max(0,i+p-n):min(i,p)
                term = (-1)^(k+p).*nchoosek(p,k).*bernstein.basis(n-p,i-k,x);
                DpBin_ = DpBin_ + term;
            end
            DpBin = factorial(n)/factorial(n-p)*DpBin_;
        end
    end
end