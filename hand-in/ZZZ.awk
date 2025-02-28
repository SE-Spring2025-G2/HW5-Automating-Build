NR == FNR {
    words[$1] = 0; 
    order[FNR] = $1; 
    next;
}

FNR == 1 {
    for (i = 1; i <= length(order); i++) {
        printf "%s%s", order[i], (i == length(order) ? "\n" : ",");
    }
}


{
    if ($0 == "") {
        process_paragraph();
        paragraph = "";
        next;
    } else {
        paragraph = paragraph (paragraph ? " " : "") $0;
    }
}

END {
    if (paragraph != "") {
        process_paragraph();
    }
}

# Function to process a full paragraph
function process_paragraph() {
    split(paragraph, tokens, " ");
    delete freq;

    for (i in tokens) {
        if (tokens[i] in words) {
            freq[tokens[i]]++;
        }
    }

    for (i = 1; i <= length(order); i++) {
        printf "%d%s", (freq[order[i]] ? freq[order[i]] : 0), (i == length(order) ? "\n" : ",");
    }
}
