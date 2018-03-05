package com.dream.controller;


import com.dream.common.Page;
import com.dream.po.Movie;
import com.dream.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MovieController {

    @Autowired
    private MovieService movieService;

    @RequestMapping(value = "/movie")
    public String showMovie() {
        return "redirect:/movie/list.action";
    }

    // 客户列表
    @RequestMapping(value = "/movie/list")
    public String list(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="5")Integer rows, Model model) {

        Page<Movie> movies = movieService.findMovieList(page, rows);
        model.addAttribute("page", movies);
        //客户来源
//        List<BaseDict> fromType = systemService.findBaseDictListByType(FROM_TYPE);
        //客户所属行业
//        List<BaseDict> industryType = systemService.findBaseDictListByType(INDUSTRY_TYPE);
        //客户级别
//        List<BaseDict> levelType = systemService.findBaseDictListByType(LEVEL_TYPE);
//        model.addAttribute("fromType", fromType);
//        model.addAttribute("industryType", industryType);
//        model.addAttribute("levelType", levelType);
        //参数回显
//        model.addAttribute("custName", custName);
//        model.addAttribute("custSource", custSource);
//        model.addAttribute("custIndustry", custIndustry);
//        model.addAttribute("custLevel", custLevel);
        return "movieManage";
    }

    @RequestMapping("/movie/delete")
    @ResponseBody
    public String customerDelete(Integer id) {
        movieService.deleteMovie(id);
        return "OK";
    }

}
