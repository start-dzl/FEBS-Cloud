package ${basePackage}.conversion;

import ${basePackage}.request.${className}Request;
import ${basePackage}.${entityPackage}.${className};
import org.mapstruct.Mapper;


@Mapper(componentModel = "spring")
public interface ${className}Convert {
        ${className} toEntity(${className}Request ${className?uncap_first}Request);
}
