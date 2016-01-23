package domain;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by martsforever on 2016/1/14.
 */
@Entity
@Table(name = "lecture", catalog = "sat")
public class Lecture {

    private int id;
    private String name;
    private String introduce;
    private String link;
    private String time;

    private Set<Person> personList;

    public Lecture() {
    }

    public Lecture(String name, String introduce, String link, String time) {
        this.name = name;
        this.introduce = introduce;
        this.link = link;
        this.time = time;
    }

    @Override
    public String toString() {
        return "Lecture{" +
                "time='" + time + '\'' +
                ", link='" + link + '\'' +
                ", introduce='" + introduce + '\'' +
                ", name='" + name + '\'' +
                ", id=" + id +
                '}';
    }

    @GeneratedValue
    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "introduce")
    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    @Column(name = "link")
    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Column(name = "time")
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(
            name = "lecture_person",
            joinColumns = @JoinColumn(name = "lecture_id"),
            inverseJoinColumns = @JoinColumn(name = "person_id")
    )
    public Set<Person> getPersonList() {
        return personList;
    }

    public void setPersonList(Set<Person> personList) {
        this.personList = personList;
    }
}
