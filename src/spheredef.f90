module sphdef
    use def
    implicit none
    contains
        subroutine spheredef(spheres, spherenum)
            integer, intent(in) :: spherenum
            type(sphere), intent(out) :: spheres(spherenum)
            spheres(1) = mksphere(5.0,0.0,0.0,5.0,255,0,0)
            spheres(2) = mksphere(15.0,0.0,0.0,2.0,0,255,255)
        end subroutine spheredef
end module sphdef
