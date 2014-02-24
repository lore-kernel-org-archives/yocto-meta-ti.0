Return-Path: <munoz0raul@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2495E008B1;
	Mon, 24 Feb 2014 05:34:49 -0800 (PST)
Received: by mail-vc0-f182.google.com with SMTP id id10so5715786vcb.41
	for <multiple recipients>; Mon, 24 Feb 2014 05:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=0D43QonAiYn6GmubQ0c+pLO5OKr4dtneeCgyOcJF3Gw=;
	b=h7gFZkRYNYNt2AgOPst54HAIeptjy7N/xxFpvXLE+1QZVIgdxjLE/WGMx4Nw83bf5Y
	8Q7Jr9UksNrW4ZTIpMhEECO9RVgHbYhJJB5tWt+g0tZHr3Nj3BxmG0NbiZh/S1ycX328
	AEGCsL6osJOUXKoEPFPxX8hpi6ZDvHbn+fctGacixFtA7KjuId1BNDKfteHH6UiwLT39
	nlxpRJLo05LnlRs4Gh05ecZViBf9cWGiZU9bm/iqXc5ybVq5hOQlg/z316s05WyzvmKb
	hp3/bE4bQyeX5MpRpUMD3OcNE/zrLU9eZziipJN+DqmruIuoUlA02lwA8/dE5QRSIBOq
	vk/Q==
MIME-Version: 1.0
X-Received: by 10.221.37.1 with SMTP id tc1mr12669777vcb.32.1393248888888;
	Mon, 24 Feb 2014 05:34:48 -0800 (PST)
Received: by 10.221.68.131 with HTTP; Mon, 24 Feb 2014 05:34:48 -0800 (PST)
Date: Mon, 24 Feb 2014 10:34:48 -0300
Message-ID: <CANmVirgMuSXcSmHYSaEGazQX=oJTyJQEmrRKGZHE9tprkeM_yw@mail.gmail.com>
From: Raul Rosetto Munoz <munoz0raul@gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Device Tree Overlays
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Feb 2014 13:34:51 -0000
Content-Type: multipart/alternative; boundary=001a11334c381b229104f32709a5

--001a11334c381b229104f32709a5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello All,

I just compile a Yocto linux for BeagleBone Black using dora branch.

I would like to use device tree overlay to change the pin mux.

But I think that this linux not enable this feature.

I couldnt see this folders:

root@beaglebone:/lib/firmware# export
SLOTS=3D/sys/devices/bone_capemgr.9/slots

1
2
3
4
5
6
7
root@beaglebone:~/temp# cat $SLOTS
0: 54:PF---
1: 55:PF---
2: 56:PF---
3: 57:PF---
4: ff:P-O-L Bone-LT-eMMC-2G,00A0,Texas Instrument,BB-BONE-EMMC-2G
5: ff:P-O-L Bone-Black-HDMI,00A0,Texas Instrument,BB-BONELT-HDMI

Plz some one can tell me what I need to do to use this feature?

Is some thing possible using yocto?

Thanks.
--=20
*Raul Rosetto Mu=F1oz*

--001a11334c381b229104f32709a5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello All,</div><div><br></div><div>I just compi=
le a Yocto linux for BeagleBone Black using dora branch.</div><div><br></di=
v><div>I would like to use device tree overlay to change the pin mux.</div>
<div><br></div><div>But I think that this linux not enable this feature.</d=
iv><div><br></div><div>I couldnt see this folders:</div><div><br></div><div=
><div>root@beaglebone:/lib/firmware# export SLOTS=3D/sys/devices/bone_capem=
gr.9/slots</div>
</div><div><br></div><div><table class=3D"" style=3D"font-size:12px;margin-=
left:0px;font-family:Monaco,MonacoRegular,&#39;Courier New&#39;,monospace;b=
ackground-color:rgb(253,253,253);color:rgb(116,116,116);line-height:15px;bo=
rder-collapse:collapse!important;border-spacing:0px!important;border:none!i=
mportant;padding:0px!important;margin-right:0px!important;margin-bottom:0px=
!important;margin-top:0px!important;background-image:none!important;width:a=
uto!important">
<tbody><tr class=3D"" style=3D"padding:0px!important;border:none!important;=
vertical-align:top!important;margin:0px!important"><td class=3D"" style=3D"=
border-bottom-width:0px;border-top-width:0px;border-left-width:0px;font-fam=
ily:Monaco,MonacoRegular,&#39;Courier New&#39;,monospace!important;vertical=
-align:top!important;padding:0px!important;background-color:rgb(238,238,238=
)!important;border-right-style:solid!important;border-right-width:1px!impor=
tant;border-right-color:rgb(0,128,0)!important;color:rgb(0,0,0)!important">
<div class=3D"" style=3D"border:0px;padding:0px;margin:0px"><div class=3D""=
 style=3D"font-family:inherit;border:0px;padding:0px 5px;margin:0px;text-al=
