#!/usr/bin/awk -f

{
    # Process each word in the line
    for (i = 1; i <= NF; i++) {
        # Remove any punctuation attached to the word for comparison
        clean_word = tolower($i)
        gsub(/[[:punct:]]/, "", clean_word)
        
        # Check if the word is in the excluded list
        if (!(clean_word ~ /^(is|the|in|but|can|a|the|is|in|of|to|a|that|it|for|on|with|as|this|was|at|by|an|be|from|or|are)$/)) {
            # If not in the list, print the original word (with punctuation)
            printf "%s ", $i
        }
    }
    # Print a newline at the end of each line processed
    printf "\n"
}