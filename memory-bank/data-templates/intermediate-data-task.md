# Intermediate Data Task Template (Level 3)

## Task Overview
**Complexity Level**: 3 - Intermediate Complexity  
**Approach**: Extract → Mapping → Data Mart Building (separate phases)

## Implementation Structure

### Phase 1: Extract Phase
Extract raw data from multiple sources with comprehensive validation.

#### Extract Code Template
```sql
-- Phase 1: Extract - [TASK_NAME]
-- Description: Extract raw data from multiple source systems
-- Created: [DATE]
-- Author: [AUTHOR]

-- Extract from source system 1
CREATE TABLE extracted_source1_data AS
SELECT 
    [source1_key],
    [source1_date_column],
    [source1_text_columns],
    [source1_numeric_columns],
    [source1_categorical_columns],
    CURRENT_TIMESTAMP as extract_timestamp,
    'source1' as source_system,
    'phase1' as processing_phase
FROM [source1_table]
WHERE [source1_date_column] >= '[START_DATE]'
    AND [source1_date_column] <= '[END_DATE]'
    AND [source1_filter_condition];

-- Extract from source system 2
CREATE TABLE extracted_source2_data AS
SELECT 
    [source2_key],
    [source2_date_column],
    [source2_text_columns],
    [source2_numeric_columns],
    [source2_categorical_columns],
    CURRENT_TIMESTAMP as extract_timestamp,
    'source2' as source_system,
    'phase1' as processing_phase
FROM [source2_table]
WHERE [source2_date_column] >= '[START_DATE]'
    AND [source2_date_column] <= '[END_DATE]'
    AND [source2_filter_condition];

-- Extract from source system 3 (if applicable)
CREATE TABLE extracted_source3_data AS
SELECT 
    [source3_key],
    [source3_date_column],
    [source3_text_columns],
    [source3_numeric_columns],
    [source3_categorical_columns],
    CURRENT_TIMESTAMP as extract_timestamp,
    'source3' as source_system,
    'phase1' as processing_phase
FROM [source3_table]
WHERE [source3_date_column] >= '[START_DATE]'
    AND [source3_date_column] <= '[END_DATE]'
    AND [source3_filter_condition];

-- Comprehensive extract validation
SELECT 
    'source1' as source,
    COUNT(*) as record_count,
    COUNT([source1_key]) as non_null_keys,
    COUNT([source1_date_column]) as non_null_dates,
    MIN([source1_date_column]) as earliest_date,
    MAX([source1_date_column]) as latest_date,
    COUNT(DISTINCT [source1_key]) as unique_keys
FROM extracted_source1_data
UNION ALL
SELECT 
    'source2' as source,
    COUNT(*) as record_count,
    COUNT([source2_key]) as non_null_keys,
    COUNT([source2_date_column]) as non_null_dates,
    MIN([source2_date_column]) as earliest_date,
    MAX([source2_date_column]) as latest_date,
    COUNT(DISTINCT [source2_key]) as unique_keys
FROM extracted_source2_data
UNION ALL
SELECT 
    'source3' as source,
    COUNT(*) as record_count,
    COUNT([source3_key]) as non_null_keys,
    COUNT([source3_date_column]) as non_null_dates,
    MIN([source3_date_column]) as earliest_date,
    MAX([source3_date_column]) as latest_date,
    COUNT(DISTINCT [source3_key]) as unique_keys
FROM extracted_source3_data;
```

