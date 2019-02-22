
TOP=$(shell pwd)

JSON_FILES:=$(shell find *.json)

.PHONY: all
all: validate

.PHONY: show
show: show_json


.PHONY: show_json
show_json: 
	@echo "JSON files: $(JSON_FILES)"

.PHONY: validate
validate: validate_json

.PHONY: validate_json
validate_json: 
	@echo "Validating JSON files: $(JSON_FILES)";
	for f in $(JSON_FILES); do \
		echo "VALIDATE_BEGIN: $${f}"; \
		jq . $${f}; \
		ret=$$?; \
		echo "VALIDATE_END($${ret}): $${f}"; \
		if [ $${ret} -ne 0 ]; then \
			exit 1; \
		fi; \
	done


