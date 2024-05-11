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
public class Question extends BaseModel{
    @Column(nullable = false)
    String title;

    @Column(nullable = false)
    String body;

    @ManyToMany
    @JoinTable(
            name = "question_topics",
            joinColumns = @JoinColumn(name = "question_id"),
            inverseJoinColumns = @JoinColumn(name = "topic_id")
    )
    List<Topic> topics;

    @ManyToOne(fetch = FetchType.LAZY)
    User user;

    @ManyToMany(mappedBy = "questionLikes")
    private List<User> Likes;

    @OneToMany(mappedBy = "question",cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Answer> answers;
}
