package art.arcane.summit.data.unit.board.access;

import art.arcane.summit.data.unit.board.Board;
import art.arcane.summit.data.unit.user.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Service
@Log4j2
public class BoardAccessService {
    private final BoardAccessRepository repository;

    public BoardAccess getBoardAccess(UUID id) {
        return repository.getById(id);
    }

    public BoardAccess saveBoardAccess(BoardAccess boardAccess) {
        if (!repository.existsById(boardAccess.id())) {
            throw new RuntimeException("Board Access does not exist. Use createBoard() instead.");
        }

        return repository.save(boardAccess);
    }

    public BoardAccess createAdminBoardAccess(User user, Board board) {
        return repository.save(new BoardAccess()
                .admin(true).moderator(true).bigPicture(true)
                .edit(true).delegate(true)
                .user(user).board(board));
    }

    public BoardAccess createBoardAccess(User user, Board board) {
        return repository.save(new BoardAccess()
                .admin(false).moderator(false).bigPicture(false)
                .edit(false).delegate(false)
                .user(user).board(board));
    }

    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
