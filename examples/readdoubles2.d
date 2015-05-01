import std.algorithm.iteration : map, each;
import std.array : array;
import std.conv : parse;
import std.range : takeExactly, tee;
import std.stdio;

void main()
{
	double mean = 0;
	auto sample = File("10numbers.txt")
		.byLine
		.takeExactly(10)
		.map!(line => line.parse!double)
		.tee!((x){mean += x;})
		.array;
	mean /= sample.length;
	// prints one element per line
	sample.map!(x => x - mean).each!writeln;
}
