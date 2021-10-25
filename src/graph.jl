export get_direct_neighbor, get_reachable_node

get_direct_neighbor(graph, node) = Set(union(node, graph[node]))

function get_reachable_node(graph, node, reached = Set([node]))
    neighbor = get_direct_neighbor(graph, node)
    for n in neighbor
        if !in(n, reached)
            push!(reached, n)
            get_reachable_node(graph, n, reached)
        end
    end
    return reached
end