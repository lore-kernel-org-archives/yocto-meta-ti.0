Return-Path: <prabindh@yahoo.com>
Received: from nm23-vm0.bullet.mail.ne1.yahoo.com
	(nm23-vm0.bullet.mail.ne1.yahoo.com [98.138.91.57])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DFE9E01486
	for <meta-ti@yoctoproject.org>; Tue, 14 May 2013 21:15:22 -0700 (PDT)
Received: from [98.138.90.53] by nm23.bullet.mail.ne1.yahoo.com with NNFMP;
	15 May 2013 04:15:21 -0000
Received: from [98.138.89.251] by tm6.bullet.mail.ne1.yahoo.com with NNFMP;
	15 May 2013 04:15:21 -0000
Received: from [127.0.0.1] by omp1043.mail.ne1.yahoo.com with NNFMP;
	15 May 2013 04:15:21 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 428019.9121.bm@omp1043.mail.ne1.yahoo.com
Received: (qmail 49264 invoked by uid 60001); 15 May 2013 04:15:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1368591321; bh=2iGYigt8dl7RyjV6IV7eCCyBzcxrcWbBZq5jMNgiumk=;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type;
	b=5ANi4O9XVoNGR5gw7stSHOJT/Kq1zw5KdkP+3tJ5z9NY4/XwX5f5fjZoRzd2lgSEqQ0Kx8wHM0Du1OBCIQFoIEQFf70amNw0wL37xxoPJMBzEUTe2Ds1UMea3QgREvBcuS6NSELQtie9qCJTmdtO6nhn8dJVKOTkv/rTrD3sWIQ=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type;
	b=TkKZrG095EdUnYhi756txokMhUoaPUhjAorsNIAysMAs0f5AWqo6tkfRX56IPxiusf3YQ0scQPyoyRb316nxsCB0GEK0huXvP6S/tTWyL8vCrEMVVAyLt4gBdZnfsfiIkFOJxzO8TNXCamdfH29mjBiKbmAbBFp7X5ZkfhtEyoA=;
X-YMail-OSG: TZmUeX0VM1nwOHIEseuJtgL3TjEf4YYCWg6uMCVzs.o4F5m
	2tbx_CSUy9fk28AzqljGp7c_V3zmkymK6eMN0ciSSpEJkOVi4zHsJB5wIX6l
	3mjuoqH_eaXzrBoClEwWBps1mxBnzC6aGaRPL3HT.g64Ld4kIuA53H3zTYza
	9F2NA3ypnxqk6snI7aWvn7joce5kpVihYxmlCCJUups0Vk4.C9Vhzw7mxqaA
	wmGJ_2WEbWUz.pq5q7QNipaVHg._E9.j9gpEKjWNO41gmP1VmvlHWulY6lV4
	zz1KyDJ.iJSgHCelEeFSoBRmmGtm25tFuP7PtNU8f_S7PXVJq9sLryGf5IXu
	69mfUtLc9oMMCUNBTWFyF5FgoVfzMSefeUVIRstom80PmE2a768oX3e0Bx8B
	FQO_W07Z_yVuUuIfoVCq_RrNypn_cLS.sEp1E0KLRIDXo7VKz7RnFZZT9l.d
	T9Uhhml6nsi1lvRTQqUxtKn3C5t6_.sohwyG9PBZKZlid8GODjUJjSyuDSw7
	3Sn4VBpJH4BAc16Xi2nLyGRIn6bypEzj.f0lSOfXz99MFp_f7AbcIo45Bx9l
	3n3rL8n6ATTd7jVwUU9q1p5tsqKpUGsUjCaaIQnDE56W1IvEB8MdeEfHoUar
	HZwjGfRL4Arj5nwpq5WtSbxXx9RmLmWP4VrqdisqJ_jG7Dk6ZMkjglq9c7IQ
	mbjlSar4b.rg5UyMIvk3W.XDVwwpmHm8jaLQl7BrZzIx1hQ_NotlWYrCrbG6
	FnHOMEIp6FlCCWjQPf1sYozD3uFrHZ_2aKHmTtRyaB1SJYQykATxanllTZ6V
	O16rIZ4n2gy4UeSrEtgbO2NeXNTF7w6Pr4QywL72J.F1QKvrMK02DiIwigbu
	pkZByV.QU2wEGkX4ab7ztCXCYOeXAYfXMqcgFaN.wWUWq07wXZVdHSbxcWq2
	eXUnzhLVBm9C1JcJ7110_9piL6r.A7XwWYPh7flc5hLOzeQ--
Received: from [61.95.193.231] by web125603.mail.ne1.yahoo.com via HTTP;
	Tue, 14 May 2013 21:15:21 PDT
