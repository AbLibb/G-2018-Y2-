package com.accp.Email.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Param;

import com.accp.Email.pojo.Efile;
import com.accp.Email.pojo.Efolder;
import com.accp.Email.pojo.Email;
import com.accp.Email.pojo.Erelation;
import com.accp.Email.pojo.Euser;
public interface EmailMapper {
   List<Euser> login();
   List<Efolder> zhuyeleft(@Param("euid")int euid);
   int getcount(@Param("euid")int euid,@Param("efid")int efid);
   List<Email> getfajian(@Param("senderid")int senderid,@Param("efid")int efid,@Param("begin")int begin,@Param("size")int size);
   int getfajiancount(@Param("senderid")int senderid,@Param("efid")int efid);
   Euser getname(@Param("receivercodeid")int receivercodeid);
   void belaji(@Param("efid")int efid,@Param("esid")int esid);
   void savewen(@Param("euid")int euid,@Param("foldername")String foldername);
   List<Email> getshoujian(@Param("receivercodeid")int receivercodeid,@Param("begin")int begin,@Param("size")int size);
   int getshoujiancount(@Param("receivercodeid")int receivercodeid);
   Erelation getone(@Param("esid")int esid,@Param("euid")int uid);
   Erelation getone2(@Param("esid")int esid,@Param("euid")int uid);
   void updateyd(@Param("time")Date time,@Param("Erid")int Erid);
   void updatewd(@Param("time")Date time,@Param("Erid")int Erid);
   void updateyichu(@Param("efid")int efid,@Param("Erid")int Erid);
   void updateyichu2(@Param("efid")int efid,@Param("Erid")int Erid);
   int weidu(@Param("uid")int uid,@Param("efid")int efid);
   List<Email> getlajilist(@Param("uid")int uid,@Param("begin")int begin,@Param("size")int size);
   int getlajicount(@Param("uid")int uid);
   List<Erelation> dellist(@Param("esid")int esid);
   void delere(@Param("Erid")int Erid);
   void delemail(@Param("esid")int esid);
   List<Euser> mohuuser(@Param("uname")String uname); 
   List<Email> getshoujianmohu(@Param("receivercodeid")int receivercodeid,@Param("uid")int uid);
   int getshoujianmohucount(@Param("receivercodeid")int receivercodeid,@Param("uid")int uid);
   List<Email> getfajianone(@Param("senderid")int senderid,@Param("esid")int esid);
   int insert(Euser record);
   int oo(@Param("receivercodeid")int receivercodeid,@Param("efid")int efid);
   int ooo(@Param("receivercodeid")int receivercodeid);
	Integer insertEmail(Email eemail);
	Integer insertErelation(Erelation erelation);
	Integer insertEfile(Efile efile);
	void delfj(@Param("esid")int esid);
	List<Efile> delfjlist(@Param("esid")int esid);
}
