package {{.PackageName}}.domain.right;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import {{.PackageName}}.domain.base.BaseEntity;
import lombok.Data;

import java.util.List;

/**
 * @author {{.Author}}
 * @date {{.Date}}
 */
@Data
@TableName("{{.TableName}}")
public class {{.EntityName}} extends BaseEntity<{{.EntityName}}> {

   {{range .Fields}}
    /**
     * {{.Comment}}
     */
    private {{.TypeName}} {{.Name}};
   {{end}}

}
