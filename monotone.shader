/* マテリアルをモノトーン化するシェーダーです。
   https://drive.google.com/file/d/1sG3p7h3HPjCjmY6R2MP6t-plyPKJU7x9/view?usp=drivesdk
   上記URLからサンプルの動画が視聴できます。 */

Shader "Unlit/monotone"
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
        Cull off //裏面表記
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
                //グレースケール化
                float gray = col.r * 0.3 + col.g * 0.6 + col.b * 0.1;
                col.rgb = fixed3(gray, gray, gray);
                //黒以外を透過
                col.a *= (col.r * 0.3 + col.g * 0.6 + col.b * 0.1 < 0.2) ? 1 : 0.9*_Alpha;
                return col;

            }

            ENDCG
        }
    }
}
