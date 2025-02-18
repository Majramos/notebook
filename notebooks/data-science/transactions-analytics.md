# Clients Transactions Analytics

??? note "Work in Progress"

    Please note that the notebook you are referring to is currently a work in progress and may continue to be under development for an extended period. This ongoing process ensures that the content remains up-to-date and relevant, reflecting the latest information and research. As such, some sections may be incomplete or subject to change.


## Queries

### Ticket Sequence

```sql
/*
=======================================================
Read only tickets that contain fuel products,
and give them an order number (e.g., First ticket -> n = 1)
=======================================================
*/
WITH client_tickets AS (
	SELECT
        t.ticket_id
        , ROW_NUMBER() OVER (PARTITION BY t.user_id ORDER BY t.ticket_date) AS client_ticket_n
        , t.ticket_date
        , t.user_id
        , O.site_id
        -- , O.product_code AS productCode
        , O.quantity_fuel
        , O.quantity_discount_fuel
        , O.amount_fuel
        , O.discount_fuel
	FROM Transactions t
)
/*
=======================================================
Connect consecutive tickets from the same client.
In this way it is possible to know the average consumption by day/hour
and get the usual interval between supplies (and spot outliers).
n = 2 -> n = 1
n = 3 -> n = 2
=======================================================
*/
SELECT
    MT1.ticket_id AS ticket_id_1
    , MT2.ticket_id AS ticket_id_2
    -- , MT1.user_id
    , MT1.email
    , MT1.card_number
    , MT2.client_ticket_n
    , MT1.ticket_date
    -- , MT1.productCode AS product_1
    , MT2.ticket_date AS second_date
    -- , MT2.productCode AS product_2
    , CAST(EXTRACT(EPOCH FROM MT2.ticket_date - MT1.ticket_date) AS FLOAT) /3600 AS hours_diff
    , MT1.quantity_fuel AS quantity_fuel_1
    , MT2.quantity_fuel AS quantity_fuel_2
    , MT1.discount_fuel AS discount_fuel_1
    , MT2.discount_fuel AS discount_fuel_2
    , MT1.quantity_discount_fuel AS quantity_discount_fuel_1
    , MT2.quantity_discount_fuel AS quantity_discount_fuel_2
FROM client_tickets MT1, client_tickets MT2
WHERE TRUE
    -- AND MT1.user_id = MT2.user_id
    AND MT1.email = MT2.email
    AND MT2.client_ticket_n - 1 = MT1.client_ticket_n
    AND ABS(CAST(EXTRACT(EPOCH FROM MT2.ticket_date - MT1.ticket_date) AS FLOAT) /3600) > 0.33

```


### Client Consumption Profile