#### Python Extract Template
```python
# Phase 1: Extract - [TASK_NAME]
# Description: Extract raw data from multiple source systems
# Created: [DATE]
# Author: [AUTHOR]

import pandas
import numpy
from datetime import datetime
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def extract_source1_data():
    """Extract data from source system 1"""
    logger.info("Extracting data from source 1...")
    
    dataframe_source1 = pandas.read_csv('[source1_file].csv')
    
    # Apply filters
    dataframe_source1 = dataframe_source1[
        (dataframe_source1['date_column'] >= '[START_DATE]') &
        (dataframe_source1['date_column'] <= '[END_DATE]') &
        (dataframe_source1['filter_condition'])
    ]
    
    # Add metadata
    dataframe_source1['extract_timestamp'] = datetime.now()
    dataframe_source1['source_system'] = 'source1'
    dataframe_source1['processing_phase'] = 'phase1'
    
    logger.info(f"Extracted {len(dataframe_source1)} records from source 1")
    return dataframe_source1

def extract_source2_data():
    """Extract data from source system 2"""
    logger.info("Extracting data from source 2...")
    
    df_source2 = pd.read_csv('[source2_file].csv')
    
    # Apply filters
    df_source2 = df_source2[
        (df_source2['date_column'] >= '[START_DATE]') &
        (df_source2['date_column'] <= '[END_DATE]') &
        (df_source2['filter_condition'])
    ]
    
    # Add metadata
    df_source2['extract_timestamp'] = datetime.now()
    df_source2['source_system'] = 'source2'
    df_source2['processing_phase'] = 'phase1'
    
    logger.info(f"Extracted {len(df_source2)} records from source 2")
    return df_source2

def extract_source3_data():
    """Extract data from source system 3"""
    logger.info("Extracting data from source 3...")
    
    df_source3 = pd.read_csv('[source3_file].csv')
    
    # Apply filters
    df_source3 = df_source3[
        (df_source3['date_column'] >= '[START_DATE]') &
        (df_source3['date_column'] <= '[END_DATE]') &
        (df_source3['filter_condition'])
    ]
    
    # Add metadata
    df_source3['extract_timestamp'] = datetime.now()
    df_source3['source_system'] = 'source3'
    df_source3['processing_phase'] = 'phase1'
    
    logger.info(f"Extracted {len(df_source3)} records from source 3")
    return df_source3

def validate_extracts(df_source1, df_source2, df_source3):
    """Validate extracted data from all sources"""
    logger.info("Validating extracted data...")
    
    sources = [
        ('source1', df_source1),
        ('source2', df_source2),
        ('source3', df_source3)
    ]
    
    for source_name, df in sources:
        if len(df) > 0:
            logger.info(f"{source_name}: {len(df)} records, "
                       f"date range: {df['date_column'].min()} to {df['date_column'].max()}")
        else:
            logger.warning(f"{source_name}: No records extracted")
    
    return df_source1, df_source2, df_source3

# Execute extract phase
if __name__ == "__main__":
    df_source1 = extract_source1_data()
    df_source2 = extract_source2_data()
    df_source3 = extract_source3_data()
    
    df_source1, df_source2, df_source3 = validate_extracts(df_source1, df_source2, df_source3)
    
    # Save extracted data
    df_source1.to_csv('extracted_source1_data.csv', index=False)
    df_source2.to_csv('extracted_source2_data.csv', index=False)
    df_source3.to_csv('extracted_source3_data.csv', index=False)
    
    logger.info("Extract phase completed successfully!")
```

### Phase 2: Mapping Phase
Transform and clean extracted data with complex business logic.

#### Mapping Code Template
```sql
-- Phase 2: Mapping - [TASK_NAME]
-- Description: Transform and clean extracted data with complex business logic
-- Created: [DATE]
-- Author: [AUTHOR]

-- Map and clean source 1 data
CREATE TABLE mapped_source1_data AS
SELECT 
    [source1_key],
    [source1_date_column],
    
    -- Text cleaning and standardization
    UPPER(TRIM([source1_text_column])) as clean_source1_text,
    CASE 
        WHEN [source1_email_column] LIKE '%@%' THEN [source1_email_column]
        ELSE NULL 
    END as valid_source1_email,
    
    -- Numeric validation and transformation
    CASE 
        WHEN [source1_numeric_column] > 0 THEN [source1_numeric_column]
        ELSE 0 
    END as valid_source1_number,
    
    -- Complex business logic
    CASE 
        WHEN [source1_value_column] > [high_threshold] THEN 'HIGH'
        WHEN [source1_value_column] > [medium_threshold] THEN 'MEDIUM'
        WHEN [source1_value_column] > [low_threshold] THEN 'LOW'
        ELSE 'MINIMAL'
    END as source1_value_tier,
    
    -- Derived calculations
    [source1_value_column] * [source1_multiplier] as calculated_source1_value,
    
    extract_timestamp,
    source_system,
    'phase2' as processing_phase
    
FROM extracted_source1_data
WHERE [source1_key] IS NOT NULL;

-- Map and clean source 2 data
CREATE TABLE mapped_source2_data AS
SELECT 
    [source2_key],
    [source2_date_column],
    
    -- Apply similar transformations
    UPPER(TRIM([source2_text_column])) as clean_source2_text,
    CASE 
        WHEN [source2_numeric_column] > 0 THEN [source2_numeric_column]
        ELSE 0 
    END as valid_source2_number,
    
    -- Source 2 specific business logic
    CASE 
        WHEN [source2_value_column] > [source2_high_threshold] THEN 'HIGH'
        WHEN [source2_value_column] > [source2_medium_threshold] THEN 'MEDIUM'
        ELSE 'LOW'
    END as source2_value_tier,
    
    -- Derived calculations for source 2
    [source2_value_column] * [source2_multiplier] as calculated_source2_value,
    
    extract_timestamp,
    source_system,
    'phase2' as processing_phase
    
FROM extracted_source2_data
WHERE [source2_key] IS NOT NULL;

-- Map and clean source 3 data (if applicable)
CREATE TABLE mapped_source3_data AS
SELECT 
    [source3_key],
    [source3_date_column],
    
    -- Apply similar transformations
    UPPER(TRIM([source3_text_column])) as clean_source3_text,
    CASE 
        WHEN [source3_numeric_column] > 0 THEN [source3_numeric_column]
        ELSE 0 
    END as valid_source3_number,
    
    -- Source 3 specific business logic
    CASE 
        WHEN [source3_value_column] > [source3_high_threshold] THEN 'HIGH'
        WHEN [source3_value_column] > [source3_medium_threshold] THEN 'MEDIUM'
        ELSE 'LOW'
    END as source3_value_tier,
    
    extract_timestamp,
    source_system,
    'phase2' as processing_phase
    
FROM extracted_source3_data
WHERE [source3_key] IS NOT NULL;
```

