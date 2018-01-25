# SwiftyDijkstra

Simple code showing how dijkstra's algorithms works when coded from scratch. The bulk of the work is in creating priority queue / min heap.

This current code of Dijkstra's is slow however. It runs in `O( E(log(E)) + V(log(V) )` E -> Edges, V -> Vertices
* Decrease Operation is `log(V)`
* Extract-Min Operation is `O(1)` for actually extracting... but maintaining the heap after that takes `log(V)` time 
* You must run through every Edge and Vertex, so that's where the multiplying coefficients come into place

This can be speed up using a different data structure: **Fibonacci Heap**

---

*Developing...*
