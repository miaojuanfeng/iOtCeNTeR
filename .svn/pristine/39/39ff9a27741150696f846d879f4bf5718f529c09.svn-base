package com.krt.cloud.entity;

import com.krt.common.base.BaseEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
    import java.util.Date;
    import org.springframework.format.annotation.DateTimeFormat;

/**
* @author chenwu
* @version 1.0
* @Description: 设备上下线日志实体类
* @date 2019-04-22 09:14:56
*/
@Getter
@Setter
@ToString(callSuper = true)
public class ExistLogs extends BaseEntity {

    /**
     * 设备id
     */
    private String deviceId;

    /**
     * 上下线状态 1表示上线 0表示下线
     */
    private Byte state;

    /**
     * 上下线时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;

}