#### Python Mapping Template
```python
# Phase 2: Mapping - [TASK_NAME]
# Description: Transform and clean extracted data with complex business logic
# Created: [DATE]
# Author: [AUTHOR]

import pandas as pd
import numpy as np
from datetime import datetime
import logging

logger = logging.getLogger(__name__)

def map_source1_data(df_source1):
    """Transform and clean source 1 data"""
    logger.info("Mapping source 1 data...")
    
    # Text cleaning and standardization
    df_source1['clean_source1_text'] = df_source1['source1_text_column'].str.upper().str.strip()
    df_source1['valid_source1_email'] = df_source1['source1_email_column'].apply(
        lambda x: x if '@' in str(x) else None
    )
    
    # Numeric validation and transformation
    df_source1['valid_source1_number'] = df_source1['source1_numeric_column'].fillna(0)
    df_source1['valid_source1_number'] = df_source1['valid_source1_number'].apply(
        lambda x: x if x > 0 else 0
    )
    
    # Complex business logic
    df_source1['source1_value_tier'] = df_source1['source1_value_column'].apply(
        lambda x: 'HIGH' if x > [high_threshold] 
        else 'MEDIUM' if x > [medium_threshold] 
        else 'LOW' if x > [low_threshold] 
        else 'MINIMAL'
    )
    
    # Derived calculations
    df_source1['calculated_source1_value'] = df_source1['source1_value_column'] * [source1_multiplier]
    
    # Update processing phase
    df_source1['processing_phase'] = 'phase2'
    
    logger.info(f"Mapped {len(df_source1)} records from source 1")
    return df_source1

def map_source2_data(df_source2):
    """Transform and clean source 2 data"""
    logger.info("Mapping source 2 data...")
    
    # Apply similar transformations
    df_source2['clean_source2_text'] = df_source2['source2_text_column'].str.upper().str.strip()
    df_source2['valid_source2_number'] = df_source2['source2_numeric_column'].fillna(0)
    df_source2['valid_source2_number'] = df_source2['valid_source2_number'].apply(
        lambda x: x if x > 0 else 0
    )
    
    # Source 2 specific business logic
    df_source2['source2_value_tier'] = df_source2['source2_value_column'].apply(
        lambda x: 'HIGH' if x > [source2_high_threshold] 
        else 'MEDIUM' if x > [source2_medium_threshold] 
        else 'LOW'
    )
    
    # Derived calculations for source 2
    df_source2['calculated_source2_value'] = df_source2['source2_value_column'] * [source2_multiplier]
    
    # Update processing phase
    df_source2['processing_phase'] = 'phase2'
    
    logger.info(f"Mapped {len(df_source2)} records from source 2")
    return df_source2

def map_source3_data(df_source3):
    """Transform and clean source 3 data"""
    logger.info("Mapping source 3 data...")
    
    # Apply similar transformations
    df_source3['clean_source3_text'] = df_source3['source3_text_column'].str.upper().str.strip()
    df_source3['valid_source3_number'] = df_source3['source3_numeric_column'].fillna(0)
    df_source3['valid_source3_number'] = df_source3['valid_source3_number'].apply(
        lambda x: x if x > 0 else 0
    )
    
    # Source 3 specific business logic
    df_source3['source3_value_tier'] = df_source3['source3_value_column'].apply(
        lambda x: 'HIGH' if x > [source3_high_threshold] 
        else 'MEDIUM' if x > [source3_medium_threshold] 
        else 'LOW'
    )
    
    # Update processing phase
    df_source3['processing_phase'] = 'phase2'
    
    logger.info(f"Mapped {len(df_source3)} records from source 3")
    return df_source3

def validate_mapped_data(df_source1_mapped, df_source2_mapped, df_source3_mapped):
    """Validate mapped data quality"""
    logger.info("Validating mapped data...")
    
    sources = [
        ('source1', df_source1_mapped),
        ('source2', df_source2_mapped),
        ('source3', df_source3_mapped)
    ]
    
    for source_name, df in sources:
        if len(df) > 0:
            logger.info(f"{source_name} mapped data:")
            logger.info(f"  - Records: {len(df)}")
            logger.info(f"  - Clean text completeness: {df['clean_source1_text'].notna().sum() / len(df) * 100:.1f}%")
            logger.info(f"  - Value tiers: {df[f'{source_name}_value_tier'].value_counts().to_dict()}")
    
    return df_source1_mapped, df_source2_mapped, df_source3_mapped

# Execute mapping phase
if __name__ == "__main__":
    # Load extracted data
    df_source1 = pd.read_csv('extracted_source1_data.csv')
    df_source2 = pd.read_csv('extracted_source2_data.csv')
    df_source3 = pd.read_csv('extracted_source3_data.csv')
    
    # Map data
    df_source1_mapped = map_source1_data(df_source1)
    df_source2_mapped = map_source2_data(df_source2)
    df_source3_mapped = map_source3_data(df_source3)
    
    # Validate
    df_source1_mapped, df_source2_mapped, df_source3_mapped = validate_mapped_data(
        df_source1_mapped, df_source2_mapped, df_source3_mapped
    )
    
    # Save mapped data
    df_source1_mapped.to_csv('mapped_source1_data.csv', index=False)
    df_source2_mapped.to_csv('mapped_source2_data.csv', index=False)
    df_source3_mapped.to_csv('mapped_source3_data.csv', index=False)
    
    logger.info("Mapping phase completed successfully!")
```

