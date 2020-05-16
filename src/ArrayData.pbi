Dim classNumberBoys.s(25)
Dim classNumberGirls.s(25)

For x.b = 0 To 24
  classNumberBoys(x) = "B" + Str(x + 1)
  classNumberGirls(x) = "G" + Str(x + 1)
Next

;maximum is 25
desiredNumberBoys = 20 - 1

NewList stuList.s()
For x.b = 0 To desiredNumberBoys
  AddElement(stuList()) : stuList() = classNumberBoys(x)
Next

;maximum is 25
desiredNumberGirls = 20 - 1

For x.b = 0 To desiredNumberGirls
  AddElement(stuList()) : stuList() = classNumberGirls(x)
Next
