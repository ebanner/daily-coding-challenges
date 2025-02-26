def get_neighbors(node, tree):
    neighbors = tree.get(node, []) # for leaf nodes
    return neighbors


def get_amount(node, bob_amounts, ts, amounts):
    if node not in bob_amounts:
        amount = amounts[node]
    else:
        bob_ts = bob_amounts[node]
        if ts == bob_ts:
            amount = amounts[node] // 2
        elif ts > bob_ts:
            amount = 0
        elif ts < bob_ts:
            amount = amounts[node]
    return amount


def get_tree(edges):
    tree = {}
    for u, v in edges:
        if u not in tree:
            tree[u] = []
        tree[u].append(v)
    return tree


def get_parents(edges):
    parents = {}
    for u, v in edges:
        parents[v] = u
    return parents


def get_bob_amounts(edges, bob):
    parents = get_parents(edges)
    ts = 0
    node = bob
    bob_amounts = {}
    while True:
        if node == None:
            break

        bob_amounts[node] = ts
        node = parents.get(node, None) # for node 0
        ts += 1

    return bob_amounts


def sort_edges(edges):
    edges = set((u, v) for u, v in edges)

    UV = {}
    for u, v in edges:
        if u not in UV:
            UV[u] = set()
        UV[u].add(v)
    
    VU = {}
    for u, v in edges:
        if v not in VU:
            VU[v] = set()
        VU[v].add(u)

    frontier = [0]
    sorted_edges = []
    while True:
        if not (UV and VU):
            break

        new_frontier = []
        for node in frontier:
            for child in UV.get(node, []):
                edge = [node, child]
                sorted_edges.append(edge)
                new_frontier.append(child)
                VU[child].remove(node)
                if not VU[child]:
                    del VU[child]

            if node in UV:
                del UV[node]

            for child in VU.get(node, []):
                edge = [node, child]
                sorted_edges.append(edge)
                new_frontier.append(child)
                UV[child].remove(node)
                if not UV[child]:
                    del UV[child]

            if node in VU:
                del VU[node]

        frontier = new_frontier

    return sorted_edges


class Solution:
    def mostProfitablePath(self, edges: List[List[int]], bob: int, amount: List[int]) -> int:
        amounts = amount
        sorted_edges = sort_edges(edges)
        tree = get_tree(sorted_edges)
        bob_amounts = get_bob_amounts(sorted_edges, bob)

        def dfs(node, ts):
            max_amount = -float('inf')
            for neighbor in get_neighbors(node, tree):
                amount = dfs(neighbor, ts+1)
                if amount > max_amount:
                    max_amount = amount

            max_amount = 0 if max_amount == -float('inf') else max_amount # leaf node

            node_amount = get_amount(node, bob_amounts, ts, amounts)
            path_amount = node_amount + max_amount

            return path_amount

        max_amount = dfs(node=0, ts=0)

        return max_amount
        