### Phase 3: Data Mart Building Phase
Create structured data marts for analysis.

#### Data Mart Code Template
```sql
-- Phase 3: Data Mart Building - [TASK_NAME]
-- Description: Create structured data marts for analysis
-- Created: [DATE]
-- Author: [AUTHOR]

-- Create fact table for business transactions
CREATE TABLE fact_business_transactions AS
SELECT 
    s1.[source1_key] as transaction_id,
    s1.[source1_date_column] as transaction_date,
    s1.clean_source1_text as transaction_description,
    s1.valid_source1_number as transaction_amount,
    s1.source1_value_tier as transaction_tier,
    s1.calculated_source1_value as calculated_amount,
    s2.clean_source2_text as customer_description,
    s2.valid_source2_number as customer_value,
    s2.source2_value_tier as customer_tier,
    s2.calculated_source2_value as customer_calculated_value,
    s3.clean_source3_text as product_description,
    s3.valid_source3_number as product_value,
    s3.source3_value_tier as product_tier,
    CURRENT_TIMESTAMP as data_mart_timestamp,
    'fact_business_transactions' as mart_name
FROM mapped_source1_data s1
LEFT JOIN mapped_source2_data s2
    ON s1.[source1_key] = s2.[source2_key]
    AND s1.[source1_date_column] = s2.[source2_date_column]
LEFT JOIN mapped_source3_data s3
    ON s1.[source1_key] = s3.[source3_key]
    AND s1.[source1_date_column] = s3.[source3_date_column]
WHERE s1.[source1_key] IS NOT NULL;

-- Create dimension table for customers
CREATE TABLE dim_customers AS
SELECT DISTINCT
    s2.[source2_key] as customer_id,
    s2.clean_source2_text as customer_name,
    s2.valid_source2_number as customer_value,
    s2.source2_value_tier as customer_tier,
    s2.calculated_source2_value as customer_calculated_value,
    CURRENT_TIMESTAMP as data_mart_timestamp,
    'dim_customers' as mart_name
FROM mapped_source2_data s2
WHERE s2.[source2_key] IS NOT NULL;

-- Create dimension table for products
CREATE TABLE dim_products AS
SELECT DISTINCT
    s3.[source3_key] as product_id,
    s3.clean_source3_text as product_name,
    s3.valid_source3_number as product_value,
    s3.source3_value_tier as product_tier,
    CURRENT_TIMESTAMP as data_mart_timestamp,
    'dim_products' as mart_name
FROM mapped_source3_data s3
WHERE s3.[source3_key] IS NOT NULL;

-- Create aggregated summary table
CREATE TABLE summary_business_metrics AS
SELECT 
    DATE_TRUNC('month', transaction_date) as month,
    transaction_tier,
    customer_tier,
    product_tier,
    COUNT(*) as transaction_count,
    SUM(transaction_amount) as total_transaction_amount,
    AVG(transaction_amount) as avg_transaction_amount,
    SUM(calculated_amount) as total_calculated_amount,
    COUNT(DISTINCT transaction_id) as unique_transactions,
    COUNT(DISTINCT customer_id) as unique_customers,
    COUNT(DISTINCT product_id) as unique_products
FROM fact_business_transactions
GROUP BY 
    DATE_TRUNC('month', transaction_date),
    transaction_tier,
    customer_tier,
    product_tier
ORDER BY 
    month DESC,
    total_transaction_amount DESC;
```

