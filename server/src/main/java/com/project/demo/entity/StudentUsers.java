package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 学生用户：(StudentUsers)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "StudentUsers")
public class StudentUsers implements Serializable {

    // StudentUsers编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "student_users_id")
    private Integer student_users_id;

    // 学生姓名
    @Basic
    private String student_name;
    // 性别
    @Basic
    private String gender;
    // 院系信息
    @Basic
    private String department_information;
    // 班级信息
    @Basic
    private String class_information;












    // 用户编号
    @Id
    @Column(name = "user_id")
    private Integer userId;


    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
