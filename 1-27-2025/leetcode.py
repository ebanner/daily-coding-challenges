def get_graph(numCourses, prerequisites):
    def get_neighbors(course):
        neighbors = []
        for [a, b] in prerequisites:
            if a != course:
                continue
            neighbor = b
            neighbors.append(neighbor)
        return neighbors

    graph = {}
    for course in range(numCourses):
        neighbors = get_neighbors(course)
        graph[course] = neighbors
    return graph


def compute_prerequisite_pairs(graph, numCourses):
    def init_matrix():
        matrix = [[False]*numCourses for _ in range(numCourses)]
        return matrix

    def dfs(i, j, visited):
        if i == j:
            return True
        for neighbor in graph[i]:
            if neighbor in visited:
                continue
            visited.add(neighbor)
            if dfs(neighbor, j, visited) == True:
                return True
        return False

    prerequisite_matrix = init_matrix()
    for i in range(numCourses):
        for j in range(numCourses):
            if i == j:
                continue
            prerequisite_matrix[i][j] = dfs(i, j, {i})
    return prerequisite_matrix


class Solution:
    def checkIfPrerequisite(self, numCourses: int, prerequisites: List[List[int]], queries: List[List[int]]) -> List[bool]:
        graph = get_graph(numCourses, prerequisites)
        prerequisite_matrix = compute_prerequisite_pairs(graph, numCourses)
        answers = [prerequisite_matrix[a][b] for a, b in queries]
        return answers

