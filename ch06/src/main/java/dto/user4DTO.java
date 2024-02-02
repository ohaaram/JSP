package dto;

public class user4DTO {
	String uid;
	String name;
	String gender;
	String age;
	String hp;
	String addr;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	@Override
	public String toString() {
		return "user4DTO [uid=" + uid + ", name=" + name + ", gender=" + gender + ", age=" + age + ", hp=" + hp
				+ ", addr=" + addr + "]";
	}	

}
