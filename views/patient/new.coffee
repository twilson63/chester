class PatientNew extends Chester.View
  name: "new"
  render: ->
    # TODO: add your presentation code here.

  # Register view to Patients Controller
Chester.Application.find("PatientController").add(new PatientNew())