package ink.tsg.feedBack.beans;

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
 * @since 2019-11-14
 */
@TableName("tb_feed_back")
public class FeedBack extends Model<FeedBack> {

    private static final long serialVersionUID = 1L;

    /**
     * 反馈表的主键
     */
    @TableId(value = "feedback_id", type = IdType.AUTO)
    private Integer feedbackId;
    /**
     * 反馈客户的称呼
     */
    private String feedbackCustName;
    /**
     * 反馈客户的email
     */
    private String feedbackCustEmail;
    /**
     * 反馈内容
     */
    private String feedbackText;
    /**
     * 反馈的分类，连接发聩分类表的id
     */
    private Integer feedbackSortId;
    /**
     * 反馈的紧急性（0表示普通，1表示紧急）
     */
    private Integer feedbackSerious;
    /**
     * 反馈的时间
     */
    @TableField(fill = FieldFill.INSERT)
    private String createTime;
    /**
     * 解决的时间
     */
    private String solveTime;
    /**
     * 是否解决（-1表示为待解决，1表示解决）
     */
    private Integer feedIsDel;
    /**
             * 是否赠送了优惠卷（1表示未赠送，0表示已赠送）
     */
    private Integer feedIsGiven;
    /**
     * 是否删除（-1表示删除，1表示未删除）
     */
    @TableField(fill = FieldFill.INSERT)
    @TableLogic
    private Integer feedDestroy;

    public Integer getFeedIsGiven() {
		return feedIsGiven;
	}

	public void setFeedIsGiven(Integer feedIsGiven) {
		this.feedIsGiven = feedIsGiven;
	}

	public Integer getFeedDestroy() {
		return feedDestroy;
	}

	public void setFeedDestroy(Integer feedDestroy) {
		this.feedDestroy = feedDestroy;
	}

	@TableField(exist=false)
    private FeedBackSort feedBackSort;
    
    public FeedBackSort getFeedBackSort() {
		return feedBackSort;
	}

	public void setFeedBackSort(FeedBackSort feedBackSort) {
		this.feedBackSort = feedBackSort;
	}

	public Integer getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(Integer feedbackId) {
        this.feedbackId = feedbackId;
    }

    public String getFeedbackCustName() {
        return feedbackCustName;
    }

    public void setFeedbackCustName(String feedbackCustName) {
        this.feedbackCustName = feedbackCustName;
    }

    public String getFeedbackCustEmail() {
        return feedbackCustEmail;
    }

    public void setFeedbackCustEmail(String feedbackCustEmail) {
        this.feedbackCustEmail = feedbackCustEmail;
    }

    public String getFeedbackText() {
        return feedbackText;
    }

    public void setFeedbackText(String feedbackText) {
        this.feedbackText = feedbackText;
    }

    public Integer getFeedbackSortId() {
        return feedbackSortId;
    }

    public void setFeedbackSortId(Integer feedbackSortId) {
        this.feedbackSortId = feedbackSortId;
    }

    public Integer getFeedbackSerious() {
        return feedbackSerious;
    }

    public void setFeedbackSerious(Integer feedbackSerious) {
        this.feedbackSerious = feedbackSerious;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getSolveTime() {
        return solveTime;
    }

    public void setSolveTime(String solveTime) {
        this.solveTime = solveTime;
    }

    public Integer getFeedIsDel() {
        return feedIsDel;
    }

    public void setFeedIsDel(Integer feedIsDel) {
        this.feedIsDel = feedIsDel;
    }

    @Override
    protected Serializable pkVal() {
        return this.feedbackId;
    }

    @Override
    public String toString() {
        return "FeedBack{" +
        ", feedbackId=" + feedbackId +
        ", feedbackCustName=" + feedbackCustName +
        ", feedbackCustEmail=" + feedbackCustEmail +
        ", feedbackText=" + feedbackText +
        ", feedbackSortId=" + feedbackSortId +
        ", feedbackSerious=" + feedbackSerious +
        ", createTime=" + createTime +
        ", solveTime=" + solveTime +
        ", feedIsDel=" + feedIsDel +
        "}";
    }
}
