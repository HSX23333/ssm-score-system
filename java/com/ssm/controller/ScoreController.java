package com.ssm.controller;

import com.ssm.entity.Score;
import com.ssm.service.ScoreService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/score")
public class ScoreController {
    @Resource
    private ScoreService scoreService;

    @RequestMapping("/toAdd")
    public String toAdd(@RequestParam Integer stuId, Model model) {
        model.addAttribute("stuId", stuId);
        return "addScore";
    }

    @RequestMapping("/add")
    public String add(Score score, @RequestParam Integer stuId, Model model) {
        score.setStuId(stuId);
        boolean duplicate = scoreService.isCourseDuplicate(stuId, score.getCourse(), null);
        if (duplicate) {
            model.addAttribute("msg", "该学生已存在此课程成绩，课程名不能重复！");
            model.addAttribute("stuId", stuId);
            return "addScore";
        }
        scoreService.add(score);
        return "redirect:/score/list?stuId=" + stuId;
    }

    @RequestMapping("/list")
    public String list(@RequestParam Integer stuId, Model model) {
        List<Score> scoreList = scoreService.findByStuId(stuId);
        model.addAttribute("scoreList", scoreList);
        model.addAttribute("stuId", stuId);
        return "scoreList";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam Integer id, @RequestParam Integer stuId) {
        scoreService.delete(id);
        return "redirect:/score/list?stuId=" + stuId;
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam Integer id, @RequestParam Integer stuId, Model model) {
        Score score = scoreService.findById(id);
        model.addAttribute("score", score);
        model.addAttribute("stuId", stuId);
        return "updateScore";
    }

    @RequestMapping("/update")
    public String update(Score score, @RequestParam Integer stuId) {
        scoreService.update(score);
        return "redirect:/score/list?stuId=" + stuId;
    }
}