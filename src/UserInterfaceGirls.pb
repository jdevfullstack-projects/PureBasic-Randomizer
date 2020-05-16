XIncludeFile "ArrayData.pbi"
NewList indexArray.i()

;the increment everytime the program
;is run until such time it is already
;greater than 25
addToItself.i = 0

Enumeration
  #WINDOW_1 
  #LISTVIEW_1 
  #TEXT_GADGET_1
  #BUTTON_GADGET_1
  #BUTTON_GADGET_2
EndEnumeration

#WINDOWS_FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered

If OpenWindow(#WINDOW_1, 0, 0, 420, 120, "RANDOM SELECTION GIRLS", #WINDOWS_FLAGS)
  
  TextGadget(#TEXT_GADGET_1, 5, 10, 400, 30, "RANDOM LEARNERS:")
  
  ButtonGadget(#BUTTON_GADGET_1, 230 , 0, 85, 40, "RUN!")  
  ButtonGadget(#BUTTON_GADGET_2, 320, 0, 85, 40, "CLEAR")
  ListViewGadget(#LISTVIEW_1, 10, 40, 400, 68) 
  
  SetGadgetFont(#WINDOW_1, FontID(LoadFont(#PB_Any,"Century Gothic", 12)))
  SetGadgetFont(#LISTVIEW_1, FontID(LoadFont(#PB_Any,"Century Gothic", 40)))
  SetGadgetFont(#TEXT_GADGET_1, FontID(LoadFont(#PB_Any,"Comic Sans MS", 16)))
  SetGadgetFont(#BUTTON_GADGET_1, FontID(LoadFont(#PB_Any,"Century Gothic", 18)))
  SetGadgetFont(#BUTTON_GADGET_2, FontID(LoadFont(#PB_Any,"Century Gothic", 18)))
  
  For x.b = 0 To 24
    AddElement(indexArray())
    indexArray() = x              
  Next
  
  RandomizeList(indexArray())
  DisableGadget(#BUTTON_GADGET_2, 1)
  
  Repeat
    
    Event = WaitWindowEvent()
    
    Select Event        
      Case #PB_Event_Gadget
        Select EventGadget()
            
          ;run button  
          Case #BUTTON_GADGET_1
            DisableGadget(#BUTTON_GADGET_1, 1)
            DisableGadget(#BUTTON_GADGET_2, 0)
            
            If addToItself >= 25 
              MessageRequester("ATTENTION: ", "Nothing left, program will exit.") 
              Break              
            EndIf
            
            SelectElement(indexArray(), addToItself)
            AddGadgetItem(#LISTVIEW_1, 0, classNumberGirls(indexArray()))
            SetGadgetState(#LISTVIEW_1, 0)   
            
            addToItself.i = addToItself + 1 
            
          ;clear button, proceed to the next random number  
          Case #BUTTON_GADGET_2
            DisableGadget(#BUTTON_GADGET_1, 0)
            RemoveGadgetItem(#LISTVIEW_1, 0)  
            DisableGadget(#BUTTON_GADGET_2, 1)
        EndSelect
        
    EndSelect
  Until Event = #PB_Event_CloseWindow
EndIf
; IDE Options = PureBasic 5.00 (Windows - x64)
; EnableXP