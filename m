Return-Path: <zafrullahmehdi@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46A9AE0053A
	for <meta-ti@yoctoproject.org>; Mon, 10 Feb 2014 08:16:51 -0800 (PST)
Received: by mail-wg0-f51.google.com with SMTP id z12so4276126wgg.18
	for <meta-ti@yoctoproject.org>; Mon, 10 Feb 2014 08:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=BKrK7SNiXHi1YzUc8XKIL035OJPgVW+NgB/ukyLabVA=;
	b=0eM6KBDUbYsm83PHTuTDa3pLsxfFNH4Rv9hI6sDWgRJW5Pvn6pCQe2qkT2SlpHr8VQ
	Y3l486Gi5tgfOXLvAq+CkNxrcwjiqkUnzQIUm8TmpibPRZjKU4j9XPyCI8bcuR+tRYzf
	qM22vs8dkJXn1Dw9/4cxa6FhdO8CQd4WnzSRQm1144j4CAKVP+UDDewhLu9k0wtobF4Y
	N3ZoNbbEevI/3huynRXC3IdeVyc/yM0Go9koWiH0VbC7PoWc9ukiwMt6vVRoyBXvvq7x
	kGiwqk9S96I2ck5+O9EiscNEpUfNEyuPF+ZXJ2W/Q7nQWE89Lbwmnqkhf9cro7BjVgl3
	BUpA==
X-Received: by 10.180.77.74 with SMTP id q10mr11059668wiw.39.1392049009647;
	Mon, 10 Feb 2014 08:16:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.137.234 with HTTP; Mon, 10 Feb 2014 08:16:29 -0800 (PST)
From: Zafrullah Syed <zafrullahmehdi@gmail.com>
Date: Mon, 10 Feb 2014 17:16:29 +0100
Message-ID: <CAAGt+t3-dmMXrsTM+0oosRQ5NJmvCs5gjj=hBD23ms=rKw2Jtw@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: ti-imglib recipe
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
X-List-Received-Date: Mon, 10 Feb 2014 16:16:57 -0000
Content-Type: multipart/alternative; boundary=f46d043bdf6abae8b004f20faab2

--f46d043bdf6abae8b004f20faab2
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am trying to optimise Image processing algorithm and came across IMGLIB.
Is there any IMGLIB recipe?. In meta-ti/recipes-ti/includes/ti-paths.inc it
says "export IMGLIB_C64P_INSTALL_DIR_RECIPE=
"${installdir}/ti-imglib-tree".

I have successfully installed the following with Yocto.

TI_DSP_INSTALL = " \
 gstreamer-ti \
 ti-codec-engine \
 ti-dmai \
 ti-dspbios \
 ti-dsplink-module \
 ti-cmem-module \
 "
How to get IMGLIB with yocto? Do I need to download .bin file from ti
website and put it in ~/poky/downloads?

Any hints please?

-- 
Regards,
Zafrullah Syed

--f46d043bdf6abae8b004f20faab2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif">


I am trying to optimise Image processing algorithm and came across IMGLIB. =
Is there any IMGLIB recipe?. In meta-ti/recipes-ti/includes/ti-paths.inc it=
 says &quot;export IMGLIB_C64P_INSTALL_DIR_RECIPE=3D &quot;${installdir}/ti=
-imglib-tree&quot;.=A0</div>


<div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-seri=
f"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,helvet=
ica,sans-serif">I have successfully installed the following with Yocto.=A0<=
/div>

<div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-seri=
f"><br></div><div class=3D"gmail_default"><div class=3D"gmail_default"><fon=
t face=3D"arial, helvetica, sans-serif">TI_DSP_INSTALL =3D &quot; \</font><=
/div><div class=3D"gmail_default">

<font face=3D"arial, helvetica, sans-serif">=A0gstreamer-ti \</font></div><=
div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">=A0=
ti-codec-engine \</font></div><div class=3D"gmail_default"><font face=3D"ar=
ial, helvetica, sans-serif">=A0ti-dmai \</font></div>

<div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">=
=A0ti-dspbios \</font></div><div class=3D"gmail_default"><font face=3D"aria=
l, helvetica, sans-serif">=A0ti-dsplink-module \</font></div><div class=3D"=
gmail_default">

<font face=3D"arial, helvetica, sans-serif">=A0ti-cmem-module \</font></div=
><div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">=
=A0&quot;</font></div></div><div class=3D"gmail_default" style=3D"font-fami=
ly:arial,helvetica,sans-serif">

How to get IMGLIB with yocto? Do I need to download .bin file from ti websi=
te and put it in ~/poky/downloads?</div>
<div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-seri=
f"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,helvet=
ica,sans-serif">Any hints please?=A0<br></div><div><br></div>-- <br><div di=
r=3D"ltr">


<span style=3D"font-family:arial,sans-serif;font-size:13px;border-collapse:=
collapse;color:rgb(136,136,136)">Regards,<br>Zafrullah Syed</span><div><fon=
t color=3D"#888888" face=3D"arial, sans-serif"><span style=3D"border-collap=
se:collapse"><br>


</span></font></div></div>
</div>

--f46d043bdf6abae8b004f20faab2--
