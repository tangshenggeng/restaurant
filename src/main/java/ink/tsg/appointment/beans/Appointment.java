package ink.tsg.appointment.beans;

import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author ITEr
 * @since 2019-11-17
 */
@TableName("tb_appointment")
public class Appointment extends Model<Appointment> {

    private static final long serialVersionUID = 1L;

    /**
     * 预约表的id
     */
    @TableId(value = "appointment_id", type = IdType.AUTO)
    private Integer appointmentId;
    /**
     * 预约人称呼
     */
    private String custName;
    /**
     * 预约人的电话
     */
    private String custPhone;
    /**
     * 预约人数
     */
    private Integer custNum;
    /**
     * 留言
     */
    private String custMessage;
    /**
     * 预约日期
     */
    private String appointmentDate;
    /**
     * 预约时间
     */
    private String appointmentTime;
    /**
     * 留言预约的时间
     */
    @TableField(fill = FieldFill.INSERT)
    private String createTime;
    /**
     * 是否到来（100是到来，200是未到来）
     */
    @TableField(fill = FieldFill.INSERT)
    private Integer isArrival;
    /**
     * 是否删除（1是未删除，-1是删除）
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer isDel;


    public Integer getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(Integer appointmentId) {
        this.appointmentId = appointmentId;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustPhone() {
        return custPhone;
    }

    public void setCustPhone(String custPhone) {
        this.custPhone = custPhone;
    }

    public Integer getCustNum() {
        return custNum;
    }

    public void setCustNum(Integer custNum) {
        this.custNum = custNum;
    }

    public String getCustMessage() {
        return custMessage;
    }

    public void setCustMessage(String custMessage) {
        this.custMessage = custMessage;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Integer getIsArrival() {
        return isArrival;
    }

    public void setIsArrival(Integer isArrival) {
        this.isArrival = isArrival;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.appointmentId;
    }

    @Override
    public String toString() {
        return "Appointment{" +
        ", appointmentId=" + appointmentId +
        ", custName=" + custName +
        ", custPhone=" + custPhone +
        ", custNum=" + custNum +
        ", custMessage=" + custMessage +
        ", appointmentDate=" + appointmentDate +
        ", appointmentTime=" + appointmentTime +
        ", createTime=" + createTime +
        ", isArrival=" + isArrival +
        ", isDel=" + isDel +
        "}";
    }
}
