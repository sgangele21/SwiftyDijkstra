func dijkstra(_ graph: Graph, weight: (Vertex,Vertex) -> Weight, source: Vertex) {
    
    let queue = MinHeap()
    initialize(graph: graph, queue: queue, with: graph.nodes, source: source)
    while !queue.isEmpty {
        
        let min = queue.extractMin()
        graph.shortestPath[min] = min.data
        
        for edge in min.edges {
            let edgeVertex = edge.key
            let edgeWeight = edge.value
            relax(graph, queue: queue, u: min, v: edgeVertex, weight: edgeWeight)
        }
    }
    
}

func relax(_ graph: Graph, queue: MinHeap, u: Vertex, v: Vertex, weight: Weight) {
    let relaxedValue = u.data + weight
    
    if relaxedValue < v.data {
        
        graph.parent[v] = u
        queue.decrease(v, to: relaxedValue)
    }
}

func initialize(graph: Graph, queue: MinHeap, with vertices: [Vertex], source: Vertex) {
    for vertex in vertices {
        queue.insert(vertex)
        graph.shortestPath[vertex] = vertex.data
    }
    queue.decrease(source, to: 0)
}

// ------------------------------------------------

var a = Vertex(id: "a")
var b = Vertex(id: "b")
var c = Vertex(id: "c")
var d = Vertex(id: "d")
var e = Vertex(id: "e")

a.addEdge(b, 10)
a.addEdge(c, 3)

b.addEdge(c, 1)
b.addEdge(d, 2)

c.addEdge(b, 4)
c.addEdge(e, 2)
c.addEdge(d, 8)

d.addEdge(e, 7)

e.addEdge(d, 9)

let graph = Graph(nodes: [a,b,c,d,e])

func weight(u: Vertex, v: Vertex) -> Weight {
    return u.edges[v]!
}

dijkstra(graph, weight: weight(u:v:), source: a)
print(graph.shortestPath)
