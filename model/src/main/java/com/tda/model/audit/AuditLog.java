package com.tda.model.audit;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Past;

@Entity
public class AuditLog implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;

    private Long formId;

    private String user;

    private String controllerUsed;

    @Past
    private Date timestamp;

    public AuditLog() {
        
    }

    public AuditLog(Long formId, String user, String controllerUsed, Date timestamp) {
        this.formId = formId;
        this.user = user;
        this.controllerUsed = controllerUsed;
        this.timestamp = timestamp;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Long getFormId() {
        return formId;
    }

    public void setFormId(Long formId) {
        this.formId = formId;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getControllerUsed() {
        return controllerUsed;
    }

    public void setControllerUsed(String controllerUsed) {
        this.controllerUsed = controllerUsed;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }
}
