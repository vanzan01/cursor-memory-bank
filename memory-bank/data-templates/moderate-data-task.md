# Moderate Data Task Template (Level 2)

## Task Overview
**Complexity Level**: 2 - Moderate Complexity  
**Approach**: Separate Extract and Mapping phases

## Implementation Structure

### Phase 1: Extract Phase
Extract raw data from source systems with basic validation.

#### Extract Code Template
```sql
-- Phase 1: Extract - [TASK_NAME]
-- Description: Extract raw data from source systems
-- Created: [DATE]
-- Author: [AUTHOR]

-- Extract from primary source
CREATE TABLE extracted_primary_data AS
SELECT 
    [primary_key],
    [date_column],
    [text_columns],
    [numeric_columns],
    [categorical_columns],
    CURRENT_TIMESTAMP as extract_timestamp,
    'primary_source' as source_system
FROM [primary_source_table]
WHERE [date_column] >= '[START_DATE]'
    AND [date_column] <= '[END_DATE]'
    AND [basic_filter_condition];

-- Extract from secondary source (if applicable)
CREATE TABLE extracted_secondary_data AS
SELECT 
    [secondary_key],
    [secondary_date_column],
    [secondary_columns],
    CURRENT_TIMESTAMP as extract_timestamp,
    'secondary_source' as source_system
FROM [secondary_source_table]
WHERE [secondary_date_column] >= '[START_DATE]'
    AND [secondary_date_column] <= '[END_DATE]'
    AND [secondary_filter_condition];

-- Data quality check for extracts
SELECT 
    'primary' as source,
    COUNT(*) as record_count,
    COUNT([primary_key]) as non_null_keys,
    MIN([date_column]) as earliest_date,
    MAX([date_column]) as latest_date
FROM extracted_primary_data
UNION ALL
SELECT 
    'secondary' as source,
    COUNT(*) as record_count,
    COUNT([secondary_key]) as non_null_keys,
    MIN([secondary_date_column]) as earliest_date,
    MAX([secondary_date_column]) as latest_date
FROM extracted_secondary_data;
```

#### Python Extract Template
```python
# Phase 1: Extract - [TASK_NAME]
# Description: Extract raw data from source systems
# Created: [DATE]
# Author: [AUTHOR]

import pandas
import numpy
from datetime import datetime

def extract_primary_data():
    """Extract data from primary source"""
    dataframe_primary = pandas.read_csv('[primary_source_file].csv')
    
    # Basic filtering
    dataframe_primary = dataframe_primary[
        (dataframe_primary['date_column'] >= '[START_DATE]') &
        (dataframe_primary['date_column'] <= '[END_DATE]') &
        (dataframe_primary['filter_condition'])
    ]
    
    # Add metadata
    dataframe_primary['extract_timestamp'] = datetime.now()
    dataframe_primary['source_system'] = 'primary_source'
    
    return dataframe_primary

def extract_secondary_data():
    """Extract data from secondary source"""
    dataframe_secondary = pandas.read_csv('[secondary_source_file].csv')
    
    # Basic filtering
    dataframe_secondary = dataframe_secondary[
        (dataframe_secondary['date_column'] >= '[START_DATE]') &
        (dataframe_secondary['date_column'] <= '[END_DATE]') &
        (dataframe_secondary['filter_condition'])
    ]
    
    # Add metadata
    dataframe_secondary['extract_timestamp'] = datetime.now()
    dataframe_secondary['source_system'] = 'secondary_source'
    
    return dataframe_secondary

def validate_extracts(dataframe_primary, dataframe_secondary):
    """Validate extracted data"""
    print("Primary data validation:")
    print(f"Records: {len(dataframe_primary)}")
    print(f"Date range: {dataframe_primary['date_column'].min()} to {dataframe_primary['date_column'].max()}")
    print(f"Null keys: {dataframe_primary['primary_key'].isnull().sum()}")
    
    print("\nSecondary data validation:")
    print(f"Records: {len(dataframe_secondary)}")
    print(f"Date range: {dataframe_secondary['date_column'].min()} to {dataframe_secondary['date_column'].max()}")
    print(f"Null keys: {dataframe_secondary['secondary_key'].isnull().sum()}")
    
    return dataframe_primary, dataframe_secondary

# Execute extract phase
if __name__ == "__main__":
    dataframe_primary = extract_primary_data()
    dataframe_secondary = extract_secondary_data()
    dataframe_primary, dataframe_secondary = validate_extracts(dataframe_primary, dataframe_secondary)
    
    # Save extracted data
    dataframe_primary.to_csv('extracted_primary_data.csv', index=False)
    dataframe_secondary.to_csv('extracted_secondary_data.csv', index=False)
    
    print("Extract phase completed successfully!")
```

