package {{.PackageName}}.controller.{{.LowercaseEntityName}};

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import {{.PackageName}}.common.exception.BizException;
import {{.PackageName}}.common.exception.BizResponse;
import {{.PackageName}}.domain.{{.LowercaseEntityName}}.{{.EntityName}};
import {{.PackageName}}.service.{{.LowercaseEntityName}}.{{.EntityName}}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author linjiayu
 * @date 2019-07-20
 */
@Controller
public class {{.EntityName}}Controller {

    @Autowired
    private {{.EntityName}}Service {{.LowercaseEntityName}}Service;

    @GetMapping("/pv/{{.LowercaseEntityName}}/list")
    public String index(Model model,
                        {{.EntityName}} {{.LowercaseEntityName}},
                        @RequestParam(required = false, defaultValue = "1") int pageNum,
                        @RequestParam(required = false, defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<{{.EntityName}}> {{.LowercaseEntityName}}s = this.{{.LowercaseEntityName}}Service.list{{.EntityName}}({{.LowercaseEntityName}});

        model.addAttribute("pageInfo", new PageInfo<>({{.LowercaseEntityName}}s));
        model.addAttribute("{{.LowercaseEntityName}}", {{.LowercaseEntityName}});
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("pageNum", pageNum);
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
    public String save({{.EntityName}} {{.LowercaseEntityName}}) throws BizException {
        this.{{.LowercaseEntityName}}Service.saveOrUpdate({{.LowercaseEntityName}});
        return "redirect:/pv/{{.LowercaseEntityName}}/list";
    }

    @GetMapping("/pv/{{.LowercaseEntityName}}/delete")
    @ResponseBody
    public BizResponse<Void> del{{.EntityName}}(@RequestBody List<Long> ids) {
        this.{{.LowercaseEntityName}}Service.removeByIds(ids);
        return new BizResponse<>(BizRetStatus.SUCCESS);
    }

    @PostMapping("/pv/{{.LowercaseEntityName}}/disable/{status}")
    @ResponseBody
    public BizResponse<Boolean> disable(@PathVariable("status") Integer status , @RequestBody List<String> ids) {
        UpdateWrapper<{{.EntityName}}> updateWrapper = new UpdateWrapper<>();
        updateWrapper.set("status" , status);
        updateWrapper.in("id" , ids);
        this.{{.LowercaseEntityName}}Service.update(updateWrapper);
        return new BizResponse<>(true);
    }

}
