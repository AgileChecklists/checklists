# 
# Makefile for generating different output formats from the Markdown source.
#
# See file LICENSE for copyright information.
#

OUTPUT_DIR=output
HTML_OUTPUT_DIR=$(OUTPUT_DIR)/html
CSS_OUTPUT_DIR=$(HTML_OUTPUT_DIR)/css

all: html

clean:
	find . -name .DS_Store | xargs rm
	find . -name \*~ | xargs rm

output_dir:
	mkdir -p $(OUTPUT_DIR)

html_output_dir: output_dir
	mkdir -p $(HTML_OUTPUT_DIR)

css_output_dir: html_output_dir
	mkdir -p $(CSS_OUTPUT_DIR)

html: css_output_dir $(HTML_OUTPUT_DIR)/Product_owner_checklist.html
	cp css/*.css $(CSS_OUTPUT_DIR) 

output/html/Product_owner_checklist.html: Product_owner_checklist.md css/style.css
	pandoc -s Product_owner_checklist.md -c css/style.css -o $(HTML_OUTPUT_DIR)/Product_owner_checklist.html