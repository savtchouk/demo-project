def main():
    with open("/test/test.txt", "a") as f:
        f.write("Hello from Docker!\n")

if __name__ == "__main__":
    main()
