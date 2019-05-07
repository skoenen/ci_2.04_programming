#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// this function helps us read a variable length sentence
// since we are not sure how many characters the user wants to input

char *take_variable_input()
{
	int max_sentence_len = 1000;
	char *sentence = malloc(max_sentence_len);

	if (sentence != NULL)
	{
		int i = 0;
		int current_char = EOF;

		// check if user presses enter or end of file is reached
		while ((current_char = getchar()) != '\n' && current_char != EOF)
		{
			sentence[i++] = (char)current_char;

			// add additional memory if 1000 characters are already entered
			if (i == max_sentence_len)
			{
				max_sentence_len = i;
				sentence = realloc(sentence, max_sentence_len);
			}
		}
		sentence[i] = '\0';
	}

	return sentence;
}

// this function reverses the sentence given by the user

char *rev_sentence(char *sentence)
{

	int sent_len = strlen(sentence);

	printf("Your reversed sentence is: ");

	for (int i = sent_len; i >= 0; i--)
	{
		printf("%c", sentence[i]);
	}

	return sentence;
}

// main function call

int main()
{

	printf("Input a sentence to get the reverse: ");

	char *sentence = rev_sentence(take_variable_input());

	// !!! free memory allocation done in take_variable_input function
	free(sentence);

	return 0;
}
