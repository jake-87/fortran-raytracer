program fray
    use math
    use def
    real :: onex, oney, smallestdist
    integer :: xvar, yvar, x, y, sphcheck = 0, sphcount, inter, bounces
    type(sphere) :: sph(1)
    type(camera) :: cam
    type(ray) :: mainray, tempray
    type(point) :: storeage,  tmp1, tmp2
    tmp1%x = 0
    tmp1%z = 0
    tmp1%y = 0
    tmp2%x = 2
    tmp2%y = 3
    tmp2%z = 6
    print *, "test is : ",distance(tmp1, tmp2)
    cam = mkcam(0.0,0.0,0.0,1.0,0.0,0.0)
    sph = mksphere(10.0, 0.0, 0.0, 2.0)
    print *, "input x:"
    read *, x
    print *, "input y:"
    read *, y
    print *, "enter bounces"
    read *,bounces
    print *, "You inputed ", x , " as x and ", y, " as y and ", bounces, " bounces." 
    onex = 1 / real(x)
    oney = 1 / real(y)
    do yvar = -y, y
        do xvar = -x, x
            inter = 0
            sphcheck = 0  
            smallestdist = 19999998
            mainray = mkray(0.0,0.0,0.0,1.0,oney * yvar, onex * xvar)
            !print *, mainray
            do while (sphcheck /= 1)
                do sphcount = 1, 1
                    !print *, "sphcount is ", sphcount
                    if (isInsideSphere(mainray%p, sph(sphcount)) == 1) then
                        sphcheck = 1 
                    else
                        sphcheck = 0
                    end if
                    if (distance(sph(sphcount)%p, mainray%p) < smallestdist) then
                        smallestdist = distance(sph(sphcount)%p, mainray%p)
                    end if
                end do
                if (sphcheck == 1) then
                    exit
                end if
                !print *,"smol is", smallestdist
                tempray = calculateRay(mainray, smallestdist)
                !print *, "tmpray is ", tempray
                storeage%x = mainray%v%x
                storeage%y = mainray%v%y
                storeage%z = mainray%v%z
                mainray%v%x = tempray%v%x
                mainray%v%y = tempray%v%y
                mainray%v%z = tempray%v%z
                mainray%p%x = storeage%x
                mainray%p%y = storeage%y
                mainray%p%z = storeage%z
                inter = inter + 1
                if (inter > bounces) then
                    exit
                end if
                !print *, "inter : ", inter
            end do
            if (sphcheck == 1) then
                write(*,"(A)",advance="no") "11"
            else
                write(*,"(A)",advance="no") "00"
            end if
        end do
        print *, ""
    end do
end program fray
