Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6469BE00D07; Fri, 18 Aug 2017 17:32:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.42 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ankur.tyagi85[at]gmail.com)
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9240AE00CB4
	for <meta-ti@yoctoproject.org>; Fri, 18 Aug 2017 17:32:16 -0700 (PDT)
Received: by mail-wm0-f42.google.com with SMTP id m85so10651692wma.0
	for <meta-ti@yoctoproject.org>; Fri, 18 Aug 2017 17:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sKPS1VZnXbdN9d27GMizG/LnGUZkKHutsuqZ3F7+znE=;
	b=iOyCpvP34eN5zaiPAEvkQgKVNVevvUaOrAA9NVGybonWazIpeduGz4OKaSNvzUBUEk
	h2ewYrFGgwJP2/90PKVblW/ketmIClUpz0Vj8AmtCwgdbfcfcWPzKsox9ej5nqxeJB27
	uyIEsYzZMyKI56mr7cPeOYtiCRzN7tYxOotJfRDDoL+QyXxVMN7yHSkwLF67yoVteKoj
	AJs29YmSgMYDwFGJnizq6CSUTBUgvGAauQs2OvmFsmNSMPwuAONFhdSJCqOIEtk9t0Sr
	W38gOAOnm10Cbtaoz6UrEMYXjaewT+LgO5liwV69RpRxOqzGIR/wQoYnYKAjtLEnelN8
	1n9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sKPS1VZnXbdN9d27GMizG/LnGUZkKHutsuqZ3F7+znE=;
	b=iqFBWxrk5Rn9/Om61XCa3hE//OY7c/2ZANAnighwM2iebHB9BwtZs5tCnVJtBadzAu
	pp8iBIg3wVCp6vjtTHILf/TNtYk65wIZC3tdVASvC6O0w25ZyA8m+rNOUHHYvn98P9/A
	O6/M7CUqWOe8rBrXtmT6ybhoswAIX2tcW5LbB+qlRvIMG4jrVxEDfzZCAyOI7mytyecw
	5+Ru3AiSDCP2G+XmuqDMoP3kWRgrR7r2Lr85zd1ulmINX4dJoKnvCaCKjrgTwGhGrxNt
	APuxNJl0uuge7K2pyI7jXdIY8hSDlxLBo+HZgOdObZgseJyBFuqO32Lgj+eJL98iCM1Q
	sU+w==
X-Gm-Message-State: AHYfb5j4wzVRF4zQZwckWiRU8NCP1oU1uWsO+VyujryeaIfbQhsxV5T6
	OM27qhLv6OFiLHWnQNDah0Fa6h+pug==
X-Received: by 10.80.219.133 with SMTP id p5mr6355360edk.104.1503102735541;
	Fri, 18 Aug 2017 17:32:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.175.65 with HTTP; Fri, 18 Aug 2017 17:31:54 -0700 (PDT)
In-Reply-To: <20170818232514.GD28233@edge>
References: <1502369244-9597-1-git-send-email-ankur.tyagi85@gmail.com>
	<20170811200720.GQ19736@edge>
	<CADySD0HZjR_GWuEPwe0qF_XO+g4xPZfXiK3m+iDrpH4-VFSzvg@mail.gmail.com>
	<20170816201519.GG19736@edge>
	<009C030982313E4589C6BC55FBF1E82A2539F2E4@DFLE09.ent.ti.com>
	<20170817161336.GK19736@edge>
	<009C030982313E4589C6BC55FBF1E82A2539F361@DFLE09.ent.ti.com>
	<CADySD0GuL75A22Tmunog4PP1KRXbrkeb1t=hQdgrc1km=ws61w@mail.gmail.com>
	<20170818232514.GD28233@edge>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 19 Aug 2017 12:31:54 +1200
Message-ID: <CADySD0G+ew5Ekxqgn5oncdwhJ4nNfzkuhuUiKcL6NuMM0w_PSw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: ti-sgx-ddk-um_1.14.3699939: check for wayland in DISTRO_FEATURES
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
X-List-Received-Date: Sat, 19 Aug 2017 00:32:18 -0000
Content-Type: multipart/alternative; boundary="f403043ea0fc9ced970557106003"

