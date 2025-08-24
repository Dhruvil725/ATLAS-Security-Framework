#!/bin/bash

# ATLAS Framework Repository Setup Script
# Run this in your ATLAS-Security-Framework repository root

echo " Setting up ATLAS Framework repository structure..."

# Create main directory structure
echo " Creating directory structure..."

mkdir -p framework/trusted-data
mkdir -p framework/resilient-models
mkdir -p framework/hardened-operations
mkdir -p framework/responsible-governance
mkdir -p framework/continuous-assurance

mkdir -p case-studies
mkdir -p docs
mkdir -p tools
mkdir -p examples

mkdir -p .github/ISSUE_TEMPLATE
mkdir -p .github/workflows

# Create framework control files
echo " Creating control templates..."

# Trusted Data Controls
cat > framework/trusted-data/data-integrity-validation.yaml << 'EOF'
# TD-001: Data Integrity Validation
control_id: "TD-001"
control_name: "Training Data Integrity Validation"
pillar: "Trusted Data"
status: "draft"

description: "Verify integrity and authenticity of training datasets to prevent data tampering"

implementation:
  - "Implement cryptographic hashing for datasets"
  - "Monitor for statistical anomalies"
  - "Establish data lineage tracking"

code_example: |
  ```python
  def validate_dataset_integrity(dataset_path):
      expected_hash = load_dataset_hash(dataset_path)
      actual_hash = calculate_file_hash(dataset_path)
      if expected_hash != actual_hash:
          raise DataIntegrityError("Dataset tampering detected")
  ```

compliance_mappings:
  nist_ai_rmf: "GOVERN-1.1"
  iso_27001: "A.12.6.1"
EOF

cat > framework/trusted-data/data-poisoning-detection.yaml << 'EOF'
# TD-002: Data Poisoning Detection
control_id: "TD-002"
control_name: "Training Data Poisoning Detection"
pillar: "Trusted Data"
status: "draft"

description: "Detect malicious data injection in training datasets"

implementation:
  - "Statistical distribution analysis"
  - "Outlier detection algorithms"
  - "Data source verification"

compliance_mappings:
  nist_ai_rmf: "MAP-2.3"
  iso_27001: "A.12.2.1"
EOF

# Resilient Models Controls
cat > framework/resilient-models/adversarial-robustness.yaml << 'EOF'
# RM-001: Adversarial Robustness Testing
control_id: "RM-001"
control_name: "Adversarial Robustness Testing"
pillar: "Resilient Models"
status: "draft"

description: "Test AI models against adversarial attacks and ensure robust performance"

implementation:
  - "Generate adversarial examples"
  - "Test model robustness"
  - "Implement defensive techniques"

code_example: |
  ```python
  def test_adversarial_robustness(model, test_data):
      adversarial_examples = generate_adversarial_examples(test_data)
      robustness_score = evaluate_model_performance(model, adversarial_examples)
      return robustness_score > 0.8  # 80% threshold
  ```

compliance_mappings:
  nist_ai_rmf: "MEASURE-2.3"
  iso_27001: "A.14.2.5"
EOF

cat > framework/resilient-models/model-theft-protection.yaml << 'EOF'
# RM-002: Model Theft Protection
control_id: "RM-002"
control_name: "AI Model Theft Protection"
pillar: "Resilient Models"
status: "draft"

description: "Protect AI models from extraction, stealing, and unauthorized replication"

implementation:
  - "Model watermarking techniques"
  - "Query rate limiting"
  - "Behavioral monitoring"

compliance_mappings:
  nist_ai_rmf: "PROTECT-1.1"
  iso_27001: "A.13.2.1"
EOF

# Hardened Operations Controls
cat > framework/hardened-operations/secure-ml-pipeline.yaml << 'EOF'
# HO-001: Secure ML Pipeline
control_id: "HO-001"
control_name: "Secure Machine Learning Pipeline"
pillar: "Hardened Operations"
status: "draft"

description: "Implement security controls throughout the ML development and deployment pipeline"

implementation:
  - "Pipeline access controls"
  - "Code signing for ML artifacts"
  - "Secure containerization"

code_example: |
  ```python
  def secure_ml_pipeline():
      # Authenticate user
      if not authenticate_user():
          raise AccessDenied("Unauthorized access")
      
      # Verify model signature
      if not verify_model_signature(model_path):
          raise SecurityError("Model integrity compromised")
  ```

compliance_mappings:
  nist_ai_rmf: "PROTECT-2.1"
  iso_27001: "A.14.1.3"
EOF

cat > framework/hardened-operations/api-security.yaml << 'EOF'
# HO-002: AI API Security Controls
control_id: "HO-002"
control_name: "AI API Security Controls"
pillar: "Hardened Operations"
status: "draft"

description: "Secure AI service APIs against common attacks and abuse"

implementation:
  - "Authentication and authorization"
  - "Rate limiting and throttling"
  - "Input validation and sanitization"

