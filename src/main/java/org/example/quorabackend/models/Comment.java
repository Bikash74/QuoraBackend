package org.example.quorabackend.models;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.List;
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Comment extends BaseModel{
    @ManyToOne(fetch = FetchType.LAZY)
    private Answer answer;

    @Column(nullable = false)
    private String text;

    @OneToMany(mappedBy = "comment",cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<ChildComments> childComments;

    @ManyToMany(mappedBy = "commentLikes")
    private List<User> likes;


}
