package art.arcane.summit.data.unit.event.assignment;

import art.arcane.summit.data.unit.board.Board;
import art.arcane.summit.data.unit.event.Event;
import art.arcane.summit.data.unit.user.User;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serial;
import java.io.Serializable;
import java.util.UUID;

@Table(name = "event_assignment")
@Entity
@Getter
@Setter
@Accessors(fluent = true, chain = true)
@RequiredArgsConstructor
public class EventAssignment implements Serializable {
    @Serial
    private static final long serialVersionUID = 337830420440330693L;

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "id", columnDefinition = "BINARY(16)",
            updatable = false, nullable = false)
    private UUID id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(optional = false)
    @JoinColumn(name = "event_id", nullable = false)
    private Event event;

    @Column(name = "organizer", nullable = false)
    private boolean organizer;
}