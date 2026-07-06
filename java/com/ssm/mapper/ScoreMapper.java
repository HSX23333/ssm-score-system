package com.ssm.mapper;

import com.ssm.entity.Score;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface ScoreMapper {
    // 根据学生ID查询所有成绩
    List<Score> findByStuId(@Param("stuId") Integer stuId);

    int add(Score score);
    int update(Score score);
    int delete(@Param("id") Integer id);
    Score findById(@Param("id") Integer id);

    // 检查同一学生是否存在相同课程（排除指定id）
    int countByStuIdAndCourseExcludeId(@Param("stuId") Integer stuId,
                                       @Param("course") String course,
                                       @Param("id") Integer id);
}