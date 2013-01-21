Return-Path: <munoz0raul@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C889E013EB;
	Mon, 21 Jan 2013 02:00:15 -0800 (PST)
Received: by mail-ie0-f177.google.com with SMTP id k13so9522387iea.36
	for <multiple recipients>; Mon, 21 Jan 2013 02:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=hO8zIzbdn0uVxptye9NfJrnfnqWJlXWduAq1yhKsWHg=;
	b=y9ZOWWPN/z1r50fHTfiNi1En25qH0F8ECSKbnQKHp123VW4KPwd5M9T/x/648Ik0lm
	f6Cu44mm/mzV6h/a3j0EYkZo709y3DbP9VYP1sSIQ+bavv0N4oYp+eAOy07EZgZ6ljAA
	d+ESebLUc319/IDpFHT1T+9AxdK4KwSwImrHaTeYE/K3jK9xcEZN0c9LA+7nm1seFNPR
	084E6cK885TiLqscpVAxVMtsGfTXtYyFL5GpT6mHXeHXgiFIhQkKP3aJDzJb7cRfElth
	BucrvO6zccDyKXEuX28VOf6c0zlHk6ILwGI63h6Cx2oLnQh9AaecXe6/pourVH75JCWN
	SsTA==
MIME-Version: 1.0
X-Received: by 10.50.217.129 with SMTP id oy1mr8613628igc.26.1358762414457;
	Mon, 21 Jan 2013 02:00:14 -0800 (PST)
Received: by 10.64.147.40 with HTTP; Mon, 21 Jan 2013 02:00:14 -0800 (PST)
In-Reply-To: <CANmVirgp9nqu65jvhXQ3kpSEt=9roE6W8y5e65S6Kr9_2VnjHw@mail.gmail.com>
References: <CANmVirgp9nqu65jvhXQ3kpSEt=9roE6W8y5e65S6Kr9_2VnjHw@mail.gmail.com>
Date: Mon, 21 Jan 2013 08:00:14 -0200
Message-ID: <CANmVirgpGqK7MtnmtoBBT9UiOK5Pn7SqG0N6XV+Gb30s9K3Nog@mail.gmail.com>
From: Raul Rosetto Munoz <munoz0raul@gmail.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, 
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Mouse Keyboard don't work at sato Beagle Image
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
X-List-Received-Date: Mon, 21 Jan 2013 10:00:15 -0000
Content-Type: multipart/alternative; boundary=14dae934052b0c433a04d3c98798

--14dae934052b0c433a04d3c98798
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Some one have any suggestion?

I think that is a meta-ti configuration.

I did the same for imx53 using meta-fsl and the mouse and keyboard working
fine!

Thanks


2013/1/19 Raul Rosetto Munoz <munoz0raul@gmail.com>

> Hello All,
>
> I compiled a core-image-sato for a BeagleBone and BeagleBoard.
>
> I'm using all layers at danny version.
>
> My bblayer is like this:
>
>
> BBLAYERS ?=3D " \
>   /home/prjs/video0001/linux/poky/meta \
>   /home/prjs/video0001/linux/poky/meta-yocto \
>   /home/prjs/video0001/linux/meta-ti \
>   /home/prjs/video0001/linux/meta-openembedded/meta-oe  \
>   "
>
> In beagleboard Im using the DVI conector to see the X, and for beaglebone
> I'm using a DVI cape.
>
> At the two cases the video  working very well but for this two situation,
> when I plug some USB keyboard or USB mouse, I see at serial console that
> linux recognize the device, but in video interface, nothing happen.
>
> I dont know if is necessary create a video target for the USB devices.
>
> Here is a USB mouse log example:
>
>
> [   74.651458] usb 1-1: USB disconnect, device number 2
> [   79.874298] usb 1-1: new low-speed USB device number 3 using musb-hdrc
> [   80.016906] usb 1-1: New USB device found, idVendor=3D15d9, idProduct=
=3D0a33
> [   80.023925] usb 1-1: New USB device strings: Mfr=3D0, Product=3D1,
> SerialNumber=3D0
> [   80.031402] usb 1-1: Product: USB Mouse
> [   80.041412] input: USB Mouse as
> /devices/platform/omap/musb-ti81xx/musb-hdrc.1/usb1/1-1/1-1:1.0/input/inp=
ut1
> [   80.052642] generic-usb 0003:15D9:0A33.0002: input: USB HID v1.10 Mous=
e
> [USB Mouse] on usb-musb-hdrc.1-1/input0
>
>
> Thanks
>
> --
> *Raul Rosetto Mu=F1oz*
>



