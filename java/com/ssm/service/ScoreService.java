package com.ssm.service;

import com.ssm.entity.Score;
import java.util.List;

public interface ScoreService {
    List<Score> findByStuId(Integer stuId);
    int add(Score s);
    int update(Score s);
    int delete(Integer id);
    Score findById(Integer id);
    boolean isCourseDuplicate(Integer stuId, String course, Integer excludeId);
}