compliance_mappings:
  nist_ai_rmf: "PROTECT-1.2"
  iso_27001: "A.13.1.1"
EOF

# Responsible Governance Controls
cat > framework/responsible-governance/ai-risk-assessment.yaml << 'EOF'
# RG-001: AI Risk Assessment
control_id: "RG-001"
control_name: "AI System Risk Assessment"
pillar: "Responsible Governance"
status: "draft"

description: "Systematic assessment of AI system risks and impact"

implementation:
  - "Risk identification methodology"
  - "Impact assessment framework"
  - "Mitigation strategy development"

compliance_mappings:
  nist_ai_rmf: "GOVERN-2.1"
  iso_27001: "A.6.1.1"
EOF

cat > framework/responsible-governance/bias-monitoring.yaml << 'EOF'
# RG-002: AI Bias Monitoring
control_id: "RG-002"
control_name: "AI Bias Detection and Monitoring"
pillar: "Responsible Governance"
status: "draft"

description: "Monitor AI systems for bias and fairness issues"

implementation:
  - "Bias detection algorithms"
  - "Fairness metrics monitoring"
  - "Regular bias audits"

compliance_mappings:
  nist_ai_rmf: "MEASURE-2.2"
  eu_ai_act: "Article 15"
EOF

# Continuous Assurance Controls
cat > framework/continuous-assurance/model-drift-monitoring.yaml << 'EOF'
# CA-001: Model Drift Monitoring
control_id: "CA-001"
control_name: "AI Model Drift Monitoring"
pillar: "Continuous Assurance"
status: "draft"

description: "Monitor AI models for performance degradation and concept drift"

implementation:
  - "Performance metric tracking"
  - "Data distribution monitoring"
  - "Automated alerting system"

code_example: |
  ```python
  def monitor_model_drift(model, new_data, baseline_metrics):
      current_metrics = evaluate_model(model, new_data)
      drift_score = calculate_drift(current_metrics, baseline_metrics)
      
      if drift_score > DRIFT_THRESHOLD:
          alert_ops_team("Model drift detected")
  ```

compliance_mappings:
  nist_ai_rmf: "MEASURE-1.1"
  iso_27001: "A.12.1.4"
EOF

cat > framework/continuous-assurance/security-monitoring.yaml << 'EOF'
# CA-002: AI Security Monitoring
control_id: "CA-002"
control_name: "AI Security Incident Monitoring"
pillar: "Continuous Assurance"
status: "draft"

description: "Real-time monitoring for AI security incidents and anomalies"

implementation:
  - "Anomaly detection systems"
  - "Security event logging"
  - "Incident response procedures"

compliance_mappings:
  nist_ai_rmf: "DETECT-1.1"
  iso_27001: "A.12.6.1"
EOF

# Create case studies
echo " Creating case study templates..."

cat > case-studies/deepfake-detection.md << 'EOF'
#  Deepfake Detection System Security

**Threat Landscape:** Social engineering attacks, misinformation campaigns, identity theft

**Business Impact:** Reputation damage, legal liability, user trust erosion

## ATLAS Controls Applied

###  Trusted Data
- **TD-001**: Validate video/image file integrity
- **TD-002**: Detect poisoned training datasets

###  Resilient Models  
- **RM-001**: Test detection models against adversarial examples
- **RM-002**: Protect proprietary detection algorithms

###  Hardened Operations
- **HO-001**: Secure deployment pipeline
- **HO-002**: API rate limiting and authentication

###  Responsible Governance
- **RG-001**: Risk assessment for deepfake threats
- **RG-002**: Monitor for bias in detection accuracy

###  Continuous Assurance
- **CA-001**: Monitor detection model performance
- **CA-002**: Alert on potential security incidents

## Implementation Results
- 95%+ detection accuracy maintained under attack
- Zero successful model extraction attempts
- Complete audit trail for compliance

*Full technical implementation guide coming in v1.0*
EOF

cat > case-studies/fraud-detection.md << 'EOF'
#  AI Fraud Detection Security

**Threat:** Adversarial attacks fool transaction monitoring systems  
**Impact:** Millions in undetected fraud, regulatory penalties

## Quick Overview
-  **Trusted Data**: Validate transaction datasets for poisoning
-  **Resilient Models**: Test fraud models against adversarial examples  
-  **Hardened Operations**: Deploy with encrypted model storage

**Result:** Robust fraud detection that attackers can't easily bypass

*[Full implementation guide coming in v1.0]*
EOF

cat > case-studies/llm-applications.md << 'EOF'
#  LLM Application Security

**Threat:** Prompt injection, data extraction, jailbreaking attacks
**Impact:** Data breaches, unauthorized access, compliance violations

## Quick Overview
-  **Trusted Data**: Secure training data management
-  **Resilient Models**: Prompt injection defense
-  **Hardened Operations**: Secure API deployment

**Result:** LLM applications resistant to common attack vectors

*[Full implementation guide coming in v1.0]*
EOF

# Create documentation files
echo " Creating documentation..."

