package domain;

import javax.persistence.*;

/**
 * Created by martsforever on 2016/1/13.
 */
@Entity
@Table(name = "competition", catalog = "sta")
public class Competition {
    private int id;
    private String name;
    private String time;
    private String link;
    private String introduce;


    public Competition() {
    }

    public Competition(String name, String time, String link, String introduce) {
        this.name = name;
        this.time = time;
        this.link = link;
        this.introduce = introduce;
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

    @Column(name = "time")
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Column(name = "link")
    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Column(name = "introduce")
    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    @Override
    public String toString() {
        return "Competition{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", time='" + time + '\'' +
                ", link='" + link + '\'' +
                ", introduce='" + introduce + '\'' +
                '}';
    }
}
