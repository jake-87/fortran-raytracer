# math.f90, explained:
##So, we have point functions:
* subtractPoint
* addPoint
* scalePoint

These do what it says on the tin.

## Ray functions:
* rayToPoint
* rayVelToPoint
* calculateRay
rayToPoint and rayVelToPoint do what they say on the tin, convert the `p` point and the `v` point repectivly to points. Easy.
calculateRay is a bit harder: Basically, it takes `p` and `v`, and makes `v` exactly `distance` units away from point `p`, while still being on the same axis's of rotation. This can be used to scale a ray to a distance for ray marching. (Yes, this project is actually a ray marcher. I Lied.)
