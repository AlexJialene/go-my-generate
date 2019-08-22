package {{.PackageName}}.controller.right;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import {{.PackageName}}.domain.{{.EntityName}};
import {{.PackageName}}.service.{{.EntityName}}Service;
import {{.PackageName}}.vo.IdAndNameVo;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

/**
 * @author {{.Author}}
 * @date {{.Date}}
 */
@Controller
public class {{.EntityName}}Controller {

    @Autowired
    private {{.EntityName}}Service {{.LowercaseEntityName}}Service;

    @GetMapping("/pv/{{.LowercaseEntityName}}/list")
    public String list(Model model,
                       {{.EntityName}} {{.LowercaseEntityName}},
                       @RequestParam(required = false, defaultValue = "1") int pageNum,
                       @RequestParam(required = false, defaultValue = "10") int pageSize) {
        QueryWrapper<{{.EntityName}}> queryWrapper = new QueryWrapper<>();

        PageHelper.startPage(pageNum, pageSize);
        List<{{.EntityName}}> {{.LowercaseEntityName}}s = this.{{.LowercaseEntityName}}Service.list(queryWrapper);

        model.addAttribute("pageInfo", new PageInfo<>({{.LowercaseEntityName}}s));
        model.addAttribute("{{.LowercaseEntityName}}", {{.LowercaseEntityName}});
        model.addAttribute("pageSize", pageSize);
        return "{{.LowercaseEntityName}}/{{.LowercaseEntityName}}";
    }

    @GetMapping("/pv/{{.LowercaseEntityName}}/add{{.EntityName}}")
    public String add{{.EntityName}}() {
        return "{{.LowercaseEntityName}}/add{{.EntityName}}";
    }

    @GetMapping("/pv/{{.LowercaseEntityName}}/view/{id}")
    public String add{{.EntityName}}(Model model, @PathVariable("id") Long id) {
        {{.EntityName}} {{.LowercaseEntityName}} = this.{{.LowercaseEntityName}}Service.getById(id);

        model.addAttribute("{{.LowercaseEntityName}}", {{.LowercaseEntityName}});
        return "{{.LowercaseEntityName}}/add{{.EntityName}}";
    }

    @PostMapping("/pv/{{.LowercaseEntityName}}/save")
    public String save({{.EntityName}} {{.LowercaseEntityName}}) {
        if (Objects.isNull({{.LowercaseEntityName}}.getId())) {
            {{.LowercaseEntityName}}.setPriority(IdWorker.getId());
        }

        this.{{.LowercaseEntityName}}Service.saveOrUpdate({{.LowercaseEntityName}});
        return "redirect:/pv/{{.LowercaseEntityName}}/list";
    }

    @GetMapping("/pv/{{.LowercaseEntityName}}/delete/{id}")
    public String add{{.EntityName}}(@PathVariable("id") Long id) {
        this.{{.LowercaseEntityName}}Service.removeById(id);
        return "redirect:/pv/{{.LowercaseEntityName}}/list";
    }

    @GetMapping("/pb/{{.LowercaseEntityName}}/list/ajax")
    @ResponseBody
    public Object listAjax(@RequestParam(required = false, defaultValue = "1") int pageNum,
                           @RequestParam(required = false, defaultValue = "100") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return this.{{.LowercaseEntityName}}Service.selectAjax(null , IdAndNameVo.class);
    }
}