--f403043ea0fc9ced970557106003
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fair enough.

If Imagination has decided for the hard coded dependency, then they are
needed.

thanks
Ankur

On Sat, Aug 19, 2017 at 11:25 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Sat, Aug 19, 2017 at 11:18:08AM +1200, Ankur Tyagi wrote:
> > Thanks for the info Eric.
> >
> > So when wayland is removed from DISTRO_FEATURES, QT uses eglfs QPA and
> SGX
> > DDK UM uses
>
> As long as you have the required wayland libs present.
>
>
> > libpvrDRMWSEGL.so: EGLFS (Raw), then why hard coded dependency on
> wayland ?
>
> Ask Imagination.
>
>
> > Why to package libraries in target rootfs if they are not needed ?
>
> Because they are linked against and hence are needed to be present.
>
> --
> Denys
>
>
> > On Fri, Aug 18, 2017 at 4:33 AM, Ruei, Eric <e-ruei1@ti.com> wrote:
> >
> > > Hi, Denys:
> > >
> > > Yes and yes, we do need the wayland  libraries to be present at the
> target
> > > file system because they are required by the SGX DDM UM binaries.
> > > The SGX DDK UM supports the following three (EGL) window systems and
> > > auto-detect which one should be used.
> > > =E2=80=8B=E2=80=8B
> > > libpvrDRMWSEGL.so: EGLFS (Raw)
> > > libpvrGBMWSEGL.so: Wayland-Server, DRM owner such as kmscube, or QT Q=
PA
> > > EGLFS_KMS.
> > > libpvrws_WAYLAND.so: Wayland Client
> > >
> > > Best regards,
> > >
> > > Eric
> > >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Thursday, August 17, 2017 12:14 PM
> > > To: Ruei, Eric
> > > Cc: Ankur Tyagi; meta-ti@yoctoproject.org; R, Karthik
> > > Subject: Re: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for wayland =
in
> > > DISTRO_FEATURES
> > >
> > > Thanks, Eric,
> > >
> > > As I was suspecting, wayland libs are required to be present for SGX =
to
> > > work even in no-Wayland mode. Good thing OE detects those .so
> dependencies
> > > and automatically pulls them in for you.
> > >
> > > Have you tried removing Wayland pieces from the rootfs after the fact=
?
> I'm
> > > guessing SGX would stop working due to dynamic linker/loader not bein=
g
> able
> > > to resolve all the dependencies hardcoded in .so...
> > >
> > > --
> > > Denys
> > >
> > >
> > > On Thu, Aug 17, 2017 at 12:02:27PM -0400, Ruei, Eric wrote:
> > > > Hi, Denys:
> > > >
> > > > Yes, we can make PLSDK image with Weston disabled by removing wayla=
nd
> > > from
> > > > the DISTRO_FEATURES list.
> > > > Conf/local.conf:
> > > > DISTRO_FEATURES_remove =3D "wayland"
> > > >
> > > > Therefore QT will use eglfs as the default QPA.
> > > >
> > > > However, some of the wayland related libraries and components are
> still
> > > > present at the target file system.
> > > > There is no need to update ti-sgx-ddk-um_1.14.3699939 recipe and SG=
X
> > > should
> > > > work by using libpvrDRMWSEGL.so.
> > > >
> > > > Best regards,
> > > >
> > > > Eric
> > > >
> > > >
> > > > -----Original Message-----
> > > > From: Dmytriyenko, Denys
> > > > Sent: Wednesday, August 16, 2017 4:15 PM
> > > > To: Ankur Tyagi
> > > > Cc: meta-ti@yoctoproject.org; Ruei, Eric; R, Karthik
> > > > Subject: Re: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for waylan=
d
> in
> > > DISTRO_FEATURES
> > > >
> > > > +Eric and Karthik.
> > > >
> > > > On Sat, Aug 12, 2017 at 02:10:50PM +1200, Ankur Tyagi wrote:
> > > > > So even if I added "wayland" in DISTRO_FEATURES_remove, it would
> still
> > > > > be packaged in resulting image.
> > > > >
> > > > > I don't want to use x11, wayland and have also configured Qt to u=
se
> > > > > eglfs qpa. But it seems wayland will be used anyhow. Am I correct=
 ?
