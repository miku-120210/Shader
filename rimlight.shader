/* リムライトのシェーダーです。透明度、光の強さ、光の色を調整できます。
  https://drive.google.com/file/d/1d_NFgk-4B69R-6i0eXkLabdl9CKkeNM4/view?usp=drivesdk
   上記URLからサンプルの動画が視聴できます。 */
Shader "Custom/Rimlight" 
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

        //裏面を描写しない
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
            //ベクトルの内積から輪郭周辺を求める
            float rim = 1 - (abs(dot(IN.viewDir, IN.worldNormal)));
            //上で求めたrimを3乗し、光を輪郭に集中させる。太目の輪郭にしたい場合後ろのコメントを入れる
            o.Emission = _Color2 * pow(rim, _Rim); // *_Rim / 2;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
