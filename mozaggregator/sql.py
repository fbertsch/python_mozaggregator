def get_query():
    with open("functions.pgsql", "r") as f:
        return "".join(f.readlines())

query = get_query()
