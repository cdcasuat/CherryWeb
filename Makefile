# Makefile for MyProject

# Variables
CC = gcc
CFLAGS = -Wall -Wextra -std=c11
SRC_DIR = src
BUILD_DIR = build
BIN_DIR = bin

# Source files
SRCS = $(wildcard $(SRC_DIR)/*.c)

# Object files
OBJS = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

# Executable
EXEC = $(BIN_DIR)/myapp

# Default target
all: $(EXEC)

# Compile source files into object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
    $(CC) $(CFLAGS) -c $< -o $@

# Link object files into executable
$(EXEC): $(OBJS)
    $(CC) $(OBJS) -o $(EXEC)

# Clean build files
clean:
    rm -rf $(BUILD_DIR)/* $(BIN_DIR)/*

# Run the application
run:
    $(EXEC)
