GDPC                  `	                                                                         T   res://.godot/exported/133200997/export-66da1ffa42ef8ef9885baab8c901e2ef-cenário.scnP      =      �[�4���©���    X   res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res �      �	      Y��Q�}o�C�\Q�    X   res://.godot/exported/133200997/export-91601aefd5ab165f25c33f58558fbc87-plataformas.scn @J      �      ��%K������dో    P   res://.godot/exported/133200997/export-9f17d0b210d291ed810fb30d4ef3ee41-bird.scn0            ��j�H]J�5���v�    \   res://.godot/exported/133200997/export-d8bbc5b5b53645421a251828e4223ace-ScoreDetector.scn   PP      h      �Ż����hwQh�    P   res://.godot/exported/133200997/export-efc710f71cc67b1c92c5451511245266-Menu.scn�.      L      �������\9V�5�    ,   res://.godot/global_script_class_cache.cfg                 ��Р�8���8~$}P�    D   res://.godot/imported/icon.png-487276ed1e3a0c39cad0279d744ee560.ctex0%      �      �`� ͏+�>��`    H   res://.godot/imported/passaro.png-065f2069d7a4b23ea609c01084b785d3.ctex  =      	      pC��;�����'<
       res://.godot/uid_cache.bin  �f      �       ���޾̯�QV��       res://Global.gd �$      D       �<	�TA�<b�Q�<��       res://Menu.gd   .      �       ٥��ީg۰����E�       res://Menu.tscn.remap   @X      a       �MV�^l��/f�|�       res://Score.gd  �N      D       ��BaV�e���?       res://ScoreDetector.gd  0O            �lٿ�q�wUr̐�8        res://ScoreDetector.tscn.remap   Y      j       ߳�v�Z7
�3���       res://Timer.gd  �T      /      �v�g$�Rx#��n       res://bird.gd                 T��%��d�0��TQ�\�       res://bird.tscn.remap   �V      a       � c����=�<����H�       res://cenário.tscn.remap   `W      e       z���PPK)��������       res://deathmenu.gd  �      L      ���WM�	#�m|wK       res://default_env.tres.remap�W      h       cXv�S��P�O�Tq�o       res://highscore.gd  �$      F       C���y5��. .R�J       res://icon.png  �Y      �      G1?��z�c��vN��       res://icon.png.import    +      �      �������kFV>.       res://passaro.png.import0F      �      
�=W�b`M�'�o��2�       res://plataformas.gd0I            ��Lyu8>sv�g! ��       res://plataformas.tscn.remap�X      h       ��ǻK��5E]�Ѽ�       res://project.binary�g      	      ��'g�=�Vgs]�     h�3list=Array[Dictionary]([])
�_�extends CharacterBody2D
signal death

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const GRAVITY = 220.0
const WALK_SPEED = 180
var speed = Vector2()
var control = 1



func _physics_process(delta):
	speed.y += delta * GRAVITY
	
	if Input.is_action_pressed("ui_up") and control ==1:
		speed.y = -WALK_SPEED
		
		
	set_velocity(speed)
	set_up_direction(Vector2(0, -1))
	set_floor_stop_on_slope_enabled(false)
	set_max_slides(4)
	set_floor_max_angle(0.785)
	# TODOConverter40 infinite_inertia were removed in Godot 4.0 - previous value `true`
	move_and_slide()
	
	for index in get_slide_collision_count():
		var collision  = get_slide_collision(index)
		if collision.get_collider() is StaticBody2D:
			emit_signal("death")
			control = 0
			Global.platSpeed =0
			if Input.is_action_pressed("ui_accept"):
				if Global.score < Global.hscore:
					Global.hscore = Global.score
				Global.score = 0
				Global.platSpeed = 1
				print(Global.platSpeed)
				get_tree().reload_current_scene()
	
	
			
	pass


}}������lRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    script    animations 	   _bundled       Script    res://bird.gd ��������
   Texture2D    res://passaro.png m#�d���O   
   local://1 �         local://SpriteFrames_bn47f �         local://PackedScene_arlev �         CircleShape2D             SpriteFrames                         name ,      flap       speed      �@      loop              frames                   texture             	   duration      �?            name ,      godown       speed      �@      loop             frames                    name ,      idle       speed      �@      loop             frames                   texture             	   duration      �?         PackedScene          	         names "         bird    z_index    script    player    CharacterBody2D    CollisionShape2D    shape 
   ColorRect    visible    offset_left    offset_top    offset_right    offset_bottom    color 	   Sprite2D 	   position    scale    sprite_frames 
   animation    AnimatedSprite2D    	   variants          ����                                ��     �@   ��c?��V?���=  �?
    @5��?
    sm>s�k>         ,      flap       node_count             nodes     7   ��������       ����                                    ����                           ����         	      
                                          ����                  	      
             conn_count              conns               node_paths              editable_instances              version             RSRC B�0�À��RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://Global.gd ��������   PackedScene    res://bird.tscn 	m.�}+�_   PackedScene    res://plataformas.tscn �Z��Ra�5   Script    res://Timer.gd ��������   Script    res://Score.gd ��������   PackedScene    res://ScoreDetector.tscn ��(�`�B   Script    res://deathmenu.gd ��������   
   local://1 G         local://PackedScene_r5lpm x         RectangleShape2D       
    ��D  C         PackedScene          	         names "   6      cenario    script    Node2D    fundo    z_index    ColorRect2    offset_left    offset_top    offset_right    offset_bottom    scale    color 
   ColorRect    bird 	   position 	   Camera2D    plataformas    chao    plat    StaticBody2D    CollisionShape2D    shape    Timer 
   autostart    score    Score $   theme_override_font_sizes/font_size    text    horizontal_alignment    Label    ScoreDetector 
   deathmenu    layout_mode    anchors_preset    Control    menu    visible    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    VBoxContainer    morte    vertical_alignment !   pressione [Enter] para reiniciar    Button    Sair    _on_bird_death    death    _on_Timer_timeout    timeout    _on_menu_pressed    pressed    _on_Sair_pressed    	   variants    0                ����     |�     �     ��     A
   ݵ�A��yA   ��`=��!?��?  �?                
     �C ��C
      D  �C               
    �1D  gC
      � @�     ��     �C    ��D    �!D   ���=���>���<  �?
    `D  D                                    �C     �A    �D     �B   #         00                   
     9D ��C                        �?     �C     `C    �D     �C               Death       Press [Enter] to restart       Menu       Exit       node_count             nodes       ��������       ����                            ����                          ����                     	      
                        ���            	      
                     ����                     ���                                ���                                 ����                            ����                     	                             ����                                 ����                                 ����                          ����                     	                                           ���   !         "               "      ����       #   !   	              )   #   ����   $   $          !   %   %   &   &   &      '      (      )   	   *   '      (         +                 *   ����             ,         +                    ,   ����             -         +                 -   #   ����             .              -   .   ����             /             conn_count             conns              0   /              
   
   2   1                    4   3                    4   5                    node_paths              editable_instances              version             RSRC�5�extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_bird_death():
	visible = true
	if Global.score > Global.hscore:
		Global.hscore = Global.score



func _on_menu_pressed():
	Global.score = 0
	Global.platSpeed = 1
	get_tree().change_scene_to_file("res://Menu.tscn")


func _on_Sair_pressed():
	get_tree().quit()
���ORSRC                     Environment            ��������                                            d      resource_local_to_scene    resource_name    sky_material    process_mode    radiance_size    script    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction        
   local://1 Q	         local://Environment_6012n e	         Sky             Environment                                RSRC��~�Ѯ���ݥ�휓extends Node2D

var score = 0
var hscore = 0

var platSpeed = 1 



�#&$�?uJC=extends Label

func _process(delta):
	self.text = str(Global.hscore)

��BI�%J�#�GST2   @   @      ����               @ @        �  RIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
 [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c353m24sio4jq"
path="res://.godot/imported/icon.png-487276ed1e3a0c39cad0279d744ee560.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=["res://.godot/imported/icon.png-487276ed1e3a0c39cad0279d744ee560.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
[���Xextends Control




func _on_start_pressed():
	Global.score = 0
	Global.platSpeed = 1
	get_tree().change_scene_to_file("res://cenário.tscn")

func _on_sair_pressed():
	get_tree().quit()
3��޾RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    animations    script 	   _bundled       Script    res://Menu.gd ��������   Script    res://highscore.gd ��������
   Texture2D    res://passaro.png m#�d���O      local://SpriteFrames_4q162 �         local://PackedScene_bfpjo b         SpriteFrames                         name ,      flap       speed      �@      loop              frames                   texture             	   duration      �?            name ,      godown       speed      �@      loop             frames                    name ,      idle       speed      �@      loop             frames                   texture             	   duration      �?         PackedScene          	         names "   +      Menu    layout_mode    anchors_preset    anchor_right    anchor_bottom    offset_right    offset_bottom    grow_horizontal    grow_vertical    pivot_offset    script    Control    ceu    offset_left    offset_top    scale    color 
   ColorRect    Chao    Titulo !   theme_override_colors/font_color (   theme_override_colors/font_shadow_color $   theme_override_font_sizes/font_size    text    horizontal_alignment    vertical_alignment 
   uppercase    Label    VBoxContainer    start    Button    sair    ColorRect2    Label H 
   highscore 	   Sprite2D 	   position    sprite_frames 
   animation    AnimatedSprite2D    _on_start_pressed    pressed    _on_sair_pressed    	   variants    A                    �?     ��      �      
    �<�  "�                      0A     ��     LB     �A
   ݵ�A��yA   ��`=��!?��?  �?     @�    @D     �D    @D
    �D  ��   ���=���>���<  �?     |C     (B    @QD      C   ��9?��?���>  �?   �ȩ>�_�>��=  �?   <         Flappy Bird Clone                  �C     TC    �!D     �C
    �D  gC      Start       Exit      dD     �C    �oD    �,D   ��`=��c?���>  �?     ��    ��     8B     /�     �B    ��C     +C    �0D     �C     C    �D     -C      HIGH SCORE:
     @
D    @D     C      0          
     ID  lC
    sm>s�k>          ,      flap       node_count             nodes       ��������       ����
                                                    	      
                        ����            	      
                                             ����                                 	                              ����                                                                                             ����                         !      "   	   #                    ����            $                    ����            %                     ����            &      '      (      )      *                    ����            +      ,      -      .      *                      ����            /      0      1      2      *       	             ����            +      ,      -      .      *                  !   ����            3      4      5      6      7                  "   ����            8      4      9      :      ;   
   <               '   #   ����   $   =      >   %   ?   &   @             conn_count             conns               )   (                     )   *                    node_paths              editable_instances              version             RSRC-d��GST2   �   q      ����               � q        �  RIFF�  WEBPVP8L�  /� ��m�1IR��|͙Yٶm��}Ѷm�;+�#^E|���x!ٶmӮ���y'%;y��W�m�5�t9�m��3;�m۩l��*����m�Ne۶��_Z�d���޸�m�ֳm��e۶m۶mۼ�}�JGn�H�dOU�>���6E�/R{�?|�����?���8�A�@;49��G�0��"<��k!�%���p��{?�H�n8�c ��S\��PioֿC��p&�7�.��&����K�r++ޡ��:�!~���6�֢!��Z�%���F�Yl����(p?�46�+��a�,�a�F�V���]��:�*�!�B�:k*�Acď�\�����`�����\�l�����L�q(�h�j�J��WYEq0t��X�w�\�D Y|��%k(�`}_(�}�S�  /�Tf<h�������-�  �Eʌ.Jx�oi��>y�\X�	�AG�-��A����g?\����-ח{��	���S|N  ��/3���pA�So/�i$�7����ss\��$�  ��5�����Z�yg�;���������2$���tU�@�}`#��e�Tr�Gn�&�{;{!H�  ^�a 6`�?����%��x��q<��}!�d���C�||��D����`�bRoC���?�ኒ�\?�!���%x� /�KGP�OC���{�����^J�+E�|h,��A�z�`��0D��o�E�����z��=�HS��?��
�@w|4�˼���>:Y�/����|q����fH߄�S��hR�'�2�\��>2QP��_Xi$�SP��/x~ �ໜ_���/͕`�
������a��𦑜Z|t���$�5��l�I�஁�L�A?;�KQs�HN��!�*�K�I%=A'�)����>>]Q��z��}	�ܐv�kr�H�cp�@(�w��{���}mcK_���/�����	v V��zRI&"�@s,���}r��U����eO*IvN��R/���~nɼ�����H����F�X���#�|"�9kJMt��R	3pG�8��
����D��.⺈&e{�� e|�%eQ�� ��DHF�<�Pq�J�ǂma��s��oGLkIDzo����!�_Ѹl~�r0E�%^�kxo��]T~�K���7D���qR9 S����'
�p&,�Tށʻq7���<��-#�:o8o�q�.}��/b� ���֋r�,x�\�� ��zJ�=FL?��l�/�?a���zRy3���kkB���͌wPs�ul��#΍��4BQ�
z�`	:�D�rZ������k�C�=���a���^"�֎������Y���$`��g+#.�hzZ�i-���Pyzr>�"�z��ID-��N��D�fq����3�D�j��#r��E'����~��6\�2�z�?Gl���H�v��{�[���e|k+3#��D$"e�Gt�B��ŝ�,{��a
"VD\�$")In�t�7x�x�X�Q��?�}Dj�@ӡ�!��n�B~��|��5����.k�ft�u,��?\?H��/OkG䬑�FZ��`
�}ݦ�Ev�w'���q�H�������[�����&�D4(.[;�v�C�G�c
Y���&��&I�<���,R�w��˧��`��R]Aǀ)����)d!xIV�3*�����b��U� H�n�l���j���) g"�"�D
qX�p�M! ��VJxj�����bF���?5������J@0��i��B�d���PT\í3��4�����|C���vH�:����6�=XV�D��+%��ϡ���ѧѵ�Q�\���B�:5��`_����<��54EjV��r'��0�p���꺂�x  �Et�B0�#��-��?y�5����h��
�8k�et�B�5Ʒw����k�F�)�c/��]�����r�����%��5�Y2�ٲ)3pF Ȟ�y3��-�B��<LAy�n�V�9�N��|��1+3�a���G`S4B�=�U[v"�+&~}�*� (�Z�!R�w�z'R8�Z��.3A��-ْ-�'����3���d�=G�-��<���d&��;&&2��!��ΤpS�ݒ���'L#'2���������g)>��]#ٙ�fz�d&�$��L��I�9rsw�s�j�w&-��MmyW��y&T&�-�s�[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://coc0yrkq2kobt"
path="res://.godot/imported/passaro.png-065f2069d7a4b23ea609c01084b785d3.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://passaro.png"
dest_files=["res://.godot/imported/passaro.png-065f2069d7a4b23ea609c01084b785d3.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
��=�=n]6�h�extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	position.x -=  Global.platSpeed
	
	if position.x < -10000:
		queue_free()

)�\8���b����RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://plataformas.gd ��������   
   local://1 B         local://PackedScene_v4g8a s         RectangleShape2D       
     ,B  �C         PackedScene          	         names "         plataformas    Node2D    plataforma 1    z_index 	   position    script    plat    StaticBody2D    CollisionShape2D    shape 
   ColorRect    offset_left    offset_top    offset_right    offset_bottom    color    	   variants    
      ����
        �D          
     �A  ��                A     ��     \B     ��   ��`=��c?���>  �?      node_count             nodes     1   ��������       ����                      ����                                         ����         	                 
   
   ����                              	             conn_count              conns               node_paths              editable_instances              version             RSRCǯl�=extends Label

func _process(delta):
	self.text = str(Global.score)
�mW����Z��.wextends Area2D


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	position.x -=  Global.platSpeed
	
	if position.x < -10000:
		queue_free()


func _on_ScoreDetector_body_entered(body):
	if body.is_in_group("player"):
			Global.score+=1
�/0	X�&���hRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://ScoreDetector.gd ��������   
   local://1 D         local://PackedScene_6obpk u         RectangleShape2D       
     �@  C         PackedScene          	         names "         ScoreDetector    script    Area2D    CollisionShape2D 	   position    shape 
   ColorRect    visible    offset_left    offset_top    offset_right    offset_bottom    _on_ScoreDetector_body_entered    body_entered    	   variants                 
      ?  ,�                      @�     ��     �@     B      node_count             nodes     %   ��������       ����                            ����                                 ����               	      
                      conn_count             conns                                       node_paths              editable_instances              version             RSRCC����L��extends Timer

var plataforma = preload("res://plataformas.tscn")
var scoreDetec = preload("res://ScoreDetector.tscn")



func _on_Timer_timeout():
	var criador = [plataforma.instantiate(),plataforma.instantiate(),scoreDetec.instantiate()]
	var x = 1100
	var y = randf_range(150,300)
	var y2 = y - randf_range(500,600)
	criador[0].position = Vector2(x,y)
	criador[1].position = Vector2(x,y2)
	criador[2].position = Vector2(x+30,y+30)
	criador[2].scale = Vector2 (1,y2-y)
	add_child(criador[0])
	add_child(criador[1])
	add_child(criador[2])
	wait_time = 3
	
	
g[remap]

path="res://.godot/exported/133200997/export-9f17d0b210d291ed810fb30d4ef3ee41-bird.scn"
���`I�Y�˨[remap]

