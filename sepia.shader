Shader "Unlit/sepia"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "" {}
        // ñæìx
        _Dark("Dark", Range(0, 0.2)) = 0.04
        //ç ìx
        _Strength("Strength", Range(0.05, 0.2)) = 0.05
        _Alpha("Alpha", Range(0.1, 3)) = 3
    }
    SubShader
    {
        Tags {
            "RenderType"="Transparent"
            "Queue"="Transparent"
        }
        LOD 100
        Cull off
        Blend SrcAlpha OneMinusSrcAlpha


        Pass
        {
            CGPROGRAM

            #include "UnityCG.cginc"

            #pragma vertex vert_img
            #pragma fragment frag

            sampler2D _MainTex;
            half _Dark;
            half _Strength;
            half _Alpha;

            fixed4 frag (v2f_img i) : SV_Target
            {
                fixed4 c = tex2D(_MainTex, i.uv);
                half gray = c.r * 0.3 + c.g * 0.6 + c.b * 0.1 - _Dark;
                gray = (gray < 0) ? 0 : gray;

                half R = gray + _Strength;
                half B = gray - _Strength;

                R = (R > 1.0) ? 1.0 : R;
                B = (B < 0) ? 0 : B;
                c.rgb = fixed3(R, gray, B);
                return c;
            }
            ENDCG
        }
    }
}
