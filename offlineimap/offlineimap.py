#!/usr/bin/env python

def prefix(prefix, folder):
    if folder != "INBOX":
        return "".join((prefix, folder))
    else:
        return folder
