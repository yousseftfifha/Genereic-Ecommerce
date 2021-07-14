package com.group3s2i.springboot.Model;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


/**
 * @author tfifha youssef
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "orders")
public class Order implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "dueamount")
    private Double dueamount;

    @Column(name = "innonumber")
    private int innoNumber;

    @Column(name = "orderdate")
    private Date date;

    @Column(name = "status")
    private String status;

    @Column(name = "orderNum")
    private String orderNum;


    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name="userID")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private User userID;

    @OneToOne(fetch = FetchType.LAZY, cascade =  CascadeType.ALL, mappedBy = "orderID")
    @JsonIgnoreProperties("orderID")
    private OrderDetails details;

    public Order() {
    }

    public Order(Long id, Double dueamount, int innoNumber, Date date, String status, String orderNum, User userID) {
        this.id = id;
        this.dueamount = dueamount;
        this.innoNumber = innoNumber;
        this.date = date;
        this.status = status;
        this.orderNum = orderNum;
        this.userID = userID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getDueamount() {
        return dueamount;
    }

    public void setDueamount(Double dueamount) {
        this.dueamount = dueamount;
    }

    public int getInnoNumber() {
        return innoNumber;
    }

    public void setInnoNumber(int innoNumber) {
        this.innoNumber = innoNumber;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public User getUserID() {
        return userID;
    }

    public void setUserID(User userID) {
        this.userID = userID;
    }

    public OrderDetails getDetails() {
        return details;
    }

    public void setDetails(OrderDetails details) {
        this.details = details;
    }
}
