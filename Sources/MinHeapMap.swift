public typealias HeapPosition = Int

public class MinHeap {
    
    public var array: [Vertex]
    
    private var map:  [Vertex : HeapPosition]
    
    public var isEmpty: Bool {
        return self.array.isEmpty
    }
    
    public init() {
        self.array = []
        self.map   = [:]
    }
    
    func rightChildIndex(_ index: HeapPosition) -> Int { return (2 * index) + 2 }
    func leftChildIndex(_ index: HeapPosition)  -> Int { return (2 * index) + 1 }
    func parentIndex(_ index:HeapPosition)      -> Int { return (index - 1) / 2 }
    
    func rightChild(index: HeapPosition) -> Vertex { return array[rightChildIndex(index)] }
    func leftChild(index: HeapPosition)  -> Vertex { return array[leftChildIndex(index)]  }
    func parent(index: HeapPosition)     -> Vertex { return array[parentIndex(index)]     }
    func current(index: HeapPosition)    -> Vertex { return array[index]                  }
    
    func hasRightChild(index: HeapPosition) -> Bool { return  rightChildIndex(index) < array.count && rightChildIndex(index) >= 0 }
    func hasLeftChild(index: HeapPosition)  -> Bool { return  leftChildIndex(index)  < array.count && leftChildIndex(index) >= 0}
    func hasParent(index: HeapPosition)     -> Bool { return  parentIndex(index)     < array.count && parentIndex(index) >= 0}
    
    
    public func extractMin() -> Vertex {
        let min = self.array.first!
        let lastIndex = self.array.count - 1
        swap(positionOne: 0, positionTwo: lastIndex)
        
        // Remove from Heap
        self.map.removeValue(forKey: min)
        self.array.removeLast()
        
        heapifyDown(index: 0)
        return min
    }
    
    // Append new element, and heapify up to put in respective position
    public func insert(_ vertex: Vertex) {
        self.array.append(vertex)
        let lastIndex = self.array.count - 1
        self.map[vertex] = lastIndex
        self.heapifyUp(index: lastIndex)
        
    }
    
    // Lower the key value of an element, then heapify up to put in respective position
    public func decrease(_ vertex: Vertex, to value: Int) {
        if !self.array.isEmpty {
            let position = self.map[vertex]!
            self.array[position].data = value
            heapifyUp(index: position)
        }
        
    }
    
    // Given an index value, bubble this key up in the "tree", until it's in the correct place
    func heapifyUp(index: HeapPosition) {
        var currentIndex = index
        while hasParent(index: currentIndex) && (parent(index: currentIndex) > current(index: currentIndex)) {
            let parentIndex = self.parentIndex(currentIndex)
            swap(positionOne: parentIndex, positionTwo: currentIndex)
            // Continue up heap
            currentIndex = parentIndex
        }
    }
    
    // Given an index that possibly might violate the minHeap Rule, swap with a node lower than it
    func heapifyDown(index: HeapPosition) {
        var smallestChildIndex: HeapPosition?
        
        if hasRightChild(index: index) {
            smallestChildIndex = rightChildIndex(index)
        }
        if hasLeftChild(index: index) {
            if smallestChildIndex == nil {
                smallestChildIndex = leftChildIndex(index)
            } else {
                smallestChildIndex = leftChild(index: index) < current(index: smallestChildIndex!) ? leftChildIndex(index) : smallestChildIndex
            }
        }
        if smallestChildIndex != nil {
            swap(positionOne: index, positionTwo: smallestChildIndex!)
            heapifyDown(index: smallestChildIndex!)
        }
        
    }
    
    // Swap two positions in the heap, given their positions, and modify the map respectively
    func swap(positionOne: HeapPosition, positionTwo: HeapPosition) {
        self.editMapPositions(key: current(index: positionOne), newValue: positionTwo)
        self.editMapPositions(key: current(index: positionTwo), newValue: positionOne)
        
        let tempPositionOne = self.current(index: positionOne)
        array[positionOne] = array[positionTwo]
        array[positionTwo] = tempPositionOne
        
    }
    
    func editMapPositions(key: Vertex, newValue: HeapPosition) {
        self.map[key] = newValue
    }
    
    // Make vertex negative infinity, heapify up, and then extract it
    public func removeKey(_ vertex: Vertex) -> Vertex {
        let position = self.map[vertex]!
        self.decrease(current(index: position), to: Int.min)
        return self.extractMin()
    }
    
}

