# Author: Tyson Arnold
# File Name: Makefile
# Last Modified: Feb 17, 2025
# Description: Makefile that complies the program

CC = g++

# Compile with all errors and warnings
CFLAGS = -c -Wall -Wextra  

TARGET = employee

all: $(TARGET)

# Link all object files and create the executable
$(TARGET): main.o Employee.o Officer.o Supervisor.o
	$(CC) -o $(TARGET) main.o Employee.o Officer.o Supervisor.o

# This compiles main.o
main.o: main.cpp
	$(CC) $(CFLAGS) main.cpp

# This compiles Employee.o
Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) Employee.cpp

# This compile Officer.o
Officer.o: Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) Officer.cpp

# This compiles Supervisor.o
Supervisor.o: Supervisor.cpp Supervisor.h Employee.h
	$(CC) $(CFLAGS) Supervisor.cpp

# Cleans up the files
clean:
	rm -f $(TARGET) *.o *~