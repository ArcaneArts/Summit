package art.arcane.summit.data.unit.board;

import art.arcane.summit.data.unit.board.access.BoardAccess;
import art.arcane.summit.data.unit.board.access.BoardAccessService;
import art.arcane.summit.data.unit.user.User;
import art.arcane.summit.data.unit.user.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/v1/board")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class BoardController {
    private final BoardService boardService;
    private final BoardAccessService boardAccessService;
    private final UserService userService;

    @GetMapping("/{board}")
    public ResponseEntity<?> get(@PathVariable("board") String id) {
        return ResponseEntity.ok(boardService.getBoard(UUID.fromString(id)));
    }

    @PostMapping("/create")
    public ResponseEntity<?> create() {

        Board b = boardService.createBoard();
        User u = userService.context();
        BoardAccess a = boardAccessService.createAdminBoardAccess(u, b);
        return ResponseEntity.ok(a);
    }

    @PutMapping("/update")
    public ResponseEntity<?> update(@RequestBody Board board) {
        return ResponseEntity.ok(boardService.saveBoard(board));
    }

    @DeleteMapping("/{board}")
    public ResponseEntity<?> delete(@PathVariable("board") String id) {
        boardService.delete(UUID.fromString(id));
        return ResponseEntity.ok().build();
    }
}
