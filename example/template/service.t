package {{.PackageName}}.service;

import {{.PackageName}}.{{.EntityName}};
import {{.PackageName}}.BaseService;

import java.util.List;

/**
 * @author {{.Author}}
 * @date {{.Date}}
 */
public interface {{.EntityName}}Service extends BaseService<{{.EntityName}}> {

    List<{{.EntityName}}> list{{.EntityName}}({{.LowercaseEntityName}})();
}
