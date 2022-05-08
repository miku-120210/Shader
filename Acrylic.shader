Shader "Custom/Acrylic"
{
	Properties{
		//色、テクスチャ、透明度
		_Color("Color", Color) = (1,1,1,1)
		_Alpha("Alpha", Range(0,4)) = 1.5
	}
	SubShader{
		Tags { 
			"Queue" = "Transparent"
			"RenderType" = "Transparent"
		}
		LOD 200
		//裏面を描写しない
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
			//ベクトルの内積で外側向きを調べる
			float alpha = 1 - (abs(dot(IN.viewDir, IN.worldNormal)));
			//外側ほど不当明度を上げ、内側は透明度を上げる
			o.Alpha = alpha * _Alpha;
		}
		ENDCG
}
FallBack "Transparent/Diffuse"
}