package kopo.poly.service;

import kopo.poly.dto.UserInfoDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IUserInfoMapper {

    int insertUserInfo(UserInfoDTO pDTO) throws Exception;

    UserInfoDTO getUserIdExists(UserInfoDTO pDTO) throws Exception;

    UserInfoDTO getEmailExists(UserInfoDTO pDTO) throws Exception;

}