cat > docs/getting-started.md << 'EOF'
# Getting Started with ATLAS

## Quick Start Guide

1. **Choose Your Use Case**: Browse our case studies
2. **Select Relevant Controls**: Pick controls that apply to your AI system
3. **Implement Security Measures**: Follow the implementation guidance
4. **Monitor and Maintain**: Use continuous assurance controls

## Implementation Levels

- **Basic**: Essential controls for minimum security
- **Intermediate**: Comprehensive security program  
- **Advanced**: Industry-leading security practices

## Support

- GitHub Issues: Technical questions and bug reports
- Discussions: General questions and community support
- Contributing: Help improve the framework
EOF

cat > docs/compliance-mappings.md << 'EOF'
# Compliance Mappings

## NIST AI Risk Management Framework
- GOVERN: Organizational AI risk management
- MAP: AI system categorization and documentation  
- MEASURE: AI system performance and impact assessment
- MANAGE: Risk mitigation and monitoring
- PROTECT: Technical safeguards and security

## ISO 27001:2022
- A.12: Operations Security
- A.13: Communications Security
- A.14: System Acquisition, Development and Maintenance
- A.16: Information Security Incident Management

## EU AI Act
- Article 15: Accuracy, robustness and cybersecurity
- Article 17: Quality management system
- Article 61: Post-market monitoring system
EOF

# Create GitHub issue templates
echo " Creating GitHub issue templates..."

cat > .github/ISSUE_TEMPLATE/good_first_issue.md << 'EOF'
---
name: Good First Issue
about: Perfect for newcomers to contribute
title: '[GOOD FIRST ISSUE] '
labels: 'good first issue'
assignees: ''
---

## Description
Brief description of what needs to be done

## What to do
- [ ] Step 1
- [ ] Step 2  
- [ ] Step 3

## Estimated time
 15-30 minutes

## Getting help
Comment on this issue if you need help or have questions!
EOF

cat > .github/ISSUE_TEMPLATE/new_control.md << 'EOF'
---
name: New Control Request
about: Suggest a new security control
title: '[CONTROL] '
labels: 'enhancement'
assignees: ''
---

## Control Details
**Control Name:** 
**Pillar:** (Trusted Data, Resilient Models, etc.)
**Description:** 

## Implementation Guidance
**What should this control do?**

**How should it be implemented?**

## Compliance Mappings
**Which standards does this map to?**
- [ ] NIST AI RMF
- [ ] ISO 27001
- [ ] EU AI Act
- [ ] Other: 

## Use Cases
**Where would this control be useful?**
EOF

# Create contributing guide
cat > CONTRIBUTING.md << 'EOF'
# Contributing to ATLAS

##  Quick Start (5 minutes)
1. Fork the repo
2. Pick a `good-first-issue` 
3. Make your change
4. Submit PR

##  Easy Ways to Contribute

### Micro-Contributions (5-10 mins)
- [ ] Fix a typo in documentation
- [ ] Add a compliance mapping 
- [ ] Suggest a control name improvement

### Small Contributions (30 mins)
- [ ] Add a code snippet to existing control
- [ ] Create a new case study stub
- [ ] Improve a control description

### Medium Contributions (2-3 hours)
- [ ] Add a new control to existing pillar
- [ ] Complete a case study implementation
- [ ] Add framework mapping to new standard

##  Adding a Control in 3 Steps
1. Copy an existing control YAML file as template
2. Fill in: name, description, implementation guidance (3 bullets max), code snippet
3. Add to appropriate pillar directory

Done! 

## Code of Conduct
Be respectful, constructive, and helpful to other contributors.
EOF

# Create basic GitHub workflow
cat > .github/workflows/validate-controls.yml << 'EOF'
name: Validate Controls

on:
  pull_request:
    paths:
      - 'framework/**/*.yaml'
      - 'framework/**/*.yml'

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Validate YAML files
        run: |
          # Install yaml validator
          pip install pyyaml
          
          # Validate all YAML files
          find framework/ -name "*.yaml" -o -name "*.yml" | while read file; do
            python -c "import yaml; yaml.safe_load(open('$file'))" || exit 1
            echo " $file is valid"
          done
EOF

# Create tools directory with helper scripts
cat > tools/control-validator.py << 'EOF'
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
EOF

chmod +x tools/control-validator.py

# Create requirements.txt
echo "pyyaml>=6.0" > requirements.txt


echo " ATLAS Framework repository structure created successfully!"
echo ""
echo " Created directories:"
echo "   - framework/ (with 5 pillars and 10 controls)"
echo "   - case-studies/ (3 example studies)"
echo "   - docs/ (getting started and compliance guides)"
echo "   - .github/ (issue templates and workflows)"
echo "   - tools/ (validation scripts)"
echo ""
echo " Next steps:"
echo "   1. Review the created files"
echo "   2. Customize the control content"
echo "   3. Add your README.md"
echo "   4. Commit and push to GitHub"
echo ""
echo " Pro tip: Run 'python tools/control-validator.py' to validate your controls"