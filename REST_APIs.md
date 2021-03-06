# REST APIs

---

## General Notes:
- REST stands for Representational State Transfer
- REST is an architecture, not a standard
- It's best to send/receive `json` whenever possible. It's very flexible and very common.
- The most common operations are `GET`, `POST`, `PUT`, `PATCH`, and `DELETE`
- REST APIs use a stateless request model and may occur in any order. Each request should be an atomic operation and be completely independent from other requests. [Source](https://docs.microsoft.com/en-us/azure/architecture/best-practices/api-design)
- URIs should be based around nouns instead of verbs [Source](https://docs.microsoft.com/en-us/azure/architecture/best-practices/api-design)
  - Good: `/cars`
  - Bad: `/create_car`
- Resources should not mirror the internal structure of the database and the client should not be exposted to the internal implementation. [Source](https://docs.microsoft.com/en-us/azure/architecture/best-practices/api-design)
- Entities are often grouped into collections and should have their own unique URI. [Source](https://docs.microsoft.com/en-us/azure/architecture/best-practices/api-design)
  - Example: `/cars/5` would represent the car with the id `5`

---

## API Endpoint Validation (POST):
When validating data, I've found that the following order works best:
1. Check that the required fields are present (if expected data is missing, raise an error)
2. Validate the data against a validator (if the API expects a 5-digit number but receives a 3-digit number, raise an error)
3. Validate that the data received matches the data in the database (if a user wants to update "John" but "John" doesn't exist in the database, raise an error)

---

## Useful Resources:
- https://docs.microsoft.com/en-us/azure/architecture/best-practices/api-design
