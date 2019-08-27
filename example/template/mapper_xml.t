<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="{{.PackageName}}.mapper.right.{{.EntityName}}Mapper">
    <!-- 通用查询结果列 -->
    <sql id="Base_Column_List">

    </sql>

    <resultMap id="BaseResultMap" type="{{.PackageName}}.domain.right.{{.EntityName}}">
        {{range .Fields}}
        {{$field := .Name}}
        {{if eq $field "id"}}
        <id column="{{.ColumnName}}" property="{{.Name}}" />
        {{else}}
        <result column="{{.ColumnName}}" property="{{.Name}}" />
        {{end}}
        {{end}}
    </resultMap>
</mapper>