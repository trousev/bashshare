#!/bin/bash
export BS_ROOT=$(dirname $0)
export BS_STORAGE=${BS_STORAGE:-plain}
export BS_DRIVERS="ssh smb dav"
export BS_SU="sudo"
