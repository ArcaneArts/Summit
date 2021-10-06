package art.arcane.summit.data.unit.event;

import art.arcane.summit.data.unit.board.Board;
import art.arcane.summit.data.unit.board.access.BoardAccess;
import art.arcane.summit.data.unit.event.assignment.EventAssignment;
import art.arcane.summit.data.unit.user.User;
import art.arcane.summit.security.LudicrousPasswordEncoder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serial;
import java.io.Serializable;
import java.sql.Date;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

@Table(name = "event")
@Entity
@Getter
@Setter
@Accessors(fluent = true, chain = true)
@RequiredArgsConstructor
public class Event implements Serializable {
    @Serial
    private static final long serialVersionUID = 337830420440330693L;

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "id", columnDefinition = "BINARY(16)",
            updatable = false, nullable = false)
    private UUID id;

    @Column(name = "start", nullable = false)
    private long eventStart = -1;

    @Column(name = "end", nullable = false)
    private long eventEnd = -1;

    @Column(name = "deadline", nullable = false)
    private long deadline = -1;

    @Column(name = "name", nullable = false)
    private String name = "";

    @Column(name = "description", nullable = false)
    private String description = "";

    @Column(name = "color", nullable = false)
    private int color = -1;

    @ManyToOne(optional = false)
    @JoinColumn(name = "board_id", nullable = false)
    private Board board;

    @OneToMany(mappedBy = "event", orphanRemoval = true)
    private List<EventAssignment> eventAssignments;

    @Enumerated
    @Column(name = "event_status", nullable = false)
    private EventStatus eventStatus = EventStatus.PLANNED;

}