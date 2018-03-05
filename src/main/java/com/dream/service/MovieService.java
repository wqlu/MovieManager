package com.dream.service;

import com.dream.common.Page;
import com.dream.po.Movie;

public interface MovieService {

    // 查询客户列表
    public Page<Movie> findMovieList(Integer page, Integer rows, String moviename);

    public Movie getMovieById(Integer id);

    public void deleteMovie(Integer id);
}
