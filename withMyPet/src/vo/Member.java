package vo;

import java.util.Date;

public class Member{
   private String e_mail;
   private String password;
   private String img;
   private String nickname;
   private char gender;
   private Date birthdate;
   private Date reg_date;
   private int bl_flag;
   
   public Member() {
      super();
   }

   @Override
   public String toString() {
      return "Member [e_mail=" + e_mail + ", password=" + password + ", img="
            + img + ", nickname=" + nickname + ", gender=" + gender
            + ", birthdate=" + birthdate + ", reg_date=" + reg_date
            + ", bl_flag=" + bl_flag + "]";
   }

   public Member(String e_mail, String password, String img, String nickname,
         char gender, Date birthdate, Date reg_date, int bl_flag) {
      super();
      this.e_mail = e_mail;
      this.password = password;
      this.img = img;
      this.nickname = nickname;
      this.gender = gender;
      this.birthdate = birthdate;
      this.reg_date = reg_date;
      this.bl_flag = bl_flag;
   }

   public String getE_mail() {
      return e_mail;
   }

   public void setE_mail(String e_mail) {
      this.e_mail = e_mail;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getImg() {
      return img;
   }

   public void setImg(String img) {
      this.img = img;
   }

   public String getNickname() {
      return nickname;
   }

   public void setNickname(String nickname) {
      this.nickname = nickname;
   }

   public char getGender() {
      return gender;
   }

   public void setGender(char gender) {
      this.gender = gender;
   }

   public Date getBirthdate() {
      return birthdate;
   }

   public void setBirthdate(Date birthdate) {
      this.birthdate = birthdate;
   }

   public Date getReg_date() {
      return reg_date;
   }

   public void setReg_date(Date reg_date) {
      this.reg_date = reg_date;
   }

   public int getBl_flag() {
      return bl_flag;
   }

   public void setBl_flag(int bl_flag) {
      this.bl_flag = bl_flag;
   }
   
   

}