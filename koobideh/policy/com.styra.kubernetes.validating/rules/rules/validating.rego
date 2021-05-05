package policy["com.styra.kubernetes.validating"].rules.rules

monitor[decision] {
  data.library.v1.kubernetes.admission.network.v1.ingress_host_conflict[message]

  decision := {
    "allowed": false,
    "message": message
  }
}

monitor[decision] {
  input.request.kind.kind == "Pod"
  parameters := {
    "required": {
      "example-label-name": {
        "this-is-an-example-value"
      }
    }
  }

  data.library.v1.kubernetes.admission.metadata.v1.missing_label[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}


dummy := {
"foo": "bar",
}