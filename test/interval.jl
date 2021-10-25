using TDD
using Test

@testset "interval.jl" begin

    # 2.1
    iv = Interval(0, 1)
    @test iv.min == 0
    @test iv.max == 1
    @test minimum(iv) == 0
    @test maximum(iv) == 1
end