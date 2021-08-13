# Generated on: 2021-08-13 
# Author: Suwon Lee from Samsung Electronics

import numpy as np
import scipy
from scipy.special import comb

class Bernstein:
    def __init__(self,coef):
        self.coefficients = coef
        self.n = np.size(coef) - 1

    def basis(self,n,i,x):
        return comb(n,i)*x**i*(1-x)**(n-i)

    def basisPthDerivative(self,n,i,p,x):
        DpBin = 0
        for k in range(max(0,i+p-n),max(i,p)+1):
            term = (-1)**(k+p)*comb(p,k)*self.basis(n-p,i-k,x)
            DpBin = DpBin + term
        return scipy.special.factorial(n)/scipy.special.factorial(n-p)*DpBin

    def feval(self,x):
        n = self.n
        nx = np.size(x)
        value = np.zeros(nx)
        for i in range(1,n+1+1):
            v = i-1
            value = value + self.basis(n,v,x)*self.coefficients[v]
        return value

    def derivative(self,x):
        n = self.n
        nx = np.size(x)
        value = np.zeros(nx)
        for i in range(1,n+1+1):
            v = i-1
            value = value + self.basisPthDerivative(n,v,1,x)*self.coefficients[v]
        return value

    def Pthderivative(self,x,P):
        n = self.n
        nx = np.size(x)
        value = np.zeros(nx)
        for i in range(1,n+1+1):
            v = i-1
            value = value + self.basisPthDerivative(n,v,P,x)*self.coefficients[v]
        return value
