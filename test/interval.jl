using TDD
using Test

@testset "interval.jl" begin

    # 2.1
    iv = Interval(0, 1.0)
    @test iv.min == 0
    @test iv.max == 1
    @test typeof(iv.min) === typeof(1.0)
    @test minimum(iv) == 0
    @test maximum(iv) == 1

    # 2.2
    @test in(0.5, iv) == true
    @test in(0, iv) == true
    @test in(1, iv) == true
    @test in(0-eps(), iv) == false
    @test in(1+eps(), iv) == false
    @test (0.5 in iv) == true
    @test ∈(0.5, iv) == true
    f = in(iv)
    @test f(0.5) == true

    # 2.3
    iv_empty = Interval(0, -1)
    @test isempty(iv_empty)
    
    # 2.4
    iv_subset = Interval(0, 0.5)
    iv_not_subset = Interval(0.1, Inf)
    @test issubset(iv_subset, iv) == true
    @test issubset(iv_not_subset, iv) == false
    @test issubset(iv, iv) == true
    @test issubset(iv_empty, iv) == true
    @test ⊆(iv_subset, iv) == true
    @test ⊈(iv_not_subset, iv) == true
    @test issubset([0 1], iv) == true

    # 2.5
    iv_intersect = Interval(0.5, 1.5)
    iv_no_intersect = Interval(2, Inf)
    @test intersect(iv_intersect, iv) == Interval(0.5, 1)
    @test intersect(iv_subset, iv) == iv_subset
    @test intersect(iv_not_subset, iv) == Interval(0.1, 1)
    @test isempty(intersect(iv_no_intersect, iv)) == true
    @test isempty(intersect(iv_empty, iv)) == true
    @test ∩(iv_not_subset, iv) == Interval(0.1, 1)
end