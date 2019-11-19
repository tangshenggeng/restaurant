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
 * @since 2019-11-19
 */
@TableName("tb_food_menus")
public class FoodMenus extends Model<FoodMenus> {

    private static final long serialVersionUID = 1L;

    /**
     * 菜单
     */
    @TableId(value = "menu_id", type = IdType.AUTO)
    private Integer menuId;
    /**
     * 菜名
     */
    private String foodName;
    /**
     * 原料
     */
    private String foodMaterial;
    /**
     * 原价
     */
    private Double oldPrice;
    /**
     * 促销价
     */
    private Double newPrice;
    /**
     * 图片路径
     */
    private String foodImg;
    /**
     * 是否展示（100展示，200不展示）
     */
    private Integer isShow;
    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private String createTime;
    /**
     * 是否删除（-1删除，1未删除）
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer foodState;


    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getFoodMaterial() {
        return foodMaterial;
    }

    public void setFoodMaterial(String foodMaterial) {
        this.foodMaterial = foodMaterial;
    }

    public Double getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(Double oldPrice) {
        this.oldPrice = oldPrice;
    }

    public Double getNewPrice() {
        return newPrice;
    }

    public void setNewPrice(Double newPrice) {
        this.newPrice = newPrice;
    }

    public String getFoodImg() {
        return foodImg;
    }

    public void setFoodImg(String foodImg) {
        this.foodImg = foodImg;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
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
        return this.menuId;
    }

    @Override
    public String toString() {
        return "FoodMenus{" +
        ", menuId=" + menuId +
        ", foodName=" + foodName +
        ", foodMaterial=" + foodMaterial +
        ", oldPrice=" + oldPrice +
        ", newPrice=" + newPrice +
        ", foodImg=" + foodImg +
        ", isShow=" + isShow +
        ", createTime=" + createTime +
        ", foodState=" + foodState +
        "}";
    }
}