ign:center;font-size:inherit!important;line-height:inherit!important;font-w=
eight:inherit!important;height:inherit!important">
1</div><div class=3D"" style=3D"font-family:inherit;border:0px;padding:0px =
5px;margin:0px;text-align:center;font-size:inherit!important;line-height:in=
herit!important;font-weight:inherit!important;height:inherit!important">2</=
div>
<div class=3D"" style=3D"font-family:inherit;border:0px;padding:0px 5px;mar=
gin:0px;text-align:center;font-size:inherit!important;line-height:inherit!i=
mportant;font-weight:inherit!important;height:inherit!important">3</div><di=
v class=3D"" style=3D"font-family:inherit;border:0px;padding:0px 5px;margin=
:0px;text-align:center;font-size:inherit!important;line-height:inherit!impo=
rtant;font-weight:inherit!important;height:inherit!important">
4</div><div class=3D"" style=3D"font-family:inherit;border:0px;padding:0px =
5px;margin:0px;text-align:center;font-size:inherit!important;line-height:in=
herit!important;font-weight:inherit!important;height:inherit!important">5</=
div>
<div class=3D"" style=3D"font-family:inherit;border:0px;padding:0px 5px;mar=
gin:0px;text-align:center;font-size:inherit!important;line-height:inherit!i=
mportant;font-weight:inherit!important;height:inherit!important">6</div><di=
v class=3D"" style=3D"font-family:inherit;border:0px;padding:0px 5px;margin=
:0px;text-align:center;font-size:inherit!important;line-height:inherit!impo=
rtant;font-weight:inherit!important;height:inherit!important">
7</div></div></td><td class=3D"" style=3D"border:0px;width:649px;font-famil=
y:Monaco,MonacoRegular,&#39;Courier New&#39;,monospace!important;vertical-a=
lign:top!important;padding:0px!important"><div class=3D"" style=3D"padding:=
0px;margin:0px;color:rgb(0,0,0);white-space:pre;overflow:visible;background=
-image:none!important;border:none!important">
<div class=3D"" id=3D"crayon-530b48709bf76604528014-1" style=3D"font-family=
:inherit;border:0px;padding:0px 5px;margin:0px;font-size:inherit!important;=
line-height:inherit!important;font-weight:inherit!important;height:inherit!=
important">
<span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;f=
ont-size:inherit!important;line-height:inherit!important;font-weight:inheri=
t!important;height:inherit!important">root</span><span class=3D"" style=3D"=
font-family:inherit;display:inline-block;zoom:1;font-size:inherit!important=
;line-height:inherit!important;font-weight:inherit!important;height:inherit=
!important">@</span><span class=3D"" style=3D"font-family:inherit;display:i=
nline-block;zoom:1;font-size:inherit!important;line-height:inherit!importan=
t;font-weight:inherit!important;height:inherit!important">beaglebone</span>=
<span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;f=
ont-size:inherit!important;line-height:inherit!important;font-weight:inheri=
t!important;height:inherit!important">:</span><span class=3D"" style=3D"fon=
t-family:inherit;display:inline-block;zoom:1;font-size:inherit!important;li=
ne-height:inherit!important;font-weight:inherit!important;height:inherit!im=
portant">~</span><span class=3D"" style=3D"font-family:inherit;display:inli=
ne-block;zoom:1;font-size:inherit!important;line-height:inherit!important;f=
ont-weight:inherit!important;height:inherit!important">/</span><span class=
=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;font-size:in=
herit!important;line-height:inherit!important;font-weight:inherit!important=
;height:inherit!important">temp</span><span class=3D"" style=3D"font-family=
:inherit;display:inline-block;zoom:1;font-size:inherit!important;line-heigh=
t:inherit!important;font-weight:inherit!important;height:inherit!important"=
># cat $SLOTS</span></div>
<div class=3D"" id=3D"crayon-530b48709bf76604528014-2" style=3D"font-family=
:inherit;border:0px;padding:0px 5px;margin:0px;background-color:rgb(247,247=
,247)!important;font-size:inherit!important;line-height:inherit!important;f=
ont-weight:inherit!important;height:inherit!important">
<span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;f=
ont-size:inherit!important;line-height:inherit!important;font-weight:inheri=
t!important;height:inherit!important;color:rgb(0,111,224)!important"> </spa=
n><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1=
;font-size:inherit!important;line-height:inherit!important;font-weight:inhe=
rit!important;height:inherit!important;color:rgb(8,40,251)!important">0</sp=
an><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:=
1;font-size:inherit!important;line-height:inherit!important;font-weight:inh=
erit!important;height:inherit!important">:</span><span class=3D"" style=3D"=
font-family:inherit;display:inline-block;zoom:1;font-size:inherit!important=
;line-height:inherit!important;font-weight:inherit!important;height:inherit=
!important;color:rgb(0,111,224)!important"> </span><span class=3D"" style=
=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit!impor=
tant;line-height:inherit!important;font-weight:inherit!important;height:inh=
erit!important;color:rgb(8,40,251)!important">54</span><span class=3D"" sty=
le=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit!imp=
ortant;line-height:inherit!important;font-weight:inherit!important;height:i=
nherit!important">:</span><span class=3D"" style=3D"font-family:inherit;dis=
play:inline-block;zoom:1;font-size:inherit!important;line-height:inherit!im=
portant;font-weight:inherit!important;height:inherit!important">PF</span><s=
pan class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;fon=
t-size:inherit!important;line-height:inherit!important;font-weight:inherit!=
important;height:inherit!important">--</span><span class=3D"" style=3D"font=
-family:inherit;display:inline-block;zoom:1;font-size:inherit!important;lin=
e-height:inherit!important;font-weight:inherit!important;height:inherit!imp=
ortant">-</span><span class=3D"" style=3D"font-family:inherit;display:inlin=
e-block;zoom:1;font-size:inherit!important;line-height:inherit!important;fo=
nt-weight:inherit!important;height:inherit!important;color:rgb(0,111,224)!i=
mportant"> </span></div>
<div class=3D"" id=3D"crayon-530b48709bf76604528014-3" style=3D"font-family=
:inherit;border:0px;padding:0px 5px;margin:0px;font-size:inherit!important;=
line-height:inherit!important;font-weight:inherit!important;height:inherit!=
important">
<span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;f=
ont-size:inherit!important;line-height:inherit!important;font-weight:inheri=
t!important;height:inherit!important;color:rgb(0,111,224)!important"> </spa=
n><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1=
;font-size:inherit!important;line-height:inherit!important;font-weight:inhe=
rit!important;height:inherit!important;color:rgb(8,40,251)!important">1</sp=
an><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:=
1;font-size:inherit!important;line-height:inherit!important;font-weight:inh=
erit!important;height:inherit!important">:</span><span class=3D"" style=3D"=
font-family:inherit;display:inline-block;zoom:1;font-size:inherit!important=
;line-height:inherit!important;font-weight:inherit!important;height:inherit=
!important;color:rgb(0,111,224)!important"> </span><span class=3D"" style=
=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit!impor=
tant;line-height:inherit!important;font-weight:inherit!important;height:inh=
erit!important;color:rgb(8,40,251)!important">55</span><span class=3D"" sty=
le=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit!imp=
ortant;line-height:inherit!important;font-weight:inherit!important;height:i=
nherit!important">:</span><span class=3D"" style=3D"font-family:inherit;dis=
play:inline-block;zoom:1;font-size:inherit!important;line-height:inherit!im=
portant;font-weight:inherit!important;height:inherit!important">PF</span><s=
pan class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;fon=
t-size:inherit!important;line-height:inherit!important;font-weight:inherit!=
important;height:inherit!important">--</span><span class=3D"" style=3D"font=
-family:inherit;display:inline-block;zoom:1;font-size:inherit!important;lin=
e-height:inherit!important;font-weight:inherit!important;height:inherit!imp=
ortant">-</span><span class=3D"" style=3D"font-family:inherit;display:inlin=
e-block;zoom:1;font-size:inherit!important;line-height:inherit!important;fo=
nt-weight:inherit!important;height:inherit!important;color:rgb(0,111,224)!i=
mportant"> </span></div>
<div class=3D"" id=3D"crayon-530b48709bf76604528014-4" style=3D"font-family=
:inherit;border:0px;padding:0px 5px;margin:0px;background-color:rgb(247,247=
,247)!important;font-size:inherit!important;line-height:inherit!important;f=
ont-weight:inherit!important;height:inherit!important">
<span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;f=
ont-size:inherit!important;line-height:inherit!important;font-weight:inheri=
t!important;height:inherit!important;color:rgb(0,111,224)!important"> </spa=
n><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1=
;font-size:inherit!important;line-height:inherit!important;font-weight:inhe=
rit!important;height:inherit!important;color:rgb(8,40,251)!important">2</sp=
an><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:=
1;font-size:inherit!important;line-height:inherit!important;font-weight:inh=
erit!important;height:inherit!important">:</span><span class=3D"" style=3D"=
font-family:inherit;display:inline-block;zoom:1;font-size:inherit!important=
;line-height:inherit!important;font-weight:inherit!important;height:inherit=
!important;color:rgb(0,111,224)!important"> </span><span class=3D"" style=
=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit!impor=
tant;line-height:inherit!important;font-weight:inherit!important;height:inh=
erit!important;color:rgb(8,40,251)!important">56</span><span class=3D"" sty=
le=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit!imp=
ortant;line-height:inherit!important;font-weight:inherit!important;height:i=
nherit!important">:</span><span class=3D"" style=3D"font-family:inherit;dis=
play:inline-block;zoom:1;font-size:inherit!important;line-height:inherit!im=
portant;font-weight:inherit!important;height:inherit!important">PF</span><s=
pan class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;fon=
t-size:inherit!important;line-height:inherit!important;font-weight:inherit!=
important;height:inherit!important">--</span><span class=3D"" style=3D"font=
-family:inherit;display:inline-block;zoom:1;font-size:inherit!important;lin=
e-height:inherit!important;font-weight:inherit!important;height:inherit!imp=
ortant">-</span><span class=3D"" style=3D"font-family:inherit;display:inlin=
e-block;zoom:1;font-size:inherit!important;line-height:inherit!important;fo=
nt-weight:inherit!important;height:inherit!important;color:rgb(0,111,224)!i=
mportant"> </span></div>
<div class=3D"" id=3D"crayon-530b48709bf76604528014-5" style=3D"font-family=
:inherit;border:0px;padding:0px 5px;margin:0px;font-size:inherit!important;=
line-height:inherit!important;font-weight:inherit!important;height:inherit!=
important">
<span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;f=
ont-size:inherit!important;line-height:inherit!important;font-weight:inheri=
t!important;height:inherit!important;color:rgb(0,111,224)!important"> </spa=
n><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1=
;font-size:inherit!important;line-height:inherit!important;font-weight:inhe=
rit!important;height:inherit!important;color:rgb(8,40,251)!important">3</sp=
an><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:=
1;font-size:inherit!important;line-height:inherit!important;font-weight:inh=
erit!important;height:inherit!important">:</span><span class=3D"" style=3D"=
font-family:inherit;display:inline-block;zoom:1;font-size:inherit!important=
;line-height:inherit!important;font-weight:inherit!important;height:inherit=
!important;color:rgb(0,111,224)!important"> </span><span class=3D"" style=
=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit!impor=
tant;line-height:inherit!important;font-weight:inherit!important;height:inh=
erit!important;color:rgb(8,40,251)!important">57</span><span class=3D"" sty=
le=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit!imp=
ortant;line-height:inherit!important;font-weight:inherit!important;height:i=
nherit!important">:</span><span class=3D"" style=3D"font-family:inherit;dis=
play:inline-block;zoom:1;font-size:inherit!important;line-height:inherit!im=
portant;font-weight:inherit!important;height:inherit!important">PF</span><s=
pan class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;fon=
t-size:inherit!important;line-height:inherit!important;font-weight:inherit!=
important;height:inherit!important">--</span><span class=3D"" style=3D"font=
-family:inherit;display:inline-block;zoom:1;font-size:inherit!important;lin=
e-height:inherit!important;font-weight:inherit!important;height:inherit!imp=
ortant">-</span><span class=3D"" style=3D"font-family:inherit;display:inlin=
e-block;zoom:1;font-size:inherit!important;line-height:inherit!important;fo=
nt-weight:inherit!important;height:inherit!important;color:rgb(0,111,224)!i=
mportant"> </span></div>
<div class=3D"" id=3D"crayon-530b48709bf76604528014-6" style=3D"font-family=
:inherit;border:0px;padding:0px 5px;margin:0px;background-color:rgb(247,247=
,247)!important;font-size:inherit!important;line-height:inherit!important;f=
ont-weight:inherit!important;height:inherit!important">
<span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;f=
ont-size:inherit!important;line-height:inherit!important;font-weight:inheri=
t!important;height:inherit!important;color:rgb(0,111,224)!important"> </spa=
n><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1=
;font-size:inherit!important;line-height:inherit!important;font-weight:inhe=
rit!important;height:inherit!important;color:rgb(8,40,251)!important">4</sp=
an><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:=
1;font-size:inherit!important;line-height:inherit!important;font-weight:inh=
erit!important;height:inherit!important">:</span><span class=3D"" style=3D"=
font-family:inherit;display:inline-block;zoom:1;font-size:inherit!important=
;line-height:inherit!important;font-weight:inherit!important;height:inherit=
!important;color:rgb(0,111,224)!important"> </span><span class=3D"" style=
=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit!impor=
tant;line-height:inherit!important;font-weight:inherit!important;height:inh=
erit!important">ff</span><span class=3D"" style=3D"font-family:inherit;disp=
lay:inline-block;zoom:1;font-size:inherit!important;line-height:inherit!imp=
ortant;font-weight:inherit!important;height:inherit!important">:</span><spa=
n class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;font-=
size:inherit!important;line-height:inherit!important;font-weight:inherit!im=
portant;height:inherit!important">P</span><span class=3D"" style=3D"font-fa=
mily:inherit;display:inline-block;zoom:1;font-size:inherit!important;line-h=
eight:inherit!important;font-weight:inherit!important;height:inherit!import=
ant">-</span><span class=3D"" style=3D"font-family:inherit;display:inline-b=
lock;zoom:1;font-size:inherit!important;line-height:inherit!important;font-=
weight:inherit!important;height:inherit!important">O</span><span class=3D""=
 style=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit=
