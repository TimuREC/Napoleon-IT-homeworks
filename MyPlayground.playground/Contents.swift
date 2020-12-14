struct Queue<Element>: ExpressibleByArrayLiteral {
    private var elements: [Element]
    
    init(arrayLiteral elements: Element...) {
        self.elements = elements
    }
    
    mutating func pushFront(_ element: Element) {
        elements.insert(element, at: 0)
    }
    
    @discardableResult
    mutating func popBack() -> Element {
        elements.removeLast()
    }
    
    func back() -> Element {
        return elements.last!
    }
    
    func front() -> Element {
        return elements.first!
    }
    
}

var queue: Queue<String> = ["a", "b", "c", "d"]
queue.pushFront("e")
queue.pushFront("f")

queue.popBack()

print(queue)
print("Первый элемент очереди: \(queue.front())")
print("Последний элемент очереди: \(queue.back())")
print("Удаляем последний элемент очереди: \(queue.popBack())")
print(queue)
