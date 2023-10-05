package kopo.poly.service;

import kopo.poly.dto.NoticeDTO;
import kopo.poly.dto.UserInfoDTO;

import java.util.List;

public interface IUserInfoService {

    UserInfoDTO getUserIdExists(UserInfoDTO pDTO) throws Exception;
    UserInfoDTO getEmailExists(UserInfoDTO pDTO) throws Exception;
    int insertUserInfo(UserInfoDTO pDTO) throws Exception;
    // List<UserInfoDTO> getUserList() throws Exception;
    //UserInfoDTO getUserInfo(UserInfoDTO pDTO, boolean type) throws Exception;
    UserInfoDTO getLogin(UserInfoDTO pDTO) throws Exception;
    UserInfoDTO searchUserIdOrPasswordProc(UserInfoDTO pDTO) throws Exception;
    UserInfoDTO getUserId(UserInfoDTO pDTO) throws Exception;
    // 비밀번호 재설정
    int newPasswordProc(UserInfoDTO pDTO) throws Exception;

}



