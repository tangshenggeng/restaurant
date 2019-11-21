package ink.tsg.foodMenu.beans;

import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;

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
 * @since 2019-11-20
 */
@TableName("tb_soon_food")
public class SoonFood extends Model<SoonFood> {

    private static final long serialVersionUID = 1L;

    /**
     * 即将上新id
     */
    @TableId(value = "soon_id", type = IdType.AUTO)
    private Integer soonId;
    /**
     * 菜名
     */
    private String foodName;
    /**
     * 描述
     */
    private String foodDescribe;
    /**
     * 推新博文
     */
    private String foodText;
    /**
     * 图片
     */
    private String foodImg;
    /**
     * 是否展示（100展示，200不展示）
     */
    private Integer isShow;
    /**
     * 上市时间
     */
    private Date upTime;
    /**
     * 添加
     */
    @TableField(exist=false)
    private String formTime;
    
    /**
     * 筛选开始时间
     * */
    @TableField(exist=false)
    private String formStartTime;
    
    /**
     * 筛选结束时间
     * */
    @TableField(exist=false)
    private String formEndTime;
    
    /**
     * 是否删除（-1删除，1未删除）
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer foodState;


    public String getFormTime() {
		return formTime;
	}

	public void setFormTime(String formTime) {
		this.formTime = formTime;
	}

	public Integer getSoonId() {
        return soonId;
    }

    public void setSoonId(Integer soonId) {
        this.soonId = soonId;
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

    public String getFoodText() {
        return foodText;
    }

    public void setFoodText(String foodText) {
        this.foodText = foodText;
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

    public Date getUpTime() {
        return upTime;
    }

    public void setUpTime(Date upTime) {
        this.upTime = upTime;
    }

    public Integer getFoodState() {
        return foodState;
    }

    public void setFoodState(Integer foodState) {
        this.foodState = foodState;
    }

    @Override
    protected Serializable pkVal() {
        return this.soonId;
    }

    public String getFormStartTime() {
		return formStartTime;
	}

	public void setFormStartTime(String formStartTime) {
		this.formStartTime = formStartTime;
	}

	public String getFormEndTime() {
		return formEndTime;
	}

	public void setFormEndTime(String formEndTime) {
		this.formEndTime = formEndTime;
	}

	@Override
	public String toString() {
		return "SoonFood [soonId=" + soonId + ", foodName=" + foodName + ", foodDescribe=" + foodDescribe
				+ ", foodText=" + foodText + ", foodImg=" + foodImg + ", isShow=" + isShow + ", upTime=" + upTime
				+ ", formTime=" + formTime + ", formStartTime=" + formStartTime + ", formEndTime=" + formEndTime
				+ ", foodState=" + foodState + "]";
	}

	
}
