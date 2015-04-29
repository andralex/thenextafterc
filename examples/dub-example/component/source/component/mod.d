/++
Module mod;
+/
module component.mod;

import std.algorithm, std.ascii, std.range, std.string, std.functional;

/++
Reads forward range `ir` and removes single line comments.
The result is stored in output range `or`.

Params:
	or = output range
	ir = input range
	cmt = comment prefix (like // in C or # in Python)
+/
void removeSingleLineComments
	(OutputRange, Range1, Range2)            // template parameters
	(OutputRange or, Range1 ir, Range2 cmt)  // function parameters
{
	foreach(line; lineSplitter(ir))
	{
		auto s = line.save.find!(not!isWhite);
		if(!s.startsWith(cmt))
		{
			put(or, line.until(cmt));
			put(or, "\n");
		}
	}
}

/// Unittests with comment appears in documentation.
unittest
{
	auto app = appender!string;

	immutable text0 =
`
// main function
int main()
{
	// return statement
	return 0; //returns 0
}
`;

	immutable text1 =
`
int main()
{
	return 0; 
}
`; // Note: "return 0; " ends with a space character

	removeSingleLineComments(app, text0, "//");
	
	debug
	{
		import std.stdio;
		writeln("text:", app.data);		
	}
	
	assert(app.data == text1);
}
