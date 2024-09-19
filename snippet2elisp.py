#!/usr/bin/python3

# TODO: test this against python2? Maybe also there's a way
# to do this in perl or shell? A dream rewrite would be in
# pure elisp but that's got to be saved for a less busy time
import re, os, argparse

parse = argparse.ArgumentParser("snippet2elisp",
                                description="A small tool for converting Markdown code snippets to Emacs Lisp.",
                                epilog="For more information, please read the enclosed README.md that came with this configuration.")
parse.add_argument('file', type=str, help="The file to convert.")
parse.add_argument('-q', action='store_true', help="Disable messages.")
args = parse.parse_args()

# TODO: find a way to iterate over a directory rather than just one config
with open(args.file, 'r', encoding="utf-8") as f:
 regex_text = f.read()
 # TODO: make this regex skip the line after the first quotation
 result = re.findall(r'```(.*?)```', regex_text, re.S)
 # TODO: hide this value if -q is passed
 for i in result:
  print(' '.join(i.split()))

print(args)

# TODO: find some way this function can be called from within emacs
