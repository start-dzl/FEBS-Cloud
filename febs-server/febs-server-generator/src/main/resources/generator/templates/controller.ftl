package ${basePackage}.${controllerPackage};

import ${basePackage}.${entityPackage}.${className};
import ${basePackage}.${servicePackage}.I${className}Service;
import ${basePackage}.request.${className}Request;
import ${basePackage}.conversion.${className}Convert;
import com.od.core.exception.ODException;
import com.od.core.request.QueryRequest;
import lombok.extern.slf4j.Slf4j;
import lombok.RequiredArgsConstructor;
import com.od.core.utils.FebsUtil;
import com.od.core.vo.ODResponse;
import io.swagger.annotations.Api;
import com.od.core.vo.PageResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

/**
 * ${tableComment} Controller
 *
 * @author ${author}
 * @date ${date}
 */
@Slf4j
@Validated
@RestController
@Api(tags = "${tableComment} ")
@RequestMapping("/api/vo/${className?uncap_first}")
@RequiredArgsConstructor
public class ${className}Controller {

    private final I${className}Service ${className?uncap_first}Service;

    private final ${className}Convert ${className?uncap_first}Convert;

<#--    @GetMapping-->
<#--    @PreAuthorize("hasAuthority('${className?uncap_first}:list')")-->
<#--    public ODResponse getAll${className}s(${className} ${className?uncap_first}) {-->
<#--        return new ODResponse().data(${className?uncap_first}Service.find${className}s(${className?uncap_first}));-->
<#--    }-->

    @GetMapping("list")
    //@PreAuthorize("hasAuthority('${className?uncap_first}:list')")
    public PageResponse<${className}> ${className?uncap_first}List(QueryRequest request, ${className}Request ${className?uncap_first}Request) {
            ${className} ${className?uncap_first} =  ${className?uncap_first}Convert.toEntity(${className?uncap_first}Request);
            return FebsUtil.page(this.${className?uncap_first}Service.find${className}s(request, ${className?uncap_first}));
    }

    @PostMapping
    //@PreAuthorize("hasAuthority('${className?uncap_first}:add')")
    public void add${className}(@RequestBody @Valid ${className}Request ${className?uncap_first}Request) throws ODException {
        try {
            ${className} ${className?uncap_first} =  ${className?uncap_first}Convert.toEntity(${className?uncap_first}Request);
            this.${className?uncap_first}Service.create${className}(${className?uncap_first});
        } catch (Exception e) {
            String message = "新增${className}失败";
            log.error(message, e);
            throw new ODException(message);
        }
    }

    @DeleteMapping
    //@PreAuthorize("hasAuthority('${className?uncap_first}:delete')")
    public void delete${className}(${className} ${className?uncap_first}) throws ODException {
        try {
            this.${className?uncap_first}Service.delete${className}(${className?uncap_first});
        } catch (Exception e) {
            String message = "删除${className}失败";
            log.error(message, e);
            throw new ODException(message);
        }
    }

    @PutMapping
    //@PreAuthorize("hasAuthority('${className?uncap_first}:update')")
    public void update${className}(@RequestBody @Valid ${className} ${className?uncap_first}) throws ODException {
        try {
            this.${className?uncap_first}Service.update${className}(${className?uncap_first});
        } catch (Exception e) {
            String message = "修改${className}失败";
            log.error(message, e);
            throw new ODException(message);
        }
    }
}
