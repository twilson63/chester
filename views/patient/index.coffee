class PatientIndex extends Chester.View
  name: "index"
  render: ->
    # TODO: add your presentation code here.

  # Register view to Patients Controller
Chester.Application.find("PatientController").add(new PatientIndex())