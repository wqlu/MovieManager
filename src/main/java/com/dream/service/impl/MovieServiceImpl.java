package com.dream.service.impl;

import com.dream.common.Page;
import com.dream.mapper.MovieMapper;
import com.dream.po.Movie;
import com.dream.po.MovieExample;
import com.dream.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Service("movieService")
@Transactional
public class MovieServiceImpl implements MovieService{

    @Autowired
    private MovieMapper movieMapper;

    @Override
    public Movie getMovieById(Integer id) {
        Movie movie = movieMapper.selectByPrimaryKey(id);
        return movie;
    }

    @Override
    public Page<Movie> findMovieList(Integer page, Integer rows) {
        Movie movie = new Movie();

        // 当前页
        movie.setStart((page-1) * rows);
        // 每页数
        movie.setRows(rows);
        // 查询电影列表
        MovieExample example = new MovieExample();
        List<Movie> movies = movieMapper.selectByExample(example);
        // 总记录数
        Integer count = movies.size();
        // 创建page返回对象
        Page<Movie> result = new Page<>();
        result.setPage(page);
        result.setRows(movies);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    @Override
    public void deleteMovie(Integer id) {
        movieMapper.deleteByPrimaryKey(id);
    }
}
