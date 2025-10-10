# Snowflake-DBT Key Pair Authentication Setup

## Run in a terminal where OpenSSL is available

### Step 1: Generate private key (choose one option)

**Option A – Encrypted private key (requires passphrase, more secure):**

```bash
openssl genrsa 2048 | openssl pkcs8 -topk8 -v2 des3 -out rsa_private_key.p8
```

**Option B – Unencrypted private key (no passphrase):**

```bash
openssl genrsa 2048 | openssl pkcs8 -topk8 -nocrypt -out rsa_private_key.p8
```

### Step 2: Generate public key (always unencrypted)

```bash
openssl rsa -in rsa_private_key.p8 -pubout -out rsa_public_key.pub
```

## Run in Snowflake CLI or Snowsight

### Step 3: Configure Snowflake User Account

```sql
ALTER USER <username> SET RSA_PUBLIC_KEY='<public_key_string>';
```

---

## Notes

* With the help of OpenSSL, a **private key** and a matching **public key** are generated. The public key is derived from the private key, making it unique and usable only with that private key.
* **Snowflake** (user account) is configured with the **public key**.
* The **private key** is stored securely in the external system or tool that will connect to Snowflake **(e.g., DBT, ETL tools, CI/CD pipelines)**.
* This setup establishes a **secure handshake** between the external system and Snowflake.
* The external system can connect and be verified by Snowflake using the public key, **without sending a password**.
* This method is secure and suitable for **automated workflows** and **system-to-system passwordless connections**.

Note: A passphrase can be used to protect the private key locally within the external system. This passphrase never leaves the system and is not transmitted to Snowflake.