### Phase 2: Mapping Phase
Transform and clean extracted data with business logic.

#### Mapping Code Template
```sql
-- Phase 2: Mapping - [TASK_NAME]
-- Description: Transform and clean extracted data
-- Created: [DATE]
-- Author: [AUTHOR]

-- Map and clean primary data
CREATE TABLE mapped_primary_data AS
SELECT 
    [primary_key],
    [date_column],
    
    -- Text cleaning and standardization
    UPPER(TRIM([text_column])) as clean_text,
    CASE 
        WHEN [email_column] LIKE '%@%' THEN [email_column]
        ELSE NULL 
    END as valid_email,
    
    -- Numeric validation and transformation
    CASE 
        WHEN [numeric_column] > 0 THEN [numeric_column]
        ELSE 0 
    END as valid_number,
    
    -- Categorical mapping
    CASE 
        WHEN [category_column] IN ('A', 'B', 'C') THEN [category_column]
        ELSE 'OTHER'
    END as standardized_category,
    
    -- Business logic application
    CASE 
        WHEN [value_column] > [threshold] THEN 'HIGH'
        WHEN [value_column] > [medium_threshold] THEN 'MEDIUM'
        ELSE 'LOW'
    END as value_tier,
    
    extract_timestamp,
    source_system
    
FROM extracted_primary_data
WHERE [primary_key] IS NOT NULL;

-- Map and clean secondary data (if applicable)
CREATE TABLE mapped_secondary_data AS
SELECT 
    [secondary_key],
    [secondary_date_column],
    
    -- Apply similar transformations
    UPPER(TRIM([secondary_text_column])) as clean_secondary_text,
    CASE 
        WHEN [secondary_numeric_column] > 0 THEN [secondary_numeric_column]
        ELSE 0 
    END as valid_secondary_number,
    
    extract_timestamp,
    source_system
    
FROM extracted_secondary_data
WHERE [secondary_key] IS NOT NULL;

-- Join mapped data (if multiple sources)
CREATE TABLE final_mapped_data AS
SELECT 
    mapped_primary_data.[primary_key],
    mapped_primary_data.[date_column],
    mapped_primary_data.clean_text,
    mapped_primary_data.valid_email,
    mapped_primary_data.valid_number,
    mapped_primary_data.standardized_category,
    mapped_primary_data.value_tier,
    mapped_secondary_data.clean_secondary_text,
    mapped_secondary_data.valid_secondary_number,
    mapped_primary_data.extract_timestamp,
    'combined' as source_system
    
FROM mapped_primary_data
LEFT JOIN mapped_secondary_data
    ON mapped_primary_data.[primary_key] = mapped_secondary_data.[secondary_key]
    AND mapped_primary_data.[date_column] = mapped_secondary_data.[secondary_date_column];
```

