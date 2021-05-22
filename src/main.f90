program fray
    use math
    use def
    use rgbimage_m
    use sphdef
    real :: onex, oney, smallestdist
    integer :: xvar, yvar, x, y, sphcheck = 0, sphcount, inter, bounces, spherenum
    type(sphere) :: sph(2)
    type(camera) :: cam
    type(ray) :: mainray, tempray
    type(point) :: storeage
    type(color) :: spherecolor
    integer :: r,g,b, rgb(3)
    type(rgbimage) :: image
    cam = mkcam(0.0,0.0,0.0,1.0,0.0,0.0)
    spherenum = 2
    call spheredef(sph,spherenum)
    print *, sph
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
    do yvar = -y, y
        do xvar = -x, x
            inter = 0
            sphcheck = 0  
            smallestdist = 19999998
            mainray = mkray(0.0,0.0,0.0,1.0,oney * yvar, onex * xvar)
            do while (sphcheck /= 1)
                do sphcount = 1, spherenum
                    if (distance(sph(sphcount)%p, mainray%p) + 0.1 < smallestdist) then
                        smallestdist = distance(sph(sphcount)%p, mainray%p) + 0.1
                    end if
                    if (isInsideSphere(mainray%p, sph(sphcount)) == 1) then
                        spherecolor = sph(sphcount)%color
                        sphcheck = 1
                    else
                        sphcheck = 0
                    end if
                end do
                if (sphcheck == 1) exit
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
                rgb(1) = r
                rgb(2) = g
                rgb(3) = b
                call image%set_pixel(xvar + (x / 2), yvar + (y / 2), rgb)
            else
                call image%set_pixel(xvar + (x / 2), yvar + (y / 2), [0,0,0])
            end if
        end do
    end do
    print *, "Now writing image."
    call image%write("output.ppm")
end program fray
