# Complex Data Task Template (Level 4)

## Task Overview
**Complexity Level**: 4 - Complex Data Engineering  
**Approach**: Define metrics above data marts

## Implementation Structure

### Phase 1: Extract Phase
Extract raw data from multiple complex sources with advanced validation.

#### Extract Code Template
```sql
-- Phase 1: Extract - [TASK_NAME]
-- Description: Extract raw data from multiple complex source systems
-- Created: [DATE]
-- Author: [AUTHOR]

-- Extract from multiple complex sources
CREATE TABLE extracted_complex_source1 AS
SELECT 
    [source1_key],
    [source1_date_column],
    [source1_complex_columns],
    CURRENT_TIMESTAMP as extract_timestamp,
    'complex_source1' as source_system,
    'phase1' as processing_phase
FROM [complex_source1_table]
WHERE [source1_date_column] >= '[START_DATE]'
    AND [source1_date_column] <= '[END_DATE]'
    AND [complex_filter_condition];

-- Additional complex sources as needed...
```

### Phase 2: Mapping Phase
Transform and clean extracted data with advanced business logic.

#### Mapping Code Template
```sql
-- Phase 2: Mapping - [TASK_NAME]
-- Description: Transform and clean extracted data with advanced business logic
-- Created: [DATE]
-- Author: [AUTHOR]

-- Advanced mapping with complex business logic
CREATE TABLE mapped_complex_data AS
SELECT 
    [source_key],
    [date_column],
    
    -- Advanced text processing
    UPPER(TRIM([text_column])) as clean_text,
    
    -- Complex business logic
    CASE 
        WHEN [value_column] > [high_threshold] THEN 'HIGH'
        WHEN [value_column] > [medium_threshold] THEN 'MEDIUM'
        WHEN [value_column] > [low_threshold] THEN 'LOW'
        ELSE 'MINIMAL'
    END as value_tier,
    
    -- Advanced calculations
    [value_column] * [complex_multiplier] as calculated_value,
    
    extract_timestamp,
    source_system,
    'phase2' as processing_phase
    
FROM extracted_complex_source1
WHERE [source_key] IS NOT NULL;
```

### Phase 3: Data Mart Building Phase
Create sophisticated data marts for advanced analysis.

#### Data Mart Code Template
```sql
-- Phase 3: Data Mart Building - [TASK_NAME]
-- Description: Create sophisticated data marts for advanced analysis
-- Created: [DATE]
-- Author: [AUTHOR]

-- Create advanced fact table
CREATE TABLE fact_advanced_analytics AS
SELECT 
    mapped_complex_data.[key_column] as analytics_id,
    mapped_complex_data.[date_column] as analytics_date,
    mapped_complex_data.[clean_text] as analytics_description,
    mapped_complex_data.[value_tier] as analytics_tier,
    mapped_complex_data.[calculated_value] as analytics_value,
    CURRENT_TIMESTAMP as data_mart_timestamp,
    'fact_advanced_analytics' as mart_name
FROM mapped_complex_data
WHERE mapped_complex_data.[key_column] IS NOT NULL;

-- Create dimension tables
CREATE TABLE dim_advanced_dimensions AS
SELECT DISTINCT
    mapped_complex_data.[dimension_key] as dimension_id,
    mapped_complex_data.[dimension_text] as dimension_name,
    mapped_complex_data.[dimension_value] as dimension_value,
    CURRENT_TIMESTAMP as data_mart_timestamp,
    'dim_advanced_dimensions' as mart_name
FROM mapped_complex_data
WHERE mapped_complex_data.[dimension_key] IS NOT NULL;
```

### Phase 4: Metrics Definition Phase
Define complex business metrics above data marts.

#### Metrics Code Template
```sql
-- Phase 4: Metrics Definition - [TASK_NAME]
-- Description: Define complex business metrics above data marts
-- Created: [DATE]
-- Author: [AUTHOR]

-- Define advanced business metrics
CREATE TABLE advanced_business_metrics AS
SELECT 
    DATE_TRUNC('month', analytics_date) as metric_month,
    analytics_tier,
    
    -- Complex metric calculations
    COUNT(*) as metric_count,
    SUM(analytics_value) as total_metric_value,
    AVG(analytics_value) as avg_metric_value,
    
    -- Advanced calculations
    SUM(analytics_value) / COUNT(*) as metric_efficiency,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() as metric_percentage,
    
    -- Time-based metrics
    LAG(SUM(analytics_value)) OVER (ORDER BY DATE_TRUNC('month', analytics_date)) as prev_month_value,
    (SUM(analytics_value) - LAG(SUM(analytics_value)) OVER (ORDER BY DATE_TRUNC('month', analytics_date))) / 
    LAG(SUM(analytics_value)) OVER (ORDER BY DATE_TRUNC('month', analytics_date)) * 100 as growth_rate,
    
    CURRENT_TIMESTAMP as metric_timestamp,
    'advanced_business_metrics' as metric_name
    
FROM fact_advanced_analytics
GROUP BY 
    DATE_TRUNC('month', analytics_date),
    analytics_tier
ORDER BY 
    metric_month DESC,
    total_metric_value DESC;
```

