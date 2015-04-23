import std.stdio;

void main()
{
	File fin = File("10numbers.txt");
	double[] sample;
	sample.length = 10;
	double mean = 0;
	for(int i = 0; i < sample.length; i++)
	{
		fin.readf("%s", &sample[i]);
		if(!fin.eof)
			fin.readln();
		mean += sample[i];
	}
	mean /= sample.length;
	// prints one element per line
	for(int i = 0; i < sample.length; i++)
	{
		writeln(sample[i] - mean);
	}
}
