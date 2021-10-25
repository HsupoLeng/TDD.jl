export get_direct_neighbor, get_reachable_node, get_connected_component

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

function get_connected_component(graph)
    n_node = size(graph)[1]
    component_all = Set()
    not_covered = trues(n_node)
    while any(not_covered)
        component = get_reachable_node(graph, findfirst(not_covered))
        push!(component_all, component)
        not_covered[collect(component)] .= false
    end
    return component_all
end