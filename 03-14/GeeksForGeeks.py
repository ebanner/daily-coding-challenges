def minCoins(coins, sum, memo):
    if sum in memo:
        return memo[sum]

    if sum < 0:
        return float('inf')
    elif sum == 0:
        return 0

    min_num_coins = float('inf')
	for coin in coins:
	    num_coins = minCoins(coins, sum-coin, memo)
	    min_num_coins = min(num_coins, min_num_coins)

	if min_num_coins == float('inf'):
	    memo[sum] = float('inf')
	else:
        memo[sum] = 1 + min_num_coins

    return memo[sum]

class Solution:
	def minCoins(self, coins, sum):
	    min_coins = minCoins(coins, sum, {})
	    if min_coins == float('inf'):
	        return -1
	    else:
	        return min_coins

