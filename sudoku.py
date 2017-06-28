class Board:
    def __init__(this, str_array):
        this.num_map = {}
        for i in range(9):
            for j in range(9):
                this.num_map[(i, j)] = int(str_array[i][j])

    def __str__(this):
        c = "*"
        tbr = c * 13 + "\n"
        for i in range(9):
            for j in range(9):
                if j%3 == 0: tbr += c
                if this.num_map[(i, j)] == 0:
                    tbr += ' '
                else:
                    tbr += str(this.num_map[(i, j)])

            tbr += c+"\n"
            if i%3 == 2: tbr += c * 13 + "\n"
        return tbr

    def solve(this): #return Board
        possibilies = all_possibilies()
        pos = min(possibilies.keys, lambda x: len(possibilies[x]), reverse=True)

        for val in possibilies[pos]:
            new_map = this.num_map.copy
            new_map[pos] = pos
            new_board = Board(new_map).solve_rec()
            if(new_board != None):
                return new_board
        return None

    @staticmethod
    def all_possibilies(this):
        empties = {}
        for i in range(9):
            for j in range(9):
                if (this.num_map[(i, j)] == 0):
                    empties[(i, j)] = possibilies((i, j))
        return empties

    @staticmethod
    def possibilies(pos): #return [Int]
        return set(range(1, 10))  - set(row(pos[0]) + col(pos[1]))

        def row(i): return [this.num_map[(i, j)] for j in range(9)]
        def col(j): return [this.num_map[(i, j)] for i in range(9)]

board = Board(
    ["003020600",
     "900305001",
     "001806400",
     "008102900",
     "700000008",
     "006708200",
     "002609500",
     "800203009",
     "005010300"])
print board.solve()

















#
