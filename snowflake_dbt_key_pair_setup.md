# Snowflake-dbt Key Pair Authentication Setup

## Terminal Steps (OpenSSL)

Step 1: Generate private key  
`openssl genrsa 2048 | openssl pkcs8 -topk8 -v2 des3 -inform PEM -out rsa_private_key.p8`

Step 2: Generate public key  
`openssl rsa -in rsa_private_key.p8 -pubout -out rsa_public_key.pub`

## Snowflake Steps (CLI or Snowsight)

Step 3: Configure Snowflake User Account  
`ALTER USER <username> SET RSA_PUBLIC_KEY='<public_key_string>';`
