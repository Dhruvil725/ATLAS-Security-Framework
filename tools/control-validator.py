#!/usr/bin/env python3
"""
ATLAS Control Validator
Validates control YAML files for consistency and completeness
"""

import yaml
import sys
import glob

def validate_control(file_path):
    """Validate a single control file"""
    try:
        with open(file_path, 'r') as f:
            control = yaml.safe_load(f)
        
        required_fields = ['control_id', 'control_name', 'pillar', 'description']
        
        for field in required_fields:
            if field not in control:
                print(f" {file_path}: Missing required field '{field}'")
                return False
        
        print(f" {file_path}: Valid")
        return True
        
    except Exception as e:
        print(f" {file_path}: Error - {e}")
        return False

if __name__ == "__main__":
    yaml_files = glob.glob("framework/**/*.yaml", recursive=True)
    
    valid_count = 0
    for file_path in yaml_files:
        if validate_control(file_path):
            valid_count += 1
    
    print(f"\n{valid_count}/{len(yaml_files)} controls are valid")
    
    if valid_count < len(yaml_files):
        sys.exit(1)