#### Python Data Mart Template
```python
# Phase 3: Data Mart Building - [TASK_NAME]
# Description: Create structured data marts for analysis
# Created: [DATE]
# Author: [AUTHOR]

import pandas as pd
import numpy as np
from datetime import datetime
import logging

logger = logging.getLogger(__name__)

def build_fact_business_transactions(df_source1_mapped, df_source2_mapped, df_source3_mapped):
    """Build fact table for business transactions"""
    logger.info("Building fact business transactions table...")
    
    # Join mapped data
    fact_table = df_source1_mapped.merge(
        df_source2_mapped,
        left_on=['source1_key', 'source1_date_column'],
        right_on=['source2_key', 'source2_date_column'],
        how='left'
    ).merge(
        df_source3_mapped,
        left_on=['source1_key', 'source1_date_column'],
        right_on=['source3_key', 'source3_date_column'],
        how='left'
    )
    
    # Rename columns for clarity
    fact_table = fact_table.rename(columns={
        'source1_key': 'transaction_id',
        'source1_date_column': 'transaction_date',
        'clean_source1_text': 'transaction_description',
        'valid_source1_number': 'transaction_amount',
        'source1_value_tier': 'transaction_tier',
        'calculated_source1_value': 'calculated_amount',
        'clean_source2_text': 'customer_description',
        'valid_source2_number': 'customer_value',
        'source2_value_tier': 'customer_tier',
        'calculated_source2_value': 'customer_calculated_value',
        'clean_source3_text': 'product_description',
        'valid_source3_number': 'product_value',
        'source3_value_tier': 'product_tier'
    })
    
    # Add metadata
    fact_table['data_mart_timestamp'] = datetime.now()
    fact_table['mart_name'] = 'fact_business_transactions'
    
    logger.info(f"Built fact table with {len(fact_table)} records")
    return fact_table

def build_dim_customers(df_source2_mapped):
    """Build dimension table for customers"""
    logger.info("Building dimension customers table...")
    
    dim_customers = df_source2_mapped[[
        'source2_key', 'clean_source2_text', 'valid_source2_number',
        'source2_value_tier', 'calculated_source2_value'
    ]].drop_duplicates()
    
    # Rename columns
    dim_customers = dim_customers.rename(columns={
        'source2_key': 'customer_id',
        'clean_source2_text': 'customer_name',
        'valid_source2_number': 'customer_value',
        'source2_value_tier': 'customer_tier',
        'calculated_source2_value': 'customer_calculated_value'
    })
    
    # Add metadata
    dim_customers['data_mart_timestamp'] = datetime.now()
    dim_customers['mart_name'] = 'dim_customers'
    
    logger.info(f"Built customers dimension with {len(dim_customers)} records")
    return dim_customers

def build_dim_products(df_source3_mapped):
    """Build dimension table for products"""
    logger.info("Building dimension products table...")
    
    dim_products = df_source3_mapped[[
        'source3_key', 'clean_source3_text', 'valid_source3_number', 'source3_value_tier'
    ]].drop_duplicates()
    
    # Rename columns
    dim_products = dim_products.rename(columns={
        'source3_key': 'product_id',
        'clean_source3_text': 'product_name',
        'valid_source3_number': 'product_value',
        'source3_value_tier': 'product_tier'
    })
    
    # Add metadata
    dim_products['data_mart_timestamp'] = datetime.now()
    dim_products['mart_name'] = 'dim_products'
    
    logger.info(f"Built products dimension with {len(dim_products)} records")
    return dim_products

def build_summary_business_metrics(fact_table):
    """Build aggregated summary table"""
    logger.info("Building summary business metrics table...")
    
    # Convert date column
    fact_table['transaction_date'] = pd.to_datetime(fact_table['transaction_date'])
    fact_table['month'] = fact_table['transaction_date'].dt.to_period('M')
    
    # Create summary
    summary = fact_table.groupby([
        'month', 'transaction_tier', 'customer_tier', 'product_tier'
    ]).agg({
        'transaction_id': ['count', 'nunique'],
        'transaction_amount': ['sum', 'mean'],
        'calculated_amount': 'sum',
        'customer_id': 'nunique',
        'product_id': 'nunique'
    }).reset_index()
    
    # Flatten column names
    summary.columns = [
        'month', 'transaction_tier', 'customer_tier', 'product_tier',
        'transaction_count', 'unique_transactions',
        'total_transaction_amount', 'avg_transaction_amount',
        'total_calculated_amount', 'unique_customers', 'unique_products'
    ]
    
    # Add metadata
    summary['data_mart_timestamp'] = datetime.now()
    summary['mart_name'] = 'summary_business_metrics'
    
    logger.info(f"Built summary table with {len(summary)} records")
    return summary

def validate_data_marts(fact_table, dim_customers, dim_products, summary):
    """Validate data mart quality"""
    logger.info("Validating data marts...")
    
    # Check referential integrity
    fact_customers = fact_table['customer_id'].dropna().nunique()
    dim_customers_count = len(dim_customers)
    logger.info(f"Customer referential integrity: {fact_customers} in fact, {dim_customers_count} in dim")
    
    fact_products = fact_table['product_id'].dropna().nunique()
    dim_products_count = len(dim_products)
    logger.info(f"Product referential integrity: {fact_products} in fact, {dim_products_count} in dim")
    
    # Check summary accuracy
    summary_total = summary['total_transaction_amount'].sum()
    fact_total = fact_table['transaction_amount'].sum()
    logger.info(f"Summary accuracy: {summary_total} vs {fact_total}")
    
    return fact_table, dim_customers, dim_products, summary

# Execute data mart building phase
if __name__ == "__main__":
    # Load mapped data
    df_source1_mapped = pd.read_csv('mapped_source1_data.csv')
    df_source2_mapped = pd.read_csv('mapped_source2_data.csv')
    df_source3_mapped = pd.read_csv('mapped_source3_data.csv')
    
    # Build data marts
    fact_table = build_fact_business_transactions(df_source1_mapped, df_source2_mapped, df_source3_mapped)
    dim_customers = build_dim_customers(df_source2_mapped)
    dim_products = build_dim_products(df_source3_mapped)
    summary = build_summary_business_metrics(fact_table)
    
    # Validate
    fact_table, dim_customers, dim_products, summary = validate_data_marts(
        fact_table, dim_customers, dim_products, summary
    )
    
    # Save data marts
    fact_table.to_csv('fact_business_transactions.csv', index=False)
    dim_customers.to_csv('dim_customers.csv', index=False)
    dim_products.to_csv('dim_products.csv', index=False)
    summary.to_csv('summary_business_metrics.csv', index=False)
    
    logger.info("Data mart building phase completed successfully!")
```

