# Snowflake-dbt Key Pair Authentication Setup

## Run in a terminal where OpenSSL is available

Step 1: Generate private key  
`openssl genrsa 2048 | openssl pkcs8 -topk8 -v2 des3 -inform PEM -out rsa_private_key.p8`

Step 2: Generate public key  
You can choose either option:  
**Option A – Encrypted private key (requires passphrase - more secure)**: 
`openssl genrsa 2048 | openssl pkcs8 -topk8 -v2 des3 -out rsa_private_key.p8`  

**Option B – Unencrypted private key (no passphrase)**: 
`openssl genrsa 2048 | openssl pkcs8 -topk8 -nocrypt -out rsa_private_key.p8`

## Run in Snowflake CLI or Snowsight

Step 3: Configure Snowflake User Account  
`ALTER USER <username> SET RSA_PUBLIC_KEY='<public_key_string>';`
