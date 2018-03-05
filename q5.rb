#整數相加不使用 + 號 - 號
def sum(a,b)
    if 0 == b        
        return a
    end
    return sum(a^b,(a&b)<<1)
end

while(true)
a = gets.chomp.to_i
b = gets.chomp.to_i
    if a != 0 && b != 0
        puts sum(a,b)
        break 
    else
        puts "請輸入數字!"
    end
end
