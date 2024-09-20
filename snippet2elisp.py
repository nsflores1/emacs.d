#!/usr/bin/env python3

import re, os, argparse


# needed for error messages
class txtformat:
    bold = "\033[1m"
    end = "\033[0m"


parse = argparse.ArgumentParser(
    "snippet2elisp",
    description="A small tool for converting Markdown code snippets to Emacs Lisp.",
    epilog="For more information, please read the enclosed README.md that came with this configuration.",
)
parse.add_argument("file", type=str, help="The file to convert.")
parse.add_argument("-v", action="store_true", help="Enable debug messages.")
args = parse.parse_args()

# TODO: find a way to iterate over a directory rather than just one config
with open(args.file, "r", encoding="utf-8") as f:
    regex_text = f.read()
    result = re.findall(r"```(\s.*?\n)(.*?)```", regex_text, re.S)
    if args.v == True:
        print(txtformat.bold + "Extracted text:" + txtformat.end)
    for i in result:
        print(i[1])
    if args.v == True:
        print(txtformat.bold + "\nArguments passed:" + txtformat.end)
        print(args)

# TODO: find some way this function can be called from within emacs
