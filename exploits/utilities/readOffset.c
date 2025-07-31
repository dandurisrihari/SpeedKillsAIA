#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <string.h>
#include <errno.h>

#define DEVICE_NAME "/dev/mem_rw"
#define IOCTL_SET_ADDRESS _IOW('a', 'a', unsigned long)
#define IOCTL_SET_SIZE _IOW('a', 'b', size_t)
#define IOCTL_SET_WRITE_MODE _IOW('a', 'c', int)

void read_memory(int fd, unsigned long address, size_t size) {
    if (ioctl(fd, IOCTL_SET_ADDRESS, &address) == -1) {
        perror("ioctl: set address");
        return;
    }
    
    if (ioctl(fd, IOCTL_SET_SIZE, &size) == -1) {
        perror("ioctl: set size");
        return;
    }
    
    char *buffer = malloc(size);
    if (!buffer) {
        perror("malloc");
        return;
    }

    ssize_t ret = read(fd, buffer, size);
    if (ret < 0) {
        perror("read");
        free(buffer);
        return;
    }

    printf("Read %zu bytes from address 0x%lx:\n", size, address);
    for (size_t i = 0; i < size; i++) {
        printf("%02x ", buffer[i] & 0xFF);
        if ((i + 1) % 16 == 0) {
            printf("\n");
        }
    }
    printf("\n");

    free(buffer);
}

void write_memory(int fd, unsigned long address, int write_size, unsigned long long data) {
    if (ioctl(fd, IOCTL_SET_ADDRESS, &address) == -1) {
        perror("ioctl: set address");
        return;
    }

    if (ioctl(fd, IOCTL_SET_WRITE_MODE, &write_size) == -1) {
        perror("ioctl: set write mode");
        return;
    }

    ssize_t ret = write(fd, &data, write_size);
    if (ret < 0) {
        perror("write");
        return;
    }

    printf("Wrote %d bytes to address 0x%lx\n", write_size, address);
}

int main(int argc, char *argv[]) {
    if (argc < 4) {
        fprintf(stderr, "Usage: %s <operation> <address> <size> [<data>]\n", argv[0]);
        fprintf(stderr, "Operations:\n");
        fprintf(stderr, "  read  - Read memory\n");
        fprintf(stderr, "  write - Write memory (1, 4, or 8 bytes)\n");
        return 1;
    }

    const char *operation = argv[1];
    unsigned long address = strtoul(argv[2], NULL, 0);
    size_t size = strtoul(argv[3], NULL, 0);

    int fd = open(DEVICE_NAME, O_RDWR);
    if (fd < 0) {
        perror("Failed to open the device");
        return errno;
    }

    if (strcmp(operation, "read") == 0) {
        if (argc != 4) {
            fprintf(stderr, "Incorrect arguments for read operation\n");
            close(fd);
            return 1;
        }
        read_memory(fd, address, size);
    } else if (strcmp(operation, "write") == 0) {
        if (argc != 5) {
            fprintf(stderr, "Incorrect arguments for write operation\n");
            close(fd);
            return 1;
        }

        if (size != 1 && size != 4 && size != 8) {
            fprintf(stderr, "Write size must be 1, 4, or 8 bytes.\n");
            close(fd);
            return 1;
        }

        unsigned long long data = strtoull(argv[4], NULL, 0);  // Convert hex string to a number
        write_memory(fd, address, size, data);
    } else {
        fprintf(stderr, "Invalid operation: %s\n", operation);
    }

    close(fd);
    return 0;
}
