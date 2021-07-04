# Getting Started

### N-Tiers Architecture
* Model for Entities
* DAO  DATA ACCESS OBJECT  for Repositories
* Service for making crud and else using the DAO layer
* Controller for handling Requests
* DTO DATA TRANSFER OBJECT for deserializing
* Exceptions for handling exepctions
* Config for web Security and authentication
#### [N-tiers Architecture Guide of utilisation ](https://medium.com/swlh/designing-a-multi-layered-architecture-for-building-restful-web-services-with-spring-boot-and-a12ef85b77c9)
### Reference Documentation

For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/2.5.2/maven-plugin/reference/html/)
* [Create an OCI image](https://docs.spring.io/spring-boot/docs/2.5.2/maven-plugin/reference/html/#build-image)
* [Spring Boot DevTools](https://docs.spring.io/spring-boot/docs/2.5.2/reference/htmlsingle/#using-boot-devtools)
* [Spring Web](https://docs.spring.io/spring-boot/docs/2.5.2/reference/htmlsingle/#boot-features-developing-web-applications)
* [Rest Repositories](https://docs.spring.io/spring-boot/docs/2.5.2/reference/htmlsingle/#howto-use-exposing-spring-data-repositories-rest-endpoint)
* [OAuth2 Client](https://docs.spring.io/spring-boot/docs/2.5.2/reference/htmlsingle/#boot-features-security-oauth2-client)
* [Spring Data JPA](https://docs.spring.io/spring-boot/docs/2.5.2/reference/htmlsingle/#boot-features-jpa-and-spring-data)
* [Okta Spring Boot documentation](https://github.com/okta/okta-spring-boot#readme)

### Guides

The following guides illustrate how to use some features concretely:

* [Accessing data with MySQL](https://spring.io/guides/gs/accessing-data-mysql/)
* [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)
* [Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Building REST services with Spring](https://spring.io/guides/tutorials/bookmarks/)
* [Accessing JPA Data with REST](https://spring.io/guides/gs/accessing-data-rest/)
* [Accessing Neo4j Data with REST](https://spring.io/guides/gs/accessing-neo4j-data-rest/)
* [Accessing MongoDB Data with REST](https://spring.io/guides/gs/accessing-mongodb-data-rest/)
* [Accessing Data with JPA](https://spring.io/guides/gs/accessing-data-jpa/)
* [Okta-Hosted Login Page Example](https://github.com/okta/samples-java-spring/tree/master/okta-hosted-login)
* [Custom Login Page Example](https://github.com/okta/samples-java-spring/tree/master/custom-login)
* [Okta Spring Security Resource Server Example](https://github.com/okta/samples-java-spring/tree/master/resource-server)

## OAuth 2.0 and OIDC with Okta

If you don't have a free Okta developer account, you can create one with [the Okta CLI](https://cli.okta.com):

```bash
$ okta register
```

Then, register your Spring Boot app on Okta using:

```bash
$ okta apps create
```

Select **Web** > **Okta Spring Boot Starter** and accept the default redirect URIs.

