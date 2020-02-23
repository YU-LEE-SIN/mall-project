package com.nf.entity;

import lombok.Data;

@Data
public class Category {
    private Integer id;
    private String categoryName;
    private Integer parentId;
    /**注意isParent生成的getter和setter方法需要手动加上Is
     * POJO 类中布尔类型变量都不要加 is 前缀，否则部分框架解析会引起序列化错误。*/
    private Boolean Parent;

    public Category(String categoryName, int parentId, Boolean Parent, int sort,int id) {
        this.categoryName = categoryName;
        this.parentId = parentId;
        this.Parent = Parent;
        this.sort = sort;
        this.id = id;
    }

    public Boolean getIsParent() {
        return Parent;
    }

    public void setIsParent(Boolean parent) {
        Parent = parent;
    }

    public Category(String categoryName, int parentId, Boolean Parent, int sort) {
        this.categoryName = categoryName;
        this.parentId = parentId;
        this.Parent = Parent;
        this.sort = sort;
    }


    private Integer sort;

    public Category() {
    }
}