### Data Quality Framework

#### Extract Phase Validation
```sql
-- Comprehensive extract validation
SELECT 
    source,
    record_count,
    non_null_keys,
    non_null_dates,
    unique_keys,
    CASE 
        WHEN record_count = unique_keys THEN 'No duplicates'
        ELSE 'Duplicates found'
    END as duplicate_status
FROM (
    SELECT 
        'source1' as source,
        COUNT(*) as record_count,
        COUNT([source1_key]) as non_null_keys,
        COUNT([source1_date_column]) as non_null_dates,
        COUNT(DISTINCT [source1_key]) as unique_keys
    FROM extracted_source1_data
    UNION ALL
    SELECT 
        'source2' as source,
        COUNT(*) as record_count,
        COUNT([source2_key]) as non_null_keys,
        COUNT([source2_date_column]) as non_null_dates,
        COUNT(DISTINCT [source2_key]) as unique_keys
    FROM extracted_source2_data
    UNION ALL
    SELECT 
        'source3' as source,
        COUNT(*) as record_count,
        COUNT([source3_key]) as non_null_keys,
        COUNT([source3_date_column]) as non_null_dates,
        COUNT(DISTINCT [source3_key]) as unique_keys
    FROM extracted_source3_data
) validation_summary;
```

#### Mapping Phase Validation
```sql
-- Validate mapping quality across all sources
SELECT 
    'source1' as source,
    COUNT(*) as total_mapped_records,
    COUNT(clean_source1_text) as clean_text_count,
    COUNT(valid_source1_number) as valid_number_count,
    COUNT(source1_value_tier) as tier_count,
    AVG(calculated_source1_value) as avg_calculated_value
FROM mapped_source1_data
UNION ALL
SELECT 
    'source2' as source,
    COUNT(*) as total_mapped_records,
    COUNT(clean_source2_text) as clean_text_count,
    COUNT(valid_source2_number) as valid_number_count,
    COUNT(source2_value_tier) as tier_count,
    AVG(calculated_source2_value) as avg_calculated_value
FROM mapped_source2_data
UNION ALL
SELECT 
    'source3' as source,
    COUNT(*) as total_mapped_records,
    COUNT(clean_source3_text) as clean_text_count,
    COUNT(valid_source3_number) as valid_number_count,
    COUNT(source3_value_tier) as tier_count,
    NULL as avg_calculated_value
FROM mapped_source3_data;
```

