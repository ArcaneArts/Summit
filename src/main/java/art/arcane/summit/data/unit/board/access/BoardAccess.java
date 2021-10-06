package art.arcane.summit.data.unit.board.access;

import art.arcane.summit.data.unit.board.Board;
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

@Table(name = "board_access")
@Entity
@Getter
@Setter
@Accessors(fluent = true, chain = true)
@RequiredArgsConstructor
public class BoardAccess implements Serializable {
    @Serial
    private static final long serialVersionUID = 337830420440330693L;

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "id", columnDefinition = "BINARY(16)",
            updatable = false, nullable = false)
    private UUID id;

    /**
     * Can this accessor edit the board related to events about
     * themselves. (No delegation)
     */
    @Column(name = "edit", nullable = false)
    private boolean edit;

    /**
     * Can this accessor delegate tasks to other users
     */
    @Column(name = "delegate", nullable = false)
    private boolean delegate;

    /**
     * Can this accessor see all events,
     * not just ones they are assigned to
     */
    @Column(name = "big_icture", nullable = false)
    private boolean bigPicture;

    /**
     * Can this accessor add / remove users from the board and
     * grant permissions up to the level they have
     */
    @Column(name = "moderator", nullable = false)
    private boolean moderator;

    /**
     * Can this accessor delete the board, and change accessor
     * permissions of other people
     */
    @Column(name = "admin", nullable = false)
    private boolean admin;

    @ManyToOne(optional = false)
    @JoinColumn(name = "board_id", nullable = false)
    private Board board;

    @ManyToOne(optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

}