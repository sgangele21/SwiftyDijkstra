public class Graph {
    
    public var nodes:        [Vertex]
    
    public var parent:       [Vertex : Vertex]
    
    public var shortestPath: [Vertex : Weight]
    
    public init(nodes: [Vertex]) {
        self.nodes  = nodes
        self.parent = [:]
        self.shortestPath = [:]
    }
    
}