> > > >
> > > > I suspect it will try to link/load the needed wayland libs, but I
> > > haven't tried it myself.
> > > >
> > > >
> > > > Eric,
> > > >
> > > > Since you've been playing with eglfs lately, can you please
> > > confirm/clarify
> > > > whether SGX can work w/o Wayland?
> > > >
> > > >
> > > > > Old branch (daisy) was not having such dependency on wayland, may=
 I
> > > know
> > > > > why it is now ?
> > > >
> > > > The old 3D Graphics SDK supported 2 modes - X11 and raw FB. We
> haven't
> > > > supported X11 for years. The new SGX DDK binaries are mostly for
> Wayland
> > > > graphics stack, as far as I know, since that's what we support on o=
ur
> > > > platforms.
> > > >
> > > >
> > > > Karthik,
> > > >
> > > > Anything you want to add or clarify here?
> > > >
> > > > --
> > > > Denys
> > > >
> > > >
> > > > > On Sat, Aug 12, 2017 at 8:07 AM, Denys Dmytriyenko <denys@ti.com>
> > > wrote:
> > > > >
> > > > > > No, it's not an optional dependency, unfortunately:
> > > > > >
> > > > > > $ for i in lib*.so.*.*.*; do echo $i;
> arm-linux-gnueabihf-readelf -a
> > > $i |
> > > > > > grep wayland; done
> > > > > > libdbm.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > > libEGL.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > > libGLES_CM.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > > libGLESv2.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > > libglslcompiler.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > > libIMGegl.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > >     23: 0000f715     4 FUNC    GLOBAL DEFAULT   11
> > > > > > wayland_drm_buffer_get_fo
> > > > > >     39: 0000f6f9    26 FUNC    GLOBAL DEFAULT   11
> wayland_drm_uninit
> > > > > >     91: 0000f66d    56 FUNC    GLOBAL DEFAULT   11
> > > wayland_drm_buffer_get
> > > > > >    119: 0000f6a5    84 FUNC    GLOBAL DEFAULT   11
> wayland_drm_init
> > > > > >    123: 0000f719     4 FUNC    GLOBAL DEFAULT   11
> > > > > > wayland_drm_buffer_get_bu
> > > > > > libpvr2d.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > > libpvrDRMWSEGL.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > > libpvrGBMWSEGL.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > > libPVRScopeServices.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > > libpvr_wlegl.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-client.so.0]
> > > > > > libpvrws_WAYLAND.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-client.so.0]
> > > > > > libsrv_init.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > > libsrv_um.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > > libusc.so.1.14.3699939
> > > > > >  0x00000001 (NEEDED)                     Shared library:
> > > > > > [libwayland-server.so.0]
> > > > > >
> > > > > > --
> > > > > > Denys
> > > > > >
> > > > > >
> > > > > > On Fri, Aug 11, 2017 at 12:47:24AM +1200, Ankur Tyagi wrote:
> > > > > > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > > > > > ---
> > > > > > >  recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 7
> > > ++++---
> > > > > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > > > >
> > > > > > > diff --git a/recipes-graphics/libgles/ti-
> > > sgx-ddk-um_1.14.3699939.bb
> > > > > > b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > > > > > > index 60f63aa..593e405 100644
> > > > > > > --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > > > > > > +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > > > > > > @@ -34,8 +34,9 @@ inherit update-rc.d
> > > > > > >  PR =3D "r26"
> > > > > > >  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2
> > > > > > omap5-sgx-ddk-um-linux"
> > > > > > >
> > > > > > > -DEPENDS +=3D "libdrm udev libgbm wayland libffi"
> > > > > > > -RDEPENDS_${PN} +=3D "libdrm libudev libgbm wayland libffi
> > > libdrm-omap"
> > > > > > > +WAYLAND =3D "${@bb.utils.contains('DISTRO_FEATURES', 'waylan=
d',
> > > > > > 'wayland', '', d)}"
> > > > > > > +DEPENDS +=3D "libdrm udev libgbm ${WAYLAND} libffi"
> > > > > > > +RDEPENDS_${PN} +=3D "libdrm libudev libgbm ${WAYLAND} libffi
> > > libdrm-omap"
> > > > > > >
> > > > > > >  RPROVIDES_${PN} =3D "libegl libgles1 libgles2
> > > omap5-sgx-ddk-um-linux"
> > > > > > >  RPROVIDES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-de=
v
> > > > > > omap5-sgx-ddk-um-linux-dev"
> > > > > > > @@ -63,7 +64,7 @@ FILES_${PN} +=3D  "${includedir}/*"
> > > > > > >  FILES_${PN} +=3D  "${sysconfdir}/*"
> > > > > > >
> > > > > > >  PACKAGES =3D+ "${PN}-plugins"
> > > > > > > -FILES_${PN}-plugins =3D "${libdir}/libsrv_init.so
> > > ${libdir}/libsrv_um.so
> > > > > > ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> > > > > > ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> > > > > > ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
> > > > > > > +FILES_${PN}-plugins =3D "${libdir}/libsrv_init.so
> > > ${libdir}/libsrv_um.so
> > > > > > ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> > > > > > ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> > > > > > ${libdir}/libpvrGBMWSEGL.so  ${@bb.utils.contains('DISTRO_
> FEATURES',
> > > > > > 'wayland', '${libdir}/libpvrws_WAYLAND.so', '', d)}"
> > > > > > >  RDEPENDS_${PN} +=3D "${PN}-plugins"
> > > > > > >
> > > > > > >  ALLOW_EMPTY_${PN}-plugins =3D "1"
> > > > > > > --
> > > > > > > 2.7.4
> > > > > > >
> > > > > > > --
> > > > > > > _______________________________________________
> > > > > > > meta-ti mailing list
> > > > > > > meta-ti@yoctoproject.org
> > > > > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > > > >
> > >
>

