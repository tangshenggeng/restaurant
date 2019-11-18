package ink.tsg.foodMenu.beans;

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
 * @since 2019-11-18
 */
@TableName("tb_new_food")
public class NewFood extends Model<NewFood> {

    private static final long serialVersionUID = 1L;

    /**
     * 新品菜id
     */
    @TableId(value = "new_food_id", type = IdType.AUTO)
    private Integer newFoodId;
    /**
     * 菜名
     */
    private String foodName;
    /**
     * 描述
     */
    private String foodDescribe;
    /**
     * 价格
     */
    private Double foodPrice;
    /**
     * 是否展示（100展示，200不展示）
     * */
    private Integer isShow;
    /**
     * 图片路径
     */
    private String foodImg;
   
   
	/**
     * 上架时间
     */
    @TableField(fill = FieldFill.INSERT)
    private String createTime;
    /**
     * 是否删除（-1删除，1未删除）
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer foodState;

    public Integer getIsShow() {
		return isShow;
	}

	public void setIsShow(Integer isShow) {
		this.isShow = isShow;
	}

    
    
    public Integer getNewFoodId() {
        return newFoodId;
    }

    public void setNewFoodId(Integer newFoodId) {
        this.newFoodId = newFoodId;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getFoodDescribe() {
        return foodDescribe;
    }

    public void setFoodDescribe(String foodDescribe) {
        this.foodDescribe = foodDescribe;
    }

    public Double getFoodPrice() {
        return foodPrice;
    }

    public void setFoodPrice(Double foodPrice) {
        this.foodPrice = foodPrice;
    }

    public String getFoodImg() {
        return foodImg;
    }

    public void setFoodImg(String foodImg) {
        this.foodImg = foodImg;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Integer getFoodState() {
        return foodState;
    }

    public void setFoodState(Integer foodState) {
        this.foodState = foodState;
    }

    @Override
    protected Serializable pkVal() {
        return this.newFoodId;
    }

	@Override
	public String toString() {
		return "NewFood [newFoodId=" + newFoodId + ", foodName=" + foodName + ", foodDescribe=" + foodDescribe
				+ ", foodPrice=" + foodPrice + ", foodImg=" + foodImg + ", isShow=" + isShow + ", createTime="
				+ createTime + ", foodState=" + foodState + "]";
	}

}
