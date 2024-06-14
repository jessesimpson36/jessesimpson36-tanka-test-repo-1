local values = import "values.json";
local isPasswordExplicit() = std.type(values.existingSecret);
local isSecretName() = 
	if std.type(values.existingSecret) == "object" then
		true;
local evaluateNameOfSecret() =
	if isPasswordExplicit() == "string" then
		std.trace("hiiii jesse", "default-secret")
	else if isSecretName() then
		values.existingSecret.name
	else "";
		
{
	kind: "Secret",
	apiVersion: "v1",
	metadata: {
		name: "jesse-frustration",
		namespace: "default",
	},
	stringData: {
		isSecretName: std.format("%s", isSecretName()),
		isPasswordExplicit: std.format("%s", isPasswordExplicit()),
		nameOfSecret: std.format("%s", evaluateNameOfSecret()),
		[if !std.isEmpty(evaluateNameOfSecret()) then
			"nameOfSecretFromValuesYaml"]: values.existingSecret.name,
		typeOfSecretName: std.type(values.existingSecret),
	}
}
