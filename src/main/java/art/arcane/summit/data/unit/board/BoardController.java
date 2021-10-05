package art.arcane.summit.data.unit.board;

import art.arcane.summit.data.object.OK;
import art.arcane.summit.data.unit.user.User;
import art.arcane.summit.data.unit.user.UserService;
import art.arcane.summit.security.LudicrousPasswordEncoder;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/v1/board")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class BoardController {
    private final BoardService boardService;

    @GetMapping("/{id}")
    public ResponseEntity<?> get(@PathVariable("id") String id) {
        return ResponseEntity.ok(boardService.getBoard(UUID.fromString(id)));
    }

    @PostMapping("/create")
    public ResponseEntity<?> create() {
        return ResponseEntity.ok(boardService.createBoard());
    }

    @PutMapping("/update")
    public ResponseEntity<?> update(@RequestBody Board board) {
        return ResponseEntity.ok(boardService.saveBoard(board));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable("id") String id) {
        boardService.delete(UUID.fromString(id));
        return ResponseEntity.ok().build();
    }
}
