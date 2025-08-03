# Data Engineering Guidelines

## Overview

This document defines the structured approach for data engineering tasks within the Memory Bank system. The framework uses a four-level complexity model that determines the modular approach for data processing tasks.

## Data Engineering Complexity Levels

### Level 1: Simple Data Tasks
**Approach**: Extract + Mapping + Data Marts + Final Metrics in same module

**Characteristics**:
- Single data source
- Basic transformations
- Simple aggregations
- Direct metric calculations

**Use Cases**:
- Basic data cleaning
- Simple aggregations (sum, count, average)
- Single table to metric conversion
- Basic reporting data

**Template**: `memory-bank/data-templates/simple-data-task.md`

**Example**:
```sql
-- All in one module
SELECT 
    date,
    SUM(sales) as total_sales,
    COUNT(orders) as order_count,
    AVG(order_value) as avg_order_value
FROM raw_sales_data
WHERE date >= '2024-01-01'
GROUP BY date
```

### Level 2: Moderate Complexity
**Approach**: Separate Extract and Mapping phases

**Characteristics**:
- Multiple data sources
- Data cleaning and parsing required
- Moderate transformations
- Some business logic

**Use Cases**:
- Data cleaning and parsing
- Multiple source tables
- Basic data validation
- Simple business rules

**Template**: `memory-bank/data-templates/moderate-data-task.md`

**Example**:
```sql
-- Phase 1: Extract
SELECT * FROM raw_customer_data WHERE is_active = 1
SELECT * FROM raw_order_data WHERE order_date >= '2024-01-01'

-- Phase 2: Map/Clean/Parse
SELECT 
    customer_id,
    UPPER(TRIM(first_name)) as first_name,
    UPPER(TRIM(last_name)) as last_name,
    CASE 
        WHEN email LIKE '%@%' THEN email 
        ELSE NULL 
    END as valid_email
FROM extracted_customer_data
```

### Level 3: Intermediate Complexity
**Approach**: Extract → Mapping → Data Mart Building (separate phases)

**Characteristics**:
- Complex transformations
- Multiple data sources
- Intermediate data marts
- Business logic layers

**Use Cases**:
- Complex data transformations
- Multiple data sources with joins
- Intermediate data marts
- Business logic implementation

**Template**: `memory-bank/data-templates/intermediate-data-task.md`

**Example**:
```sql
-- Phase 1: Extract
-- Multiple source extracts with validation

-- Phase 2: Mapping
-- Complex transformations and business logic

-- Phase 3: Data Mart Building
-- Intermediate tables for analysis
```

### Level 4: Complex Data Engineering
**Approach**: Define metrics above data marts

**Characteristics**:
- Advanced analytics
- Complex business logic
- Multiple data marts
- Sophisticated metric calculations

**Use Cases**:
- Advanced analytics
- Complex business metrics
- Machine learning features
- Executive dashboards

**Template**: `memory-bank/data-templates/complex-data-task.md`

**Example**:
```sql
-- Phase 1: Extract
-- Multiple complex data sources

-- Phase 2: Mapping
-- Advanced transformations

-- Phase 3: Data Marts
-- Multiple specialized data marts

-- Phase 4: Metrics Definition
-- Complex business metrics above data marts
```

## Modular Data Processing Framework

### Extract Phase
**Purpose**: Extract raw data from source systems

**Best Practices**:
- Extract data as-is from source
- Include data validation checks
- Preserve original data structure
- Add extraction timestamps
- Include source system metadata

**Common Patterns**:
- Full table extracts
- Incremental extracts
- Change data capture
- Real-time streaming

### Mapping Phase
**Purpose**: Transform and clean extracted data

**Best Practices**:
- Clean and validate data
- Apply business rules
- Handle data quality issues
- Standardize formats
- Document transformations

**Common Patterns**:
- Data type conversions
- Null value handling
- Duplicate removal
- Business rule application
- Data enrichment

### Data Mart Building Phase
**Purpose**: Create structured data marts for analysis

**Best Practices**:
- Design for specific use cases
- Optimize for query performance
- Include appropriate indexes
- Document data mart structure
- Implement data lineage

**Common Patterns**:
- Dimensional modeling
- Fact and dimension tables
- Aggregated tables
- Materialized views
- Partitioned tables

### Metric Calculation Phase
**Purpose**: Calculate business metrics from data marts

**Best Practices**:
- Define clear metric definitions
- Document calculation logic
- Include data quality checks
- Provide metric context
- Version control calculations

**Common Patterns**:
- KPI calculations
- Trend analysis
- Comparative metrics
- Predictive metrics
- Custom business metrics

## Data Quality Framework

### Validation Checks
- **Completeness**: Check for missing values
- **Accuracy**: Validate data against business rules
- **Consistency**: Ensure data format consistency
- **Timeliness**: Verify data freshness
- **Uniqueness**: Check for duplicate records

### Error Handling
- **Data Quality Issues**: Log and handle invalid data
- **Processing Errors**: Implement retry mechanisms
- **System Failures**: Graceful degradation
- **Data Lineage**: Track data flow and transformations

## Implementation Guidelines

### Task Assessment
1. **Analyze Requirements**: Understand data sources and outputs
2. **Determine Complexity**: Assess based on data volume, sources, and transformations
3. **Select Approach**: Choose appropriate level and modular approach
4. **Plan Implementation**: Create detailed implementation plan

### Development Workflow
1. **Extract Phase**: Implement data extraction with validation
2. **Mapping Phase**: Develop transformation logic
3. **Data Mart Phase**: Build structured data marts
4. **Metric Phase**: Implement business metric calculations
5. **Testing**: Validate each phase independently
6. **Documentation**: Document all phases and decisions

### Quality Assurance
- **Unit Testing**: Test individual components
- **Integration Testing**: Test data flow between phases
- **Data Quality Testing**: Validate data quality metrics
- **Performance Testing**: Ensure acceptable performance
- **User Acceptance Testing**: Validate against business requirements

## Template Usage

Each complexity level has a corresponding template that provides:
- **Task Structure**: Step-by-step implementation guide
- **Code Templates**: Reusable code patterns
- **Validation Checks**: Data quality validation procedures
- **Documentation Standards**: Required documentation elements
- **Testing Procedures**: Quality assurance guidelines

## Integration with Memory Bank

This framework integrates with the existing Memory Bank modes:

- **INITIALISE**: Detect data engineering tasks and determine complexity level
- **PLAN**: Create detailed data engineering implementation plan
- **CREATIVE**: Design data architecture and transformation strategies
- **IMPLEMENT**: Execute data engineering tasks using modular approach
- **REFLECT**: Review data engineering implementation and lessons learned

## Best Practices Summary

1. **Start Simple**: Begin with Level 1 approach unless complexity clearly requires higher level
2. **Modular Design**: Separate concerns into distinct phases
3. **Data Quality First**: Implement validation at each phase
4. **Document Everything**: Maintain clear documentation of all decisions
5. **Test Thoroughly**: Validate each phase independently
6. **Monitor Performance**: Track performance metrics and optimize as needed
7. **Version Control**: Maintain version control for all data engineering code
8. **Collaborate**: Work with business stakeholders to define requirements clearly 