.PHONY: clean test dependencies

# default build task
build:
	mkdir -p build
	cat src/caller-of.js >build/no-copy.caller-of.max.js
	node node_modules/uglify-js/bin/uglifyjs --verbose build/no-copy.caller-of.max.js >build/no-copy.caller-of.js
	cat template/copyright build/no-copy.caller-of.js >build/caller-of.js
	# node.js var EventTarget = require('caller-of');
	cat template/node.before src/caller-of.js template/node.after >build/no-copy.caller-of.max.node.js
	node node_modules/uglify-js/bin/uglifyjs --verbose build/no-copy.caller-of.max.node.js >build/no-copy.caller-of.node.js
	cat template/copyright build/no-copy.caller-of.node.js >build/caller-of.node.js
	# AMD define('caller-of', callerOf)
	cat template/amd.before src/caller-of.js template/amd.after >build/no-copy.caller-of.max.amd.js
	node node_modules/uglify-js/bin/uglifyjs --verbose build/no-copy.caller-of.max.amd.js >build/no-copy.caller-of.amd.js
	cat template/copyright build/no-copy.caller-of.amd.js >build/caller-of.amd.js
	rm build/no-copy.*.js
	make test

# clean/remove build folder
clean:
	rm -rf build

# tests, as usual and of course
test:
	node node_modules/wru/node/program.js test/caller-of.js

# launch polpetta (ctrl+click to open the page)
web:
	node node_modules/polpetta/build/polpetta ./


# modules used in this repo
dependencies:
	rm -rf node_modules
	mkdir node_modules
	npm install wru
	npm install polpetta
	npm install uglify-js@1
