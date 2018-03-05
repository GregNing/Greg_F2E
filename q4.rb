def min(a,b)    
    return a < b ? a : b
end

def max( a, b)
    return a < b ? b : a
end

def bOverlapped(a,b)        
    return !(a[1] < b[0] || a[0] > b[1])
end

def insert(intervals, newInterval)
    l = Array.new
    inser = true; #judge where to insert the newInterval;
    i = 0
    for value in i..intervals.length - 1
           
        if  (intervals[value][0] <= newInterval[0] && intervals[value][1] >= newInterval[0])||
            (newInterval[0] <= intervals[value][0] && newInterval[1] >= intervals[value][0]) 

            newInterval[0] = min(intervals[value][0] , newInterval[0])
            newInterval[1] = max(intervals[value][1] , newInterval[1])
            
            intervals.delete(value)            
            value -= 1            
            next
        end

        if newInterval[0] < intervals[value][0] && inser == true
            l << newInterval
            l << intervals[value]
            inser = false
        else
            l << intervals[value]
        end
    end
    l << newInterval if inser == true
    return l
end

intervals = [[1,3],[6,9]]
newInterval = [2,5]
puts insert(intervals,newInterval)# => [1,5],[6,9]

puts "========================="

intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]]
newInterval = [4,9]
puts insert(intervals,newInterval) # => [1,2],[3,10],[12,16]