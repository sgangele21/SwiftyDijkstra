public typealias Weight = Int
public typealias Edge = [Vertex : Weight]

public class Vertex {
    
    public var id: String
    
    public var data: Int
    
    public var edges: Edge
    
    public init(id: String, data: Int, edges: Edge) {
        self.id    = id
        self.data  = data
        self.edges = edges
    }
    
    public convenience init(id: String) {
        self.init(id: id, data: Int.max, edges: [:])
    }
    
    public func addEdge(_ vertex: Vertex, _ weight: Weight) {
        self.edges[vertex] = weight
    }
    
}

// Gives ability for Vertex Class to be hashed
extension Vertex: Hashable {
    
    public var hashValue: Int {
        return self.id.hashValue
    }
    
    public static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data && lhs.id == rhs.id
    }
    
}

// Gives ability for Vertext Class to be compared
extension Vertex: Comparable {
    
    public static func <(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data < rhs.data
    }
    
}

// Gives custom print display for Vertext Class
extension Vertex: CustomStringConvertible {
    
    public var description: String {
        return self.id
    }
    
}

