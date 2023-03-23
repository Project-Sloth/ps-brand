local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("logo", "Show logo branding", {}, false, function(source, args)
    TriggerClientEvent("ps-brand:client:Logo", source)
end)