package domain;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by martsforever on 2016/1/14.
 */
@Entity
@Table(name = "department", catalog = "sat")
public class Department {

    private int id;
    private String name;
    private String introduce;
    private String destination;
    private int minister;//部长的id

    private Set<Person> menberList;

    public Department() {
    }

    public Department(String name, String introduce, String destination, int minister) {
        this.name = name;
        this.introduce = introduce;
        this.destination = destination;
        this.minister = minister;
    }

    @Override
    public String toString() {
        return "Department{" +
                "minister=" + minister +
                ", destination='" + destination + '\'' +
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

    @Column(name = "destination")
    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    @Column(name = "minister")
    public int getMinister() {
        return minister;
    }

    public void setMinister(int minister) {
        this.minister = minister;
    }

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(
            name = "department_person",
            joinColumns = @JoinColumn(name = "department_id"),
            inverseJoinColumns = @JoinColumn(name = "person_id")
    )
    public Set<Person> getMenberList() {
        return menberList;
    }

    public void setMenberList(Set<Person> menberList) {
        this.menberList = menberList;
    }
}
