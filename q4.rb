def min(a,b)    
    return a < b ? a : b
end

def max( a, b)
    return a < b ? b : a
end

def bOverlapped(a,b)        
    return !(a[1] < b[0] || a[0] > b[1])
end

def insert2(intervals, newInterval)
    l = Array.new
    inser = true; #judge where to insert the newInterval;
    i = 0
    for value in i..intervals.size do     
           
        if  (intervals[i][0] <= newInterval[0] && intervals[i][1] >= newInterval[0])||
            (newInterval[0] <= intervals[i][0] && newInterval[1] >= intervals[i][0]) 

            newInterval[0] = min(intervals[i][0] , newInterval[0])
            newInterval[1] = max(intervals[i][1] , newInterval[1])
            intervals.delete(i)
            i -= 1
            next
        end

        if newInterval[0] < intervals[i][0] && inser == true
            l << newInterval
            l << intervals[i]
            inser = false;
        else
            l << intervals[i]
        end
        i += 1
    end
    l << newInterval if inser == true
    return l
end


# intervals = [[1,3],[6,9]]
# newInterval = [2,5]
#puts insert2(intervals,newInterval) => [1,5],[6,9]
intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]]
newInterval = [4,9]

puts insert2(intervals,newInterval)