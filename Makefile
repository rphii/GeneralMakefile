#### Start of system configuration section. ####

VERSION := 1.00
CC      := gcc -O
CFLAGS  := -Wall -c
LDFLAGS := -g
RM      := rm

# cleaning settings
RM = rm		# unix cleaning
DEL = del	# windows cleaning

#### End of system configuration section. ####


# TARGET
TARGET     = a

# Path for .c , .h and .o Files 
SRC_DIR = src
OBJ_DIR = obj

.PHONY: all clean


# Files to compile
C_FILES := $(wildcard $(SRC_DIR)/*.c)
O_FILES := $(addprefix $(OBJ_DIR)/,$(notdir $(C_FILES:.c=.o)))

#link all .o files
$(TARGET): $(O_FILES)
	@echo link    : $<
	@$(CC) $(LDFLAGS) -o $@ $^

#compile all .c Files 
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir $(@D)
	@echo compile : $<
	@$(CC) $(CFLAGS) -o $@ $<


#### CLEANING ####

ifeq ($(OS),Windows_NT)
# Cleaning rules for Windows OS
clean:
	@$(DEL) /q $(OBJ_DIR)\*.o $(TARGET).exe 2>NUL
else
# Cleaning rules for Unix-based OS
clean:
	@$(RM) $(OBJ_DIR)/*.o $(TARGET)
endif