path="res://.godot/exported/133200997/export-66da1ffa42ef8ef9885baab8c901e2ef-cenário.scn"
�b�{���U�[remap]

path="res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res"
()�a9�W[remap]

path="res://.godot/exported/133200997/export-efc710f71cc67b1c92c5451511245266-Menu.scn"
�έE�]��Ϟ���[remap]

path="res://.godot/exported/133200997/export-91601aefd5ab165f25c33f58558fbc87-plataformas.scn"
MMJŵ��[remap]

path="res://.godot/exported/133200997/export-d8bbc5b5b53645421a251828e4223ace-ScoreDetector.scn"
�2-F�PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`��ݘ�W�   	m.�}+�_   res://bird.tscn�'��:�   res://cenário.tscnZL��X   res://default_env.tres&q����d^   res://icon.png��l_m2   res://Menu.tscnm#�d���O   res://passaro.png�Z��Ra�5   res://plataformas.tscn��(�`�B   res://ScoreDetector.tscnᠬ���ECFG	      application/config/name         Flappy bird    application/run/main_scene         res://Menu.tscn    application/config/features   "         4.0    application/config/icon         res://icon.png     autoload/Global         *res://Global.gd   display/window/size/resizable          +   gui/common/drop_mouse_on_gui_input_disabled         )   physics/common/enable_pause_aware_picking         2   rendering/environment/defaults/default_environment          res://default_env.tres  f���2/