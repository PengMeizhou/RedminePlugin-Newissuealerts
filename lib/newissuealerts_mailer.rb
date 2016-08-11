class NewissuealertsMailer < ActionMailer::Base
  def newissuealert( email, issue, newissuealert)
    project = issue.project
    tracker = issue.tracker
    author = issue.author
    #set_language_if_valid user.language
    priority = 'High' if newissuealert.priority    
    @headers = {:importance=> priority}  
    @recipients = email
    @subject = "[#{issue.project.name} - #{issue.tracker.name} ##{issue.id}] (#{issue.status.name}) #{issue.subject}"
    body = {
         :project => project.identifier,
         :issue => issue,
         :issue_URL => url_for(:controller => 'issues', :action => 'show', :id => issue),
         :assignee => issue.assigned_to ? issue.assigned_to.login  : '',
         :author => author.login
    }
    
    mail(:headers => @headers,:to =>@recipients,:subject=>@subject,:from => 'Sean.Peng',:date => Time.now) do |format|
      format.text{render text: body}
    end
    
    Rails.logger.info "End to Send "
  end
end