X-Rocket-MIMEInfo: 002.001,
	RGVueXMsCgpIb3cgY2FuIHRoaXMgYmUgY29uZmlybWVkID8gQW55IG90aGVyIGxpc3QgdG8gYXNrID8KCgpyZWdhcmRzClByYWJ1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KIEZyb206IERlbnlzIERteXRyaXllbmtvIDxkZW55c0B0aS5jb20.ClRvOiBQcmFiaW5kaCBTdW5kYXJlc29uIDxwcmFidUB0aS5jb20.IApDYzogbWV0YS10aUB5b2N0b3Byb2plY3Qub3JnIApTZW50OiBUdWVzZGF5LCBNYXkgMTQsIDIwMTMgMTE6MDEgUE0KU3ViamVjdDogUmU6IFttZXRhLXRpXSBbUEFUQ0ggMDYBMAEBAQE-
X-Mailer: YahooMailWebService/0.8.141.536
References: <1367501964-6294-1-git-send-email-prabu@ti.com>
	<1367501964-6294-6-git-send-email-prabu@ti.com>
	<20130514173131.GD31835@denix.org>
Message-ID: <1368591321.48894.YahooMailNeo@web125603.mail.ne1.yahoo.com>
Date: Tue, 14 May 2013 21:15:21 -0700 (PDT)
From: Prabindh Sundareson <prabindh@yahoo.com>
To: Denys Dmytriyenko <denys@ti.com>, Prabindh Sundareson <prabu@ti.com>
In-Reply-To: <20130514173131.GD31835@denix.org>
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 06/10] libgles-omap3: Add missing RPROVIDES
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Prabindh Sundareson <prabindh@yahoo.com>
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 04:15:22 -0000
Content-Type: multipart/alternative;
	boundary="933233344-2066957447-1368591321=:48894"

--933233344-2066957447-1368591321=:48894
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Denys,=0A=0AHow can this be confirmed ? Any other list to ask ?=0A=0A=0Areg=
ards=0APrabu=0A=0A=0A________________________________=0A From: Denys Dmytri=
yenko <denys@ti.com>=0ATo: Prabindh Sundareson <prabu@ti.com> =0ACc: meta-t=
i@yoctoproject.org =0ASent: Tuesday, May 14, 2013 11:01 PM=0ASubject: Re: [=
meta-ti] [PATCH 06/10] libgles-omap3: Add missing RPROVIDES=0A =0A=0AOn Thu=
, May 02, 2013 at 07:09:20PM +0530, Prabindh Sundareson wrote:=0A> RPROVIDE=
S specifies the libraries that are dynamically loaded=0A> at runtime. This =
patch fixes "no package provides libGLESv2.so" and=0A> similar errors that =
occur when including packages like qtbase.=0A=0AI'm still somewhat not sure=
 about this patch. I know you had this problem with =0AQt5, but I'm wonderi=
ng if there's a bug with shlib handling in latest OE, as =0Ayou ususally do=
n't need to specify shared libs in RPROVIDES...=0A=0A=0A> Signed-off-by: Pr=
abindh Sundareson <prabu@ti.com>=0A> ---=0A>=A0 recipes-graphics/libgles/li=
bgles-omap3.inc |=A0 =A0 1 +=0A>=A0 1 files changed, 1 insertions(+), 0 del=
etions(-)=0A> =0A> diff --git a/recipes-graphics/libgles/libgles-omap3.inc =
b/recipes-graphics/libgles/libgles-omap3.inc=0A> index d08a04d..c33062a 100=
644=0A> --- a/recipes-graphics/libgles/libgles-omap3.inc=0A> +++ b/recipes-=
graphics/libgles/libgles-omap3.inc=0A> @@ -201,6 +201,7 @@ PRIVATE_LIBS_${P=
N}-es5 =3D "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so lib=0A>=A0 P=
RIVATE_LIBS_${PN}-es6 =3D "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.=
so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.=
so"=0A>=A0 PRIVATE_LIBS_${PN}-es8 =3D "libGLESv2.so libIMGegl.so libsrv_um.=
so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so=
 libGLES_CM.so"=0A>=A0 =0A> +RPROVIDES_${PN} +=3D "libGLESv2.so libEGL.so l=
ibGLES_CM.so libpvr2d.so libIMGegl.so libsrv_init.so libsrv_um.so libsrv_um=
_dri.so libglslcompiler.so"=0A>=A0 =0A>=A0 PACKAGES =3D+ "${PN}-blitwsegl $=
{PN}-flipwsegl ${PN}-frontwsegl ${PN}-linuxfbwsegl"=0A>=A0 =0A> -- =0A> 1.7=
.1=0A> =0A> _______________________________________________=0A> meta-ti mai=
ling list=0A> meta-ti@yoctoproject.org=0A> https://lists.yoctoproject.org/l=
istinfo/meta-ti=0A> =0A_______________________________________________=0Ame=
ta-ti mailing list=0Ameta-ti@yoctoproject.org=0Ahttps://lists.yoctoproject.=
org/listinfo/meta-ti