#### Python Mapping Template
```python
# Phase 2: Mapping - [TASK_NAME]
# Description: Transform and clean extracted data
# Created: [DATE]
# Author: [AUTHOR]

import pandas
import numpy
from datetime import datetime

def map_primary_data(dataframe_primary):
    """Transform and clean primary data"""
    
    # Text cleaning and standardization
    dataframe_primary['clean_text'] = dataframe_primary['text_column'].str.upper().str.strip()
    dataframe_primary['valid_email'] = dataframe_primary['email_column'].apply(
        lambda x: x if '@' in str(x) else None
    )
    
    # Numeric validation and transformation
    dataframe_primary['valid_number'] = dataframe_primary['numeric_column'].fillna(0)
    dataframe_primary['valid_number'] = dataframe_primary['valid_number'].apply(
        lambda x: x if x > 0 else 0
    )
    
    # Categorical mapping
    category_mapping = {'A': 'A', 'B': 'B', 'C': 'C'}
    dataframe_primary['standardized_category'] = dataframe_primary['category_column'].map(
        category_mapping
    ).fillna('OTHER')
    
    # Business logic application
    dataframe_primary['value_tier'] = dataframe_primary['value_column'].apply(
        lambda x: 'HIGH' if x > [threshold] else 'MEDIUM' if x > [medium_threshold] else 'LOW'
    )
    
    return dataframe_primary

def map_secondary_data(dataframe_secondary):
    """Transform and clean secondary data"""
    
    # Apply similar transformations
    dataframe_secondary['clean_secondary_text'] = dataframe_secondary['secondary_text_column'].str.upper().str.strip()
    dataframe_secondary['valid_secondary_number'] = dataframe_secondary['secondary_numeric_column'].fillna(0)
    dataframe_secondary['valid_secondary_number'] = dataframe_secondary['valid_secondary_number'].apply(
        lambda x: x if x > 0 else 0
    )
    
    return dataframe_secondary

def join_mapped_data(dataframe_primary_mapped, dataframe_secondary_mapped):
    """Join mapped data from multiple sources"""
    
    final_dataframe = dataframe_primary_mapped.merge(
        dataframe_secondary_mapped,
        left_on=['primary_key', 'date_column'],
        right_on=['secondary_key', 'secondary_date_column'],
        how='left'
    )
    
    final_dataframe['source_system'] = 'combined'
    
    return final_dataframe

def validate_mapped_data(dataframe_mapped):
    """Validate mapped data quality"""
    print("Mapped data validation:")
    print(f"Total records: {len(dataframe_mapped)}")
    print(f"Clean text completeness: {dataframe_mapped['clean_text'].notna().sum() / len(dataframe_mapped) * 100:.1f}%")
    print(f"Valid emails: {dataframe_mapped['valid_email'].notna().sum()}")
    print(f"Valid numbers: {dataframe_mapped['valid_number'].sum()}")
    print(f"Value tiers: {dataframe_mapped['value_tier'].value_counts().to_dict()}")
    
    return dataframe_mapped

# Execute mapping phase
if __name__ == "__main__":
    # Load extracted data
    dataframe_primary = pandas.read_csv('extracted_primary_data.csv')
    dataframe_secondary = pandas.read_csv('extracted_secondary_data.csv')
    
    # Map data
    dataframe_primary_mapped = map_primary_data(dataframe_primary)
    dataframe_secondary_mapped = map_secondary_data(dataframe_secondary)
    
    # Join data
    dataframe_final = join_mapped_data(dataframe_primary_mapped, dataframe_secondary_mapped)
    
    # Validate
    dataframe_final = validate_mapped_data(dataframe_final)
    
    # Save mapped data
    dataframe_final.to_csv('mapped_data.csv', index=False)
    
    print("Mapping phase completed successfully!")
```

### Data Quality Framework

#### Extract Phase Validation
```sql
-- Validate extract completeness
SELECT 
    'primary' as source,
    COUNT(*) as total_records,
    COUNT([primary_key]) as non_null_keys,
    COUNT([date_column]) as non_null_dates,
    MIN([date_column]) as earliest_date,
    MAX([date_column]) as latest_date
FROM extracted_primary_data
UNION ALL
SELECT 
    'secondary' as source,
    COUNT(*) as total_records,
    COUNT([secondary_key]) as non_null_keys,
    COUNT([secondary_date_column]) as non_null_dates,
    MIN([secondary_date_column]) as earliest_date,
    MAX([secondary_date_column]) as latest_date
FROM extracted_secondary_data;
```

#### Mapping Phase Validation
```sql
-- Validate mapping quality
SELECT 
    COUNT(*) as total_mapped_records,
    COUNT(clean_text) as clean_text_count,
    COUNT(valid_email) as valid_email_count,
    COUNT(valid_number) as valid_number_count,
    COUNT(standardized_category) as category_count,
    COUNT(value_tier) as tier_count
FROM final_mapped_data;

-- Check for data quality issues
SELECT 
    standardized_category,
    value_tier,
    COUNT(*) as record_count,
    AVG(valid_number) as avg_number
FROM final_mapped_data
GROUP BY standardized_category, value_tier
ORDER BY record_count DESC;
```

