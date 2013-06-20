Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8B60E01400
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 21:15:16 -0700 (PDT)
Received: by mail-wi0-f179.google.com with SMTP id hj3so1301054wib.6
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 21:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=p9Qltp8SiubjD+skD82DBMXoQ8ISp8SvV0GBZe+wITg=;
	b=IKhctfdBr4Pgu2i43rTKz4NXb4Rz7hwDxChZEg5dSDYULRtWRP+dq8eEMb1LWmnmMs
	WB7PlQlFw/y/THuNktf8OC//byd1pQahbuQbVXGy+ZLBVV+FdlS5xA+Vrpnsc765ru06
	+R/uumwZkNoNOqbot6lJ2pUpYDAv6zkM/6AWGLGmoax9Q9O809eCiYW/kMeHPQ734hjP
	81WLjZ8JAejA2RoagGTgcS2wgRs98hH/Evh+8ZvQ/qL6zwow++GMZkUeU3d0JvvW4GBe
	xpINfMJ+CzI9qCZL+6b52KpBFp2TXPnd1qmil7LimL061xdoKCh/XgPfx791fAiTJ7bD
	GZnA==
X-Received: by 10.180.36.209 with SMTP id s17mr4098042wij.62.1371701714267;
	Wed, 19 Jun 2013 21:15:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.180.83.1 with HTTP; Wed, 19 Jun 2013 21:14:53 -0700 (PDT)
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB53158@DBDE04.ent.ti.com>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
	<CAP71WjztrzWx6K-MNG4RQfeu0V6F45M0_0j5WP0zZjt9s9i17A@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53158@DBDE04.ent.ti.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 20 Jun 2013 00:14:53 -0400
Message-ID: <CAP71WjzqEVcxwpwvMc9V-106b2Qyq5uc-x2erf_B7AZXeBQ2Zw@mail.gmail.com>
To: "Sundareson, Prabindh" <prabu@ti.com>
X-Gm-Message-State: ALoCoQlXGN7Ec1NN/59dIl/WLi1PRFypZgtlFlnU6luxxdOvZijflhYSiDwcfdPmvRnL66LZaORs
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: meta-ti + meta-qt5
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
X-List-Received-Date: Thu, 20 Jun 2013 04:15:19 -0000
Content-Type: multipart/alternative; boundary=e89a8f6473d96ac55c04df8e317b

--e89a8f6473d96ac55c04df8e317b
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 19, 2013 at 11:01 PM, Sundareson, Prabindh <prabu@ti.com> wrote:

> Yocto builds:****
>
> ** **
>
> http://gpupowered.org/node/20****
>
> ** **
>
> Standalone builds:****
>
> ** **
>
> http://gpupowered.org/node/21****
>
> ** **
>
>
yes, that's the blog posts, i had read. but that doesn't deal with eglfs.

i was trying to build qt5 with eglfs support using something like this:

+GL_DEPENDS = "virtual/libgles2 virtual/egl"
+QT_GLFLAGS = "-opengl es2 -eglfs"

since i don't have x11 support in my distro (on purpose), qt5base fails to
configure properly since the EGL auto detect fails to build for that reason:

| EGL auto-detection... ()
| compiling
/work/rdk/build-dylan-qemuarm/tmp/work/armv5te-rdk-linux-gnueabi/qtbase/5.0.2-r2.0/qtbase-opensource-src-5.0.2/config.tests/qpa/egl/egl.cpp
| In file included from
/work/rdk/build-dylan-qemuarm/tmp/sysroots/qemuarm/usr/include/EGL/egl.h:36:0,
|                  from
/work/rdk/build-dylan-qemuarm/tmp/work/armv5te-rdk-linux-gnueabi/qtbase/5.0.2-r2.0/qtbase-opensource-src-5.0.2/config.tests/qpa/egl/egl.cpp:42:
|
/work/rdk/build-dylan-qemuarm/tmp/sysroots/qemuarm/usr/include/EGL/eglplatform.h:118:22:
fatal error: X11/Xlib.h: No such file or directory
| compilation terminated.
| make: *** [egl.o] Error 1
| EGL disabled.


have you started to look into enabling eglfs in the build?

nicolas

--e89a8f6473d96ac55c04df8e317b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jun 19, 2013 at 11:01 PM, Sundareson, Prabindh <span dir=3D"ltr">&l=
t;<a href=3D"mailto:prabu@ti.com" target=3D"_blank">prabu@ti.com</a>&gt;</s=
pan> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><p class=3D""><span style=3D"font-size:11pt;font-family:Ca=
libri,sans-serif;color:rgb(31,73,125)">Yocto builds:<u></u><u></u></span></=
p>


<p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;=
color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;=
color:rgb(31,73,125)"><a href=3D"http://gpupowered.org/node/20" target=3D"_=
blank">http://gpupowered.org/node/20</a><u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;=
color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;=
color:rgb(31,73,125)">Standalone builds:<u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;=
color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;=
color:rgb(31,73,125)"><a href=3D"http://gpupowered.org/node/21" target=3D"_=
blank">http://gpupowered.org/node/21</a><u></u><u></u></span></p>
<p class=3D""><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;=
color:rgb(31,73,125)"><u></u>=A0<u></u></span></p>
<p class=3D""></p></blockquote></div><br>yes, that&#39;s the blog posts, i =
had read. but that doesn&#39;t deal with eglfs.=A0</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra" style>i was trying to build qt=
5 with eglfs support using something like this:</div>

<div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style=
><div class=3D"gmail_extra">+GL_DEPENDS =3D &quot;virtual/libgles2 virtual/=
egl&quot;<br></div><div class=3D"gmail_extra">+QT_GLFLAGS =3D &quot;-opengl=
 es2 -eglfs&quot;</div>

<div class=3D"gmail_extra"><br></div><div style>since i don&#39;t have x11 =
support in my distro (on purpose), qt5base fails to configure properly sinc=
e the EGL auto detect fails to build for that reason:</div><div style><br>

</div><div style><div>| EGL auto-detection... ()</div><div>| compiling /wor=
k/rdk/build-dylan-qemuarm/tmp/work/armv5te-rdk-linux-gnueabi/qtbase/5.0.2-r=
2.0/qtbase-opensource-src-5.0.2/config.tests/qpa/egl/egl.cpp</div><div>

| In file included from /work/rdk/build-dylan-qemuarm/tmp/sysroots/qemuarm/=
usr/include/EGL/egl.h:36:0,</div><div>| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
from /work/rdk/build-dylan-qemuarm/tmp/work/armv5te-rdk-linux-gnueabi/qtbas=
e/5.0.2-r2.0/qtbase-opensource-src-5.0.2/config.tests/qpa/egl/egl.cpp:42:</=
div>

<div>| /work/rdk/build-dylan-qemuarm/tmp/sysroots/qemuarm/usr/include/EGL/e=
glplatform.h:118:22: fatal error: X11/Xlib.h: No such file or directory</di=
v><div>| compilation terminated.</div><div>| make: *** [egl.o] Error 1</div=
>

<div>| EGL disabled.</div><div><br></div><div><br></div><div style>have you=
 started to look into enabling eglfs in the build?=A0</div><div style><br><=
/div><div style>nicolas</div></div><div style><br></div><div style><br></di=
v>

<div style><br></div><div><br></div><div><br></div></div><div class=3D"gmai=
l_extra" style><br></div></div>

--e89a8f6473d96ac55c04df8e317b--
