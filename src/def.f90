module def
    type point
        real(8) :: x,y,z
    end type point
    type ray
        type(point) :: p
        type(point) :: v
    end type ray
    type sphere
        type(point) :: p
        real(8) :: r
    end type sphere
    type light
        type(point) :: p
        integer(kind=8) :: rgb(3)
    end type light
    type camera
        type(point) :: p, screen
    end type camera
    contains
        function mkcam(d1, d2, d3, d4, d5, d6) result(r1)
            real, intent(in) :: d1, d2, d3, d4, d5, d6
            type(camera) :: r1
            r1%p%x = d1
            r1%p%y = d2
            r1%p%z = d3
            r1%screen%x = d4
            r1%screen%y = d5
            r1%screen%z = d6
        end function mkcam
        function mkray(d1, d2, d3, d4, d5, d6) result(r1)
            real, intent(in) :: d1, d2, d3, d4, d5, d6
            type(ray) :: r1
            r1%p%x = d1
            r1%p%y = d2
            r1%p%z = d3
            r1%v%x = d4
            r1%v%y = d5
            r1%v%z = d6
        end function mkray
        function mkpoint(d1, d2, d3) result(p1)
            real, intent(in) :: d1, d2, d3
            type(point) :: p1
            p1%x = d1
            p1%y = d2
            p1%z = d3
        end function mkpoint
        function mksphere(d1, d2, d3, r) result(p1)
            real, intent(in) :: d1, d2, d3, r
            type(sphere) :: p1
            p1%p%x = d1
            p1%p%y = d2
            p1%p%z = d3
            p1%r = r
        end function mksphere

end module def
