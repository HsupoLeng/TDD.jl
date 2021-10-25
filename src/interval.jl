export Interval, minimum, maximum, in, isempty

mutable struct Interval{T<:Real}
    min :: Real
    max :: Real
end
Interval(min::T, max::T) where {T<:Real} = Interval{T}(min, max)

Base.minimum(iv::Interval) = iv.min
Base.maximum(iv::Interval) = iv.max

Base.in(item::Real, iv::Interval) = item >= iv.min && item <= iv.max
Base.in(iv::Interval) = y::Real -> in(y, iv)


