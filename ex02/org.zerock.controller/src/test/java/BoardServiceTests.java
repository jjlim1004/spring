import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.mapper.BoardService;

import static org.junit.Assert.assertNotNull;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:/Users/imjeongjun/IdeaProjects/ex02/org.zerock.controller/web/WEB-INF/applicationContext.xml")
@Log4j
public class BoardServiceTests {

    @Setter( onMethod_ = @Autowired)
    private BoardService service;

    @Test
    public void testExist(){

        log.info(service);
        assertNotNull(service);
    }

}