### Python Implementation Template

```python
# Complex Data Task - [TASK_NAME]
# Description: Advanced data engineering with metrics above data marts
# Created: [DATE]
# Author: [AUTHOR]

import pandas
import numpy
from datetime import datetime
import logging

logger = logging.getLogger(__name__)

def extract_complex_data():
    """Extract data from complex sources"""
    logger.info("Extracting complex data...")
    
    # Extract from multiple complex sources
    dataframe_complex = pandas.read_csv('[complex_source_file].csv')
    
    # Apply complex filters
    dataframe_complex = dataframe_complex[
        (dataframe_complex['date_column'] >= '[START_DATE]') &
        (dataframe_complex['date_column'] <= '[END_DATE]') &
        (dataframe_complex['complex_filter_condition'])
    ]
    
    # Add metadata
    dataframe_complex['extract_timestamp'] = datetime.now()
    dataframe_complex['source_system'] = 'complex_source'
    dataframe_complex['processing_phase'] = 'phase1'
    
    logger.info(f"Extracted {len(dataframe_complex)} complex records")
    return dataframe_complex

def map_complex_data(dataframe_complex):
    """Transform complex data with advanced business logic"""
    logger.info("Mapping complex data...")
    
    # Advanced text processing
    dataframe_complex['clean_text'] = dataframe_complex['text_column'].str.upper().str.strip()
    
    # Complex business logic
    dataframe_complex['value_tier'] = dataframe_complex['value_column'].apply(
        lambda x: 'HIGH' if x > [high_threshold] 
        else 'MEDIUM' if x > [medium_threshold] 
        else 'LOW' if x > [low_threshold] 
        else 'MINIMAL'
    )
    
    # Advanced calculations
    dataframe_complex['calculated_value'] = dataframe_complex['value_column'] * [complex_multiplier]
    
    # Update processing phase
    dataframe_complex['processing_phase'] = 'phase2'
    
    logger.info(f"Mapped {len(dataframe_complex)} complex records")
    return dataframe_complex

def build_advanced_data_marts(dataframe_complex_mapped):
    """Build advanced data marts"""
    logger.info("Building advanced data marts...")
    
    # Create fact table
    fact_table = dataframe_complex_mapped.rename(columns={
        'key_column': 'analytics_id',
        'date_column': 'analytics_date',
        'clean_text': 'analytics_description',
        'value_tier': 'analytics_tier',
        'calculated_value': 'analytics_value'
    })
    
    fact_table['data_mart_timestamp'] = datetime.now()
    fact_table['mart_name'] = 'fact_advanced_analytics'
    
    # Create dimension table
    dim_table = dataframe_complex_mapped[[
        'dimension_key', 'dimension_text', 'dimension_value'
    ]].drop_duplicates().rename(columns={
        'dimension_key': 'dimension_id',
        'dimension_text': 'dimension_name',
        'dimension_value': 'dimension_value'
    })
    
    dim_table['data_mart_timestamp'] = datetime.now()
    dim_table['mart_name'] = 'dim_advanced_dimensions'
    
    logger.info(f"Built advanced data marts: {len(fact_table)} fact records, {len(dim_table)} dimension records")
    return fact_table, dim_table

def define_advanced_metrics(fact_table):
    """Define complex business metrics above data marts"""
    logger.info("Defining advanced business metrics...")
    
    # Convert date column
    fact_table['analytics_date'] = pd.to_datetime(fact_table['analytics_date'])
    fact_table['metric_month'] = fact_table['analytics_date'].dt.to_period('M')
    
    # Create advanced metrics
    metrics = fact_table.groupby(['metric_month', 'analytics_tier']).agg({
        'analytics_id': 'count',
        'analytics_value': ['sum', 'mean'],
    }).reset_index()
    
    # Flatten column names
    metrics.columns = [
        'metric_month', 'analytics_tier', 'metric_count', 
        'total_metric_value', 'avg_metric_value'
    ]
    
    # Advanced calculations
    metrics['metric_efficiency'] = metrics['total_metric_value'] / metrics['metric_count']
    metrics['metric_percentage'] = metrics['metric_count'] / metrics['metric_count'].sum() * 100
    
    # Time-based metrics
    metrics['prev_month_value'] = metrics.groupby('analytics_tier')['total_metric_value'].shift(1)
    metrics['growth_rate'] = (
        (metrics['total_metric_value'] - metrics['prev_month_value']) / 
        metrics['prev_month_value'] * 100
    )
    
    # Add metadata
    metrics['metric_timestamp'] = datetime.now()
    metrics['metric_name'] = 'advanced_business_metrics'
    
    logger.info(f"Defined {len(metrics)} advanced metrics")
    return metrics

# Execute complex data task
if __name__ == "__main__":
    # Phase 1: Extract
    dataframe_complex = extract_complex_data()
    dataframe_complex.to_csv('extracted_complex_data.csv', index=False)
    
    # Phase 2: Map
    dataframe_complex_mapped = map_complex_data(dataframe_complex)
    dataframe_complex_mapped.to_csv('mapped_complex_data.csv', index=False)
    
    # Phase 3: Build Data Marts
    fact_table, dim_table = build_advanced_data_marts(dataframe_complex_mapped)
    fact_table.to_csv('fact_advanced_analytics.csv', index=False)
    dim_table.to_csv('dim_advanced_dimensions.csv', index=False)
    
    # Phase 4: Define Metrics
    metrics = define_advanced_metrics(fact_table)
    metrics.to_csv('advanced_business_metrics.csv', index=False)
    
    logger.info("Complex data task completed successfully!")
```

