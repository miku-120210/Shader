Shader "Unlit/mono_sepia"
{
    Properties{
        _MainTex("Texture", 2D) = ""{}
        _Alpha("Alpha", range(0.1,1)) = 1.0
    }

    SubShader{
        Tags{
            "RenderType"="Transparent"
            "Queue"="Transparent"
        }
        Cull off //���ʕ\�L
        Blend SrcAlpha OneMinusSrcAlpha
        Pass {
            CGPROGRAM

            #include "UnityCG.cginc"

            #pragma vertex vert_img
            #pragma fragment frag

            sampler2D _MainTex;
            half _Alpha;

            fixed4 frag(v2f_img i) : SV_Target {
                fixed4 col = tex2D(_MainTex, i.uv);
                //�O���[�X�P�[����
                float gray = col.r * 0.3 + col.g * 0.6 + col.b * 0.1;
                col.rgb = fixed3(gray, gray, gray);
                //���ȊO�𓧉�
                col.a *= (col.r * 0.3 + col.g * 0.6 + col.b * 0.1 < 0.2) ? 1 : 0.9*_Alpha;
                return col;

            }

            ENDCG
        }
    }
}