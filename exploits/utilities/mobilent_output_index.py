def parse_lines_as_8bit_int(filepath):
    max_value = 0  # Initialize the max 8-bit integer value
    max_index = -1  # To store the index of the max value
    index = 0  # Index counter

    with open(filepath, 'r') as f:
        lines = f.readlines()
        values = []  # To hold all values

        # Read and convert all values as 8-bit integers
        for line in lines:
            # Remove extra spaces and split the line into bytes (each as 2 hex digits)
            bytes_in_line = line.split()

            for byte_str in bytes_in_line:
                if index >= 1024:
                    break  # Ensure we only process up to 1024 values

                # Convert the hex string to an 8-bit integer
                byte_value = int(byte_str, 16)
                values.append(byte_value)

                # Update the max value and its index if this value is larger
                if byte_value > max_value:
                    max_value = byte_value
                    max_index = index
                
                index += 1
        
        # Return both the max value and its index
        return max_value, max_index

# Example usage
max_value, max_index = parse_lines_as_8bit_int('output_buffer_dump.txt')
print(f'Max 8-bit integer value: {max_value} at index: {max_index}')
