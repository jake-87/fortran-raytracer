module math
    use def
    contains
        function subtractPoint(p1, p2) result(p3)
            type(point), intent(in) :: p1, p2
            type(point):: p3
            p3%x = p1%x - p2%x
            p3%y = p1%y - p2%y
            p3%z = p1%z - p2%z
        end function subtractPoint
        function addPoint(p1, p2) result(p3)
            type(point), intent(in) :: p1, p2
            type(point) :: p3
            p3%x = p1%x + p2%x
            p3%y = p1%y + p2%y
            p3%z = p1%z + p2%z
        end function addPoint
        function scalePoint(p1, d) result(p2)
            type(point), intent(in) :: p1
            real, intent(in) :: d
            type(point) :: p2
            p2%x = p1%x * d
            p2%y = p1%y * d
            p2%z = p1%z * d
        end function scalePoint
        function rayToPoint(r1) result(p1)
            type(ray), intent(in) :: r1
            type(point) :: p1
            p1%x = r1%p%x
            p1%y = r1%p%y
            p1%z = r1%p%z
        end function rayToPoint
        function rayVelToPoint(r1) result(p1)
            type(ray), intent(in) :: r1
            type(point) :: p1
            p1%x = r1%v%x
            p1%y = r1%v%y
            p1%z = r1%v%z
        end function rayVelToPoint
        function magnitune(p1) result(d)
            type(point), intent(in) :: p1
            real :: d
            d = real(sqrt(p1%x ** 2 + p1%y ** 2 + p1%z ** 2))
        end function magnitune
        function calculateRay(r1, distance) result(r3)
            type(ray), intent(in) :: r1
            real :: distance, vmag, t
            type(ray) :: r3
            type(point) :: r1p2, v, L, r1p1
            r1p1 = rayToPoint(r1) 
            r1p2 = rayVelToPoint(r1)
            v = subtractPoint(r1p2,r1p1)
            vmag = magnitune(v)
            t = distance / vmag
            L = addPoint(r1p1, scalePoint(v, t))
            r3%p%x = r1%p%x
            r3%p%z = r1%p%z
            r3%p%y = r1%p%y
            r3%v%x = L%x
            r3%v%y = L%y
            r3%v%z = L%z
        end function calculateRay
        function distance(p1, p2) result(d1)
            type(point), intent(in) :: p1, p2
            real :: d1
            d1 = real(sqrt((p1%x - p2%x) ** 2 + (p1%y - p2%y) ** 2 + (p1%z - p2%z) ** 2))
        end function distance
        function isInsideSphere(p1, sph) result (bool)
            type(point), intent(in) :: p1
            type(sphere), intent(in) :: sph
            integer :: bool
            !print *,"dist is", distance(p1,sph%p)
            !print *,"rad is ", sph%r
            if (distance(p1, sph%p) < sph%r) then
                bool = 1
            else
                bool = 0
            end if
        end function isInsideSphere
end module math
