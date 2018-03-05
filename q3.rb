board = [["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]]

def dfs(board,word,i,j,idx)    
    
    return false if i < 0 || i > board.length - 1 || j < 0 || j > board[i].length - 1
    
    ch = board[i][j]
    board[i][j] = '#'

    if ch != word[idx]
        board[i][j] = ch
        return false
    end
    if ch == word[idx] && idx == word.length()-1
        board[i][j] = ch
        return true    
    end
    flag =  dfs(board, word, i-1,j,idx+1) ||
            dfs(board, word, i+1,j,idx+1) ||
            dfs(board, word, i,j-1,idx+1) ||
            dfs(board, word, i, j+1, idx+1) 
    board[i][j] = ch

    return flag
end

def exits(board,word)
    i = 0    
    flag = false
    for counter in i...board.length        
        for counter2 in counter...board[i].length
            flag = flag || dfs(board, word, counter, counter2, 0)            
        end
        i += 1
    end

    return flag
end

word = "ABCCED"#, -> returns true,
puts exits(board,word)
word = "SEE"#, -> returns true,
puts exits(board,word)
word = "ABCB"#, -> returns false.
puts exits(board,word)