--f403043ea0fc9ced970557106003
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Fair enough.</div><div class=3D"gmail_default" style=3D=
"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,helvetica,sans-serif">If Imagination has de=
cided for the hard coded dependency, then they are needed.</div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-s=
erif">thanks</div><div class=3D"gmail_default" style=3D"font-family:arial,h=
elvetica,sans-serif">Ankur</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Sat, Aug 19, 2017 at 11:25 AM, Denys Dmytriyenko <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys=
@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Sat, Aug 19, 2017 at 11:18:08AM +1200, Ankur Tyagi wrote:<br>
&gt; Thanks for the info Eric.<br>
&gt;<br>
&gt; So when wayland is removed from DISTRO_FEATURES, QT uses eglfs QPA and=
 SGX<br>
&gt; DDK UM uses<br>
<br>
</span>As long as you have the required wayland libs present.<br>
<span class=3D""><br>
<br>
&gt; libpvrDRMWSEGL.so: EGLFS (Raw), then why hard coded dependency on wayl=
and ?<br>
<br>
</span>Ask Imagination.<br>
<span class=3D""><br>
<br>
&gt; Why to package libraries in target rootfs if they are not needed ?<br>
<br>
</span>Because they are linked against and hence are needed to be present.<=
br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
Denys<br>
<br>
<br>
&gt; On Fri, Aug 18, 2017 at 4:33 AM, Ruei, Eric &lt;<a href=3D"mailto:e-ru=
ei1@ti.com">e-ruei1@ti.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Hi, Denys:<br>
&gt; &gt;<br>
&gt; &gt; Yes and yes, we do need the wayland=C2=A0 libraries to be present=
 at the target<br>
