# SwiftyDijkstra

Simple code showing how dijkstra's algorithms works when coded from scratch. The bulk of the work is in creating the priority queue / min heap.

### Class Structure
* **Graph:** Contains the list of vertices. Is used as a place to put data after Dijkstra's is run through the graph.
* **VertexEdges:** Contiains Vertex class which contains a dictionary of edges whose value is a Vertex, and key is the Weight. It also contains id, and data. Each Vertex is comparable, hashable, & printable.
* **MinHeapMap**: Special type of min heap that includes a map, so you can map vertices to priorities in the heap. Given a vertex, this heap will map the vertex to a position in the heap, where it's priority value resides. This makes for easier coding when dealing with dijkstra's.
* **Dijkstra:** Main Playground where it shows initialization of all the vertices and weights. As well as Dijkstra's Algorithm. It uses the relaxtion principle which says the following:

```swift
d[v] -> Length of current shortest path from source s to v
PI[v] -> Predecessor of v in the shortest path from s to v

u -----2----- v
w = 2

relax(u,v,w)

-------------------------------------------------
if (  d[v] > d[u] + w(u,v)   )
then (   d[v] = d[u] + w(u,v);   PI[v] = u     )
-------------------------------------------------

d[v] -> Length of current shortest path from source to v
PI[v] -> Predecessor of v in the shortest path in s -> v

```

This current code of Dijkstra's is slow however. It runs in `O( E(log(E)) + V(log(V) )` E -> Edges, V -> Vertices
* Decrease Operation is `log(V)`
* Extract-Min Operation is `O(1)` for actually extracting... but maintaining the heap after that takes `log(V)` time 
* You must run through every Edge and Vertex, so that's where the multiplying coefficients come into place

This can be speed up using a different data structure: **Fibonacci Heap**

---

*Developing...*
