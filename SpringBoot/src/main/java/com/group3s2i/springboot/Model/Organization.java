package com.group3s2i.springboot.Model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Getter
@Setter
@ToString
@Entity
@Table(name = "organization")
public class Organization implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "fiscalcode", nullable = false)
    private String fiscalCode;

    @Column(name = "patentcode", nullable = false)
    private String patentcode;

    @Column(name = "legalstatus", nullable = false)
    private String legalStatus;

    @Column(name = "category", nullable = false)
    private String category;

    @Column(name = "finality", nullable = false)
    private String finality;

    @Column(name = "size", nullable = false)
    private String size;

    @Column(name = "sector", nullable = false)
    private String sector;

    @Column(name = "scope", nullable = false)
    private String scope;

    public Organization() {
    }

    public Organization(String name, String fiscalCode, String patentcode, String legalStatus, String category, String finality, String size, String sector, String scope) {
        this.name = name;
        this.fiscalCode = fiscalCode;
        this.patentcode = patentcode;
        this.legalStatus = legalStatus;
        this.category = category;
        this.finality = finality;
        this.size = size;
        this.sector = sector;
        this.scope = scope;
    }

    public Organization(Long id, String name, String fiscalCode, String patentcode, String legalStatus, String category, String finality, String size, String sector, String scope) {
        this.id = id;
        this.name = name;
        this.fiscalCode = fiscalCode;
        this.patentcode = patentcode;
        this.legalStatus = legalStatus;
        this.category = category;
        this.finality = finality;
        this.size = size;
        this.sector = sector;
        this.scope = scope;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFiscalCode() {
        return fiscalCode;
    }

    public void setFiscalCode(String fiscalCode) {
        this.fiscalCode = fiscalCode;
    }

    public String getPatentcode() {
        return patentcode;
    }

    public void setPatentcode(String patentcode) {
        this.patentcode = patentcode;
    }

    public String getLegalStatus() {
        return legalStatus;
    }

    public void setLegalStatus(String legalStatus) {
        this.legalStatus = legalStatus;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getFinality() {
        return finality;
    }

    public void setFinality(String finality) {
        this.finality = finality;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass () != o.getClass ()) return false;
        Organization that = (Organization) o;
        return Objects.equals (getId (), that.getId ()) && Objects.equals (getName (), that.getName ()) && Objects.equals (getFiscalCode (), that.getFiscalCode ()) && Objects.equals (getPatentcode (), that.getPatentcode ()) && Objects.equals (getLegalStatus (), that.getLegalStatus ()) && Objects.equals (getCategory (), that.getCategory ()) && Objects.equals (getFinality (), that.getFinality ()) && Objects.equals (getSize (), that.getSize ()) && Objects.equals (getSector (), that.getSector ()) && Objects.equals (getScope (), that.getScope ());
    }

    @Override
    public int hashCode() {
        return Objects.hash (getId (), getName (), getFiscalCode (), getPatentcode (), getLegalStatus (), getCategory (), getFinality (), getSize (), getSector (), getScope ());
    }

    @Override
    public String toString() {
        return "Organization{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", fiscalCode=" + fiscalCode +
                ", patentcode=" + patentcode +
                ", legalStatus='" + legalStatus + '\'' +
                ", category='" + category + '\'' +
                ", finality='" + finality + '\'' +
                ", size='" + size + '\'' +
                ", sector='" + sector + '\'' +
                ", scope='" + scope + '\'' +
                '}';
    }
}