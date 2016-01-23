package domain;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by martsforever on 2016/1/14.
 */
@Entity
@Table(name = "team", catalog = "sta")
public class Team {

    private int id;
    private String name;
    private int teamSize;
    private String introduce;
    private String logo;

    private Set<Person> personList;//团队成员

    public Team() {
    }

    public Team(String name, int teamSize, String introduce, String logo) {
        this.name = name;
        this.teamSize = teamSize;
        this.introduce = introduce;
        this.logo = logo;
    }

    @Override
    public String toString() {
        return "Team{" +
                "logo='" + logo + '\'' +
                ", introduce='" + introduce + '\'' +
                ", teamSize=" + teamSize +
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

    @Column(name = "teamSize")
    public int getTeamSize() {
        return teamSize;
    }

    public void setTeamSize(int teamSize) {
        this.teamSize = teamSize;
    }

    @Column(name = "introduce")
    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    @Column(name = "logo")
    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    @ManyToMany(cascade = CascadeType.MERGE)
    @JoinTable(
            name = "team_person",
            joinColumns = @JoinColumn(name = "team_id"),
            inverseJoinColumns = @JoinColumn(name = "person_id")
    )
    public Set<Person> getPersonList() {
        return personList;
    }

    public void setPersonList(Set<Person> personList) {
        this.personList = personList;
    }
}
