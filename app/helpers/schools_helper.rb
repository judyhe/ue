module SchoolsHelper
  def form_title
    @school.name ? "Update #{@school.name}" : "New School"
  end
end
