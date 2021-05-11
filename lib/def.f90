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
end module def
