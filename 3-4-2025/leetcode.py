class Solution:
    def checkPowersOfThree(self, n: int) -> bool:
        while True:
            if n == 0:
                break

            if n % 3 != 0 and n % 3 != 1:
                return False

            n //= 3

        return True
