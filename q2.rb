
# perfect square not use any built-in library function such as sqrt. 
while(true)
    p = gets.chomp.to_i
    if p != 0
        i = 1        
        while (p > 0)         
            p -= i
            i += 2
        end
        if p == 0
            puts 'True'
        else
            puts 'false'
        end
        break
    else
        puts '請輸入數字'            
    end
end