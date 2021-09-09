package art.arcane.summit.data.unit.sleepevent;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/event/sleep")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SleepEventController {
    private final SleepEventService sleepEventService;
}
