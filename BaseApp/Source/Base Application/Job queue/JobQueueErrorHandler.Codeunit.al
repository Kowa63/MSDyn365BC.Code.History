codeunit 450 "Job Queue Error Handler"
{
    Permissions = TableData "Job Queue Entry" = rimd,
                    TableData "Job Queue Log Entry" = rm;
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin
        if not Rec.DoesExistLocked() then
            exit;
        Rec.Status := Rec.Status::Error;
        LogError(Rec);
    end;

    var
        JobQueueContextTxt: Label 'Job Queue', Locked = true;

    local procedure LogError(var JobQueueEntry: Record "Job Queue Entry")
    var
        JobQueueLogEntry: Record "Job Queue Log Entry";
        ErrorMessages: Record "Error Message";
        ErrorMessageManagement: Codeunit "Error Message Management";
        ErrorMessageHandler: Codeunit "Error Message Handler";
        ErrorContextElement: Codeunit "Error Context Element";
#if not CLEAN19
        JobQueueDispatcher: Codeunit "Job Queue Dispatcher";
#endif
    begin
        JobQueueLogEntry.SetErrorCallStack(GetLastErrorCallStack()); // Set callstack for telemetry
        OnBeforeLogError(JobQueueLogEntry, JobQueueEntry);

        if IsNullGuid(JobQueueEntry."Error Message Register Id") then begin
            ErrorMessageManagement.Activate(ErrorMessageHandler, false);
            ErrorMessageManagement.PushContext(ErrorContextElement, JobQueueEntry.RecordId(), 0, JobQueueContextTxt);
            JobQueueEntry."Error Message Register Id" := ErrorMessageHandler.RegisterErrorMessages(false);
            ErrorMessageManagement.PopContext(ErrorContextElement);
        end;

        ErrorMessages.SetFilter("Register ID", JobQueueEntry."Error Message Register Id");
        if ErrorMessages.FindFirst() then;

#if not CLEAN19
        // To keep the same flow as before all the changes.
        // Going forward in the event of error, subscribe to the event JobQueueErrorHandler.OnAfterLogError instead.
        JobQueueDispatcher.OnAfterExecuteJob(JobQueueEntry, false);
#endif

        JobQueueEntry."Error Message" := ErrorMessages."Message";
        JobQueueEntry.Modify();

#if not CLEAN19
        // To keep the same flow as before all the changes.
        // Going forward in the event of error, subscribe to the event JobQueueErrorHandler.OnAfterLogError instead.
        JobQueueDispatcher.OnAfterHandleRequest(JobQueueEntry, false, 0);
#endif

        JobQueueLogEntry.SetRange(ID, JobQueueEntry.ID);
        JobQueueLogEntry.SetRange(Status, JobQueueLogEntry.Status::"In Process");
        if JobQueueLogEntry.FindFirst() then begin
            JobQueueLogEntry."Error Message Register Id" := JobQueueEntry."Error Message Register Id";
            JobQueueLogEntry."Error Message" := JobQueueEntry."Error Message";
            JobQueueLogEntry.SetErrorCallStack(GetLastErrorCallStack()); // Need to save callstack before deleted above
            JobQueueLogEntry.Status := JobQueueLogEntry.Status::Error;
            JobQueueLogEntry.Modify();
            OnLogErrorOnAfterJobQueueLogEntryModify(JobQueueEntry);
        end else begin
            JobQueueEntry.InsertLogEntry(JobQueueLogEntry);
            JobQueueEntry.FinalizeLogEntry(JobQueueLogEntry, GetLastErrorCallStack());
            OnLogErrorOnAfterJobQueueLogEntryFinalizeLogEntry(JobQueueEntry);
        end;

        OnAfterLogError(JobQueueEntry);

        JobQueueEntry.FinalizeRun();
        Commit();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterLogError(var JobQueueEntry: Record "Job Queue Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLogError(var JobQueueLogEntry: Record "Job Queue Log Entry"; var JobQueueEntry: Record "Job Queue Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnLogErrorOnAfterJobQueueLogEntryModify(var JobQueueEntry: Record "Job Queue Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnLogErrorOnAfterJobQueueLogEntryFinalizeLogEntry(var JobQueueEntry: Record "Job Queue Entry")
    begin
    end;
}

