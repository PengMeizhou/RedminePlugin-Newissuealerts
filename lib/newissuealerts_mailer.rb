require "mailer"

class NewissuealertsMailer < Mailer
  def newissuealert( email, issue, newissuealert)
    project = issue.project
    tracker = issue.tracker
    author = issue.author
    #set_language_if_valid user.language
    redmine_headers 'Project' => project.identifier,
                    'Issue-Id' => issue.id,
                    'Issue-Author' => author.login
    redmine_headers 'Issue-Assignee' => issue.assigned_to.login if issue.assigned_to
    headers 'X-Priority' => 1, 'Importance' => 'High', 'X-MSMail-Priority' => 'High' if newissuealert.priority
    message_id issue
    @recipients = email
    @subject = "[#{issue.project.name} - #{issue.tracker.name} ##{issue.id}] (#{issue.status.name}) #{issue.subject}"
    body = {
         :issue => issue,
         :issue_url => url_for(:controller => 'issues', :action => 'show', :id => issue)
    }
    
    mail(:to =>@recipients,:subject=>@subject,:from => 'pengmeizhou@126.com',:date => Time.now) do |format|
      format.text{render text: body}
    end
    
    Rails.logger.info "End to Send "
  end
end
