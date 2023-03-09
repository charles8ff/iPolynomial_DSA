
#The Target Binary Program
TARGET      := main.exe

#The directories for objects, sources and binaries
INCDIR		:= def
BUILDDIR    := obj
TARGETDIR   := bin
SOURCEDIR	:= src
SRCEXT      := cpp
OBJEXT      := o

#Flags, Libraries and Includes
CFLAGS      := -Wall -O3 -g -Werror -Wextra -pedantic -std=c++17
LIB         := -lm
INC         := -I$(INCDIR)

# ----------- Installation path of C++ compiler ----------------------------------
MSYSDIR		:= 'C:\msys64\usr\bin'
#---------------------------------------------------------------------------------
#DO NOT EDIT BELOW THIS LINE
#---------------------------------------------------------------------------------
#Compiler and Linker
SHELL 		:= $(MSYSDIR)\bash.exe
CC          := g++
SOURCES     := $(shell find . -type f -name "*.$(SRCEXT)")
OBJECTS     := $(patsubst ./$(SOURCEDIR)/%,./$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.$(OBJEXT)))

#Defauilt Make
all:  directories $(TARGET)

#Remake
remake: cleaner all

#Make the Directories
directories:
	@mkdir -p $(TARGETDIR)
	@mkdir -p $(BUILDDIR)
	@mkdir -p $(SOURCEDIR)

#Clean only Objecs
clean:
	@$(RM) -rf $(BUILDDIR)
	@$(RM) -f *.o

#Full Clean, Objects and Binaries
cleaner: clean
	@$(RM) -rf $(TARGETDIR)

#Link
$(TARGET): $(OBJECTS)
	$(CC) -o $(TARGETDIR)/$(TARGET) $^ $(LIB)

#Compile
$(BUILDDIR)/%.$(OBJEXT): $(SOURCEDIR)/%.$(SRCEXT)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INC) -c -o $@ $<

listObjs: $(OBJECTS)
	@echo "SOURCES  = "$(SOURCES)
	@echo "OBJECTS  = "$(OBJECTS)
	@ls -l $(BUILDDIR)

launch: $(TARGET)
	@echo ">>> Executing: $(TARGET)"
	@echo
	@bin/$(TARGET)

#Non-File Targets
.PHONY: all remake clean cleaner
