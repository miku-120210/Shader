Shader "Custom/sample4" 
{
    Properties
    {
        _Color1 ("MainColor", Color) = (1,1,1,1)
        _Color2 ("RimColor", Color) = (0,0,0,0)
        _Rim ("Rimpower", Range(0,5)) = 2.5
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Alpha("Alpha", Range(0,1)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        //���ʂ�`�ʂ��Ȃ�
    Pass{
        ZWrite ON
        ColorMask 0
    }


        CGPROGRAM
        #pragma surface surf Standard alpha:fade
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
            float3 worldNormal;
            float3 viewDir;
        };

        half _Alpha;
        half _Rim;
        fixed4 _Color1;
        fixed4 _Color2;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = _Color1;
            o.Alpha = _Alpha;
            //�x�N�g���̓��ς���֊s���ӂ����߂�
            float rim = 1 - (abs(dot(IN.viewDir, IN.worldNormal)));
            //��ŋ��߂�rim��3�悵�A����֊s�ɏW��������B���ڂ̗֊s�ɂ������ꍇ���̃R�����g������
            o.Emission = _Color2 * pow(rim, _Rim); // *_Rim / 2;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
