# Shader
Shader practice

シェーダの練習に書いたものです。
リンク先にサンプル動画を載せています。（Googleドライブのページに飛びます）

## Acrylic shader
アクリルのような質感のシェーダです。<br>
視線ベクトルと法線ベクトルが平行な程透明度を高く、垂直な程透明度を低くしています。

<p>
<img src="https://user-images.githubusercontent.com/80895187/177835031-ba748899-778e-4443-96d4-579ffeb19c58.jpg" width="320px">
<img src="https://user-images.githubusercontent.com/80895187/177835032-3ff90e33-f580-4181-9c70-53269dc047e0.jpg" width="320px">
<img src="https://user-images.githubusercontent.com/80895187/177835037-4c14bf41-21b4-484c-826a-c3cc4d8ce01d.jpg" width="550px">
</p>
画像赤枠のAlphaで透明度を調整します。

## rimlight shader
リムライトのシェーダです。アクリルシェーダを応用し、法線ベクトルが垂直な輪郭部分をエミッションで発光させています。<br>
インスペクターで透明度、光の強さ、光の色を調整できます。<br>
<img src="https://user-images.githubusercontent.com/80895187/177837439-b3d62d7c-15b4-4187-936b-7fe0b1613d4a.jpg" width="550px">

サンプル動画は[こちら](https://drive.google.com/file/d/1d_NFgk-4B69R-6i0eXkLabdl9CKkeNM4/view?usp=drivesdk)

## monotone shader
マテリアルをモノトーン化するシェーダです。<br>
画像をグレースケール化しました。黒に近い値（0.2未満）は不透明にし、それ以外の透明度をインスペクターで調整できるようにしました。<br>
<img src="https://user-images.githubusercontent.com/80895187/177837591-69f66e1b-6469-405a-a2ee-5d2d38aacee4.jpg" width="550px">

サンプル動画は[こちら](https://drive.google.com/file/d/1sG3p7h3HPjCjmY6R2MP6t-plyPKJU7x9/view?usp=drivesdk)

## sepia shader
マテリアルをセピア化するシェーダです。<br>
グレースケール化し、暗さの値を引くことで明度の調整を行います。また、セピアの濃さをRGBのRに足しBから引くことで調整します。<br>
セピアの暗さと濃さはインスペクターから調整できます。透明度については調整中です。<br>
<img src="https://user-images.githubusercontent.com/80895187/177837612-e61035a7-f21c-4c3b-b2a8-cc0017e3db8e.jpg" width="550px">

サンプル動画は[こちら](https://drive.google.com/file/d/1UQAEPn5Hyf69FsGrGZvXLHWM8TmLEFiP/view?usp=drivesdk)

## stainedglass shader
ステンドグラス風のシェーダです。<br>
画像をグレースケール化し、黒に近い値（0.2未満）は不透明に、それ以外は透明度を上げました。透明度はインスペクターで調整できます。<br>
<img src="https://user-images.githubusercontent.com/80895187/177837629-1405b79d-5ed7-4f36-b2bd-62f57859aa01.jpg" width="550px">

サンプル動画は[こちら](https://drive.google.com/file/d/1ERq2rowV6PIgm_0FBH6NU3imGvfKsi1U/view?usp=drivesdk)
