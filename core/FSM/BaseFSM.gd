class_name BaseFSM
extends Node

# 请配合节点树使用

# 状态字典
var states: Dictionary = {}
# 必须重写
var current: Node

func init_current():
	push_error("请设置初始状态current")

func _ready():
	initStates()
	init_current()
	current.enter()

func _physics_process(_delta):
	current.do()
	
func change_state(state: String):
	current.exit()
	current = states[state]
	current.enter()

func initStates():
	for i in get_children():
		states[i.name]=i