--=20
*Raul Rosetto Mu=F1oz*

--14dae934052b0c433a04d3c98798
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Some one have any suggestion?</div><div><br></div><di=
v>I think that is a meta-ti configuration.</div><div><br></div><div>I did t=
he same for imx53 using meta-fsl and the mouse and keyboard working fine!</=
div>
<div><br></div><div>Thanks</div></div><div class=3D"gmail_extra"><br><br><d=
iv class=3D"gmail_quote">2013/1/19 Raul Rosetto Munoz <span dir=3D"ltr">&lt=
;<a href=3D"mailto:munoz0raul@gmail.com" target=3D"_blank">munoz0raul@gmail=
.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hello All,<br></div><d=
iv><br></div><div>I compiled a core-image-sato for a BeagleBone and BeagleB=
oard.</div>
<div><br></div><div>I&#39;m using all layers at danny version.</div><div><b=
r></div><div>My bblayer is like this:</div>
<div><br></div><div><br></div><div><font face=3D"courier new, monospace">BB=
LAYERS ?=3D &quot; \</font></div><div><font face=3D"courier new, monospace"=
>=A0 /home/prjs/video0001/linux/poky/meta \</font></div><div><font face=3D"=
courier new, monospace">=A0 /home/prjs/video0001/linux/poky/meta-yocto \</f=
ont></div>

<div><font face=3D"courier new, monospace">=A0 /home/prjs/video0001/linux/m=
eta-ti \</font></div><div><font face=3D"courier new, monospace">=A0 /home/p=
rjs/video0001/linux/meta-openembedded/meta-oe =A0\</font></div><div><font f=
ace=3D"courier new, monospace">=A0 &quot;</font></div>

<div><br></div><div>In beagleboard Im using the DVI conector to see the X, =
and for beaglebone I&#39;m using a DVI cape.</div><div><br></div><div>At th=
e two cases the video =A0working very well but for this two situation, when=
 I plug some USB keyboard or USB mouse, I see at serial console that linux =
recognize the device, but in video interface, nothing happen.</div>

<div><br></div><div>I dont know if is necessary create a video target for t=
he USB devices.</div><div><br></div><div>Here is a USB mouse log example:</=
div><div><br></div><div><br></div><div><font face=3D"courier new, monospace=
">[ =A0 74.651458] usb 1-1: USB disconnect, device number 2</font></div>

<div><font face=3D"courier new, monospace">[ =A0 79.874298] usb 1-1: new lo=
w-speed USB device number 3 using musb-hdrc</font></div><div><font face=3D"=
courier new, monospace">[ =A0 80.016906] usb 1-1: New USB device found, idV=
endor=3D15d9, idProduct=3D0a33</font></div>

<div><font face=3D"courier new, monospace">[ =A0 80.023925] usb 1-1: New US=
B device strings: Mfr=3D0, Product=3D1, SerialNumber=3D0</font></div><div><=
font face=3D"courier new, monospace">[ =A0 80.031402] usb 1-1: Product: USB=
 Mouse</font></div>

<div><font face=3D"courier new, monospace">[ =A0 80.041412] input: USB Mous=
e as /devices/platform/omap/musb-ti81xx/musb-hdrc.1/usb1/1-1/1-1:1.0/input/=
input1</font></div><div><font face=3D"courier new, monospace">[ =A0 80.0526=
42] generic-usb 0003:15D9:0A33.0002: input: USB HID v1.10 Mouse [USB Mouse]=
 on usb-musb-hdrc.1-1/input0</font></div>

<div><br></div><div><br></div><div>Thanks</div><span class=3D"HOEnZb"><font=
 color=3D"#888888"><div><br></div>-- <br><b>Raul Rosetto Mu=F1oz</b>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><b>Raul Rose=
tto Mu=F1oz</b>
</div>

--14dae934052b0c433a04d3c98798--
