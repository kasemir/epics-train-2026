import random

def getRandom(limit):
    # random() returns value in range [0,1]
    return random.random() * limit


if __name__ == "__main__":
    print("Random Number: %.1f" % getRandom(10))
