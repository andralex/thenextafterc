//Deduces the type of a declared variable from its initialization expression
immutable str = "Hello, World!";

void main()
{
	//Scoped and selective imports can be used.
	import std.stdio : writeln;
	writeln(str);
}
