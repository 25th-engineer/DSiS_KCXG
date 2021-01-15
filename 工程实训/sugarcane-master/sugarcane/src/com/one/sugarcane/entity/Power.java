package com.one.sugarcane.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="POWER")
public class Power {
	private Integer powerID;
	private String powerName;
	private Set<Part>part = new HashSet<Part>();	
	@Id
	@GeneratedValue(generator="a")
	@GenericGenerator(name="a",strategy="identity")
	public Integer getPowerID() {
		return powerID;
	}
	public void setPowerID(Integer powerID) {
		this.powerID = powerID;
	}
	public String getPowerName() {
		return powerName;
	}
	public void setPowerName(String powerName) {
		this.powerName = powerName;
	}
	@ManyToMany(mappedBy="power")
	public Set<Part> getPart() {
		return part;
	}
	public void setPart(Set<Part> part) {
		this.part = part;
	}
	public Power() {}
	public Power(String powerName, Set<Part> part) {
		super();
		this.powerName = powerName;
		this.part = part;
	}
	
}