### Data Quality Framework

#### Complex Validation Queries
```sql
-- Validate complex data quality
SELECT 
    'complex_source' as source,
    COUNT(*) as record_count,
    COUNT([key_column]) as non_null_keys,
    COUNT([date_column]) as non_null_dates,
    MIN([date_column]) as earliest_date,
    MAX([date_column]) as latest_date,
    COUNT(DISTINCT [key_column]) as unique_keys,
    AVG([value_column]) as avg_value,
    STDDEV([value_column]) as value_stddev
FROM extracted_complex_source1;
```

### Documentation Template

```markdown
# [TASK_NAME] - Complex Data Task

## Overview
- **Complexity Level**: 4
- **Approach**: Define metrics above data marts
- **Data Sources**: [COMPLEX_SOURCES]
- **Output**: Advanced analytics and business metrics

## Implementation Details

### Extract Phase
- **Complex Sources**: [COMPLEX_SOURCE_DETAILS]
- **Extract Criteria**: [COMPLEX_EXTRACT_CRITERIA]
- **Data Volume**: [COMPLEX_VOLUME_METRICS]

### Mapping Phase
- **Advanced Transformations**: [ADVANCED_TRANSFORMATIONS]
- **Complex Business Logic**: [COMPLEX_BUSINESS_LOGIC]
- **Advanced Calculations**: [ADVANCED_CALCULATIONS]

### Data Mart Building Phase
- **Advanced Fact Table**: [ADVANCED_FACT_TABLE_DETAILS]
- **Complex Dimension Tables**: [COMPLEX_DIMENSION_DETAILS]
- **Advanced Data Model**: [ADVANCED_DATA_MODEL]

### Metrics Definition Phase
- **Complex Business Metrics**: [COMPLEX_METRICS]
- **Advanced Calculations**: [ADVANCED_CALCULATIONS]
- **Time-based Analysis**: [TIME_BASED_ANALYSIS]

## Data Quality
- **Complex Data Validation**: [COMPLEX_VALIDATION]
- **Advanced Quality Checks**: [ADVANCED_QUALITY_CHECKS]
- **Metric Accuracy**: [METRIC_ACCURACY]

## Performance Metrics
- **Total Processing Time**: [TOTAL_TIME]
- **Complex Processing Time**: [COMPLEX_PROCESSING_TIME]
- **Metric Calculation Time**: [METRIC_CALCULATION_TIME]

## Business Impact
- **Advanced Analytics**: [ADVANCED_ANALYTICS]
- **Complex Business Value**: [COMPLEX_BUSINESS_VALUE]
- **Executive Stakeholders**: [EXECUTIVE_STAKEHOLDERS]
```

### Testing Procedures

```python
def test_complex_data_task():
    """Test complex data task functionality"""
    
    # Test extract phase
    assert len(df_complex) > 0, "Complex data extraction failed"
    assert df_complex['key_column'].notna().all(), "Complex keys missing"
    
    # Test mapping phase
    assert df_complex_mapped['clean_text'].notna().all(), "Complex text cleaning failed"
    assert df_complex_mapped['value_tier'].isin(['HIGH', 'MEDIUM', 'LOW', 'MINIMAL']).all(), "Invalid tiers"
    
    # Test data mart building
    assert len(fact_table) > 0, "Advanced fact table failed"
    assert len(dim_table) > 0, "Advanced dimension table failed"
    
    # Test metrics definition
    assert len(metrics) > 0, "Advanced metrics failed"
    assert metrics['metric_efficiency'].notna().all(), "Metric efficiency calculation failed"
    
    print("Complex data task tests passed!")
```

### Deployment Checklist

- [ ] Complex source connectivity verified
- [ ] Advanced transformations tested
- [ ] Complex business logic validated
- [ ] Advanced data marts built
- [ ] Complex metrics defined
- [ ] Advanced quality checks implemented
- [ ] Performance optimized
- [ ] Documentation completed
- [ ] Monitoring configured

### Monitoring and Maintenance

#### Key Metrics to Monitor
- Complex data processing performance
- Advanced metric calculation accuracy
- Data quality for complex transformations
- Business metric accuracy
- Executive dashboard performance

#### Maintenance Schedule
- Daily: Check complex processing status
- Weekly: Review advanced data quality metrics
- Monthly: Performance optimization for complex tasks
- Quarterly: Advanced business requirements review 