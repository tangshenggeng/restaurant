package ink.tsg.discount.beans;

import com.baomidou.mybatisplus.enums.IdType;
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
@TableName("tb_discount")
public class Discount extends Model<Discount> {

    private static final long serialVersionUID = 1L;

    /**
     * 优惠卷id
     */
    @TableId(value = "discount_id", type = IdType.AUTO)
    private Integer discountId;
    /**
     * 优惠卷名称
     */
    private String discountName;
    /**
     * 优惠乘数
     */
    private Double discountNum;
    /**
     * 是否可用（1表示可用，0表示不可用）
     */
    private Integer discountDel;


    public Integer getDiscountId() {
        return discountId;
    }

    public void setDiscountId(Integer discountId) {
        this.discountId = discountId;
    }

    public String getDiscountName() {
        return discountName;
    }

    public void setDiscountName(String discountName) {
        this.discountName = discountName;
    }

    public Double getDiscountNum() {
        return discountNum;
    }

    public void setDiscountNum(Double discountNum) {
        this.discountNum = discountNum;
    }

    public Integer getDiscountDel() {
        return discountDel;
    }

    public void setDiscountDel(Integer discountDel) {
        this.discountDel = discountDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.discountId;
    }

    @Override
    public String toString() {
        return "Discount{" +
        ", discountId=" + discountId +
        ", discountName=" + discountName +
        ", discountNum=" + discountNum +
        ", discountDel=" + discountDel +
        "}";
    }
}