!important;line-height:inherit!important;font-weight:inherit!important;heig=
ht:inherit!important">-</span><span class=3D"" style=3D"font-family:inherit=
;display:inline-block;zoom:1;font-size:inherit!important;line-height:inheri=
t!important;font-weight:inherit!important;height:inherit!important">L</span=
><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;=
font-size:inherit!important;line-height:inherit!important;font-weight:inher=
it!important;height:inherit!important;color:rgb(0,111,224)!important"> </sp=
an><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:=
1;font-size:inherit!important;line-height:inherit!important;font-weight:inh=
erit!important;height:inherit!important">Bone</span><span class=3D"" style=
=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit!impor=
tant;line-height:inherit!important;font-weight:inherit!important;height:inh=
erit!important">-</span><span class=3D"" style=3D"font-family:inherit;displ=
ay:inline-block;zoom:1;font-size:inherit!important;line-height:inherit!impo=
rtant;font-weight:inherit!important;height:inherit!important">LT</span><spa=
n class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;font-=
size:inherit!important;line-height:inherit!important;font-weight:inherit!im=
portant;height:inherit!important">-</span><span class=3D"" style=3D"font-fa=
mily:inherit;display:inline-block;zoom:1;font-size:inherit!important;line-h=
eight:inherit!important;font-weight:inherit!important;height:inherit!import=
ant">eMMC</span><span class=3D"" style=3D"font-family:inherit;display:inlin=
e-block;zoom:1;font-size:inherit!important;line-height:inherit!important;fo=
nt-weight:inherit!important;height:inherit!important">-</span><span class=
=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;font-size:in=
herit!important;line-height:inherit!important;font-weight:inherit!important=
;height:inherit!important;color:rgb(8,40,251)!important">2G</span><span cla=
ss=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;font-size:=
inherit!important;line-height:inherit!important;font-weight:inherit!importa=
nt;height:inherit!important">,</span><span class=3D"" style=3D"font-family:=
inherit;display:inline-block;zoom:1;font-size:inherit!important;line-height=
:inherit!important;font-weight:inherit!important;height:inherit!important;c=
olor:rgb(8,40,251)!important">00A0</span><span class=3D"" style=3D"font-fam=
ily:inherit;display:inline-block;zoom:1;font-size:inherit!important;line-he=
ight:inherit!important;font-weight:inherit!important;height:inherit!importa=
nt">,</span><span class=3D"" style=3D"font-family:inherit;display:inline-bl=
ock;zoom:1;font-size:inherit!important;line-height:inherit!important;font-w=
eight:inherit!important;height:inherit!important">Texas </span><span class=
=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;font-size:in=
herit!important;line-height:inherit!important;font-weight:inherit!important=
;height:inherit!important">Instrument</span><span class=3D"" style=3D"font-=
family:inherit;display:inline-block;zoom:1;font-size:inherit!important;line=
-height:inherit!important;font-weight:inherit!important;height:inherit!impo=
rtant">,</span><span class=3D"" style=3D"font-family:inherit;display:inline=
-block;zoom:1;font-size:inherit!important;line-height:inherit!important;fon=
t-weight:inherit!important;height:inherit!important">BB</span><span class=
=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;font-size:in=
herit!important;line-height:inherit!important;font-weight:inherit!important=
;height:inherit!important">-</span><span class=3D"" style=3D"font-family:in=
herit;display:inline-block;zoom:1;font-size:inherit!important;line-height:i=
nherit!important;font-weight:inherit!important;height:inherit!important">BO=
NE</span><span class=3D"" style=3D"font-family:inherit;display:inline-block=
;zoom:1;font-size:inherit!important;line-height:inherit!important;font-weig=
ht:inherit!important;height:inherit!important">-</span><span class=3D"" sty=
le=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit!imp=
ortant;line-height:inherit!important;font-weight:inherit!important;height:i=
nherit!important">EMMC</span><span class=3D"" style=3D"font-family:inherit;=
display:inline-block;zoom:1;font-size:inherit!important;line-height:inherit=
!important;font-weight:inherit!important;height:inherit!important">-</span>=
<span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;f=
ont-size:inherit!important;line-height:inherit!important;font-weight:inheri=
t!important;height:inherit!important;color:rgb(8,40,251)!important">2G</spa=
n></div>
<div class=3D"" id=3D"crayon-530b48709bf76604528014-7" style=3D"font-family=
:inherit;border:0px;padding:0px 5px;margin:0px;font-size:inherit!important;=
line-height:inherit!important;font-weight:inherit!important;height:inherit!=
important">
<span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;f=
ont-size:inherit!important;line-height:inherit!important;font-weight:inheri=
t!important;height:inherit!important;color:rgb(0,111,224)!important"> </spa=
n><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1=
;font-size:inherit!important;line-height:inherit!important;font-weight:inhe=
rit!important;height:inherit!important;color:rgb(8,40,251)!important">5</sp=
an><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:=
1;font-size:inherit!important;line-height:inherit!important;font-weight:inh=
erit!important;height:inherit!important">:</span><span class=3D"" style=3D"=
font-family:inherit;display:inline-block;zoom:1;font-size:inherit!important=
;line-height:inherit!important;font-weight:inherit!important;height:inherit=
!important;color:rgb(0,111,224)!important"> </span><span class=3D"" style=
=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit!impor=
tant;line-height:inherit!important;font-weight:inherit!important;height:inh=
erit!important">ff</span><span class=3D"" style=3D"font-family:inherit;disp=
lay:inline-block;zoom:1;font-size:inherit!important;line-height:inherit!imp=
ortant;font-weight:inherit!important;height:inherit!important">:</span><spa=
n class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;font-=
size:inherit!important;line-height:inherit!important;font-weight:inherit!im=
portant;height:inherit!important">P</span><span class=3D"" style=3D"font-fa=
mily:inherit;display:inline-block;zoom:1;font-size:inherit!important;line-h=
eight:inherit!important;font-weight:inherit!important;height:inherit!import=
ant">-</span><span class=3D"" style=3D"font-family:inherit;display:inline-b=
lock;zoom:1;font-size:inherit!important;line-height:inherit!important;font-=
weight:inherit!important;height:inherit!important">O</span><span class=3D""=
 style=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit=
