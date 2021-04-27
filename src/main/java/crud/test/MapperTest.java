package crud.test;

import crud.bean.Department;
import crud.bean.Employee;
import crud.dao.DepartmentMapper;
import crud.dao.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Test
    public void testCRUD(){
        System.out.println(departmentMapper);
        System.out.println(employeeMapper);
        Employee employee = employeeMapper.selectByPrimaryKey(3);
        System.out.println(employee);
        //departmentMapper.insertSelective(new Department(null,"产品部"));
        employeeMapper.insertSelective(new Employee(null,"r3","M","r3@qq.com",2));
    }
}
