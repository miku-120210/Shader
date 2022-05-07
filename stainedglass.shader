Shader "Custom/stainedglass"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Alpha ("Alpha",range(1,3)) = 2
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }
        LOD 200
        Cull off //���ʕ\��

        CGPROGRAM
        #pragma surface surf Standard alpha:fade
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;
        half _Alpha;


        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
            //�O���[�X�P�[���ɕϊ����A0.2�����͓���
            o.Alpha = (c.r*0.3 + c.g*0.6 + c.b*0.1 < 0.2) ? 1 : _Alpha*0.3;
        }
        ENDCG
    }
    FallBack "Transparent/Diffuse"
}
