import com.dream.mapper.MovieMapper;
import com.dream.po.Movie;
import com.dream.po.MovieExample;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestMoviePage {


    @Test
    public void Test() {

        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
        //从spring容器中获得mapper的代理对象
        MovieMapper mapper = applicationContext.getBean(MovieMapper.class);

        MovieExample example = new MovieExample();
        List<Movie> movies = mapper.selectByExample(example);
        for (Movie movie: movies) {
            System.out.println(movie.getMoviename());
        }
    }
}
