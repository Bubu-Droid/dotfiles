#!/usr/bin/env python3

# TODO: Add url

import hashlib
import random
import string

import pyperclip

tags = []
SAMPLE_TXT = ""
letters = []
letters.extend(i for i in string.ascii_uppercase)
letters.extend(i for i in string.digits)
UID_LEN = 8
SAMPLE_TXT = "".join(random.sample(letters, k=UID_LEN))

with open("/home/bubu/bon/tags.txt", "r", encoding="utf-8") as f:
    for i in f.readlines():
        if i.strip():
            tags.append(i.strip())

with open("/home/bubu/bon/tags.txt", "a", encoding="utf-8") as f:
    OPTION = 1
    opt_dict = {1: "Z", 2: "GADI"}

    try:
        OPTION = int(
            input(
                r"""
What kind of tag do you want?

1. Random TAG
2. Aditya Da Notes TAG

Enter your option: """
            )
        )
        if OPTION not in opt_dict.keys():
            raise TypeError

        TAG_TXT = (
            opt_dict[OPTION]
            + (hashlib.sha256(SAMPLE_TXT.encode("ascii")).hexdigest())[
                0 : (UID_LEN - len(opt_dict[OPTION]))
            ].upper()
        )

        while True:
            if TAG_TXT not in tags:
                print(TAG_TXT, file=f)
                pyperclip.copy(TAG_TXT)
                print(f"\nThe TAG {TAG_TXT} has been copied to your clipboard.")
                break

    except (TypeError, ValueError):
        print("\nIncorrect Option!")
