package com.krt.theme.service;

import com.krt.theme.entity.Theme;
import com.krt.common.base.IBaseService;

import java.util.List;
import java.util.Map;


/**
 * 主题表服务接口层
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年10月14日
 */
public interface IThemeService extends IBaseService<Theme>{

    /**
     * 通过主题字段验证
     * @param theme
     * @return 返回true则通过
     */
    boolean checkByTheme(Theme theme);

    List<Map> selectDeviceTheme();
}
