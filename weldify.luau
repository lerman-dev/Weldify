--[[
           .---.            ,--,                                           
          /. ./|          ,--.'|         ,---,  ,--,     .--.,             
      .--'.  ' ;          |  | :       ,---.'|,--.'|   ,--.'  \            
     /__./ \ : |          :  : '       |   | :|  |,    |  | /\/            
 .--'.  '   \' .   ,---.  |  ' |       |   | |`--'_    :  : :        .--,  
/___/ \ |    ' '  /     \ '  | |     ,--.__| |,' ,'|   :  | |-,    /_ ./|  
;   \  \;      : /    /  ||  | :    /   ,'   |'  | |   |  : :/| , ' , ' :  
 \   ;  `      |.    ' / |'  : |__ .   '  /  ||  | :   |  |  .'/___/ \: |  
  .   \    .\  ;'   ;   /||  | '.'|'   ; |:  |'  : |__ '  : '   .  \  ' |  
   \   \   ' \ |'   |  / |;  :    ;|   | '/  '|  | '.'||  | |    \  ;   :  
    :   '  |--" |   :    ||  ,   / |   :    :|;  :    ;|  : \     \  \  ;  
     \   \ ;     \   \  /  ---`-'   \   \  /  |  ,   / |  |,'      :  \  \ 
      '---"       `----'             `----'    ---`-'  `--'         \  ' ;  V1
                                                                     `--`  
--]]

local function cleanupOldWelds(model)
	for _, obj in ipairs(model:GetDescendants()) do
		if obj:IsA("Weld") or obj:IsA("Motor6D") then
			if obj.Name:sub(1,8) == "Weldify" then
				obj:Destroy()
			end
		end
	end
end

local function createWeld(part0, part1, parent, useMotor)
	local weld
	if useMotor then
		weld = Instance.new("Motor6D")
	else
		weld = Instance.new("Weld")
	end

	weld.Name = "Weldify_" .. part1.Name
	weld.Part0 = part0
	weld.Part1 = part1
	weld.C0 = part0.CFrame:ToObjectSpace(part1.CFrame)
	weld.C1 = CFrame.identity
	weld.Parent = parent
end

local function getFirstPhysicalPart(model)
	for _, part in ipairs(model:GetDescendants()) do
		if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then
			return part
		end
	end
	return nil
end

local function anchorAllParts(model)
	for _, part in ipairs(model:GetDescendants()) do
		if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then
			part.Anchored = true
		end
	end
end

local function unanchorAllParts(model)
	for _, part in ipairs(model:GetDescendants()) do
		if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then
			part.Anchored = false
		end
	end
end

local function weldify(model)
	if not model:IsA("Model") then return end

	local humanoid = model:FindFirstChildOfClass("Humanoid")
	local isCharacter = humanoid ~= nil

	local root = model.PrimaryPart or getFirstPhysicalPart(model)
	if not root then
		warn("Weldify: No physical part found in model.")
		return
	end

	-- Anchor everything before welding
	anchorAllParts(model)

	cleanupOldWelds(model)

	for _, part in ipairs(model:GetDescendants()) do
		if (part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation")) and part ~= root then
			createWeld(root, part, root, isCharacter)
		end
	end

	-- Unanchor everything after welding
	unanchorAllParts(model)
end

weldify(script.Parent)