```sql
/* =======================================================
 * Create a consumption profile for each client.
 * Study the consumption in 3 different periods:
 *   -> 6 Months
 *   -> 2 Months
 *   -> 2 Weeks
 * The main objective is to understand the period of time in which the client
 * is more "consistent" with the supply interval and average consumption per hour/day.
 * =======================================================
 */
SELECT
    -- CTS_12months.user_id
    CTS_12months.email
    -- 12 MONTHS
    , CTS_12months.total_liters
    , CTS_12months.max_time_between_supplies
    , CTS_12months.avg_discount
    , CTS_12months.total_discount
    , CTS_12months.avg_hours_between_supplies_12months
    , CTS_12months.median_hours_between_supplies_12months
    , CTS_12months.avg_liters_per_supplies_12months
    , CTS_12months.number_of_tickets_12months
    , CTS_12months.frequency_standard_deviation_12months
    , CTS_12months.avg_liters_per_hour_12months
    , CTS_12months.std_dev_liters_per_hour_12months
    , CASE
        WHEN CTS_12months.avg_hours_between_supplies_12months > 0 THEN POWER(CTS_12months.frequency_standard_deviation_12months, 2) / CTS_12months.avg_hours_between_supplies_12months 
        ELSE 0
    END AS frequency_dispersion_index_12months
    , CASE
        WHEN CTS_12months.avg_liters_per_hour_12months > 0 THEN POWER(CTS_12months.std_dev_liters_per_hour_12months, 2) / (CTS_12months.avg_liters_per_hour_12months)
        ELSE 0
    END AS liters_per_hour_dispersion_index_12months
    -- 6 MONTHS
    , CTS_6months.avg_hours_between_supplies_6months
    , CTS_6months.median_hours_between_supplies_6months
    , CTS_6months.avg_liters_per_supplies_6months
    , CTS_6months.number_of_tickets_6months
    , CTS_6months.frequency_standard_deviation_6months
    , CTS_6months.avg_liters_per_hour_6months
    , CTS_6months.std_dev_liters_per_hour_6months
    , CASE
        WHEN CTS_6months.avg_hours_between_supplies_6months > 0 THEN POWER(CTS_6months.frequency_standard_deviation_6months, 2) / CTS_6months.avg_hours_between_supplies_6months
        ELSE 0
    END AS 	frequency_dispersion_index_6months
    , CASE
        WHEN CTS_6months.avg_liters_per_hour_6months > 0 THEN POWER(CTS_6months.std_dev_liters_per_hour_6months * 24, 2) / (CTS_6months.avg_liters_per_hour_6months * 24)
        ELSE 0
    END AS 	liters_per_hour_dispersion_index_6months
    -- 2 MONTHS
    , CTS_2months.avg_hours_between_supplies_2months
    , CTS_2months.median_hours_between_supplies_2months
    , CTS_2months.avg_liters_per_supplies_2months
    , CTS_2months.number_of_tickets_2months
    , CTS_2months.frequency_standard_deviation_2months
    , CTS_2months.avg_liters_per_hour_2months
    , CTS_2months.std_dev_liters_per_hour_2months
    , CASE
        WHEN CTS_2months.avg_hours_between_supplies_2months > 0 THEN POWER(CTS_2months.frequency_standard_deviation_2months, 2) / CTS_2months.avg_hours_between_supplies_2months 
        ELSE 0
    END AS 	frequency_dispersion_index_2months
    , CASE
        WHEN CTS_2months.avg_liters_per_hour_2months > 0 THEN POWER(CTS_2months.std_dev_liters_per_hour_2months, 2) / (CTS_2months.avg_liters_per_hour_2months)
        ELSE 0
    END AS 	liters_per_hour_dispersion_index_2months
FROM (
    SELECT
        -- user_id
        email
        , COUNT(*) + 1 AS number_of_tickets_12months
        , AVG(hours_diff) AS avg_hours_between_supplies_12months
        , MEDIAN(hours_diff) AS median_hours_between_supplies_12months
        , AVG(quantity_fuel_1) AS avg_liters_per_supplies_12months
        , stddev_pop(hours_diff) AS frequency_standard_deviation_12months
        , AVG(quantity_fuel_1 / hours_diff) AS avg_liters_per_hour_12months
        , stddev_pop(quantity_fuel_1 / hours_diff) AS std_dev_liters_per_hour_12months
        , SUM(quantity_fuel_1) AS total_liters
        , MAX(hours_diff) AS max_time_between_supplies
        , AVG(CASE WHEN quantity_discount_fuel_1 > 0 THEN discount_fuel_1 / quantity_discount_fuel_1 ELSE NULL END) AS avg_discount
        , SUM(discount_fuel_1) AS total_discount
    FROM Client_Ticket_Sequence CTS
    WHERE CTS.ticket_date >= timestampadd(month, 12 * -1, CURRENT_TIMESTAMP)
    GROUP BY email --, user_id
) CTS_12months
FULL JOIN (
    SELECT
        -- user_id
        email
        , COUNT(*) + 1 AS number_of_tickets_6months
        , AVG(hours_diff) AS avg_hours_between_supplies_6months
        , MEDIAN(hours_diff) AS median_hours_between_supplies_6months
        , AVG(quantity_fuel_1) AS avg_liters_per_supplies_6months
        , stddev_pop(hours_diff) AS frequency_standard_deviation_6months
        , AVG(quantity_fuel_1 / hours_diff) AS avg_liters_per_hour_6months
        , stddev_pop(quantity_fuel_1 / hours_diff) AS std_dev_liters_per_hour_6months
    FROM Client_Ticket_Sequence CTS
    WHERE CTS.ticket_date >= timestampadd(month, 6 * -1, CURRENT_TIMESTAMP)
    GROUP BY email --, user_id
) CTS_6months
    ON CTS_12months.email = CTS_6months.email
    -- AND CTS_12months.user_id = CTS_6months.user_id
FULL JOIN (
    SELECT
        -- user_id
        email
        , COUNT(*) + 1 AS number_of_tickets_2months
        , AVG(hours_diff) AS avg_hours_between_supplies_2months
        , MEDIAN(hours_diff) AS median_hours_between_supplies_2months
        , AVG(quantity_fuel_1) AS avg_liters_per_supplies_2months
        , stddev_pop(hours_diff) AS frequency_standard_deviation_2months
        , AVG(quantity_fuel_1 / hours_diff) AS avg_liters_per_hour_2months
        , stddev_pop(quantity_fuel_1 / hours_diff) AS std_dev_liters_per_hour_2months
    FROM Client_Ticket_Sequence CTS
    WHERE CTS.ticket_date >= timestampadd(month, 2 * -1, CURRENT_TIMESTAMP)
    GROUP BY email --, user_id
) CTS_2months
    ON CTS_12months.email = CTS_2months.email
    -- AND CTS_12months.user_id = CTS_2months.user_id
```


