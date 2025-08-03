# Simple Data Task Template (Level 1)

## Task Overview
**Complexity Level**: 1 - Simple Data Tasks  
**Approach**: Extract + Mapping + Data Marts + Final Metrics in same module

## Implementation Structure

### Phase 1: Single Module Implementation
All data processing steps are combined in one module for simplicity and efficiency.

#### Code Template
```sql
-- Simple Data Task: [TASK_NAME]
-- Description: [BRIEF_DESCRIPTION]
-- Created: [DATE]
-- Author: [AUTHOR]

-- Extract, Transform, and Calculate Metrics in One Query
SELECT 
    -- Extract: Raw data selection
    [date_column] as date,
    [category_column] as category,
    
    -- Mapping: Basic transformations
    UPPER(TRIM([text_column])) as clean_text,
    CASE 
        WHEN [numeric_column] > 0 THEN [numeric_column]
        ELSE 0 
    END as valid_number,
    
    -- Data Mart: Aggregations
    SUM([value_column]) as total_value,
    COUNT(*) as record_count,
    AVG([metric_column]) as avg_metric,
    
    -- Final Metrics: Business calculations
    SUM([value_column]) / COUNT(*) as avg_value_per_record,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() as percentage_of_total
    
FROM [source_table]
WHERE [date_column] >= '[START_DATE]'
    AND [date_column] <= '[END_DATE]'
    AND [filter_condition]
GROUP BY 
    [date_column],
    [category_column],
    [clean_text],
    [valid_number]
ORDER BY 
    [date_column] DESC,
    total_value DESC;
```

#### Python Template
```python
# Simple Data Task: [TASK_NAME]
# Description: [BRIEF_DESCRIPTION]
# Created: [DATE]
# Author: [AUTHOR]

import pandas
import numpy

def process_simple_data_task():
    """
    Extract, transform, and calculate metrics in one function
    """
    # Extract: Load raw data
    df = pandas.read_csv('[source_file].csv')
    
    # Mapping: Basic transformations
    df['clean_text'] = df['text_column'].str.upper().str.strip()
    df['valid_number'] = df['numeric_column'].fillna(0)
    df['date'] = pandas.to_datetime(df['date_column'])
    
    # Filter data
    df = df[
        (df['date'] >= '[START_DATE]') &
        (df['date'] <= '[END_DATE]') &
        (df['filter_condition'])
    ]
    
    # Data Mart + Final Metrics: Aggregations and calculations
    result = df.groupby(['date', 'category', 'clean_text']).agg({
        'value_column': ['sum', 'mean'],
        'metric_column': ['count', 'std'],
        'record_id': 'count'
    }).reset_index()
    
    # Calculate final metrics
    result['avg_value_per_record'] = result[('value_column', 'sum')] / result[('record_id', 'count')]
    result['percentage_of_total'] = result[('record_id', 'count')] / result[('record_id', 'count')].sum() * 100
    
    return result

# Execute the task
if __name__ == "__main__":
    result_dataframe = process_simple_data_task()
    result_dataframe.to_csv('[output_file].csv', index=False)
    print(f"Task completed. Output: {len(result_dataframe)} records")
```

### Data Quality Checks

#### Validation Queries
```sql
-- Check for data completeness
SELECT 
    COUNT(*) as total_records,
    COUNT([key_column]) as non_null_keys,
    COUNT([date_column]) as non_null_dates,
    COUNT([value_column]) as non_null_values
FROM [source_table]
WHERE [date_column] >= '[START_DATE]';

-- Check for data accuracy
SELECT 
    MIN([date_column]) as earliest_date,
    MAX([date_column]) as latest_date,
    MIN([value_column]) as min_value,
    MAX([value_column]) as max_value,
    AVG([value_column]) as avg_value
FROM [source_table]
WHERE [date_column] >= '[START_DATE]';

-- Check for duplicates
SELECT 
    [key_column],
    COUNT(*) as duplicate_count
FROM [source_table]
GROUP BY [key_column]
HAVING COUNT(*) > 1;
```

### Documentation Template

#### Task Documentation
```markdown
# [TASK_NAME] - Simple Data Task

## Overview
- **Complexity Level**: 1
- **Approach**: Single module (Extract + Transform + Calculate)
- **Data Source**: [SOURCE_DESCRIPTION]
- **Output**: [OUTPUT_DESCRIPTION]

## Implementation Details
- **Extract**: [EXTRACT_DETAILS]
- **Transform**: [TRANSFORM_DETAILS]
- **Calculate**: [CALCULATION_DETAILS]

## Data Quality
- **Completeness**: [COMPLETENESS_METRICS]
- **Accuracy**: [ACCURACY_METRICS]
- **Timeliness**: [TIMELINESS_METRICS]

## Performance Metrics
- **Processing Time**: [TIME]
- **Record Count**: [COUNT]
- **File Size**: [SIZE]

## Business Impact
- **Key Metrics**: [METRICS]
- **Business Value**: [VALUE]
- **Stakeholders**: [STAKEHOLDERS]
```

### Testing Procedures

#### Unit Tests
```python
def test_simple_data_task():
    """Test the simple data task implementation"""
    
    # Test data extraction
    assert len(dataframe) > 0, "Data extraction failed"
    
    # Test transformations
    assert dataframe['clean_text'].notna().all(), "Text cleaning failed"
    assert dataframe['valid_number'].notna().all(), "Number validation failed"
    
    # Test calculations
    assert result['total_value'].sum() > 0, "Value calculation failed"
    assert result['record_count'].sum() > 0, "Count calculation failed"
    
    # Test data quality
    assert result['percentage_of_total'].sum() == 100, "Percentage calculation failed"
    
    print("All tests passed!")
```

### Deployment Checklist

- [ ] Code reviewed and tested
- [ ] Data quality checks implemented
- [ ] Documentation completed
- [ ] Performance validated
- [ ] Business stakeholders notified
- [ ] Monitoring alerts configured
- [ ] Backup procedures in place

### Monitoring and Maintenance

#### Key Metrics to Monitor
- Processing time
- Record counts
- Data quality scores
- Error rates
- Business metric accuracy

#### Maintenance Schedule
- Daily: Check processing status
- Weekly: Review data quality metrics
- Monthly: Performance optimization review
- Quarterly: Business requirements review 