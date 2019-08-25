package {{.PackageName}}.service.right.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import {{.PackageName}}.domain.right.{{.EntityName}};
import {{.PackageName}}.mapper.right.{{.EntityName}}Mapper;
import {{.PackageName}}.service.impl.BaseServiceImpl;
import {{.PackageName}}.service.right.{{.EntityName}}Service;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author {{.Author}}
 * @date {{.Date}}
 */
@Service
public class {{.EntityName}}ServiceImpl extends BaseServiceImpl<{{.EntityName}}Mapper, {{.EntityName}}> implements {{.EntityName}}Service {
    @Override
    public List<{{.EntityName}}> selectList() {
        QueryWrapper<{{.EntityName}}> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByAsc("priority");
        return list(queryWrapper);
    }
}
