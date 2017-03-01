#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

int main()
{
	int c;
	int n;
	unsigned long long int fact = 1;
	char buffer[20];
	read(0, buffer, 20);

	n = atoi(buffer);
	printf("%d\n", n);
	
	for (c = 1; c <= n; ++c)
		fact = fact * c;

	//itoa(fact, buffer, 10);
	sprintf(buffer, "%llu", fact);
	write(1, buffer, 20);
	
	return 0;
}



