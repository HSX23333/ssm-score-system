package com.ssm.service;

import com.ssm.entity.Score;
import com.ssm.mapper.ScoreMapper;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service
public class ScoreServiceImpl implements ScoreService {
    @Resource
    private ScoreMapper scoreMapper;

    @Override
    public List<Score> findByStuId(Integer stuId) {
        return scoreMapper.findByStuId(stuId);
    }

    @Override
    public int add(Score s) {
        return scoreMapper.add(s);
    }

    @Override
    public int update(Score s) {
        return scoreMapper.update(s);
    }

    @Override
    public int delete(Integer id) {
        return scoreMapper.delete(id);
    }

    @Override
    public Score findById(Integer id) {
        return scoreMapper.findById(id);
    }

    @Override
    public boolean isCourseDuplicate(Integer stuId, String course, Integer excludeId) {
        int count = scoreMapper.countByStuIdAndCourseExcludeId(stuId, course, excludeId);
        return count > 0;
    }
}