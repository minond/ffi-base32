.PHONY: clean

vendor/libbase32.dylib: vendor/base32.o
	clang $< -shared -o $@

vendor/base32.o: vendor/base32.c
	clang -c -O3 $< -o $@

clean:
	rm vendor/*.o vendor/*.dylib
