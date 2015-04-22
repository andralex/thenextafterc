import core.stdc.stdio;

// terminates with a null character
immutable char[] nullTerminatedStr = "Hello, World!\0"; 

int main()
{
	// calls external C function
	puts(nullTerminatedStr.ptr);
	return 0;
}
