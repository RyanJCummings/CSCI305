    PROGRAM Test
    IMPLICIT NONE

       INTEGER :: i, j, ans
    i = 30
    j = 30

    IF (mod(i, j) == 0) THEN
        ans = j / 30
    END IF
    WRITE(*,*) ans
    
END PROGRAM Test
