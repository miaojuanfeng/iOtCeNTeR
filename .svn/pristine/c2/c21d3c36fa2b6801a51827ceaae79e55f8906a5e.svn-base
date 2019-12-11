package com.krt.theme.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.krt.theme.entity.Theme;
import com.krt.theme.mapper.ThemeMapper;
import com.krt.theme.service.IThemeService;
import com.krt.common.base.BaseServiceImpl;

import java.util.List;
import java.util.Map;


/**
 * 主题表服务接口实现层
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年10月14日
 */
@Service
public class ThemeServiceImpl extends BaseServiceImpl<ThemeMapper, Theme> implements IThemeService {

    @Override
    public boolean checkByTheme(Theme theme) {
        Theme t = baseMapper.getByTheme(theme.getTheme());
        if (t==null){
            return true;
        }
        if (theme.getId()==null){
            return false;
        }

        //修改时
        if ((theme.getId()).equals(t.getId())){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public List<Map> selectDeviceTheme() {
        return baseMapper.selectDeviceTheme();
    }
}
