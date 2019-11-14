package ink.tsg.feedBack.beans;

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
 * @since 2019-11-14
 */
@TableName("tb_feed_back_sort")
public class FeedBackSort extends Model<FeedBackSort> {

    private static final long serialVersionUID = 1L;

    /**
     * 反馈的分类id
     */
    @TableId(value = "feedback_sort_id", type = IdType.AUTO)
    private Integer feedbackSortId;
    /**
     * 分类的名称
     */
    private String sortName;
    /**
     * 是否删除（-1是删除，1是未删除）
     */
    private Integer isdel;


    public Integer getFeedbackSortId() {
        return feedbackSortId;
    }

    public void setFeedbackSortId(Integer feedbackSortId) {
        this.feedbackSortId = feedbackSortId;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

    @Override
    protected Serializable pkVal() {
        return this.feedbackSortId;
    }

    @Override
    public String toString() {
        return "FeedBackSort{" +
        ", feedbackSortId=" + feedbackSortId +
        ", sortName=" + sortName +
        ", isdel=" + isdel +
        "}";
    }
}