### Share of Wallet

```sql
WITH period_best_dispersion_index AS (
    SELECT
        -- CD.user_id
        CD.email
        , CD.frequency_standard_deviation_2months
        , CD.frequency_standard_deviation_6months
        , CD.frequency_standard_deviation_12months
        , CD.avg_hours_between_supplies_2months
        , CD.avg_hours_between_supplies_6months
        , CD.avg_hours_between_supplies_12months
        , CD.avg_liters_per_hour_2months
        , CD.avg_liters_per_hour_6months
        , CD.avg_liters_per_hour_12months
        , CD.avg_liters_per_supplies_2months
        , CD.avg_liters_per_supplies_6months
        , CD.avg_liters_per_supplies_12months
        , CD.number_of_tickets_2months
        , CD.number_of_tickets_6months
        , CD.number_of_tickets_12months
        , CASE -- Get Period with best dispersion index
            WHEN CD.frequency_dispersion_index_2months > 0
                AND CD.frequency_dispersion_index_2months < CD.frequency_dispersion_index_6months
                AND CD.frequency_dispersion_index_2months < CD.frequency_dispersion_index_12months 
            THEN '2 months'
            WHEN CD.frequency_dispersion_index_6months > 0
                AND CD.frequency_dispersion_index_6months < CD.frequency_dispersion_index_12months 
            THEN '6 months'
            ELSE '12 months'
        END AS best_period
    FROM Client_Consumption_Profile CD 
),
clients_description_with_average_consumption AS (
	SELECT 
        -- pbdi.user_id
        pbdi.email
        , CASE
            WHEN pbdi.best_period = '2 months' THEN pbdi.frequency_standard_deviation_2months
            WHEN pbdi.best_period = '6 months' THEN pbdi.frequency_standard_deviation_6months 
            ELSE pbdi.frequency_standard_deviation_12months
        END frequency_standard_deviation
        , CASE
            WHEN pbdi.best_period = '2 months' THEN pbdi.avg_hours_between_supplies_2months
            WHEN pbdi.best_period = '6 months' THEN pbdi.avg_hours_between_supplies_6months 
            ELSE pbdi.avg_hours_between_supplies_12months 
        END avg_hours_between_supplies
        , CASE
            WHEN pbdi.best_period = '2 months' THEN pbdi.avg_liters_per_supplies_2months
            WHEN pbdi.best_period = '6 months' THEN pbdi.avg_liters_per_supplies_6months 
            ELSE pbdi.avg_liters_per_supplies_12months 
        END avg_liters_per_supply
        , CASE
            WHEN pbdi.best_period = '2 months' THEN pbdi.number_of_tickets_2months
            WHEN pbdi.best_period = '6 months' THEN pbdi.number_of_tickets_6months
            ELSE pbdi.number_of_tickets_12months 
        END number_of_tickets
        , CASE
            WHEN pbdi.best_period = '2 months' THEN pbdi.avg_liters_per_hour_2months
            WHEN pbdi.best_period = '6 months' THEN pbdi.avg_liters_per_hour_6months
            ELSE pbdi.avg_liters_per_hour_12months 
        END avg_liters_per_hour
        , pbdi.number_of_tickets_12months
	FROM period_best_dispersion_index pbdi
)
SELECT DISTINCT
    CAST(CTS.ticket_date AS DATE) AS ticket_date
    , SUM(CTS.quantity_fuel_1) AS quantity_fuel
    , SUM(CD.avg_liters_per_hour * CTS.hours_diff) AS forecasted_consumed_liters
    , SUM(
        CASE
            WHEN (CD.avg_liters_per_hour * CTS.hours_diff) - CTS.quantity_fuel_1 <= CD.avg_liters_per_supply * 4 THEN (CD.avg_liters_per_hour * CTS.hours_diff) - CTS.quantity_fuel_1
            ELSE CD.avg_liters_per_supply * 4
        END
    ) AS min_lost_liters
FROM Client_Ticket_Sequence CTS
GROUP BY 1
```

