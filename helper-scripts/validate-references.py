#!/usr/bin/env python3
import csv
import re
import sys


"""
validate_references.py - verify that values which refer to other files are present and typed
correctly.

This script scans the csv files and looks for references to other files (like the Types column in
card.csv and ensures that each value is actually present in the referenced CSV.

If it detects an error, it will report a filename and line number, and return non-zero to allow
pre-commit to detect a failure.
"""


errors = False

# Build a list of card types
type_filename = 'csvs/english/type.csv'
with open(type_filename, newline='') as csvfile:
    reader = csv.DictReader(csvfile, delimiter="\t")
    allowed_types = [x['Name'] for x in reader]

# Build a list of sets
set_filename = 'csvs/english/set.csv'
with open(set_filename, newline='') as csvfile:
    reader = csv.DictReader(csvfile, delimiter="\t")
    allowed_sets = {x['Identifier']:x for x in reader}

# Scan card.csv for errors
card_filename = 'csvs/english/card.csv'
with open(card_filename, newline='') as csvfile:
    reader = csv.DictReader(csvfile, delimiter="\t")
    for row in reader:
        card_types = re.split(',\s*', row['Types'])
        for card_type in card_types:
            if card_type not in allowed_types:
                print(f"Warning: unrecognized card type {card_type} in {card_filename} entry for "
                      f"{row['Name']}. Check your spelling or add this to {type_filename}.")
                errors = True

        set_ids = re.split(',\s*', row['Set Identifiers'])
        for set_id in set_ids:
            if set_id not in allowed_sets:
                print(f"Warning: unrecognized set {set_id} in {card_filename} entry for "
                      f"{row['Name']}. Check your spelling or add this to {set_filename}.")
                errors = True

        card_ids = re.split(',\s*', row['Identifiers'])
        for card_id in card_ids:
            set_id = card_id[0:3]
            if set_id not in set_ids:
                print("Warning: card has a card ID for a set that isn't associated with that "
                      f"card. Found {card_id} for {row['Name']} in {card_filename}. Check "
                      "this entry for consistency.")
                errors = True

            this_set = None
            try:
                this_set = allowed_sets[set_id]
            except KeyError:
                # This should have been caught already, but make sure we fail anyway
                errors = True
            if this_set:
                # Weird check of this_set because I /don't/ want to catch exceptions anymore
                if not (this_set['Start Card Id'] <= card_id <= this_set['End Card Id']):
                    print(f"Warning: card ID out of range for this set. Found {card_id} in "
                          f"{card_filename} entry for {row['Name']} but {set_filename} gives "
                          f"range {this_set['Start Card Id']} - {this_set['End Card Id']}.")
                    errors = True

        variations = re.split(',\s*', row['Variations'])
        for variation in variations:
            var_data = re.split(r'\s+[-–—]\s+', variation)
            card_id = var_data[1]
            if card_id not in card_ids:
                print("Warning: unrecognized card ID found in the Variations field of "
                      f"{card_filename} for {row['Name']}. Found {card_id} but that isn't in "
                      "the Identifiers field. Check this entry for consistency.")
                errors = True

        image_urls = re.split(',\s*', row['Image URLs'])
        for image_url in image_urls:
            if len(image_url) == 0:
                continue
            img_data = re.split(r'\s+[-–—]\s+', image_url)
            card_id = img_data[1]
            if card_id not in card_ids:
                print("Warning: unrecognized card ID found in the Image URLs field of "
                      f"{card_filename} for {row['Name']}. Found {card_id} but that isn't in "
                      "the Identifiers field. Check this entry for consistency.")
                errors = True

if errors:
    sys.exit(1)