&gt; &gt; file system because they are required by the SGX DDM UM binaries.=
<br>
&gt; &gt; The SGX DDK UM supports the following three (EGL) window systems =
and<br>
&gt; &gt; auto-detect which one should be used.<br>
&gt; &gt; =E2=80=8B=E2=80=8B<br>
&gt; &gt; libpvrDRMWSEGL.so: EGLFS (Raw)<br>
&gt; &gt; libpvrGBMWSEGL.so: Wayland-Server, DRM owner such as kmscube, or =
QT QPA<br>
&gt; &gt; EGLFS_KMS.<br>
&gt; &gt; libpvrws_WAYLAND.so: Wayland Client<br>
&gt; &gt;<br>
&gt; &gt; Best regards,<br>
&gt; &gt;<br>
&gt; &gt; Eric<br>
&gt; &gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Dmytriyenko, Denys<br>
&gt; &gt; Sent: Thursday, August 17, 2017 12:14 PM<br>
&gt; &gt; To: Ruei, Eric<br>
&gt; &gt; Cc: Ankur Tyagi; <a href=3D"mailto:meta-ti@yoctoproject.org">meta=
-ti@yoctoproject.org</a>; R, Karthik<br>
&gt; &gt; Subject: Re: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for wayl=
and in<br>
&gt; &gt; DISTRO_FEATURES<br>
&gt; &gt;<br>
&gt; &gt; Thanks, Eric,<br>
&gt; &gt;<br>
&gt; &gt; As I was suspecting, wayland libs are required to be present for =
SGX to<br>
&gt; &gt; work even in no-Wayland mode. Good thing OE detects those .so dep=
endencies<br>
&gt; &gt; and automatically pulls them in for you.<br>
&gt; &gt;<br>
&gt; &gt; Have you tried removing Wayland pieces from the rootfs after the =
fact? I&#39;m<br>
&gt; &gt; guessing SGX would stop working due to dynamic linker/loader not =
being able<br>
&gt; &gt; to resolve all the dependencies hardcoded in .so...<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Denys<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Aug 17, 2017 at 12:02:27PM -0400, Ruei, Eric wrote:<br>
&gt; &gt; &gt; Hi, Denys:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yes, we can make PLSDK image with Weston disabled by removin=
g wayland<br>
&gt; &gt; from<br>
&gt; &gt; &gt; the DISTRO_FEATURES list.<br>
&gt; &gt; &gt; Conf/local.conf:<br>
&gt; &gt; &gt; DISTRO_FEATURES_remove =3D &quot;wayland&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Therefore QT will use eglfs as the default QPA.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; However, some of the wayland related libraries and component=
s are still<br>
&gt; &gt; &gt; present at the target file system.<br>
&gt; &gt; &gt; There is no need to update ti-sgx-ddk-um_1.14.3699939 recipe=
 and SGX<br>
&gt; &gt; should<br>
&gt; &gt; &gt; work by using libpvrDRMWSEGL.so.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Best regards,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Eric<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; From: Dmytriyenko, Denys<br>
&gt; &gt; &gt; Sent: Wednesday, August 16, 2017 4:15 PM<br>
&gt; &gt; &gt; To: Ankur Tyagi<br>
&gt; &gt; &gt; Cc: <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoct=
oproject.org</a>; Ruei, Eric; R, Karthik<br>
&gt; &gt; &gt; Subject: Re: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for=
 wayland in<br>
&gt; &gt; DISTRO_FEATURES<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +Eric and Karthik.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Sat, Aug 12, 2017 at 02:10:50PM +1200, Ankur Tyagi wrote:=
<br>
&gt; &gt; &gt; &gt; So even if I added &quot;wayland&quot; in DISTRO_FEATUR=
ES_remove, it would still<br>
&gt; &gt; &gt; &gt; be packaged in resulting image.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I don&#39;t want to use x11, wayland and have also conf=
igured Qt to use<br>
&gt; &gt; &gt; &gt; eglfs qpa. But it seems wayland will be used anyhow. Am=
 I correct ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I suspect it will try to link/load the needed wayland libs, =
but I<br>
&gt; &gt; haven&#39;t tried it myself.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Eric,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Since you&#39;ve been playing with eglfs lately, can you ple=
ase<br>
&gt; &gt; confirm/clarify<br>
&gt; &gt; &gt; whether SGX can work w/o Wayland?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Old branch (daisy) was not having such dependency on wa=
yland, may I<br>
&gt; &gt; know<br>
&gt; &gt; &gt; &gt; why it is now ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The old 3D Graphics SDK supported 2 modes - X11 and raw FB. =
We haven&#39;t<br>
&gt; &gt; &gt; supported X11 for years. The new SGX DDK binaries are mostly=
 for Wayland<br>
