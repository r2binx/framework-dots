#!/usr/bin/env bash

original_file="/usr/share/i18n/locales/en_US"
replacement_file="/usr/share/i18n/locales/en_DK"
temp_file="/tmp/8601-en_US-patch"

# Find where the block starts and ends in the original file
start_orig=$(grep -n '^LC_TIME$' $original_file | cut -d: -f1)
end_orig=$(grep -n '^END LC_TIME$' $original_file | cut -d: -f1)

# Find where the block starts and ends in the replacement file
start_repl=$(grep -n '^LC_TIME$' $replacement_file | cut -d: -f1)
end_repl=$(grep -n '^END LC_TIME$' $replacement_file | cut -d: -f1)

# Extract the block from the replacement file
sed -n "${start_repl},${end_repl}p" $replacement_file >$temp_file
echo "" >>$temp_file

# Delete the original block from the original file
sed -i "${start_orig},${end_orig}d" $original_file

# Insert the new block into the original file
sed -i "${start_orig}r $temp_file" $original_file

# Clean up temporary file
rm $temp_file
