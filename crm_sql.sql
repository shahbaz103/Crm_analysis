use crm;
select * from user_table;

#Opportunity Dashboard 
# Expected amount KPI
SELECT 
    CONCAT(ROUND(SUM(Expected_Amount) / 1000000, 2), ' M') AS Sum_of_Expected_Amount_M
FROM opp_table;


# Active Opportunities
SELECT COUNT(*) AS Active_Opportunities
FROM opp_table
WHERE Stage NOT IN ('Closed Won', 'Closed Lost');

# Closed Won Opportunities
SELECT COUNT(*) AS Closed_Won
FROM opp_table
WHERE Stage = 'Closed Won';

# Closed Lost Opportunities
SELECT COUNT(*) AS Closed_Lost
FROM opp_table
WHERE Stage = 'Closed Lost';

#Total Closed Opportunities
SELECT COUNT(*) AS Total_Closed_Opportunities
FROM opp_table
WHERE Stage IN ('Closed Won', 'Closed Lost');

#Conversion Rate
SELECT 
    CONCAT(ROUND((COUNT(CASE WHEN Stage = 'Closed Won' THEN 1 END) * 100.0) / COUNT(*), 2), '%') AS Conversion_Rate
FROM opp_table;

#Win Rate % 
SELECT 
    CONCAT(ROUND((COUNT(CASE WHEN Stage = 'Closed Won' THEN 1 END) * 100.0) / 
                 COUNT(CASE WHEN Stage IN ('Closed Won', 'Closed Lost') THEN 1 END), 2), '%') AS Win_Rate
FROM opp_table;


#Loss Rate %
SELECT 
    CONCAT(ROUND((COUNT(CASE WHEN Stage = 'Closed Lost' THEN 1 END) * 100.0) / 
                 COUNT(CASE WHEN Stage IN ('Closed Won', 'Closed Lost') THEN 1 END), 2), '%') AS Loss_Rate
FROM opp_table;

#Lead Dashboard

#Total Leads
SELECT 
    COUNT(Total_Leads) AS Total_Leads from lead_table;

#Expected Amount
SELECT 
    CONCAT(ROUND(SUM(Expected_Amount) / 1000000, 2), ' M') AS Sum_of_Expected_Amount_M
FROM opp_table;

#Convesion Rate Percentage
SELECT 
    ROUND((COUNT(CASE WHEN Converted = 'Yes' THEN 1 END) * 100.0) / COUNT(*), 2) AS Conversion_Rate_Percentage
FROM lead_table;

#Conversion Accounts
SELECT COUNT(DISTINCT `Converted Account ID`) AS Conversion_Accounts
FROM lead_table
WHERE `Converted Account ID` IS NOT NULL;

#Converted Oppprtunities
SELECT COUNT(DISTINCT `Converted Opportunity ID`) AS Converted_Opportunities
FROM lead_table
WHERE `Converted Opportunity ID` IS NOT NULL;















