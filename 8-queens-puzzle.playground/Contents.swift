import Foundation

func eightQueensPuzzle() -> [[String]] {
    
    var boards = [[String]]() // 用來放置所有棋盤解
    var board = [String](repeating: "", count: 8) // 建立空棋盤
    runQueen(&boards, &board, n: 8, row: 0)
    return boards
    
}

private func runQueen(_ boards: inout [[String]], _ board: inout [String], n: Int, row: Int) {
    
    guard row != n else { boards.append(Array(board)); return }
    
    for col in 0 ..< n where isValidQueenPos(board, col, row) {
        board[row] = setQueenPos(col, n)
        runQueen(&boards, &board, n: n, row: row + 1)
    }
}

private func isValidQueenPos(_ board:[String], _ col: Int, _ row: Int) -> Bool {
    var c = -1
    for i in 0 ..< row {
        c = getQueenPos(board[i])
        if c == col || abs(c - col) == abs(i - row) { return false}
    }
    return true
}

private func getQueenPos(_ str: String) -> Int {
    let i = str.firstIndex(of: "Q")!
    return str.distance(from: str.startIndex, to: i)
}

private func setQueenPos(_ col: Int, _ n: Int) -> String {
    var queenPos = ""
    for i in 0 ..< n { queenPos.append(i == col ? "Q" : ".")}
    return queenPos
}

let result = eightQueensPuzzle()
print("Have \(result.count) solution")
print(result[0...5])
