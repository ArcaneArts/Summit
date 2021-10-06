package art.arcane.summit.data.unit.event;

public enum EventStatus {
    /**
     * The event is planned, meaning it has no actual scheduled date
     * maybe it doesnt even have a deadline. Lazy fucks.
     */
    PLANNED,

    /**
     * This event was either created with a date of execution or was added later on
     */
    SCHEDULED,

    /**
     * This event is actually being worked on right now (seriously)
     */
    IN_PROGRESS,

    /**
     * ABANDON SHIP! Maybe this will be browsable in an "Archive of Failures"
     * in the future, or possibly simmilar events being created in the future
     */
    ABANDONED,

    /**
     * This event was completed successfully
     */
    COMPLETED
}
