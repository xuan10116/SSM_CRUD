package crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import crud.bean.Employee;
import crud.bean.EmployeeExample;
import crud.bean.EmployeeExample.Criteria;
import crud.dao.EmployeeMapper;;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    //员工保存方法
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    //查询所有员工
    public List<Employee> getAll(){
        return employeeMapper.selectByExampleWithDept(null);
    }

    //检验员工信息是否唯一（以邮箱做标准）
    public boolean checkUser(@RequestParam("empEmail") String empEmail) {
        EmployeeExample example = new EmployeeExample();
        Criteria criteria = example.createCriteria();
        criteria.andEmailEqualTo(empEmail);
        long countByExample = employeeMapper.countByExample(example);
        return countByExample==0;
    }

    public Employee getEmp(Integer id) {
        // TODO Auto-generated method stub
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    //员工更新
    public void updateEmp(Employee employee) {
        // TODO Auto-generated method stub
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        Criteria criteria = example.createCriteria();
        //delete from tbl_emp where emp_id in (ids);
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example );
    }
}
