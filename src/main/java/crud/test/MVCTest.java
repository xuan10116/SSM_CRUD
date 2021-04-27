package crud.test;

import java.util.Arrays;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import crud.bean.Employee;
import com.github.pagehelper.PageInfo;

/**
 * 使用Spring测试模块测试请求功能，测试crud的正确性
 * （1）通过mockMvc模拟，需要传入IOC容器，（就需要标注@WebAppConfiguration注解）
 * @author xuan
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"classpath:applicationContext.xml","classpath:dispatcherServlet-servlet.xml"})
public class MVCTest {
    //传入Springmvc的ioc
    @Autowired
    WebApplicationContext context;

    //虚拟mvc请求，获取到处理结果
    MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();

        //请求成功后，取出请求域中的值（比如说之前放入的pageInfo，我们可以取出pageInfo进行验证）
        MockHttpServletRequest request = result.getRequest();
        PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码:"+pi.getPageNum());
        System.out.println("总页码:"+pi.getPages());
        System.out.println("总记录数:"+pi.getTotal());
        int[] nums = pi.getNavigatepageNums();
        System.out.println(Arrays.toString(nums));

        //获取员工数据
        List<Employee> emps = pi.getList();
        for (Employee emp : emps) {
            System.out.println(emp);
        }
    }
}
