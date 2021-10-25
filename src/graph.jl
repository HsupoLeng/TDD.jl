export get_direct_neighbor

get_direct_neighbor(graph, node) = union(node, graph[node])