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
    real :: xi,xf,xr,error,xrold,f,limiterror
    real :: start,finish
    integer :: iter, condition
    character(len=100) :: fmt
    
    write(*,*)""
    write(*,*)"---------------------------------"
    write(*,*)"FALSE POSITION - FINDING ROOT"
    write(*,*)"---------------------------------"
    write(*,*) ""
    write(*,"(a)",advance="no") "Insert Initial Boundary (XI):"
    read*, xi
    write(*,"(a)",advance="no") "Insert Final Boundary (XF):"
    read*, xf
    
    fmt = "(a12,a13,a13,a20,a13,a17,a20,a17,a17,a20)"
    write(*,*)""
    
    ! Start root calculation
    call cpu_time(start)
    limiterror = 1e-20
    open(20, file='falsepoint.txt', status='replace')
        iter = 1
        xrold = xi
        ! Calculate the root by using false position method (secant method approximation)
        xr = xf - ((f(xf)*(xf-xi))/(f(xf)-f(xi)))
        error = abs((xr-xrold)/xr) * 100
        condition = 0
        write(*,fmt)"ITER","Xi","Xf","F(Xi)","F(Xf)","XROLD","XR[ROOT]","F(XR)","ERROR","CONDITION"
        do while (error > limiterror .or. isnan(error))
            ! write the result on terminal and save to the file
            write(*,*) iter,xi,xf,f(xi),f(xf),xrold,xr,f(xr),error,condition
            write(20,*) iter,xi,xf,f(xi),f(xf),xrold,xr,f(xr),error,condition  
            ! Check first condition by using bisection approximation   
            if ((f(xi)*f(xr)) < 0) then
                xf = xr
                xrold = xr
                xr = xf - ((f(xf)*(xf-xi))/(f(xf)-f(xi)))
                error = abs((xr-xrold)/xr) * 100
                condition = 1
            ! Check second condition by using bisection approximation   
            elseif ((f(xi)*f(xr)) > 0) then
                xi = xr
                xrold = xr
                xr = xf - ((f(xf)*(xf-xi))/(f(xf)-f(xi)))
                error = abs((xr-xrold)/xr) * 100
                condition = 2
            ! Check third condition by using bisection approximation                   
            elseif (f(xi)*f(xr) == 0) then
                xr = xr
                if (f(xr) == 0) then
                    xr = xr
                else
                    xr = xi
                endif
                xrold = xr
                error = abs((xr-xrold)/xr) * 100
                condition = 3
            end if
            iter = iter + 1
        end do
    close(20)
    call cpu_time(finish)
    print '("Time = ",f12.8," seconds.")',finish-start
    end program
      
    function f(x)
    implicit none
    real::x,f
    ! f = (x**2)-16
    f = (x**2)-(2*x)+1
    ! f = (x**3) - (x**2) - (10*x) + 2
    end
      
