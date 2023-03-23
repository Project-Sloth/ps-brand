![LJ BRAND](https://user-images.githubusercontent.com/91661118/144402490-add10012-0c2b-42bb-8d9f-c5e215cf3d7e.png)

# Formally known as lj-brand
ps-brand, formerly known as [lj-brand](https://github.com/loljoshie/lj-brand), which was launched by [loljoshie](https://github.com/loljoshie) two years ago, is making a comeback. This script is a guide for newcomers, providing them with a checklist of essential elements to help get started on the server when they first join.

# Dependencies
* [qbcore framework](https://github.com/qbcore-framework)
* [interact-sound](https://github.com/qbcore-framework/interact-sound) (if you want sound effects)

# Key Features
* Configurable logo (/logo)
* Toggleable logo
* Checkboxes react when focused / checked
* Checklist requires you to checkmark all boxes
* Button is disabled until requirements are met.
* Easy to use and customize. For people that just want all branding in one place, and allow community to choose if they want to see the branding logo of the server while playing.

# Previews
## Checklist completed & Not completed
![checklist](https://user-images.githubusercontent.com/91661118/144400484-fe5734fb-af43-45a8-be4c-4dcdac7e642d.png)

## Checklist gif
![checklist gif](https://user-images.githubusercontent.com/91661118/144400634-44705317-eb68-4872-b2ba-ac1071fea607.gif)

## Checklist clothing example
![checklist example](https://user-images.githubusercontent.com/91661118/144400792-a8679b3e-9e6c-4f0c-85e0-56ccfcdf92eb.png)

# Installation 

## Editing the default config list
![config html](https://user-images.githubusercontent.com/91661118/144399653-301103f3-5b15-4b83-86b9-cc56c1ae7689.PNG)
![config lua](https://user-images.githubusercontent.com/91661118/144399687-0e3aa6d9-a493-4dfd-8af8-4d0a71c89625.PNG)

## Event: All you need is this event. It can go pretty much anywhere.
```lua
TriggerEvent('ps-brand:client:open')
```
## Example:
#### We recommend putting it in qb-clothing where newcomers first create their characters on the server.

# qb-clothing

* Find this event on qb-clothing-client.lua around Line 1239
```lua
RegisterNetEvent('qb-clothes:client:CreateFirstCharacter')
```

* Replace with this instead
```lua
RegisterNetEvent('qb-clothes:client:CreateFirstCharacter')
AddEventHandler('qb-clothes:client:CreateFirstCharacter', function()
    QBCore.Functions.GetPlayerData(function(pData)
        local skin = "mp_m_freemode_01"
        openMenu({
            {menu = "character", label = "Character", selected = true},
            {menu = "clothing", label = "Features", selected = false},
            {menu = "accessoires", label = "Accessories", selected = false}
        })

        if pData.charinfo.gender == 1 then
            skin = "mp_f_freemode_01"
        end

        ChangeToSkinNoUpdate(skin)
        SendNUIMessage({
            action = "ResetValues",
        })
    end)
        Wait(1200)
        TriggerEvent('ps-brand:client:open')
end)    
```
# Illenium-Appearance

* Find the below event, around line 89 on /qb/main.lua.

* Replace with this. 
```lua
RegisterNetEvent("qb-clothes:client:CreateFirstCharacter", function()
    QBCore.Functions.GetPlayerData(function(pd)
        PlayerData = pd
        setClientParams()
        InitializeCharacter(Framework.GetGender(true))
        Wait(1200)
        TriggerEvent('lj-brand:client:open')
    end)
end)
```

* Edit CSS to move the checklist to the right.

```css
div#checklist {
  display: none;
  position: absolute;
  height: auto;
  max-width: 18%;
  right: 0%;
  background: #232833;
}
```
