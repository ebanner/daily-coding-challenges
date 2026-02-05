def dedupe_beauties(items):
    deduped_beauties = {}
    for [price, beauty] in items:
        if price not in deduped_beauties:
            deduped_beauties[price] = -1
        deduped_beauties[price] = max(deduped_beauties[price], beauty)
    deduped_beauties[0] = 0
    return deduped_beauties


def get_price_to_max_beauty(beauties):
    price_to_max_beauty = {}
    max_beauty = 0
    for price in sorted(beauties.keys()):
        if beauties[price] > max_beauty:
            max_beauty = beauties[price]
        price_to_max_beauty[price] = max_beauty
    return price_to_max_beauty
        

def get_sorted_prices(items):
    prices = list(sorted(set(price for [price, _] in items)))
    return prices


def binary_search(prices, price):
    lo, hi = 0, len(prices)-1
    while lo <= hi:
        mid = (lo+hi) // 2
        if prices[mid] == price:
            return price
        elif prices[mid] < price:
            lo = mid + 1
        else:
            assert price < prices[mid]
            hi = mid - 1
    if lo-1 == -1:
        return 0
    return prices[lo-1]


class Solution:
    def maximumBeauty(self, items: List[List[int]], queries: List[int]) -> List[int]:
        deduped_beauties = dedupe_beauties(items)
        price_to_max_beauty = get_price_to_max_beauty(deduped_beauties)
        sorted_prices = get_sorted_prices(items)

        max_beauties = []
        for price in queries:
            closest_price = binary_search(sorted_prices, price)
            max_beauty = price_to_max_beauty[closest_price]
            max_beauties.append(max_beauty)
        
        return max_beauties

