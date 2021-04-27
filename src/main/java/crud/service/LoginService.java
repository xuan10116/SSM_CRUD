package crud.service;

import crud.bean.Admin;
import crud.dao.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
    @Autowired
    LoginMapper loginMapper;

    public Admin login(Admin admin) {
        return loginMapper.login(admin);
    }
}
