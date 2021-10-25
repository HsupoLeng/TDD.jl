export Interval, minimum, maximum

struct Interval{T<:Real}
    min :: T
    max :: T
end
Interval(min::T, max::T) where {T<:Real} = Interval{T}(min, max)

Base.minimum(iv::Interval) = iv.min
Base.maximum(iv::Interval) = iv.max

