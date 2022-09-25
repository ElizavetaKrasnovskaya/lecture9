extension Int {
    
    static func getRandomSize(maxValue: Int) -> Int {
        .random(in: 1...maxValue)
    }
    
    static func getRandomCoordinates(startX: Int, endX: Int, startY: Int, endY: Int) -> (Int, Int) {
        (.random(in: startY...endY), .random(in: startX...endX))
    }
}