### Probability of Churn

```sql
/* =======================================================
 * Get the last supply by client. The date from the last supply will be the "basis" for the next purchase day forecast.
 * =======================================================
 */
WITH last_supply_date_per_client AS (
    SELECT 
        CTS.email
        , MAX(CTS.second_date) AS last_date
    FROM Client_Ticket_Sequence CTS
    GROUP BY CTS.email
),
last_supply_per_client AS (
	SELECT 
        LS.email
        , LS.last_date
        , CTS.quantity_fuel_2 AS quantity_fuel
	FROM Client_Ticket_Sequence CTS 
	INNER JOIN last_supply_date_per_client LS
        ON CTS.email = LS.email AND CTS.second_date = LS.last_date
),
/* =======================================================
 * Understand in which of the 3 periods above the client is more consistent,
 * considering the frequency index of dispersion (https://en.wikipedia.org/wiki/Index_of_dispersion).
 * Taking into account the best period, it is calculated the forecast, considering all the data from that period.
 * 
 * For instance, best period = 2 months
 * Next Purchase Date = Last Supply Date + HOURS(Last Supply Liters / Average Consumption per Hour in the last 2 Months)
 * ======================================================
 */
best_dispersion_period AS (
    SELECT
        CD.email
        , max_time_between_supplies
        , LSPC.last_date AS last_supply_date
        , LSPC.quantity_fuel AS last_supply_liters
        , avg_discount
        , total_discount
        , frequency_standard_deviation_2months
        , frequency_standard_deviation_6months
        , frequency_standard_deviation_12months
        , avg_hours_between_supplies_2months
        , avg_hours_between_supplies_6months
        , avg_hours_between_supplies_12months
        , median_hours_between_supplies_2months
        , median_hours_between_supplies_6months
        , median_hours_between_supplies_12months
        , avg_liters_per_hour_2months
        , avg_liters_per_hour_6months
        , avg_liters_per_hour_12months
        , std_dev_liters_per_hour_2months
        , std_dev_liters_per_hour_6months
        , std_dev_liters_per_hour_12months
        , avg_liters_per_supplies_2months
        , avg_liters_per_supplies_6months
        , avg_liters_per_supplies_12months
        , number_of_tickets_2months
        , number_of_tickets_6months
        , number_of_tickets_12months
        , frequency_dispersion_index_2months
        , frequency_dispersion_index_6months
        , frequency_dispersion_index_12months
        , liters_per_hour_dispersion_index_2months
        , liters_per_hour_dispersion_index_6months
        , liters_per_hour_dispersion_index_12months
        , CASE -- Get Period with best dispersion index
            WHEN CD.frequency_dispersion_index_2months > 0
                AND CD.frequency_dispersion_index_2months < CD.frequency_dispersion_index_6months
                AND CD.frequency_dispersion_index_2months < CD.frequency_dispersion_index_12months
                THEN '2 months'
            WHEN CD.frequency_dispersion_index_6months > 0
                AND CD.frequency_dispersion_index_6months < CD.frequency_dispersion_index_12months
                THEN '6 months'
            ELSE '12 months'
        END AS best_period
        , EXTRACT(EPOCH FROM CURRENT_TIMESTAMP - LSPC.last_date)/3600 AS hours_since_last_supply
    FROM Client_Consumption_Profile CD 
    INNER JOIN last_supply_per_client LSPC
        ON CD.email = LSPC.email
),
next_purchase_day_table AS (
	SELECT 
		email
		, max_time_between_supplies
		, avg_discount
		, total_discount
		, CASE
			WHEN best_period = '2 months' THEN frequency_standard_deviation_2months
			WHEN best_period = '6 months' THEN frequency_standard_deviation_6months 
			ELSE frequency_standard_deviation_12months 
		END std_dev_frequency
		, CASE
			WHEN best_period = '2 months' THEN std_dev_liters_per_hour_2months
			WHEN best_period = '6 months' THEN std_dev_liters_per_hour_6months
			ELSE std_dev_liters_per_hour_12months
		END std_dev_liters_per_hour
		, CASE
			WHEN best_period = '2 months' THEN avg_hours_between_supplies_2months
			WHEN best_period = '6 months' THEN avg_hours_between_supplies_6months 
			ELSE avg_hours_between_supplies_12months 
		END avg_hours_between_supplies
		, CASE
			WHEN best_period = '2 months' THEN median_hours_between_supplies_2months
			WHEN best_period = '6 months' THEN median_hours_between_supplies_6months 
			ELSE median_hours_between_supplies_12months 
		END median_hours_between_supplies
		, CASE
			WHEN best_period = '2 months' THEN avg_liters_per_supplies_2months
			WHEN best_period = '6 months' THEN avg_liters_per_supplies_6months 
			ELSE avg_liters_per_supplies_12months 
		END avg_liters_per_supply
		, best_period AS best_frequency_period
		, CASE
			WHEN best_period = '2 months' THEN frequency_dispersion_index_2months
			WHEN best_period = '6 months' THEN frequency_dispersion_index_6months
			ELSE frequency_dispersion_index_12months 
		END frequency_dispersion
		, CASE
			WHEN best_period = '2 months' THEN liters_per_hour_dispersion_index_2months
			WHEN best_period = '6 months' THEN liters_per_hour_dispersion_index_6months
			ELSE liters_per_hour_dispersion_index_12months 
		END liters_per_hour_dispersion
		, last_supply_date
		, last_supply_liters
		, CASE
			WHEN best_period = '2 months' THEN number_of_tickets_2months
			WHEN best_period = '6 months' THEN number_of_tickets_6months
			ELSE number_of_tickets_12months 
		END number_of_tickets
		, CASE
			WHEN best_period = '2 months' THEN avg_liters_per_hour_2months
			WHEN best_period = '6 months' THEN avg_liters_per_hour_6months
			ELSE avg_liters_per_hour_12months 
		END avg_liters_per_hour
		, CASE
			WHEN best_period = '2 months' AND avg_liters_per_hour_2months = 0 THEN NULL
			WHEN best_period = '2 months' THEN timestampadd(hour, CAST((last_supply_liters / avg_liters_per_hour_2months) AS INT), last_supply_date)
			WHEN best_period = '6 months' AND avg_liters_per_hour_6months = 0 THEN NULL
			WHEN best_period = '6 months' THEN timestampadd(hour, CAST((last_supply_liters / avg_liters_per_hour_6months) AS INT), last_supply_date)
			ELSE 
				CASE 
				WHEN avg_liters_per_hour_12months = 0 THEN NULL
				ELSE timestampadd(hour, CAST((last_supply_liters / avg_liters_per_hour_12months) AS INT), last_supply_date)
				END
		END next_purchase_day
		, number_of_tickets_12months AS n_tickets
	FROM best_dispersion_period
),
/* =======================================================
 * Select only the forecast between the 1% and 99% of the average consumption per hour.
 * Basically, remove the outliers of that variable.
 * Besides that, only select the clients that are in the "Regular Very Frequent" cluster.
 * WITHIN 0.01 AND 0.99 PERCENTILES
 * =======================================================
 */
forecasts AS (
	SELECT *
	FROM next_purchase_day_table NP, (
		SELECT 
			PERCENTILE_CONT(0.02) WITHIN GROUP (ORDER BY avg_liters_per_hour) AS PERCENTILE_02,
			PERCENTILE_CONT(0.98) WITHIN GROUP (ORDER BY avg_liters_per_hour) AS PERCENTILE_98
		FROM next_purchase_day_table
	) NP2
	WHERE TRUE
		AND NP.number_of_tickets >= 4
		AND NP.avg_liters_per_hour <= NP2.PERCENTILE_98
		AND NP.avg_liters_per_hour >= NP2.PERCENTILE_02
),
/* =======================================================
 * Forecast for a second time for the "target" clients.
 * If they failed the first purchase date, probably they went to supply in the competition.
 * As that, we forecast again based on the first forecasted purchase date, to get the most probable date for a new supply.
 * =======================================================
 */
_pre_sec_next_purchase_day AS (
    SELECT 
        email
        , last_supply_date
        , last_supply_liters
        , max_time_between_supplies
        , avg_discount
        , total_discount
        , n_tickets
        , (EXTRACT(EPOCH FROM CURRENT_TIMESTAMP() - last_supply_date) / 3600) / avg_hours_between_supplies AS lost_supplies
        , CASE 
            WHEN avg_hours_between_supplies > median_hours_between_supplies THEN (EXTRACT(EPOCH FROM CURRENT_TIMESTAMP() - last_supply_date) / 3600) / avg_hours_between_supplies
            ELSE (EXTRACT(EPOCH FROM CURRENT_TIMESTAMP() - last_supply_date) / 3600) / median_hours_between_supplies
        END AS min_lost_supplies
        , ROUND(avg_liters_per_hour * 24, 2) AS avg_liters_per_day
        , ROUND(avg_hours_between_supplies / 24, 2) AS avg_days_between_supplies
        , ROUND(median_hours_between_supplies / 24, 2) AS median_days_between_supplies
        , next_purchase_day
        , avg_liters_per_supply
        , avg_liters_per_hour
        , std_dev_frequency
    FROM forecasts VF
    WHERE CURRENT_TIMESTAMP() >= timestampadd(hour, CAST(std_dev_frequency * 0.75 AS INT), "next_purchase_day")
),
second_next_purchase_day AS (
    SELECT 
		email
		, last_supply_date
		, last_supply_liters
		, next_purchase_day AS FAILED_next_purchase_day
		, avg_liters_per_day
		, avg_days_between_supplies
		, median_days_between_supplies
		, max_time_between_supplies
		, avg_discount
		, total_discount
		, CASE 
			WHEN DATEDIFF(CURRENT_TIMESTAMP, last_supply_date) >= (max_time_between_supplies / 24) * 1.5 THEN 1
			ELSE DATEDIFF(CURRENT_TIMESTAMP, last_supply_date) / ((max_time_between_supplies / 24) * 1.5)
		END AS churn_prob
		, n_tickets
		, FLOOR(lost_supplies) AS lost_supplies
		, FLOOR(min_lost_supplies) AS min_lost_supplies
		, CAST(
            timestampadd(hour, CAST((avg_days_between_supplies * 24 * (lost_supplies - 1) + (avg_liters_per_supply / avg_liters_per_hour) - (std_dev_frequency * 0.75)) AS INT) , next_purchase_day) AS DATE
        ) AS next_purchase_day_min
		, CAST(
            timestampadd(hour, CAST((avg_days_between_supplies * 24 * (lost_supplies - 1) + (avg_liters_per_supply / avg_liters_per_hour) + (std_dev_frequency * 0.75)) AS INT) , next_purchase_day) AS DATE
        ) AS next_purchase_day_max
		, CAST(
            timestampadd(hour, CAST((avg_days_between_supplies * 24 * lost_supplies + (avg_liters_per_supply / avg_liters_per_hour) - (std_dev_frequency * 0.75)) AS INT) , next_purchase_day) AS DATE
        ) AS next_purchase_day_2_min
		, CAST(
            timestampadd(hour, CAST((avg_days_between_supplies * 24 * lost_supplies + (avg_liters_per_supply / avg_liters_per_hour) + (std_dev_frequency * 0.75)) AS INT) , next_purchase_day) AS DATE
        ) AS next_purchase_day_2_max
    FROM _pre_sec_next_purchase_day
)
SELECT DISTINCT
	SP.*
FROM second_next_purchase_day SP
```