--933233344-2066957447-1368591321=:48894
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ar=
ial, helvetica, sans-serif;font-size:12pt">Denys,<br><br>How can this be co=
nfirmed ? Any other list to ask ?<br><div><span><br></span></div><div>regar=
ds</div><div>Prabu<br></div>  <div style=3D"font-family: arial, helvetica, =
sans-serif; font-size: 12pt;"> <div style=3D"font-family: times new roman, =
new york, times, serif; font-size: 12pt;"> <div dir=3D"ltr"> <hr size=3D"1"=
>  <font face=3D"Arial" size=3D"2"> <b><span style=3D"font-weight:bold;">Fr=
om:</span></b> Denys Dmytriyenko &lt;denys@ti.com&gt;<br> <b><span style=3D=
"font-weight: bold;">To:</span></b> Prabindh Sundareson &lt;prabu@ti.com&gt=
; <br><b><span style=3D"font-weight: bold;">Cc:</span></b> meta-ti@yoctopro=
ject.org <br> <b><span style=3D"font-weight: bold;">Sent:</span></b> Tuesda=
y, May 14, 2013 11:01 PM<br> <b><span style=3D"font-weight: bold;">Subject:=
</span></b> Re: [meta-ti] [PATCH 06/10] libgles-omap3: Add missing RPROVIDE=
S<br> </font>
 </div> <div class=3D"y_msg_container"><br>On Thu, May 02, 2013 at 07:09:20=
PM +0530, Prabindh Sundareson wrote:<br>&gt; RPROVIDES specifies the librar=
ies that are dynamically loaded<br>&gt; at runtime. This patch fixes "no pa=
ckage provides libGLESv2.so" and<br>&gt; similar errors that occur when inc=
luding packages like qtbase.<br><br>I'm still somewhat not sure about this =
patch. I know you had this problem with <br>Qt5, but I'm wondering if there=
's a bug with shlib handling in latest OE, as <br>you ususally don't need t=
o specify shared libs in RPROVIDES...<br><br><br>&gt; Signed-off-by: Prabin=
dh Sundareson &lt;<a ymailto=3D"mailto:prabu@ti.com" href=3D"mailto:prabu@t=
i.com">prabu@ti.com</a>&gt;<br>&gt; ---<br>&gt;&nbsp; recipes-graphics/libg=
les/libgles-omap3.inc |&nbsp; &nbsp; 1 +<br>&gt;&nbsp; 1 files changed, 1 i=
nsertions(+), 0 deletions(-)<br>&gt; <br>&gt; diff --git a/recipes-graphics=
/libgles/libgles-omap3.inc
 b/recipes-graphics/libgles/libgles-omap3.inc<br>&gt; index d08a04d..c33062=
a 100644<br>&gt; --- a/recipes-graphics/libgles/libgles-omap3.inc<br>&gt; +=
++ b/recipes-graphics/libgles/libgles-omap3.inc<br>&gt; @@ -201,6 +201,7 @@=
 PRIVATE_LIBS_${PN}-es5 =3D "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2=
d.so lib<br>&gt;&nbsp; PRIVATE_LIBS_${PN}-es6 =3D "libGLESv2.so libIMGegl.s=
o libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libgls=
lcompiler.so libGLES_CM.so"<br>&gt;&nbsp; PRIVATE_LIBS_${PN}-es8 =3D "libGL=
ESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libs=
rv_um_dri.so libglslcompiler.so libGLES_CM.so"<br>&gt;&nbsp; <br>&gt; +RPRO=
VIDES_${PN} +=3D "libGLESv2.so libEGL.so libGLES_CM.so libpvr2d.so libIMGeg=
l.so libsrv_init.so libsrv_um.so libsrv_um_dri.so libglslcompiler.so"<br>&g=
t;&nbsp; <br>&gt;&nbsp; PACKAGES =3D+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN=
}-frontwsegl ${PN}-linuxfbwsegl"<br>&gt;&nbsp; <br>&gt; -- <br>&gt;
 1.7.1<br>&gt; <br>&gt; _______________________________________________<br>=
&gt; meta-ti mailing list<br>&gt; <a ymailto=3D"mailto:meta-ti@yoctoproject=
.org" href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a>=
<br>&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=
=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>&gt; <br=
>_______________________________________________<br>meta-ti mailing list<br=
><a ymailto=3D"mailto:meta-ti@yoctoproject.org" href=3D"mailto:meta-ti@yoct=
oproject.org">meta-ti@yoctoproject.org</a><br><a href=3D"https://lists.yoct=
oproject.org/listinfo/meta-ti" target=3D"_blank">https://lists.yoctoproject=
.org/listinfo/meta-ti</a><br><br><br></div> </div> </div>  </div></body></h=
tml>

--933233344-2066957447-1368591321=:48894--
