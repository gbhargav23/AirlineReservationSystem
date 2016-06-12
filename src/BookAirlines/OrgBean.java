package BookAirlines;

public class OrgBean {
	 private String orgname;
	 private String orgaddress;
	 public OrgBean(String orgname, String orgaddress) {
		 setOrgname(orgname);
		 setOrgaddress(orgaddress);
	 }
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getOrgaddress() {
		return orgaddress;
	}
	public void setOrgaddress(String orgaddress) {
		this.orgaddress = orgaddress;
	}
	 
}
