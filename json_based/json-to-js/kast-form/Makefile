all:
	kompile js.k
	
run:
	krun --parser "./parser" programs/bool.js
	krun --parser "./parser" programs/multipvar.js
	krun --parser "./parser" programs/var.js
	krun --parser "./parser" programs/if.js
	krun --parser "./parser" programs/null.js
	krun --parser "./parser" programs/postfix.js
	krun --parser "./parser" programs/prefix.js
	krun --parser "./parser" programs/while.js
	krun --parser "./parser" programs/asgn.js
	krun --parser "./parser" programs/arr.js
	krun --parser "./parser" programs/no.js
	krun --parser "./parser" programs/string.js
	krun --parser "./parser" ${ARGS}

clean:
	rm -r *-kompiled