!important;line-height:inherit!important;font-weight:inherit!important;heig=
ht:inherit!important">-</span><span class=3D"" style=3D"font-family:inherit=
;display:inline-block;zoom:1;font-size:inherit!important;line-height:inheri=
t!important;font-weight:inherit!important;height:inherit!important">L</span=
><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;=
font-size:inherit!important;line-height:inherit!important;font-weight:inher=
it!important;height:inherit!important;color:rgb(0,111,224)!important"> </sp=
an><span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:=
1;font-size:inherit!important;line-height:inherit!important;font-weight:inh=
erit!important;height:inherit!important">Bone</span><span class=3D"" style=
=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inherit!impor=
tant;line-height:inherit!important;font-weight:inherit!important;height:inh=
erit!important">-</span><span class=3D"" style=3D"font-family:inherit;displ=
ay:inline-block;zoom:1;font-size:inherit!important;line-height:inherit!impo=
rtant;font-weight:inherit!important;height:inherit!important">Black</span><=
span class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;fo=
nt-size:inherit!important;line-height:inherit!important;font-weight:inherit=
!important;height:inherit!important">-</span><span class=3D"" style=3D"font=
-family:inherit;display:inline-block;zoom:1;font-size:inherit!important;lin=
e-height:inherit!important;font-weight:inherit!important;height:inherit!imp=
ortant">HDMI</span><span class=3D"" style=3D"font-family:inherit;display:in=
line-block;zoom:1;font-size:inherit!important;line-height:inherit!important=
;font-weight:inherit!important;height:inherit!important">,</span><span clas=
s=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;font-size:i=
nherit!important;line-height:inherit!important;font-weight:inherit!importan=
t;height:inherit!important;color:rgb(8,40,251)!important">00A0</span><span =
class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;font-si=
ze:inherit!important;line-height:inherit!important;font-weight:inherit!impo=
rtant;height:inherit!important">,</span><span class=3D"" style=3D"font-fami=
ly:inherit;display:inline-block;zoom:1;font-size:inherit!important;line-hei=
ght:inherit!important;font-weight:inherit!important;height:inherit!importan=
t">Texas </span><span class=3D"" style=3D"font-family:inherit;display:inlin=
e-block;zoom:1;font-size:inherit!important;line-height:inherit!important;fo=
nt-weight:inherit!important;height:inherit!important">Instrument</span><spa=
n class=3D"" style=3D"font-family:inherit;display:inline-block;zoom:1;font-=
size:inherit!important;line-height:inherit!important;font-weight:inherit!im=
portant;height:inherit!important">,</span><span class=3D"" style=3D"font-fa=
mily:inherit;display:inline-block;zoom:1;font-size:inherit!important;line-h=
eight:inherit!important;font-weight:inherit!important;height:inherit!import=
ant">BB</span><span class=3D"" style=3D"font-family:inherit;display:inline-=
block;zoom:1;font-size:inherit!important;line-height:inherit!important;font=
-weight:inherit!important;height:inherit!important">-</span><span class=3D"=
" style=3D"font-family:inherit;display:inline-block;zoom:1;font-size:inheri=
t!important;line-height:inherit!important;font-weight:inherit!important;hei=
ght:inherit!important">BONELT</span><span class=3D"" style=3D"font-family:i=
nherit;display:inline-block;zoom:1;font-size:inherit!important;line-height:=
inherit!important;font-weight:inherit!important;height:inherit!important">-=
</span><span class=3D"" style=3D"font-family:inherit;display:inline-block;z=
oom:1;font-size:inherit!important;line-height:inherit!important;font-weight=
:inherit!important;height:inherit!important">HDMI</span></div>
</div></td></tr></tbody></table></div><div><br></div><div>Plz some one can =
tell me what I need to do to use this feature?</div><div><br></div><div>Is =
some thing possible using yocto?</div><div><br></div><div>Thanks.</div>
</div>-- <br><div dir=3D"ltr">*Raul Rosetto Mu=F1oz*<br></div>
</div>

--001a11334c381b229104f32709a5--
