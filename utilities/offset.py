import sys

def calculate(base, offset1, offset2):
    result = base + (offset1 - offset2) * 16
    print(f"The result is: {hex(result)}")

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python script.py <base> <offset1> <offset2>")
        sys.exit(1)

    base = int(sys.argv[1], 16)  # Parse the base as a hexadecimal number
    offset1 = int(sys.argv[2])
    offset2 = int(sys.argv[3])

    calculate(base, offset1, offset2)
