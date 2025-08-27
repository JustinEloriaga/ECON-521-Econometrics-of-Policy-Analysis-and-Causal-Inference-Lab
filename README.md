# ECON 521: Econometrics of Policy Analysis and Causal Inference

This repository contains course materials for **ECON 521: Econometrics of Policy Analysis and Causal Inference**. The course focuses on modern econometric methods for causal inference and policy evaluation, with practical applications using real-world data.

## Course Overview

This course covers advanced econometric techniques used in policy analysis and causal inference, including:

- **Potential Outcomes Framework** - Fundamental concepts of causal inference
- **Randomized Controlled Trials** - Design and analysis of experimental data  
- **Instrumental Variables** - Dealing with endogeneity and selection bias
- **Regression Discontinuity Design** - Exploiting policy thresholds for identification
- **Difference-in-Differences** - Panel data methods for policy evaluation
- **Synthetic Control Methods** - Constructing counterfactuals for policy analysis
- **Machine Learning for Causal Inference** - Modern ML approaches to causal questions

## Repository Structure

```
├── notebooks/           # Jupyter notebooks with code examples and exercises
├── data/               # Datasets used in course examples
├── slides/             # Lecture slides and presentations  
├── assignments/        # Problem sets and projects
├── readings/          # Additional course readings and references
└── utils/             # Helper functions and utilities
```

## Getting Started

### Prerequisites

- Python 3.8+
- Basic knowledge of econometrics and statistics
- Familiarity with pandas, numpy, and matplotlib

### Installation

1. Clone this repository:
```bash
git clone https://github.com/[username]/econ521-causal-inference.git
cd econ521-causal-inference
```

2. Install required packages:
```bash
pip install -r requirements.txt
```

3. Launch Jupyter Lab:
```bash
jupyter lab
```

## Key Topics Covered

### 1. Foundations of Causal Inference
- Potential outcomes and the fundamental problem of causal inference
- Selection bias and confounding
- Randomized experiments as the gold standard

### 2. Quasi-Experimental Methods
- **Instrumental Variables**: Using external variation to identify causal effects
- **Regression Discontinuity**: Exploiting arbitrary cutoffs in treatment assignment
- **Difference-in-Differences**: Comparing changes over time between treatment and control groups

### 3. Advanced Panel Data Methods
- Fixed effects and random effects models
- Synthetic control methods
- Event study designs

### 4. Machine Learning for Causal Inference
- Double/debiased machine learning
- Causal forests and heterogeneous treatment effects
- LASSO and post-selection inference

## Acknowledgments

This repository is largely based on the excellent materials from [Pablo Estrada's Advanced Causal Machine Learning repository](https://github.com/pabloestradac/causalml-advanced). I gratefully acknowledge Pablo's contributions to making these advanced methods accessible through clear examples and implementations.

**Original Author**: [Pablo Estrada](https://www.pabloestrada.io/#about)  
**Course Adaptation**: [Justin Eloriaga](https://www.justineloriaga.com)

## Resources

### Textbooks
- Angrist, J. D., & Pischke, J. S. (2008). *Mostly Harmless Econometrics*
- Imbens, G. W., & Rubin, D. B. (2015). *Causal Inference for Statistics, Social, and Biomedical Sciences*
- Huntington-Klein, N. (2021). *The Effect: An Introduction to Research Design and Causality*

### Software
- **Python**: pandas, numpy, scipy, scikit-learn, statsmodels
- **R**: AER, plm, rdrobust, did, gsynth
- **Stata**: Various community-contributed packages

## Contributing

If you find errors or have suggestions for improvements, please:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -am 'Add improvement'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Create a Pull Request

## License

This repository is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions about the course materials, please:
- Open an issue in this repository
- Contact the instructor during office hours
- Post on the course discussion forum

---

*This repository is for educational purposes as part of ECON 521. Please cite appropriately when using these materials in your own work.*
