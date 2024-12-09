package com.winterhold.Controller;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.winterhold.Model.Department;

public class GsonExclusionStrategy implements ExclusionStrategy {

    @Override
    public boolean shouldSkipField(FieldAttributes f) {
        // Loại bỏ các field có kiểu là Department trong quá trình chuyển đổi
        return f.getDeclaredClass() == Department.class;
    }

    @Override
    public boolean shouldSkipClass(Class<?> clazz) {
        return false;
    }
}
