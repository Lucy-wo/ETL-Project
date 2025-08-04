# Trending YouTube Video ETL & Analysis (US + CA)

> End-to-end ETL that consolidates YouTube Trending data for the United States and Canada, maps category IDs to readable labels, and loads clean monthly aggregates into a relational database for analysis and visualization.

## Summary
This project builds a reproducible ETL pipeline for trending YouTube videos in the US and Canada. Raw CSVs (video stats) and a JSON file (category mapping) are extracted, cleaned, joined, and aggregated at a **year–month × category** grain. The result is a tidy dataset stored in a relational database to support queries, dashboards, and comparisons across regions and categories. Notebooks produce quick visualizations (views, likes, dislikes, comments) for exploratory insights.

## Goal
- **Primary:** Create a clean, analysis-ready data model that unifies US/CA trending video stats with readable category names and month-level rollups.
- **Secondary:** Enable fast comparison across regions and categories, and provide a foundation for reporting, forecasting, and experimentation.

## Procedure
1. **Extract**
   - Ingest US and CA trending video CSVs.
   - Load the YouTube **category_id → category name** mapping from JSON.
2. **Transform**
   - Select relevant columns; standardize types and parse dates.
   - Derive `year_month` and aggregate metrics by `year_month` and `category_id`.
   - Join category names; normalize/rename columns for clarity.
   - Basic QA: null checks, duplicate checks, schema validation.
3. **Load**
   - Create tables in a relational database (e.g., PostgreSQL).
   - Upsert monthly aggregates and category dimensions.
4. **Analyze & Visualize**
   - Produce time-series and category comparisons (views, likes, dislikes, comments).
   - Snapshot key insights for US vs. CA and by category.

## Result
- **Clean data assets:** Monthly, category-labeled aggregates for US and CA, suitable for BI tools and ad-hoc SQL.
- **Reproducible pipeline:** Notebook + scripts to re-run end-to-end from raw files to database tables.
- **Quick EDA visuals:** Line charts and comparisons for engagement metrics by month and category.

## Business Impact
- **Content strategy:** Identify which categories drive engagement over time and differ by region.
- **Marketing & planning:** Support budget allocation by category/region with trend evidence.
- **Ops efficiency:** Centralized, consistent dataset reduces one-off data prep for recurring reports.

## Next Step to Make It Better
- **Data coverage:** Add more countries and extend the time horizon; track daily granularity for seasonality.
- **Quality & governance:** Add unit tests (e.g., Great Expectations), schema checks, and data contracts.
- **Automation:** Productionize with a scheduler (Airflow/Prefect), containerize (Docker), and add CI/CD.
- **Modeling:** Build forecasting (e.g., Prophet/ARIMA) and causal analyses (e.g., DiD) for promo/feature impact.
- **Analytics layer:** Add a semantic model (dbt) and BI dashboards (Tableau/Power BI/Looker) for stakeholders.
- **Cost & performance:** Partition tables by month, index join keys, and cache common aggregates.

---

### (Optional) Tech Stack
- **Ingestion & Transform:** Python, Pandas
- **Visualization:** Matplotlib
- **Storage:** PostgreSQL (relational tables for aggregates and dimensions)
- **Workflow:** Jupyter notebooks (prototype)

### (Optional) Repo Structure
```

.
├─ data/                # raw csv/json pointers or samples
├─ notebooks/           # EDA & ETL prototype
├─ src/                 # reusable ETL scripts (extract/transform/load)
├─ configs/             # db credentials, paths (use .env for secrets)
├─ tests/               # data quality checks
└─ docs/                # figures and reports

````

### (Optional) How to Run
```bash
# 1) Environment
conda env create -f environment.yml && conda activate yt-etl

# 2) Configure secrets
cp .env.example .env   # set DB_*, DATA_DIR variables

# 3) Run ETL
python src/etl.py --config configs/default.yaml

# 4) Explore
jupyter lab  # open notebooks/ to view charts and run ad-hoc queries
````
