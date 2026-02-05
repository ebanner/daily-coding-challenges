def init(nums, k):
    num = nums[0]
    nums[0] = True
    for i in range(1, k):
        if num+1 == nums[i]:
            num = nums[i]
            nums[i] = True
        else:
            nums[:i] = [False]*i
            num = nums[i]
            nums[i] = True
        
    valid = sum(bool == True for bool in nums[:k])
    invalid = sum(bool == False for bool in nums[:k])

    if valid == k:
        result = [num]
    else:
        result = [-1]

    return valid, invalid, nums, result, num


class Solution:
    def resultsArray(self, nums: List[int], k: int) -> List[int]:
        n = len(nums)
        valid, invalid, nums, result, num = init(nums, k)
        for i in range(1, n-k+1):
            if nums[i-1] == False:
                invalid -= 1
            else:
                assert nums[i-1] == True
                valid -= 1
            
            if num+1 == nums[i+k-1]:
                num = nums[i+k-1]
                nums[i+k-1] = True
                valid += 1
            else:
                nums[i:i+k-1] = [False]*(k-1)
                num = nums[i+k-1]
                nums[i+k-1] = True
                invalid = k-1
                valid = 1
            
            if valid == k:
                result.append(num)
            else:
                result.append(-1)

        return result

