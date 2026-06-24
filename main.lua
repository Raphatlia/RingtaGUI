-- Astra Hub v2.1 (Компактная)
local Players,LP,CoreGui,UserInputService,TweenService=game:GetService("Players"),game:GetService("Players").LocalPlayer,game:GetService("CoreGui"),game:GetService("UserInputService"),game:GetService("TweenService")
local ScreenGui=Instance.new("ScreenGui")ScreenGui.Name="AstraGUI"ScreenGui.Parent=CoreGui ScreenGui.ResetOnSpawn=false
local Icon=Instance.new("ImageButton")Icon.Size=UDim2.new(0,45,0,45)Icon.Position=UDim2.new(0.02,0,0.02,0)Icon.AnchorPoint=Vector2.new(0,0)Icon.BackgroundColor3=Color3.fromRGB(80,40,140)Icon.BackgroundTransparency=0.2 Icon.BorderSizePixel=2 Icon.BorderColor3=Color3.fromRGB(80,40,140)Icon.Image="rbxassetid://4483362458"Icon.Parent=ScreenGui
local IconCorner=Instance.new("UICorner")IconCorner.CornerRadius=UDim.new(0,12)IconCorner.Parent=Icon
local IconText=Instance.new("TextLabel")IconText.Size=UDim2.new(1,0,1,0)IconText.BackgroundTransparency=1 IconText.Text="⭐"IconText.TextColor3=Color3.fromRGB(255,255,255)IconText.TextSize=24 IconText.Font=Enum.Font.GothamBold IconText.Parent=Icon
local iconDragging,iconDragStart,iconStartPos
Icon.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then iconDragging=true iconDragStart=i.Position iconStartPos=Icon.Position i.Changed:Connect(function()if i.UserInputState==Enum.UserInputState.End then iconDragging=false end)end end)
UserInputService.InputChanged:Connect(function(i)if iconDragging and i.UserInputType==Enum.UserInputType.MouseMovement then local d=i.Position-iconDragStart Icon.Position=UDim2.new(iconStartPos.X.Scale,iconStartPos.X.Offset+d.X,iconStartPos.Y.Scale,iconStartPos.Y.Offset+d.Y)end end)
local MainFrame=Instance.new("Frame")MainFrame.Size=UDim2.new(0,0,0,0)MainFrame.AnchorPoint=Vector2.new(0.5,0.5)MainFrame.Position=UDim2.new(0.5,0,0.5,0)MainFrame.BackgroundColor3=Color3.fromRGB(10,10,15)MainFrame.BackgroundTransparency=0.15 MainFrame.BorderSizePixel=0 MainFrame.ClipsDescendants=true MainFrame.Visible=false MainFrame.Parent=ScreenGui
local Corner=Instance.new("UICorner")Corner.CornerRadius=UDim.new(0,16)Corner.Parent=MainFrame
local function OpenMenu()MainFrame.Visible=true Icon.Visible=false TweenService:Create(MainFrame,TweenInfo.new(0.3,Enum.EasingStyle.Back),{Size=UDim2.new(0,400,0,370)}):Play()end
local function CloseMenu()TweenService:Create(MainFrame,TweenInfo.new(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size=UDim2.new(0,0,0,0)}):Play()task.wait(0.2)MainFrame.Visible=false Icon.Visible=true end
Icon.MouseButton1Click:Connect(OpenMenu)
local Header=Instance.new("Frame")Header.Size=UDim2.new(1,0,0,40)Header.BackgroundColor3=Color3.fromRGB(20,20,32)Header.BackgroundTransparency=0.2 Header.Parent=MainFrame
local Title=Instance.new("TextLabel")Title.Size=UDim2.new(0.4,0,1,0)Title.Position=UDim2.new(0.05,0,0,0)Title.BackgroundTransparency=1 Title.Text="✦ ASTRA HUB"Title.TextColor3=Color3.fromRGB(210,170,255)Title.TextSize=16 Title.Font=Enum.Font.GothamBold Title.TextXAlignment=Enum.TextXAlignment.Left Title.Parent=Header
local MacOSContainer=Instance.new("Frame")MacOSContainer.Size=UDim2.new(0,50,0,16)MacOSContainer.Position=UDim2.new(1,-58,0,12)MacOSContainer.BackgroundTransparency=1 MacOSContainer.Parent=Header
local function MakeMacOSButton(c,x)local b=Instance.new("TextButton")b.Size=UDim2.new(0,12,0,12)b.Position=UDim2.new(0,x,0,2)b.BackgroundColor3=c b.BorderSizePixel=0 b.Text=""b.Parent=MacOSContainer local co=Instance.new("UICorner")co.CornerRadius=UDim.new(1,0)co.Parent=b return b end
local RedBtn=MakeMacOSButton(Color3.fromRGB(255,95,87),0)local YellowBtn=MakeMacOSButton(Color3.fromRGB(254,188,46),18)local GreenBtn=MakeMacOSButton(Color3.fromRGB(40,200,64),36)
local contentVisible,isPinned=true,false
RedBtn.MouseButton1Click:Connect(CloseMenu)
YellowBtn.MouseButton1Click:Connect(function()contentVisible=not contentVisible if LeftPanel then LeftPanel.Visible=contentVisible end if RightPanel then RightPanel.Visible=contentVisible end if contentVisible then MainFrame.Size=UDim2.new(0,400,0,370)Icon.Visible=false else MainFrame.Size=UDim2.new(0,400,0,50)task.wait(0.3)Icon.Visible=true MainFrame.Visible=false end end)
GreenBtn.MouseButton1Click:Connect(function()isPinned=not isPinned GreenBtn.BackgroundColor3=isPinned and Color3.fromRGB(20,180,40)or Color3.fromRGB(40,200,64)MainFrame.ZIndex=isPinned and 100 or 0 end)
local dragging,dragStart,startPos
Header.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 and not isPinned then dragging=true dragStart=i.Position startPos=MainFrame.Position i.Changed:Connect(function()if i.UserInputState==Enum.UserInputState.End then dragging=false end)end end)
UserInputService.InputChanged:Connect(function(i)if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then local d=i.Position-dragStart MainFrame.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)end end)
local LeftPanel=Instance.new("Frame")LeftPanel.Size=UDim2.new(0,110,1,-40)LeftPanel.Position=UDim2.new(0,0,0,40)LeftPanel.BackgroundColor3=Color3.fromRGB(12,12,20)LeftPanel.BackgroundTransparency=0.2 LeftPanel.Parent=MainFrame
local Border=Instance.new("Frame")Border.Size=UDim2.new(0,1,0.85,0)Border.Position=UDim2.new(1,-1,0.075,0)Border.BackgroundColor3=Color3.fromRGB(60,60,70)Border.BackgroundTransparency=0.4 Border.Parent=LeftPanel
local btnData={"🏠 Home","⚔️ Combat","🌾 Farm","⚙️ Settings"}local btnObjects={}
for i=1,#btnData do local btn=Instance.new("TextButton")btn.Size=UDim2.new(0.85,0,0,28)btn.Position=UDim2.new(0.075,0,0,8+(i-1)*34)btn.BackgroundColor3=(i==1)and Color3.fromRGB(80,40,140)or Color3.fromRGB(30,30,40)btn.Text=btnData[i]btn.TextColor3=(i==1)and Color3.fromRGB(255,255,255)or Color3.fromRGB(200,200,220)btn.TextSize=13 btn.Font=Enum.Font.Gotham btn.BorderSizePixel=1 btn.BorderColor3=(i==1)and Color3.fromRGB(80,40,140)or Color3.fromRGB(40,40,50)btn.Parent=LeftPanel local bc=Instance.new("UICorner")bc.CornerRadius=UDim.new(0,6)bc.Parent=btn btnObjects[i]=btn end
local RightPanel=Instance.new("Frame")RightPanel.Size=UDim2.new(1,-120,1,-40)RightPanel.Position=UDim2.new(0,115,0,40)RightPanel.BackgroundTransparency=1 RightPanel.Parent=MainFrame
local allContents={}
local function CreateContent(t)local f=Instance.new("Frame")f.Size=UDim2.new(1,0,1,0)f.BackgroundTransparency=1 f.Visible=false f.Parent=RightPanel local l=Instance.new("TextLabel")l.Size=UDim2.new(1,0,0,40)l.Position=UDim2.new(0,0,0.2,0)l.BackgroundTransparency=1 l.Text="📁 "..t l.TextColor3=Color3.fromRGB(200,200,220)l.TextSize=18 l.Font=Enum.Font.GothamBold l.TextXAlignment=Enum.TextXAlignment.Center l.Parent=f return f end
local homeContent,combatContent,farmContent,settingsContent=CreateContent("Home"),CreateContent("Combat"),CreateContent("Farm"),CreateContent("Settings")
homeContent.Visible=true
allContents={homeContent,combatContent,farmContent,settingsContent}
for i=1,#btnObjects do btnObjects[i].MouseButton1Click:Connect(function()for j=1,#btnObjects do btnObjects[j].BackgroundColor3=(j==i)and Color3.fromRGB(80,40,140)or Color3.fromRGB(30,30,40)btnObjects[j].TextColor3=(j==i)and Color3.fromRGB(255,255,255)or Color3.fromRGB(200,200,220)btnObjects[j].BorderColor3=(j==i)and Color3.fromRGB(80,40,140)or Color3.fromRGB(40,40,50)end for j=1,#allContents do allContents[j].Visible=(j==i)end end)end
print("✦ Astra Hub v2.1 загружена!")
