
! HOW TO COMPILE THROUGH COMMAND LINE (CMD OR TERMINAL)
! gfortran -c falseposition.f95
! gfortran -o falseposition falseposition.o
!
! The program is open source and can use to numeric study purpose.
! The program was build by Aulia Khalqillah,S.Si
!
! email: auliakhalqillah.mail@gmail.com
! ==============================================================================

PROGRAM FALSEPOINT
IMPLICIT NONE

REAL :: XF,XI,XR,XO,F,ER,INF
INTEGER :: ITER,N
CHARACTER(LEN=100) :: FMT

WRITE(*,*) ""
WRITE(*,*)"------------------------------------"
WRITE(*,*)"FALSE POSITION METHOD - FINDING ROOT"
WRITE(*,*)"------------------------------------"
WRITE(*,*) ""
WRITE(*,"(a)",ADVANCE='NO') "INSERT INITIAL BOUNDARY (XI):"
READ *, XI
WRITE(*,"(a)",ADVANCE='NO') "INSERT FINAL BOUNDARY (XF):"
READ *, XF
WRITE(*,"(a)",ADVANCE='NO') "INSERT DATA LENGTH (N:100):"
READ *, N

INF = HUGE(1000.0)
FMT = "(a12,a13,a13,a20)"
WRITE(*,*)""
WRITE(*,FMT)"ITER","XR[ROOT]","F(XR)","ERROR(%)"
OPEN(10,FILE="falseposition.txt",STATUS="REPLACE")
50 ITER = 1
	XO = 0.0
	DO WHILE (ITER .LE. N)
		XR = XF - ((F(XF)*(XI-XF))/(F(XI)-F(XF)))

		IF (F(XR) .EQ. 0) THEN
			ER = ABS((XR-XR)/XR)*100
			WRITE(*,*) ITER,XR,F(XR),ER
		ELSEIF ((XR .NE. XR) .OR. (XR .GT. INF)) THEN
			! Estimate new final boundary
			XF = XF - 1
			GO TO 50
		ELSEIF ((F(XI)*F(XR)) .LE. 0) THEN
			XF = XR
		ELSE
			XI = XR
		END IF

		ER = ABS((XR-XO)/XR)*100
		IF (ER .GT. 0.001) THEN
			WRITE(*,*) ITER,XR,F(XR),ER
			WRITE(10,*) ITER,XR,F(XR),ER
			ITER=ITER+1
			XO=XR
		END IF
	END DO
	CLOSE(10)
END PROGRAM

REAL FUNCTION F(X)
IMPLICIT NONE
REAL :: X
! F = (X**10)-1
F = (X**2)+(2*X)+1
END FUNCTION
