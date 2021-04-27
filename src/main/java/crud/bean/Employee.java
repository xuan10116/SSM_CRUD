package crud.bean;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;

public class Employee {
    private Integer empId;

    @Pattern(regexp="(^[a-zA-Z0-9_-]{6,16})|(^[\\u2E80-\\u9FFF]{1,10})",
            message="spring warning：用户名必须是2-5位中文或者6-16位英文和数字的组合")
    private String empName;

    private String gender;

    //@Email//可以用来快速的生成一个email格式规则
    @Pattern(regexp="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
            message="spring warning：请输入正确的邮箱地址邮箱")
    private String email;

    private Integer dId;

    //希望查询员工的时候，部门的信息也查询
    private Department dept;

    public Employee() {
    }

    public Employee(Integer empId, String empName, String gender, String email, Integer dId) {
        this.empId = empId;
        this.empName = empName;
        this.gender = gender;
        this.email = email;
        this.dId = dId;
    }

    public Department getDept() {
        return dept;
    }

    public void setDept(Department dept) {
        this.dept = dept;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    @Override
    public String toString() {
        return "Employee [empId=" + empId + ", empName=" + empName + ", gender=" + gender + ", email=" + email
                + ", dId=" + dId + ", dept=" + dept + "]";
    }
}