&gt; &gt; &gt; graphics stack, as far as I know, since that&#39;s what we s=
upport on our<br>
&gt; &gt; &gt; platforms.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Karthik,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Anything you want to add or clarify here?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; Denys<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Sat, Aug 12, 2017 at 8:07 AM, Denys Dmytriyenko &lt;=
<a href=3D"mailto:denys@ti.com">denys@ti.com</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; No, it&#39;s not an optional dependency, unfortuna=
tely:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; $ for i in lib*.so.*.*.*; do echo $i; arm-linux-gn=
ueabihf-readelf -a<br>
&gt; &gt; $i |<br>
&gt; &gt; &gt; &gt; &gt; grep wayland; done<br>
&gt; &gt; &gt; &gt; &gt; libdbm.so.1.14.3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt; libEGL.so.1.14.3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt; libGLES_CM.so.1.14.3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt; libGLESv2.so.1.14.3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt; libglslcompiler.so.1.14.<wbr>3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt; libIMGegl.so.1.14.3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A023: 0000f715=C2=A0 =C2=A0 =C2=
=A04 FUNC=C2=A0 =C2=A0 GLOBAL DEFAULT=C2=A0 =C2=A011<br>
&gt; &gt; &gt; &gt; &gt; wayland_drm_buffer_get_fo<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A039: 0000f6f9=C2=A0 =C2=A0 26 FU=
NC=C2=A0 =C2=A0 GLOBAL DEFAULT=C2=A0 =C2=A011 wayland_drm_uninit<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A091: 0000f66d=C2=A0 =C2=A0 56 FU=
NC=C2=A0 =C2=A0 GLOBAL DEFAULT=C2=A0 =C2=A011<br>
&gt; &gt; wayland_drm_buffer_get<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 119: 0000f6a5=C2=A0 =C2=A0 84 FUNC=C2=
=A0 =C2=A0 GLOBAL DEFAULT=C2=A0 =C2=A011 wayland_drm_init<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 123: 0000f719=C2=A0 =C2=A0 =C2=A04 FU=
NC=C2=A0 =C2=A0 GLOBAL DEFAULT=C2=A0 =C2=A011<br>
&gt; &gt; &gt; &gt; &gt; wayland_drm_buffer_get_bu<br>
&gt; &gt; &gt; &gt; &gt; libpvr2d.so.1.14.3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt; libpvrDRMWSEGL.so.1.14.3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt; libpvrGBMWSEGL.so.1.14.3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt; libPVRScopeServices.so.1.14.<wbr>3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt; libpvr_wlegl.so.1.14.3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-client.so.0]<br>
&gt; &gt; &gt; &gt; &gt; libpvrws_WAYLAND.so.1.14.<wbr>3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-client.so.0]<br>
&gt; &gt; &gt; &gt; &gt; libsrv_init.so.1.14.3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt; libsrv_um.so.1.14.3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt; libusc.so.1.14.3699939<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; Denys<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Fri, Aug 11, 2017 at 12:47:24AM +1200, Ankur Ty=
agi wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Ankur Tyagi &lt;<a href=3D"mai=
lto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 recipes-graphics/libgles/<a href=3D"htt=
p://ti-sgx-ddk-um_1.14.3699939.bb" rel=3D"noreferrer" target=3D"_blank">ti-=
<wbr>sgx-ddk-um_1.14.3699939.bb</a> | 7<br>
&gt; &gt; ++++---<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 1 file changed, 4 insertions(+), 3 dele=
tions(-)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/recipes-graphics/libgles/ti-<br>
&gt; &gt; <a href=3D"http://sgx-ddk-um_1.14.3699939.bb" rel=3D"noreferrer" =
target=3D"_blank">sgx-ddk-um_1.14.3699939.bb</a><br>
&gt; &gt; &gt; &gt; &gt; b/recipes-graphics/libgles/<a href=3D"http://ti-sg=
x-ddk-um_1.14.3699939.bb" rel=3D"noreferrer" target=3D"_blank">ti-<wbr>sgx-=
ddk-um_1.14.3699939.bb</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; index 60f63aa..593e405 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- a/recipes-graphics/libgles/<a href=3D"htt=
p://ti-sgx-ddk-um_1.14.3699939.bb" rel=3D"noreferrer" target=3D"_blank">ti-=
<wbr>sgx-ddk-um_1.14.3699939.bb</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/recipes-graphics/libgles/<a href=3D"htt=
p://ti-sgx-ddk-um_1.14.3699939.bb" rel=3D"noreferrer" target=3D"_blank">ti-=
<wbr>sgx-ddk-um_1.14.3699939.bb</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -34,8 +34,9 @@ inherit update-rc.d<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 PR =3D &quot;r26&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 PROVIDES +=3D &quot;virtual/egl virtual=
/libgles1 virtual/libgles2<br>
&gt; &gt; &gt; &gt; &gt; omap5-sgx-ddk-um-linux&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -DEPENDS +=3D &quot;libdrm udev libgbm waylan=
d libffi&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -RDEPENDS_${PN} +=3D &quot;libdrm libudev lib=
gbm wayland libffi<br>
&gt; &gt; libdrm-omap&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +WAYLAND =3D &quot;${@bb.utils.contains(&#39;=
DISTRO_<wbr>FEATURES&#39;, &#39;wayland&#39;,<br>
&gt; &gt; &gt; &gt; &gt; &#39;wayland&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +DEPENDS +=3D &quot;libdrm udev libgbm ${WAYL=
AND} libffi&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +RDEPENDS_${PN} +=3D &quot;libdrm libudev lib=
gbm ${WAYLAND} libffi<br>
&gt; &gt; libdrm-omap&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 RPROVIDES_${PN} =3D &quot;libegl libgle=
s1 libgles2<br>
&gt; &gt; omap5-sgx-ddk-um-linux&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 RPROVIDES_${PN}-dev =3D &quot;libegl-de=
v libgles1-dev libgles2-dev<br>
&gt; &gt; &gt; &gt; &gt; omap5-sgx-ddk-um-linux-dev&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -63,7 +64,7 @@ FILES_${PN} +=3D=C2=A0 &quo=
t;${includedir}/*&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 FILES_${PN} +=3D=C2=A0 &quot;${sysconfd=
ir}/*&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 PACKAGES =3D+ &quot;${PN}-plugins&quot;=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; -FILES_${PN}-plugins =3D &quot;${libdir}/libs=
rv_init.so<br>
&gt; &gt; ${libdir}/libsrv_um.so<br>
&gt; &gt; &gt; &gt; &gt; ${libdir}/libglslcompiler.so ${libdir}/libPVRScope=
Services.<wbr>so<br>
&gt; &gt; &gt; &gt; &gt; ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so=
<br>
&gt; &gt; &gt; &gt; &gt; ${libdir}/libpvrGBMWSEGL.so=C2=A0 ${libdir}/libpvr=
ws_WAYLAND.so&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +FILES_${PN}-plugins =3D &quot;${libdir}/libs=
rv_init.so<br>
&gt; &gt; ${libdir}/libsrv_um.so<br>
&gt; &gt; &gt; &gt; &gt; ${libdir}/libglslcompiler.so ${libdir}/libPVRScope=
Services.<wbr>so<br>
&gt; &gt; &gt; &gt; &gt; ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so=
<br>
&gt; &gt; &gt; &gt; &gt; ${libdir}/libpvrGBMWSEGL.so=C2=A0 ${@bb.utils.cont=
ains(&#39;DISTRO_<wbr>FEATURES&#39;,<br>
&gt; &gt; &gt; &gt; &gt; &#39;wayland&#39;, &#39;${libdir}/libpvrws_WAYLAND=
.<wbr>so&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 RDEPENDS_${PN} +=3D &quot;${PN}-plugins=
&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY_${PN}-plugins =3D &quot;1&q=
uot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; 2.7.4<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; ______________________________<wbr>__________=
_______<br>
&gt; &gt; &gt; &gt; &gt; &gt; meta-ti mailing list<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org">m=
eta-ti@yoctoproject.org</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.org/lis=
tinfo/meta-ti" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.<wbr>org/listinfo/meta-ti</a><br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
</div></div></blockquote></div><br></div>

--f403043ea0fc9ced970557106003--
