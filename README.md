# generator

A tool to help me generate java code

## use

```
 go get github.com/alexjialene/go-my-generate/generate
```

> Create the following in the run directory

* config.yml

```yaml
author: lamkeizyi
entity: ClassName
package: com.keizyi
db:
  table: table name 
  database: records
  host: localhost
  port: 3306
  user: root
  password: 123456

# ./template/*.t Need to be configured here
templates:
  - template: controller.t
  - template: service.t
  - template: domain.t
  - template: service_impl.t
  - template: mapper.t
```

* ./template/ `Storing template files`
* ./output/  `After the file is generated`




