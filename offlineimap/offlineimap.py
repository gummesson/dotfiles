#!/usr/bin/env python

def gmail_prefix(folder):
    if folder != "INBOX":
        return "".join(("[Gmail].", folder))
    else:
        return folder
