import pyd.pyd;
import pyd.embedded;
import pyd.extra;

/++
`srcipt` is a string that contains python code

Alternatively, you can put your python code here:
--------
immutable script = `
YOUR = "PYTHON"; CODE = "HERE"
print(YOUR, CODE)
`;
--------
+/
immutable script = import("show_histogram.py");

/++
`d_to_python_numpy_ndarray` converts a D array to numpy.ndarray.
`toNumpyArray` is only an alias.
+/
alias toNumpyArray = d_to_python_numpy_ndarray;

/++
A static constructor is a function that performs initializations of 
thread local data before the `main()` function gets control for the 
main thread. 

Shared static constructors are executed before any static 
constructors, and are intended for initializing any shared global
data.
+/
shared static this() {
	//initializes PyD package.
	py_init();
}

void main()
{
	auto pythonContext = new InterpContext();
	/+
	Uniform Function Call Syntax (UFCS) 
	is used in the following line of code.
	
	Equivalent code would be just:
	--------
	pythonContext.sample = toNumpyArray(readData("data/data.txt"));
	--------
	+/
	pythonContext.sample = "data/data.txt".readData.toNumpyArray;
	pythonContext.num_bins = 50;
    pythonContext.py_stmts(script);
}

double[] readData(string file)
{
	import std.algorithm.iteration : map, splitter;
	import std.array : array;
	import std.conv : to;
	import std.file : readText;

	return file
		.readText   //Reads the contents of a text file into a string.
		.splitter        //Lazily splits words.
		.map!(to!double) //Lazily converts words to doubles.
		.array;          //Creates an array.
}
