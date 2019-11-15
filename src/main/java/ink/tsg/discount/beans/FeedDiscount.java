package ink.tsg.discount.beans;

import com.baomidou.mybatisplus.enums.IdType;

import ink.tsg.untils.EmailUntils;

import com.baomidou.mybatisplus.annotations.TableId;
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
 * @since 2019-11-15
 */
@TableName("tb_feed_discount")
public class FeedDiscount extends Model<FeedDiscount> {

    private static final long serialVersionUID = 1L;

    /**
     * 反馈表和优惠卷的中间表
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 反馈表id
     */
    private Integer feedId;
    /**
     * 优惠卷表id
     */
    private Integer discountId;
    /**
     * 优惠验证码
     */
    private String discountCode;
    /**
     * 是否已经使用（0表示未使用，1表示已经使用）
     */
    private Integer isUsed;
    /**
     * 发放的时间
     */
    private String giveTime;
    /**
     * 使用的时间
     */
    private String usedTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFeedId() {
        return feedId;
    }

    public void setFeedId(Integer feedId) {
        this.feedId = feedId;
    }

    public Integer getDiscountId() {
        return discountId;
    }

    public void setDiscountId(Integer discountId) {
        this.discountId = discountId;
    }

    public String getDiscountCode() {
        return discountCode;
    }

    public void setDiscountCode(String discountCode) {
        this.discountCode = discountCode;
    }

    public Integer getIsUsed() {
        return isUsed;
    }

    public void setIsUsed(Integer isUsed) {
        this.isUsed = isUsed;
    }

    public String getGiveTime() {
        return giveTime;
    }

    public void setGiveTime(String giveTime) {
        this.giveTime = giveTime;
    }

    public String getUsedTime() {
        return usedTime;
    }

    public void setUsedTime(String usedTime) {
        this.usedTime = usedTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "FeedDiscount{" +
        ", id=" + id +
        ", feedId=" + feedId +
        ", discountId=" + discountId +
        ", discountCode=" + discountCode +
        ", isUsed=" + isUsed +
        ", giveTime=" + giveTime +
        ", usedTime=" + usedTime +
        "}";
    }
}
