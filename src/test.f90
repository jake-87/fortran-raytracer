program test1
    use math
    implicit none
    type(ray) :: r1, r2
    real(8) :: d
    d = 7
    r1%p%x = 0
    r1%p%y = 0
    r1%p%z = 0
    r1%v%z = 1
    r1%v%y = 1.5
    r1%v%x = 3
    print *, "r1 is", r1
    print *, "d is", d
    r2 = calculateRay(r1, d)
    print *, "r1 is ", r2
end program test1
