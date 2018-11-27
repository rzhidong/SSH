package com.ssh.entity;

import java.util.Date;

import javax.persistence.*;

/**
 * @author Xuanyuan
 *
 */
@Entity
@Table(name = "Person")
public class Person {

	@Id
	@GeneratedValue
	private Long id;

	@Column(name = "created")
	private Date created = new Date();

	@Column(name = "username")
	private String username;

	@Column(name = "address")
	private String address;

	@Column(name = "phone")
	private String phone;

	@Column(name = "remark")
	private String remark;

	@Column(name = "flgdeleted")
	private int flgdeleted;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreated() {
		return created;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getFlgdeleted() {
		return flgdeleted;
	}

	public void setFlgdeleted(int flgdeleted) {
		this.flgdeleted = flgdeleted;
	}

	@Override
	public String toString() {
		return "Person [id=" + id + ", created=" + created + ", username=" + username + ", address=" + address
				+ ", phone=" + phone + ", remark=" + remark + ", flgdeleted=" + flgdeleted + "]";
	}

}
