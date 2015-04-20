import core.stdc.stdio;

// ends with null!
immutable char[] nullTerminatedStr = "Hello, World!\0"; 

int main()
{
	// calls external C function
	puts(nullTerminatedStr.ptr);
	return 0;
}
