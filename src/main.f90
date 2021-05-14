program fray
    use math
    use def
    use rgbimage_m
    real :: onex, oney, smallestdist, start, finish
    integer :: xvar, yvar, x, y, sphcheck = 0, sphcount, inter, bounces
    type(sphere) :: sph(1)
    type(camera) :: cam
    type(ray) :: mainray, tempray
    type(point) :: storeage,  tmp1, tmp2
    type(color) :: spherecolor
    integer :: r,g,b
    type(rgbimage) :: image
    tmp1%x = 0
    tmp1%z = 0
    tmp1%y = 0
    tmp2%x = 2
    tmp2%y = 3
    tmp2%z = 6
    print *, "test is : ",distance(tmp1, tmp2)
    cam = mkcam(0.0,0.0,0.0,1.0,0.0,0.0)
    sph = mksphere(10.0, 0.0, 0.0, 2.0, 255, 255, 255)
    print *, "input x:"
    read *, x
    print *, "input y:"
    read *, y
    print *, "enter bounces"
    read *,bounces
    print *, "You inputed ", x , " as x and ", y, " as y and ", bounces, " bounces." 
    onex = 1 / real(x)
    oney = 1 / real(y)
    call image%init(x,y)
    print *, "Now calculating image."
    !$omp parallel do
    do yvar = -y, y
        !$omp parallel do
        do xvar = -x, x
            inter = 0
            sphcheck = 0  
            smallestdist = 19999998
            mainray = mkray(0.0,0.0,0.0,1.0,oney * yvar, onex * xvar)
            do while (sphcheck /= 1)
                do sphcount = 1, 1
                    if (isInsideSphere(mainray%p, sph(sphcount)) == 1) then
                        sphcheck = 1 
                    else
                        sphcheck = 0
                    end if
                    if (distance(sph(sphcount)%p, mainray%p) < smallestdist) then
                        smallestdist = distance(sph(sphcount)%p, mainray%p)
                        spherecolor = sph(sphcount)%color
                    end if
                end do
                if (sphcheck == 1) then
                    exit
                end if
                tempray = calculateRay(mainray, smallestdist)
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
            end do
            if (sphcheck == 1) then
                call colorToRGB(spherecolor, r, g ,b)
                call image%set_pixel(xvar + (x / 2), yvar + (y / 2), [r,g,b])
            else
                call image%set_pixel(xvar + (x / 2), yvar + (y / 2), [0,0,0])
            end if
        end do
        !$omp end parallel do
    end do
    !$omp end parallel do
    print *, "Now writing image."
    call image%write("output.ppm")
end program fray
