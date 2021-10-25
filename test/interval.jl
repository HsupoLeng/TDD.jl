using TDD
using Test

@testset "interval.jl" begin

    # 2.1
    iv = Interval(0, 1)
    @test iv.min == 0
    @test iv.max == 1
    @test minimum(iv) == 0
    @test maximum(iv) == 1

    # 2.2
    @test in(0.5, iv) == true
    @test in(0, iv) == true
    @test in(1, iv) == true
    @test in(0-eps(), iv) == false
    @test in(1+eps(), iv) == false
    @test_broken 0.5 in iv == true
    @test ∈(0.5, iv) == true
    f = in(iv)
    @test f(0.5) == true

    # 2.3
    iv_empty = Interval(0, -1)
    @test isempty(iv_empty)
    
        
end