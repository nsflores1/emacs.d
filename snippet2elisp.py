#!/usr/bin/python3
import re, os, argparse

parse = argparse.ArgumentParser("snippet2elisp",
                                description="A small tool for converting Markdown code snippets to Emacs Lisp.",
                                epilog="For more information, please read the enclosed README.md that came with this configuration.")
parse.add_argument('-f', '--file', help="The file to convert.")
parse.add_argument('-q', '--quiet', help="Disable messages.")
args = parse.parse_args()

with open('elisp.md', 'r', encoding="utf-8") as f:
 regex_text = f.read()
 result = re.findall(r'```(.*?)```', regex_text, re.S)
 print(result)

print(args)
