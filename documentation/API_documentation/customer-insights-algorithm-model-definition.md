# Algorithm Model Definition

This document reflects the CAMARA WG Recommendation regarding the concepts to be evaluated for the implementation of the underlying algorithm for a specific scoring model.

CAMARA WG recognizes this is a non-exhaustive list:
* This list can be enhanced from the learning and experience gained across different implementations
* An algorithm implementation is not required to support all the concepts listed below. Such a decision will be market by market case (i.e. country, by means of a consensus among Operators involved)

The list of concepts is depicted below:

| **ORDER (NOTE 1)** | **CONCEPT/PARAMETER (NOTE 2)** | **DESCRIPTION** | **FORMAT (NOTE 3)** | **ADDITIONAL COMMENTS** | **BASELINE CONCEPT (NOTE 4)**| 
|:------------------:|:------------------------------:|:----------------|:-------------------:|:------------------------|:-----------------------------|
| #1 | subscription_type | Contract type (Postpay, Prepay, Control/Hybrid) | string | N/A | YES |
| #2 | customer_since_months | Time since the customer belongs to the Telco Operator in months | integer | N/A | YES |
| #3 |  outgoing_calls_minutes_in_{period} | Accumulated time of outgoing calls in minutes in the last {period} agreed in the specific market (1 month, 3 months, 6 months, ...) | decimal | N/A | YES |
| #4 | outgoing_sms_in_{period} | Accumulated number of outgoing sms in the last {period} agreed in the specific market (1 month, 3 months, 6 months, ...) | decimal | N/A | YES |
| #5 | outgoing_data_{unit}_{subscription}\_in\_{period} | Accumulated outgoing data session in agreed {units}, {subscription} and {period} in the specific market:<br> * {units}: MB or GB<br>* {subscription}: Postpay, Prepay or Control/Hybrid (mixed case of Postpay/Prepay)<br>* {period}: 1 month, 3 months, 6 months, ... | decimal | N/A | YES |
| #6 | incoming_calls_minutes_in_{period} | Accumulated time of incoming calls in minutes in the last {period} agreed in the specific market (1 month, 3 months, 6 months, ...) | decimal | N/A | YES |
| #7 | incoming_sms_in_{period} | Accumulated number of incoming sms in the last {period} agreed in the specific market (1 month, 3 months, 6 months, ...) | decimal | N/A | YES |
| #8 | arpu_in_{period} | Average revenue per user (ARPU), sometimes known as average revenue per unit, is a measure used primarily by consumer communications, digital media, and networking companies, defined as the total revenue divided by the number of subscribers in the last {period} agreed in the specific market (1 month, 3 months, 6 months, ...) | decimal | N/A | YES
| #9 | average_billing_amount_in_{period} | Average Billing Amount in the official market currency in the last {period} agreed in the specific market (1 month, 3 months, 6 months, ...) | decimal | N/A | NO |
| #10 | average_recharge_amount_in_{period} | Average Recharge Amount in the official market currency in the last {period} agreed in the specific market (1 month, 3 months, 6 months, ...) | decimal | N/A | NO |
| #11 | max_payment_due_date_delay_in_{period} | Maximum number of days the customer delayed his payment (after due date) in the last {period} agreed in the specific market (1 month, 3 months, 6 months, ...). Only applies to Postpay or Control/Hybrid | integer | N/A | NO |
| #12 | max_overdue_balance_in_{period} | Maximum balance amount in the official market currency that was not paid by due date over the last {period} agreed in the specific market (1 month, 3 months, 6 months, ...) | decimal | N/A | NO |
| #13 | geographical_numbering_area | Geographical Numbering Area, representing the part of the phone number that is linked to a geographical (Fixed or Mobile Area). | integer | Used for instance in payments, when Telco Operator has the historical payments of customers and their ubication, in order to check number of payments and their amount (i.e. to check whether he/she is a good payer). | NO | 
| #14 | social_networks_data_consumption_{unit}_{subscription}\_in\_{period} | Accumulated outgoing data session consumed in Social Networks in agreed {units}, {subscription} and {period} in the specific market:<br> * {units}: MB or GB<br>* {subscription}: Postpay, Prepay or Control/Hybrid (mixed case of Postpay/Prepay)<br>* {period}: 1 month, 3 months, 6 months, ... | decimal | This concept may have GDPR constraints in a given market to be considered. Please check regulation in the market/country for the consideration of this concept. | NO |


**NOTE 1**: This is a recommenadation for consideration order in the algorithm.
**NOTE 2**: This is an informative name, the exact name of the parameter is up to the implementation.<br>
**NOTE 3**: This is a recommendation. Up to the implementation agreed in a specific market.
**NOTE 4**: This is a recommendation about which concepts (marked with YES) could be considered as potential baseline for initial implementations. The others (marked with NO) would be considered as advanced features.<br>
