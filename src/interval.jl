export Interval, minimum, maximum, in, isempty, issubset

struct Interval{T<:Real}
    min :: T
    max :: T
end
Interval(min::Real, max::Real) = Interval(promote(min, max)...)

Base.minimum(iv::Interval) = iv.min
Base.maximum(iv::Interval) = iv.max

Base.in(item::Real, iv::Interval) = item >= iv.min && item <= iv.max 
Base.in(iv::Interval) = y::Real -> in(y, iv)

Base.isempty(iv::Interval) = iv.min > iv.max

Base.issubset(a::Array{<:Real}, b::Interval) = all(in(b), a)
Base.issubset(a::Interval, b::Interval) = isempty(a) ? true : ((a.min in b) && (a.max in b))