#### Data Mart Validation
```sql
-- Validate data mart quality
SELECT 
    'fact_business_transactions' as mart_name,
    COUNT(*) as record_count,
    COUNT(DISTINCT transaction_id) as unique_transactions,
    COUNT(DISTINCT customer_id) as unique_customers,
    COUNT(DISTINCT product_id) as unique_products,
    SUM(transaction_amount) as total_amount,
    AVG(transaction_amount) as avg_amount
FROM fact_business_transactions
UNION ALL
SELECT 
    'dim_customers' as mart_name,
    COUNT(*) as record_count,
    COUNT(DISTINCT customer_id) as unique_customers,
    NULL as unique_customers,
    NULL as unique_products,
    SUM(customer_value) as total_amount,
    AVG(customer_value) as avg_amount
FROM dim_customers
UNION ALL
SELECT 
    'dim_products' as mart_name,
    COUNT(*) as record_count,
    COUNT(DISTINCT product_id) as unique_products,
    NULL as unique_customers,
    NULL as unique_products,
    SUM(product_value) as total_amount,
    AVG(product_value) as avg_amount
FROM dim_products;
```

### Documentation Template

#### Task Documentation
```markdown
# [TASK_NAME] - Intermediate Data Task

## Overview
- **Complexity Level**: 3
- **Approach**: Extract → Mapping → Data Mart Building (separate phases)
- **Data Sources**: [SOURCE1], [SOURCE2], [SOURCE3]
- **Output**: Fact and dimension tables for analysis

## Implementation Details

### Extract Phase
- **Source 1**: [SOURCE1_DETAILS]
- **Source 2**: [SOURCE2_DETAILS]
- **Source 3**: [SOURCE3_DETAILS]
- **Extract Criteria**: [EXTRACT_CRITERIA]
- **Data Volume**: [VOLUME_METRICS]

### Mapping Phase
- **Text Transformations**: [TEXT_TRANSFORMATIONS]
- **Numeric Validations**: [NUMERIC_VALIDATIONS]
- **Business Logic**: [BUSINESS_LOGIC]
- **Data Joins**: [JOIN_LOGIC]

### Data Mart Building Phase
- **Fact Table**: [FACT_TABLE_DETAILS]
- **Dimension Tables**: [DIMENSION_TABLE_DETAILS]
- **Summary Table**: [SUMMARY_TABLE_DETAILS]
- **Data Model**: [DATA_MODEL_DETAILS]

## Data Quality
- **Extract Completeness**: [EXTRACT_COMPLETENESS]
- **Mapping Accuracy**: [MAPPING_ACCURACY]
- **Data Mart Quality**: [DATA_MART_QUALITY]
- **Referential Integrity**: [REFERENTIAL_INTEGRITY]

## Performance Metrics
- **Extract Time**: [EXTRACT_TIME]
- **Mapping Time**: [MAPPING_TIME]
- **Data Mart Building Time**: [DATA_MART_TIME]
- **Total Processing Time**: [TOTAL_TIME]
- **Record Counts**: [RECORD_COUNTS]

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
    
    # Test all source extractions
    sources = [df_source1, df_source2, df_source3]
    source_names = ['source1', 'source2', 'source3']
    
    for df, name in zip(sources, source_names):
        assert len(df) > 0, f"{name} data extraction failed"
        assert df[f'{name}_key'].notna().all(), f"{name} keys missing"
        assert df[f'{name}_date_column'].notna().all(), f"{name} dates missing"
    
    # Test data ranges
    for df, name in zip(sources, source_names):
        assert df[f'{name}_date_column'].min() >= '[START_DATE]', f"{name} date range issue"
        assert df[f'{name}_date_column'].max() <= '[END_DATE]', f"{name} date range issue"
    
    print("Extract phase tests passed!")

def test_mapping_phase():
    """Test mapping phase functionality"""
    
    # Test all source mappings
    mapped_sources = [df_source1_mapped, df_source2_mapped, df_source3_mapped]
    source_names = ['source1', 'source2', 'source3']
    
    for df, name in zip(mapped_sources, source_names):
        # Test text cleaning
        assert df[f'clean_{name}_text'].notna().all(), f"{name} text cleaning failed"
        assert df[f'clean_{name}_text'].str.isupper().all(), f"{name} text not uppercase"
        
        # Test numeric validation
        assert df[f'valid_{name}_number'].notna().all(), f"{name} number validation failed"
        assert (df[f'valid_{name}_number'] >= 0).all(), f"{name} negative numbers found"
        
        # Test business logic
        assert df[f'{name}_value_tier'].isin(['HIGH', 'MEDIUM', 'LOW', 'MINIMAL']).all(), f"{name} invalid tiers"
    
    print("Mapping phase tests passed!")

def test_data_mart_phase():
    """Test data mart building functionality"""
    
    # Test fact table
    assert len(fact_table) > 0, "Fact table building failed"
    assert fact_table['transaction_id'].notna().all(), "Transaction IDs missing"
    assert fact_table['transaction_date'].notna().all(), "Transaction dates missing"
    
    # Test dimension tables
    assert len(dim_customers) > 0, "Customers dimension failed"
    assert len(dim_products) > 0, "Products dimension failed"
    
    # Test referential integrity
    fact_customers = fact_table['customer_id'].dropna().nunique()
    dim_customers_count = len(dim_customers)
    assert fact_customers <= dim_customers_count, "Customer referential integrity failed"
    
    # Test summary accuracy
    summary_total = summary['total_transaction_amount'].sum()
    fact_total = fact_table['transaction_amount'].sum()
    assert abs(summary_total - fact_total) < 0.01, "Summary accuracy failed"
    
    print("Data mart phase tests passed!")
```

