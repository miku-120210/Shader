Shader "Custom/Acrylic"
{
	Properties{
		//�F�A�e�N�X�`���A�����x
		_Color("Color", Color) = (1,1,1,1)
		_Alpha("Alpha", Range(0,4)) = 1.5
	}
	SubShader{
		Tags { 
			"Queue" = "Transparent"
			"RenderType" = "Transparent"
		}
		LOD 200
		//���ʂ�`�ʂ��Ȃ�
	Pass{
		ZWrite ON
		ColorMask 0
	}


		CGPROGRAM
		#pragma surface surf Standard alpha:fade
		#pragma target 3.0

		fixed4 _Color;
		sampler2D _MainTex;
		half _Alpha;

		struct Input {
			float3 worldNormal;
			float3 viewDir;
		};

		void surf(Input IN, inout SurfaceOutputStandard o) {
			o.Albedo = _Color;
			//�x�N�g���̓��ςŊO�������𒲂ׂ�
			float alpha = 1 - (abs(dot(IN.viewDir, IN.worldNormal)));
			//�O���قǕs�����x���グ�A�����͓����x���グ��
			o.Alpha = alpha * _Alpha;
		}
		ENDCG
}
FallBack "Transparent/Diffuse"
}