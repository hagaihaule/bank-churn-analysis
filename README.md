# Bank Customer Churn Analysis

## Overview
This project analyzes customer churn for a retail bank using a dataset of 10,000 customers. The goal was simple: figure out *why* customers leave, and which segments are most at risk — the kind of question any bank's retention team would actually want answered.

This was my first end-to-end data analytics project, built to apply the skills from my Google Data Analytics Certificate in a real, hands-on way — from raw data to a published, interactive dashboard.

## Tools Used
- **SQL (Google BigQuery)** — data exploration and aggregation
- **Tableau Public** — dashboard design and visualization
- **Excel** — initial data cleaning

## The Process
1. Sourced a bank customer dataset (10,000 records, including demographics, account details, and churn status)
2. Cleaned and loaded the data into BigQuery
3. Wrote SQL queries to break down churn by geography, number of products held, and account activity status
4. Built an interactive Tableau dashboard to visualize the findings
5. Published the dashboard publicly for easy sharing

## Key Findings

**1. Germany has a churn problem.**
German customers churn at 32.4%, nearly double the rate of France and Spain (~16% each). This isn't explained by the product mix — it holds even when comparing customers with the same number of products, suggesting something specific to the German customer experience is driving people away.

**2. Customers with 3+ products are a red flag, not a loyalty signal.**
Churn climbs sharply with product count: 7.6% for customers with 2 products, jumping to 82.7% for 3 products and 100% for 4 products. This pattern held consistently across all three countries, pointing to a bank-wide issue — possibly over-selling, poor product bundling, or an onboarding experience that isn't working for multi-product customers.

**3. Inactive customers are twice as likely to leave.**
Customers not actively engaging with their account churn at 26.9%, compared to 14.3% for active members — a clear, actionable signal for re-engagement campaigns.

## Retention Recommendations

**1. Prioritize Germany.**
Launch a dedicated retention campaign for German customers. This could include localized offers, relationship-manager outreach, or competitive product reviews, given that this market accounts for the highest churn rate.

**2. Address high product-holding risk.**
Customers with 3 or more products represent extreme churn risk. Introduce a proactive review process when a customer reaches three products — contact them to confirm product relevance, simplify holdings if needed, or offer tailored bundles that improve perceived value.

**3. Re-engage inactive customers.**
Develop a structured win-back program for inactive members (e.g., personalized offers, account health checks, or digital engagement nudges). Reducing inactivity should directly lower the 26.85% churn rate observed in this group.

**4. Create a high-risk alert list.**
Flag customers who combine multiple risk factors (German + inactive + 3+ products) for priority personal outreach. Even a small, focused intervention on this overlapping segment can deliver measurable retention gains.

**5. Pilot and measure.**
Run a short pilot on one high-risk segment (for example, inactive German customers), track retention lift over 30–60 days, and scale what works.

## Dashboard
🔗 **[View the live interactive dashboard](https://public.tableau.com/views/BANKCUSTOMERCHURNANALYSIS_17866670959890/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

![Dashboard preview](dashboard-preview.png)

## What I'd Explore Next
- Whether the 1-product churn gap in Germany relates to specific demographics (age, balance, credit score)
- What's actually driving the 3+ product churn spike — survey data or CRM notes would help explain the "why" behind the numbers
- A time-series view, if historical churn data were available, to see whether these patterns are worsening or improving

## Files in This Repo
- `queries.sql` — all SQL queries used for the analysis
- `README.md` — this file
