package org.example.quorabackend.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import lombok.*;

import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Topic extends BaseModel{
    @Column(nullable = false)
    String name;

    @ManyToMany(mappedBy = "topics")
    private List<Question> Questions;
}
