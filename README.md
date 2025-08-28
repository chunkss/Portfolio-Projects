# 🛒 Sales Data Analysis Project

## 📌 Project Overview
This project demonstrates an end-to-end data analysis workflow using **Python, SQL, and MySQL Workbench**.  
The dataset is downloaded directly from **Kaggle via API**, cleaned and transformed using Python, and then loaded into **MySQL Workbench** for SQL-based analysis.

---

## 📂 Dataset
- **Source**: [Retail Orders Dataset - Kaggle](https://www.kaggle.com/datasets/ankitbansal06/retail-orders)  
- The dataset contains retail order details including product information, sales, cost, and profit-related fields.  

---

## 🧹 Data Cleaning & Transformation
The following steps were performed in **Python (Jupyter Notebook)**:

1. Download dataset using **Kaggle API**.  
2. Extract the dataset using `zipfile`.  
3. Load data into **Pandas DataFrame**.  
4. Handle **missing values**.  
5. Rename columns → all lowercase & spaces replaced with underscores.  
6. Derived new columns:  
   - `discount`  
   - `sale_price`  
   - `profit`  
7. Convert `order_date` to **datetime** format.  
8. Dropped unnecessary columns:  
   - `cost_price`  
   - `list_price`  
   - `discount_percent`  
9. Loaded the cleaned data into **MySQL Workbench** using `SQLAlchemy` + `PyMySQL`.  

---

## 🗄️ SQL Analysis
The following business questions were answered using SQL queries in MySQL Workbench:

1. Find **Top 10 highest revenue-generating products**.  
2. Find **Top 5 highest selling products in each region**.  
3. Perform **Month-over-Month comparison for 2022 vs 2023 sales**.  
4. For each category, find the **month with the highest sales**.  
5. Identify **Sub-category with the highest profit growth in 2023 vs 2022**.  

---

## 🛠️ Tech Stack / Tools
- **Python**  
  - Pandas  
  - SQLAlchemy  
  - PyMySQL  
  - Zipfile  
- **MySQL Workbench**  
- **Kaggle API**  
- **Jupyter Notebook**  

---

## 🚀 How to Run

Follow these steps to reproduce the project:

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/sales-data-analysis.git
   cd sales-data-analysis
## Install dependencies

bash
Copy code
pip install pandas sqlalchemy pymysql kaggle
Set up Kaggle API

 Download your Kaggle API token (kaggle.json) from your Kaggle account

 Place it inside your working directory:

bash
Copy code
mkdir -p ~/.kaggle
mv kaggle.json ~/.kaggle/
chmod 600 ~/.kaggle/kaggle.json
Run the Jupyter Notebook

 Open sales_analysis.ipynb

 Execute cells step by step (data download → cleaning → loading into MySQL)

 Run SQL queries

 Open MySQL Workbench

 import and execute queries from orders.sql

## 👨‍💻 Author
Arkadev Mishra

[GitHub](https://https://github.com/chunkss)
[LinkedIn](https://www.linkedin.com/in/arkadev-mishra-b0b364125?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BIq9QCzaASL2s9XSD4IwQNQ%3D%3D)

📧 Email: arkadevmishra@gmail.com
