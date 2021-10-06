package art.arcane.summit.data.unit.event;

import art.arcane.summit.data.object.OK;
import art.arcane.summit.security.LudicrousPasswordEncoder;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/event")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class EventController {
    private final EventService userService;
}
