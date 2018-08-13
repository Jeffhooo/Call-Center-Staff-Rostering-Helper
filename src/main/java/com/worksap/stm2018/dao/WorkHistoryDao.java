package com.worksap.stm2018.dao;

import com.worksap.stm2018.vo.WorkHistoryVo;

import java.sql.Timestamp;
import java.util.List;

public interface WorkHistoryDao {
    /**
     * List the work history of staff
     *
     * @param staffId
     * @param beginTime
     * @param endTime
     */
    List<WorkHistoryVo> list(String staffId, Timestamp beginTime, Timestamp endTime);
}
