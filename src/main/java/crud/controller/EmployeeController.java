package crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import crud.bean.Employee;
import crud.bean.Msg;
import crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

//用来处理关于Employee相关的请求

/**
 * 注意使用RESTful风格
 * URI：
 * 	（1）/emp/{id}  GET  查询员工
 * 	（2）/emp/	  POST 保存员工
 * 	（3）/emp/{id}  PUT  修改员工
 * 	（4）/emp/{id}  DELETE  删除员工
 * @author xuan
 *
 */

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    /**
     * 删除员工的方法（批量删除和单个删除都是用这个方法）
     * 批量删除：1-2-3
     * 单个删除：1
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}",method=RequestMethod.DELETE)
    public Msg deleteEmpById(@PathVariable("ids") String ids) {
        if(ids.contains("-")) {//批量删除
            String[] str_ids = ids.split("-");
            List<Integer> del_ids = new ArrayList<>();
            for (String id : str_ids) {
                del_ids.add(Integer.parseInt(id));
            }
            employeeService.deleteBatch(del_ids);

        }else {//单个删除
            int id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }

        return Msg.success();
    }

    /**
     * 查询员工
     */
    @RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id) {
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp", employee);
    }

    /**
     * 检验员工信息是否唯一（以邮箱做标准）
     */
    @ResponseBody
    @RequestMapping("/checkuser")
    public Msg checkUser(String empEmail) {
        //先判断邮箱地址是否是符合规则的
        String regxEmail = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$";
        if(!empEmail.matches(regxEmail)) {
            return Msg.fail().add("va_msg", "coding error:请输入正确的邮箱地址");
        }
        //如果邮箱地址符合规则，在对其进行唯一性校验
        boolean flag = employeeService.checkUser(empEmail);
        if(flag) {
            return Msg.success();
        }else {
            return Msg.fail().add("va_msg", "coding error:邮箱地址重复");
        }
    }

    /**
     * 修改员工信息后的保存方法
     */
    @ResponseBody
    @RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
    public Msg saveEmp(Employee employee) {
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    /**
     * 员工的保存方法
     * @param employee
     * @return
     */
    @RequestMapping(value="/emp",method=RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee,BindingResult result) {
        //@Valid表示需要校验，result保存校验结果
        if(result.hasErrors()) {
            //如果校验结果中有错误，应该返回失败信息（保存在map中），在modal中显示校验失败信息
            Map<String,Object> map = new HashMap<>();
            //通过result得到错误信息
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                //遍历错误信息添加到map中
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }

    //@ResponseBody会将返回的数据以json字符串的形式返回
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
        PageHelper.startPage(pn, 5);
        List<Employee> emps = employeeService.getAll();
        PageInfo<Employee> page = new PageInfo<Employee>(emps,5);
        return Msg.success().add("pageInfo", page);
    }
}
