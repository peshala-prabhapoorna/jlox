SRC_DIR := src
BUILD_DIR := build

LOX_SRCS := $(wildcard $(SRC_DIR)/lox/*.java)
LOX_CLS := $(LOX_SRCS:$(SRC_DIR)/lox/%.java=$(BUILD_DIR)/%.class)

TOOL_SRCS := $(wildcard $(SRC_DIR)/tool/*.java)
TOOL_CLS := $(TOOL_SRCS:$(SRC_DIR)/tool/%.java=$(BUILD_DIR)/%.class)

.PHONY: default

default: $(LOX_CLS)

$(BUILD_DIR)/%.class: $(SRC_DIR)/lox/%.java $(TOOL_CLS)
	@ mkdir -p $(BUILD_DIR)
	@ javac -cp $(SRC_DIR) -d $(BUILD_DIR) $(JAVA_OPTIONS) -implicit:none $<
	@ printf "%8s %-60s %s\n" javac $< "$(JAVA_OPTIONS)"

$(BUILD_DIR)/%.class: $(SRC_DIR)/tool/%.java
	@ mkdir -p $(BUILD_DIR)
	@ javac -cp $(SRC_DIR) -d $(BUILD_DIR) $(JAVA_OPTIONS) -implicit:none $<
	@ printf "%8s %-60s %s\n" javac $< "$(JAVA_OPTIONS)"

clean:
	@ rm -rf $(BUILD_DIR)/*.class
	@ printf "cleaned %s directory" "$(BUILD_DIR)"
