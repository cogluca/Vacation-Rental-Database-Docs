# Vacation rental service database schema

This project is about the analysis and architecture of a plausible persistence level in a short term rental service application

### Process

I documented the whole process in a detailed manner in the [[Integral_Documentation]]

1. I analyzed the given requirements and reduced them to standardized phrasing and a glossary
2. In a secondary phase I developed a possible conceptual schema without worrying much about redundancies, class hierarchies and composite attributes
3. I collected possible volumes of such an application and scaled the volume pool to the 1% of the total
4. With such volumes I calculated the value brought by redundant attributes with a few select operations in order to decide to remove or keep these redudancies
5. Applied some standardizations to the conceptual schema in order to help in the relational schema translation
6. Created the relational schema
7. Tried implementing the schema in a Postegres instance and tested some operations to verify the validity of my assumptions


## Main deliverables

### Conceptual schema

![Conceptual Schema](static_resources/E-R%20Diagram%20GIVE.png)


### Standardized conceptual schema

![Standardized conceptual schema](static_resources/E-R%20Ristrutturato%20GIVE.png)

