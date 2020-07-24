
! HOW TO COMPILE THROUGH COMMAND LINE (CMD OR TERMINAL)
! gfortran -c falseposition.f95
! gfortran -o falseposition falseposition.o
!
! The program is open source and can use to numeric study purpose.
! The program was build by Aulia Khalqillah,S.Si.,M.Si
!
! email: auliakhalqillah.mail@gmail.com
! ==============================================================================
program bisection_method
    implicit none
    real :: xi,xf,xr,er,xrold,f,check,limrange,limit
    integer :: iter, condition
    character(len=100) :: fmt
    
    write(*,*)""
    write(*,*)"---------------------------------"
    write(*,*)"BISECTION METHOD - FINDING ROOT"
    write(*,*)"---------------------------------"
    write(*,*) ""
    write(*,"(a)",advance="no") "Insert Initial Boundary (XI):"
    read*, xi
    write(*,"(a)",advance="no") "Insert Final Boundary (XF):"
    read*, xf
    
    fmt = "(a12,a13,a13,a20,a13,a17,a20,a17,a17,a20)"
    write(*,*)""
    
    limrange = 1e12
    limit = 1e-10
    open(20, file='falsepoint.txt', status='replace')
        iter = 1
        xrold = 0
        xr = xf - ((f(xf)*(xf-xi))/(f(xf)-f(xi)))
        er = abs((xr-xrold)/xrold)
        write(*,fmt)"ITER","Xi","Xf","F(Xi)","F(Xf)","XROLD","XR[ROOT]","F(XR)","ERROR","CONDITION"
        do while (er > limit .or. isnan(er))      
            if ((f(xi)*f(xr)) < 0) then
                xf = xr
                xrold = xr
                xr = xf - ((f(xf)*(xf-xi))/(f(xf)-f(xi)))
                er = abs((xr-xrold)/xrold)
                condition = 1
            elseif ((f(xi)*f(xr)) > 0) then
                xi = xr
                xrold = xr
                xr = xf - ((f(xf)*(xf-xi))/(f(xf)-f(xi)))
                er = abs((xr-xrold)/xrold)
                condition = 2
            elseif (f(xi)*f(xr) == 0) then
                xr = xr
    
                if (f(xr) == 0) then
                    xr = xr
                else
                    xr = xi
                endif
                
                xrold = xr
                er = abs((xr-xrold)/xrold)
                condition = 3
            end if
    
            write(*,*) iter,xi,xf,f(xi),f(xf),xrold,xr,f(xr),er,condition
            write(20,*) iter,xi,xf,f(xi),f(xf),xrold,xr,f(xr),er,condition
    
            iter = iter + 1
        end do
    close(20)
    end program
      
    function f(x)
    implicit none
    real::x,f
    ! f = (x**2)-16
    f = (x**2)-(2*x)+1
    ! f = (x**3) - (x**2) - (10*x) + 2
    end
      
