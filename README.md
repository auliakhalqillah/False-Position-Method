# False-Position-Method
The false-position method is another method in bracketing method for finding root. This method makes use of first derivative of a function where the false position equation as follows

![equation1](https://i.upmath.me/svg/x_%7Bn%2B1%7D%3Dx_n-%7Bf(x_n%20)%5Cover%20f'(x_n)%7D)

Therefore, the first derivative, f'(xn), have to be solved analytically. Another way to solve first derivative without analytic process, we can use first derivative approximation equation as follows

![equation2](https://i.upmath.me/svg/f'(x_n)%5Capprox%20%7Bf(x_n)-f(x_%7Bn-1%7D)%5Cover%20x_n-x_%7Bn-1%7D%7D)

Then, equation above is substituted to first equation and we get

![equation3](https://i.upmath.me/svg/x_%7Bn%2B1%7D%3Dx_n-%7Bf(x_n)(x_%7Bn-1%7D-x_n%20)%5Cover%20f(x_%7Bn-1%7D)-f(x_n)%7D)

we can simplify become

![equation4](https://i.upmath.me/svg/x_r%3Dx_f-%7Bf(x_f)(x_i-x_f)%5Cover%20f(x_i)-f(x_f)%7D)

for finding root of a function. The false position is required two initial root approximation, `xi` and `xf`, where both initial are in range of expected root. To calculate an error of root approximation, we can use equation as follows

![equation5](https://i.upmath.me/svg/error%20%3D%20%5Cleft%5Clvert%20%7Bx_r-x_0%5Cover%20x_0%7D%20%5Cright%5Clvert)

where `x0` is the initial expected root.
# Example
Given a function  of f(x) = x2-2x+1. By using bisection method to solve this equation, set the initial boundary xi = -3, final boundary xf = 3, limit range = 1e12, and limit of error = 1e-10. After 4596 times iteration, we get the root of this function is 1.00042284 (precision in Fortran 95) where the f(1.00042284) = 1.19209290E-07 (close to 0). 

By using this method, if you set the two initial roots aproximation are not in range of expected root (e.g xi = 3 and xf 5), it will solve automatically without re-input the two initial roots approximation again.
# Contact
Email: auliakhalqillah.mail@gmail.com
 # Material Source
[Julan Hernadi(2012),Matematika Numerik dengan Implementasi Matlab](http://andipublisher.com/produk-1012004497-matematika-numerik-dengan-implementasi-m.html)