### Documentation Template

#### Task Documentation
```markdown
# [TASK_NAME] - Moderate Data Task

## Overview
- **Complexity Level**: 2
- **Approach**: Separate Extract and Mapping phases
- **Data Sources**: [PRIMARY_SOURCE], [SECONDARY_SOURCE]
- **Output**: [OUTPUT_DESCRIPTION]

## Implementation Details

### Extract Phase
- **Primary Source**: [PRIMARY_SOURCE_DETAILS]
- **Secondary Source**: [SECONDARY_SOURCE_DETAILS]
- **Extract Criteria**: [EXTRACT_CRITERIA]
- **Data Volume**: [VOLUME_METRICS]

### Mapping Phase
- **Text Transformations**: [TEXT_TRANSFORMATIONS]
- **Numeric Validations**: [NUMERIC_VALIDATIONS]
- **Business Logic**: [BUSINESS_LOGIC]
- **Data Joins**: [JOIN_LOGIC]

## Data Quality
- **Extract Completeness**: [EXTRACT_COMPLETENESS]
- **Mapping Accuracy**: [MAPPING_ACCURACY]
- **Join Quality**: [JOIN_QUALITY]

## Performance Metrics
- **Extract Time**: [EXTRACT_TIME]
- **Mapping Time**: [MAPPING_TIME]
- **Total Processing Time**: [TOTAL_TIME]
- **Record Count**: [RECORD_COUNT]

## Business Impact
- **Key Metrics**: [METRICS]
- **Business Value**: [VALUE]
- **Stakeholders**: [STAKEHOLDERS]
```

### Testing Procedures

#### Extract Phase Tests
```python
def test_extract_phase():
    """Test extract phase functionality"""
    
    # Test primary data extraction
    assert len(df_primary) > 0, "Primary data extraction failed"
    assert df_primary['primary_key'].notna().all(), "Primary keys missing"
    assert df_primary['date_column'].notna().all(), "Dates missing"
    
    # Test secondary data extraction
    assert len(df_secondary) > 0, "Secondary data extraction failed"
    assert df_secondary['secondary_key'].notna().all(), "Secondary keys missing"
    
    # Test data ranges
    assert df_primary['date_column'].min() >= '[START_DATE]', "Date range issue"
    assert df_primary['date_column'].max() <= '[END_DATE]', "Date range issue"
    
    print("Extract phase tests passed!")

def test_mapping_phase():
    """Test mapping phase functionality"""
    
    # Test text cleaning
    assert df_mapped['clean_text'].notna().all(), "Text cleaning failed"
    assert df_mapped['clean_text'].str.isupper().all(), "Text not uppercase"
    
    # Test numeric validation
    assert df_mapped['valid_number'].notna().all(), "Number validation failed"
    assert (df_mapped['valid_number'] >= 0).all(), "Negative numbers found"
    
    # Test business logic
    assert df_mapped['value_tier'].isin(['HIGH', 'MEDIUM', 'LOW']).all(), "Invalid tiers"
    
    # Test joins
    assert len(df_final) >= len(df_primary_mapped), "Join lost records"
    
    print("Mapping phase tests passed!")
```

### Deployment Checklist

#### Extract Phase
- [ ] Source system connectivity verified
- [ ] Extract queries tested
- [ ] Data volume validated
- [ ] Extract timestamps added
- [ ] Source metadata captured

#### Mapping Phase
- [ ] Transformation logic tested
- [ ] Business rules validated
- [ ] Data quality checks implemented
- [ ] Join logic verified
- [ ] Output format confirmed

#### Overall
- [ ] Both phases tested independently
- [ ] Integration testing completed
- [ ] Performance validated
- [ ] Documentation updated
- [ ] Monitoring configured

### Monitoring and Maintenance

#### Key Metrics to Monitor
- Extract phase performance
- Mapping phase performance
- Data quality scores
- Join success rates
- Business metric accuracy

#### Maintenance Schedule
- Daily: Check processing status
- Weekly: Review data quality metrics
- Monthly: Performance optimization review
- Quarterly: Business requirements review 