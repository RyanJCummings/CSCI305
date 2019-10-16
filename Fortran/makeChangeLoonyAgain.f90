    PROGRAM MakeChangeLoonyAgain
    IMPLICIT NONE
        
        ! Input from console 1-99 cents
        ! Uses greedy algorithm to convert cents to Looney Money
        ! Outputs to console

        ! 1 Lunker = 30 cents
        ! 1 loonter = 15 cents
        ! 1 little = 5 cents
        ! 1 Pooney = 1 cent

        INTEGER :: i, j, k, answer, errorCheck
        CHARACTER(LEN = 9) :: denom
        CHARACTER(LEN = 8) :: DateINFO
        CHARACTER(LEN = 4) :: Year, Month * 2, Day * 2
        CHARACTER(LEN = 10) :: TimeINFO, PrettyTime * 1
        CHARACTER(LEN = 2) :: Hour, Minute, Second * 6

        j = 0  ! Initializes counter variable for loop
        
        CALL errorHandling(i, errorCheck)

! Part 1
        DO WHILE(j < 4)

            CALL checkCoins(j, k, denom) 
            answer = convert(i, k)
            j = j + 1
            IF (answer /= 0) THEN
                WRITE(*,*) answer, denom
            END IF
        END DO


! Part 2
!        WRITE(*,*) "Please enter an integer between 1 and 99."
!        READ(*,*) i
        j = 0
        CALL errorHandling(i, errorCheck)       
        
        DO WHILE(j < 4)
            CALL checkCoins(j, k, denom) 
            !i = i - (answer * k)
            answer = convert(i, k)
            j = j + 1

            IF (answer /= 0) THEN
                WRITE(*,"(I2A1A9)", ADVANCE='NO') answer, " ", denom
            END IF
        END DO
        WRITE(*,*)" "        

! Part 3
        CALL DATE_AND_TIME(DateInfo, TimeINFO)
        
        Year = DateINFO(1:4)
        Month = DateINFO(5:6)
        Day = DateINFO(7:8)
        Hour = TimeINFO(1:2)
        Minute = TimeINFO(3:4)

        WRITE(*,*) Month, "-", Day, "-", Year, ", ", Hour, ":", Minute


        CONTAINS
            FUNCTION convert(amount, denomination)
            IMPLICIT NONE
                INTEGER :: amount, denomination, Loony_Money, convert
 
                IF (mod(amount, denomination) == 0) THEN
                    Loony_money = (amount / denomination)
                    amount = 0
                ELSE
                    Loony_money = 0
                    DO WHILE(amount > denomination)
                        amount = amount - denomination
                        Loony_money = Loony_money + 1
                    END DO
                END IF
                convert = Loony_money
            END FUNCTION convert
        
            SUBROUTINE errorHandling(i, errorCheck)
            IMPLICIT NONE
                INTEGER :: i, errorCheck    
                DO
                    WRITE(*,*) "Please enter an integer between 1 and 99."
                    READ(*,'(i3)',iostat=errorCheck) i

                    IF  (errorCheck == 0) THEN
                        EXIT
                    END IF
                    WRITE(*,*) "An error occured, please try again."
                END DO
            END SUBROUTINE errorHandling

            SUBROUTINE checkCoins(j, k, denom)
            IMPLICIT NONE
                INTEGER :: j, k
                CHARACTER(LEN = 9) :: denom
                IF (j == 0) THEN
                    k = 30
                    denom = "Lunkers"
                ELSE IF (j == 1) THEN
                    k = 15
                    denom = "Loonters"
                ELSE IF (j == 2) THEN
                    k = 5
                    denom = "Littles"
                ELSE IF (j == 3) THEN
                    k = 1
                    denom = "Pooneys"
                ELSE
                    WRITE(*,*) "ERROR"
                END IF
            END SUBROUTINE checkCoins
            
    END PROGRAM makeChangeLoonyAgain

