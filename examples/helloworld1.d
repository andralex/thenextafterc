import core.stdc.stdio;

immutable char[] nullTerminatedStr = "Hello, World!\0"; // ends with null!

int main()
{
	puts(nullTerminatedStr.ptr); // calls external C function
	return 0;
}
