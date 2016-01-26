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
    private int currentSize;
    private String introduce;
    private String logo;
    private String publishTime;
    private int ministerId;
    private String expiryDate;
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
                "id=" + id +
                ", name='" + name + '\'' +
                ", teamSize=" + teamSize +
                ", currentSize=" + currentSize +
                ", introduce='" + introduce + '\'' +
                ", logo='" + logo + '\'' +
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

    @Column(name = "currentSize")
    public int getCurrentSize() {
        return currentSize;
    }

    public void setCurrentSize(int currentSize) {
        this.currentSize = currentSize;
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

    @Column(name = "publishTime")
    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    @Column(name = "expiryDate")
    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    @Column(name = "ministerId")
    public int getMinisterId() {
        return ministerId;
    }

    public void setMinisterId(int ministerId) {
        this.ministerId = ministerId;
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