### Deployment Checklist

#### Extract Phase
- [ ] All source system connectivity verified
- [ ] Extract queries tested for all sources
- [ ] Data volume validated for all sources
- [ ] Extract timestamps added to all sources
- [ ] Source metadata captured for all sources

#### Mapping Phase
- [ ] Transformation logic tested for all sources
- [ ] Business rules validated for all sources
- [ ] Data quality checks implemented for all sources
- [ ] Join logic verified between sources
- [ ] Output format confirmed for all sources

#### Data Mart Building Phase
- [ ] Fact table structure validated
- [ ] Dimension table structures validated
- [ ] Summary table calculations verified
- [ ] Referential integrity tested
- [ ] Data model documentation completed

#### Overall
- [ ] All phases tested independently
- [ ] Integration testing completed across all phases
- [ ] Performance validated for all phases
- [ ] Documentation updated for all phases
- [ ] Monitoring configured for all phases

### Monitoring and Maintenance

#### Key Metrics to Monitor
- Extract phase performance for all sources
- Mapping phase performance for all sources
- Data mart building performance
- Data quality scores across all phases
- Referential integrity maintenance
- Business metric accuracy

#### Maintenance Schedule
- Daily: Check processing status for all phases
- Weekly: Review data quality metrics for all phases
- Monthly: Performance optimization review for all phases
- Quarterly: Business requirements review for all phases 