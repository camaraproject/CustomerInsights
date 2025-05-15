# Algorithm Model Definition

This document reflects the CAMARA WG Recommendation regarding the concepts to be evaluated for the implementation of the underlying algorithm for a specific scoring model.

CAMARA WG recognizes this is a non-exhaustive list:
* This list can be enhanced from the learning and experience gained across different implementations
* An algorithm implementation is not required to support all the concepts listed below. Such a decision will be market by market case (i.e. country, by means of a consensus among Operators involved)

The list of concepts is depicted below:

| **ORDER (NOTE 1)** | **CONCEPT/PARAMETER (NOTE 2)** | **DESCRIPTION** | **FORMAT (NOTE 3)** | **ADDITIONAL COMMENTS** | **BASELINE CONCEPT (NOTE 4)**| 
|:-------------------|:------------------------------:|:----------------|:-------------------:|:------------------------|:-----------------------------|
| #1 | subscription_type | Contract type (Postpay, Prepay, Control/Hybrid) | string | N/A | YES |
| #2 | customer_since_months | Time since the customer belongs to the Telco Operator in months | integer | N/A | YES |
| #3 | outgoing_calls_minutes_in_{period} | Accumulated time of outgoing calls in minutes in the last {period} agreed in the specific market (1 month, 3 months, 6 months, ...) | decimal | N/A | YES |
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
| #14 | social_net_data_{unit}_{subscription}\_in\_{period} | Accumulated outgoing data session consumed in Social Networks in agreed {units}, {subscription} and {period} in the specific market:<br> * {units}: MB or GB<br>* {subscription}: Postpay, Prepay or Control/Hybrid (mixed case of Postpay/Prepay)<br>* {period}: 1 month, 3 months, 6 months, ... | decimal | This concept may have GDPR constraints in a given market to be considered. Please check regulation in the market/country for the consideration of this concept. | NO |


**NOTE 1**: This is a recommenadation for consideration order in the algorithm.<br>
**NOTE 2**: This is an informative name, the exact name of the parameter is up to the implementation.<br>
**NOTE 3**: This is a recommendation. Up to the implementation agreed in a specific market.<br>
**NOTE 4**: This is a recommendation about which concepts (marked with YES) could be considered as potential baseline for initial implementations. The others (marked with NO) would be considered as advanced features.<br>

Below table shows the Telco Operator source system that hosts the above concepts:

| **CONCEPT/PARAMETER** | **TELCO OPERATOR SOURCE SYSTEM** |
|:---------------------:|:---------------------------------|
| subscription_type | BSS |
| customer_since_months | BSS. Also related to [Tenure API functionality](https://github.com/camaraproject/Tenure) |
| outgoing_calls_minutes_in_{period} | OCS for prepay // OFCS for postpay // Both for control/hybrid |
| outgoing_sms_in_{period} | OCS for prepay // OFCS for postpay // Both for control/hybrid |
| outgoing_data_{unit}_{subscription}\_in\_{period} | OCS for prepay // OFCS for postpay // Both for control/hybrid |
| incoming_calls_minutes_in_{period} | OCS for prepay // OFCS for postpay // Both for control/hybrid |
| incoming_sms_in_{period} | OCS for prepay // OFCS for postpay // Both for control/hybrid |
| arpu_in_{period} | BSS and CRM |
| average_billing_amount_in_{period} | OFCS and Billing System |
| average_recharge_amount_in_{period} | OCS |
| max_payment_due_date_delay_in_{period} | Billing System |
| max_overdue_balance_in_{period} | Billing System |
| geographical_numbering_area | HLR/HSS (Geographical Numbering Area may be part of the phoneNumber in some countries, e.g. Brazil Numbering +55**11**xxxxxxxx) | 
| social_net_data_{unit}_{subscription}\_in\_{period} | OCS for prepay // OFCS for postpay // Both for control/hybrid |

LEGEND:
- BSS: Business Support Systems
- CRM: Customer Relationship Management
- HLR: Home Location Register
- HSS: Home Subscriber Server
- OCS: Online Charging System
- OFCS: Offline Charging System


## INFORMATIVE: Algorithm Model implementation examplification

This section provides an example about how to the algorithm could be implemented. 
The specific implementation approach in a given market MUST be discussed and agreed among involved participants (i.e. Telco Operators) in such a market.

Below example considers:
- `veritasIndex` scoring
- postpay and prepay subscriptions in market
- period of 1 month
- data units in GB
- Indicated weight for each concept considered
- Concepts considered: The ones tagged as Baseline concepts (first eitht ones)
- Example ranges for each concept associated to each score range


| **CONCEPT/PARAMETER** | **WEIGHT(%)** | **SCORE 0** | **SCORE 1** | **SCORE 2** | **SCORE 3** | **SCORE 4** | **SCORE 5** | **SCORE 6** | **SCORE 7** | **SCORE 8** | **SCORE 9** | **SCORE 10** | **SCORE 11** | **SCORE 12** |**SCORE 13** | **SCORE 14** | **SCORE 15** | **SCORE 16** | **SCORE 17** | **SCORE 18** | **SCORE 19** |
|:---------------------:|:----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:------------:|:------------:|:------------:|:-----------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|
| subscription_type | 12,5 | N/A | N/A | N/A | N/A | postpay | N/A | N/A | N/A | N/A | N/A | N/A | N/A | N/A | N/A | prepay | N/A | N/A | N/A | N/A | N/A |
| customer_since_months | 12,5 | x > 120 | 96 < x <= 120 | 72 < x <= 96 | 60 < x <= 72 | 48 < x <= 60 | 36 < x <= 48 | 24 < x <= 36 | 12 < x <= 24 | 11 < x <= 12 | 10 < x <= 11 | 9 < x <= 10 | 8 < x <= 9 | 7 < x <= 8 | 6 < x <= 7  | 5 < x <= 6 | 4 < x <= 5 | 3 < x <= 4 | 2 < x <= 3 | 1 < x <= 2 | 0 <= x <= 1 |
| outgoing_calls_minutes_in_{period} | 12,5 | x > 1140 | 1080 < x <= 1140 | 1020 < x <= 1080 | 960 < x <= 1020 | 900 < x <= 960 | 840 < x <= 900 | 780 < x <= 840 | 720 < x <= 780 | 660 < x <= 720 | 600 < x <= 660 | 540 < x <= 600 | 480 < x <= 540 | 420 < x <= 480 | 360 < x <= 420 | 300 < x <= 360 | 240 < x <= 300 | 180 < x <= 240 | 120 < x <= 180 | 60 < x <= 120 | 0 <= x <= 60 |
| outgoing_sms_in_{period} | 12,5 | > 100 | 90 < x <= 100 | 80 < x <= 90 | 70 < x <= 80 | 60 < x <= 70 | 50 < x <= 60 | 40 < x <= 50 | 35 < x <= 40 | 30 < x <= 35 | 25 < x <= 30 | 20 < x <= 25 | 15 < x <= 20 | 10 < x <= 15 | 12 < x <= 14 | 11 < x <= 13 | 8 < x <= 10 | 6 < x <= 8 | 4 < x <= 6 | 2 < x <= 4 | 0 <= x <= 2 |
| outgoing_data_{unit}_{subscription}\_in\_{period} | 12,5 | x > 160 | 150 < x <= 160 | 140 < x <= 150 | 130 < x <= 140 | 120 < x <= 130 | 110 < x <= 120 | 100 < x <= 110 | 90 < x <= 100 | 80 < x <= 90 | 70 < x <= 80 | 60 < x <= 70 | 50 < x <= 60 | 40 < x <= 50 | 30 < x <= 40 | 25 < x <= 30 | 20 < x <= 25 | 15 < x <= 20 | 10 < x <= 15 | 5 < x <= 10 | 0 <= x <= 5 |
| incoming_calls_minutes_in_{period} | 6,25 | x > 570 | 540 < x <= 570 | 510 < x <= 540 | 480 < x <= 510 | 450 < x <= 480 | 420 < x <= 450 | 390 < x <= 420 | 360 < x <= 390 | 330 < x <= 360 | 300 < x <= 330 | 270 < x <= 300 | 240 < x <= 270 | 210 < x <= 240 | 180 < x <= 210 | 150 < x <= 180 | 120 < x <= 150 | 90 < x <= 120 | 60 < x <= 90 | 30 < x <= 60 | 0 <= x <= 30 |
| incoming_sms_in_{period} | 6,25 | x > 57 | 54 < x <= 57 | 51 < x <= 54 | 48 < x <= 51 | 45 < x <= 48 | 42 < x <= 45 | 39 < x <= 42 | 36 < x <= 39 | 33 < x <= 36 | 30 < x <= 33 | 27 < x <= 30 | 24 < x <= 27 | 21 < x <= 24 | 18 < x <= 21 | 15 < x <= 18 | 12 < x <= 15 | 9 < x <= 12 | 6 < x <= 9 | 3 < x <= 6 | 0 <= x <= 3 |
| arpu_in_{period} | 25 | x > 190 | 180 < x <= 190 | 170 < x <= 180 | 160 < x <= 170 | 150 < x <= 160 | 140 < x <= 150 | 130 < x <= 140 | 120 < x <= 130 | 110 < x <= 120 | 100 < x <= 110 | 90 < x <= 100 | 80 < x <= 90 | 70 < x <= 80 | 60 < x <= 70 | 50 < x <= 60 | 40 < x <= 50 | 30 < x <= 40 | 20 < x <= 30 | 10 < x <= 20 | 0 <= x <= 10 |


**User A scenario score calculation**

| **CONCEPT/PARAMETER** | **WEIGHT(%)** | **VALUE** | **MAPPED SCORE** | **WEIGHTED SCORE** | **SCORE** |
|:---------------------:|:-------------:|:---------:|:----------------:|:------------------:|:---------:|
| subscription_type | 12,5 | postpay | 4 | 0,5 | N/A |
| customer_since_months | 12,5 | 60 | 4 | 0,5 | N/A |
| outgoing_calls_minutes_in_{period} | 12,5 | 600 | 10 | 1,25 | N/A |
| outgoing_sms_in_{period} | 12,5 | 15 | 12 | 1,5 | N/A |
| outgoing_data_{unit}_{subscription}\_in\_{period} | 12,5 | 100 | 7 | 0,875 | N/A |
| incoming_calls_minutes_in_{period} | 6,25 | 300 | 10 | 0,625 | N/A |
| incoming_sms_in_{period} | 6,25 | 10 | 16 | 1 | N/A |
| arpu_in_{period} | 25 | 100 | 10 | 2,5 | N/A |
| scoringValue | 100% | N/A | N/A | 8,75 | 9 |


**scoringValue weighted score** is indicated in **column WEIGHTED SCORE** as the sum of the **WEIGHTED SCORE** of every concept.<br>
**scoringValue** is indicated in **column SCORE** rounding to the nearest integer of the **scoringValue weighted score**
