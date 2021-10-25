using TDD
using Test

@testset "graph.jl" begin

    undirected_graph = [
        [2, 3],     # list of nodes that can be reached from node 1
        [1],        # list of nodes that can be reached from node 2
        [1],        # ", node 3
        [5],        # ", node 4
        [4]]        # ", node 5

    directed_graph = [
        [2, 3, 4],     # list of nodes that can be reached from node 1
        [1],        # list of nodes that can be reached from node 2
        [],        # ", node 3
        [5],        # ", node 4
        [4]]        # ", node 5

    # 1.1
    @test get_direct_neighbor(undirected_graph, 1) == Set([1, 2, 3])
    @test get_direct_neighbor(undirected_graph, 3) == Set([1, 3])
    @test get_direct_neighbor(undirected_graph, 4) == Set([4, 5])

    @test get_direct_neighbor(directed_graph, 1) == Set([1, 2, 3, 4])
    @test get_direct_neighbor(directed_graph, 3) == Set([3])
    @test get_direct_neighbor(directed_graph, 4) == Set([4, 5])

    # 1.2
    @test get_reachable_node(undirected_graph, 1) == Set([1, 2, 3])
    @test get_reachable_node(undirected_graph, 3) == Set([1, 2, 3])
    @test get_reachable_node(undirected_graph, 4) == Set([4, 5])

    @test get_reachable_node(directed_graph, 1) == Set([1, 2, 3, 4, 5])
    @test get_reachable_node(directed_graph, 3) == Set([3])
    @test get_reachable_node(directed_graph, 4) == Set([4, 5])

    # 1.3 
    @test get_connected_component(undirected_graph) == Set([Set([1, 2, 3]), Set([4, 5])])
    @test get_connected_component(directed_graph) == Set([Set([1, 2, 3, 4, 5])])
end