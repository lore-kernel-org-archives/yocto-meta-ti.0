Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FFFDE00CEC; Fri, 18 Aug 2017 16:18:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ankur.tyagi85[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.42 listed in list.dnswl.org]
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97C4EE00C1C
	for <meta-ti@yoctoproject.org>; Fri, 18 Aug 2017 16:18:30 -0700 (PDT)
Received: by mail-wm0-f42.google.com with SMTP id u29so2944292wma.0
	for <meta-ti@yoctoproject.org>; Fri, 18 Aug 2017 16:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B128bY6FhlELE2o7ZO1bfX1SEoEcqjwnmn2SusoQRI0=;
	b=a3SrjB2z29mFrJxEvMY3oEPFnI95JZgZaEgomtqulpRYvEup77MpUKScl5cjrCDgqU
	4F12A5Ts9Z0srlF+cM4tTnBQmqIGAUqW1FI9jWHoZu07dU9T70c6NskYu64sTXclAe3u
	pwOWB+u5Tq1A50NuVn/NssH51toTZWROpZNFMWO+cgstr+Pta7gPN0Y7PAfVvwaiaITC
	aTWijg1uCYGvt8NDkAaWILpgYPN8JHxqvU9sW0t8hzukZD4Wl+YgUvgBg+PJTKbsnW3O
	zy0Q4k/somgVnZcy600p/A7Oya/S7VQqC/MmWWXPdDyblQ1M0R0+7lieEv20WaT4RcBd
	dRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B128bY6FhlELE2o7ZO1bfX1SEoEcqjwnmn2SusoQRI0=;
	b=FGK/+ebgfkhUmdVmMM0vzBnGxjnGqJ98FzBVlTTJiDwyHuWFcIS9+nDcAW0nO6ns19
	EF6r4bSxccUSJi/BY5NnnVduxsrmFz3UxPCLEKpvIYsHyxyXEgO63GbALU3iqzJ5nhlv
	zveTvWbVathgulGkYy9OUwrt63Azesf808oR8zu8bCrZCowRbfcggztkY8p6DUnHMUo/
	Or3azxQLG7kxDHAUobm2mvPiwXLOTviBFBcGB1LC7QoabpcJmwrCRTkjbeCRPoROeCfb
	L6b4SFLWU2+yS7YRPnm0tIDO4Tq9EsGmM0bEalvkw4GQVvA0lQ4+HQualvdfGs2ZwL/D
	vJmw==
X-Gm-Message-State: AHYfb5iXEGmVyZbYN2kJy05qF3/6L2vI9Ocp0yqEcPg5BAM1Jku9NQ+v
	h12ZW1Ath1XYkGEpBnC46T8Enyg61jQf
X-Received: by 10.80.191.75 with SMTP id g11mr5938136edk.243.1503098309381;
	Fri, 18 Aug 2017 16:18:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.175.65 with HTTP; Fri, 18 Aug 2017 16:18:08 -0700 (PDT)
In-Reply-To: <009C030982313E4589C6BC55FBF1E82A2539F361@DFLE09.ent.ti.com>
References: <1502369244-9597-1-git-send-email-ankur.tyagi85@gmail.com>
	<20170811200720.GQ19736@edge>
	<CADySD0HZjR_GWuEPwe0qF_XO+g4xPZfXiK3m+iDrpH4-VFSzvg@mail.gmail.com>
	<20170816201519.GG19736@edge>
	<009C030982313E4589C6BC55FBF1E82A2539F2E4@DFLE09.ent.ti.com>
	<20170817161336.GK19736@edge>
	<009C030982313E4589C6BC55FBF1E82A2539F361@DFLE09.ent.ti.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 19 Aug 2017 11:18:08 +1200
Message-ID: <CADySD0GuL75A22Tmunog4PP1KRXbrkeb1t=hQdgrc1km=ws61w@mail.gmail.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
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
X-List-Received-Date: Fri, 18 Aug 2017 23:18:32 -0000
Content-Type: multipart/alternative; boundary="089e0824ef2ccb122e05570f58ca"

--089e0824ef2ccb122e05570f58ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the info Eric.

So when wayland is removed from DISTRO_FEATURES, QT uses eglfs QPA and SGX
DDK UM uses
=E2=80=8B
libpvrDRMWSEGL.so: EGLFS (Raw), then why hard coded dependency on wayland ?

Why to package libraries in target rootfs if they are not needed ?

regards
Ankur

On Fri, Aug 18, 2017 at 4:33 AM, Ruei, Eric <e-ruei1@ti.com> wrote:

> Hi, Denys:
>
> Yes and yes, we do need the wayland  libraries to be present at the targe=
t
> file system because they are required by the SGX DDM UM binaries.
> The SGX DDK UM supports the following three (EGL) window systems and
> auto-detect which one should be used.
> =E2=80=8B=E2=80=8B
> libpvrDRMWSEGL.so: EGLFS (Raw)
> libpvrGBMWSEGL.so: Wayland-Server, DRM owner such as kmscube, or QT QPA
> EGLFS_KMS.
> libpvrws_WAYLAND.so: Wayland Client
>
> Best regards,
>
> Eric
>
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, August 17, 2017 12:14 PM
> To: Ruei, Eric
> Cc: Ankur Tyagi; meta-ti@yoctoproject.org; R, Karthik
> Subject: Re: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for wayland in
> DISTRO_FEATURES
>
> Thanks, Eric,
>
> As I was suspecting, wayland libs are required to be present for SGX to
> work even in no-Wayland mode. Good thing OE detects those .so dependencie=
s
> and automatically pulls them in for you.
>
> Have you tried removing Wayland pieces from the rootfs after the fact? I'=
m
> guessing SGX would stop working due to dynamic linker/loader not being ab=
le
> to resolve all the dependencies hardcoded in .so...
>
> --
> Denys
>
>
> On Thu, Aug 17, 2017 at 12:02:27PM -0400, Ruei, Eric wrote:
> > Hi, Denys:
> >
> > Yes, we can make PLSDK image with Weston disabled by removing wayland
> from
> > the DISTRO_FEATURES list.
> > Conf/local.conf:
> > DISTRO_FEATURES_remove =3D "wayland"
> >
> > Therefore QT will use eglfs as the default QPA.
> >
> > However, some of the wayland related libraries and components are still
> > present at the target file system.
> > There is no need to update ti-sgx-ddk-um_1.14.3699939 recipe and SGX
> should
> > work by using libpvrDRMWSEGL.so.
> >
> > Best regards,
> >
> > Eric
> >
> >
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, August 16, 2017 4:15 PM
> > To: Ankur Tyagi
> > Cc: meta-ti@yoctoproject.org; Ruei, Eric; R, Karthik
> > Subject: Re: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for wayland in
> DISTRO_FEATURES
> >
> > +Eric and Karthik.
> >
> > On Sat, Aug 12, 2017 at 02:10:50PM +1200, Ankur Tyagi wrote:
> > > So even if I added "wayland" in DISTRO_FEATURES_remove, it would stil=
l
> > > be packaged in resulting image.
> > >
> > > I don't want to use x11, wayland and have also configured Qt to use
> > > eglfs qpa. But it seems wayland will be used anyhow. Am I correct ?
> >
> > I suspect it will try to link/load the needed wayland libs, but I
> haven't tried it myself.
> >
> >
> > Eric,
> >
> > Since you've been playing with eglfs lately, can you please
> confirm/clarify
> > whether SGX can work w/o Wayland?
> >
> >
> > > Old branch (daisy) was not having such dependency on wayland, may I
> know
> > > why it is now ?
> >
> > The old 3D Graphics SDK supported 2 modes - X11 and raw FB. We haven't
> > supported X11 for years. The new SGX DDK binaries are mostly for Waylan=
d
> > graphics stack, as far as I know, since that's what we support on our
> > platforms.
> >
> >
> > Karthik,
> >
> > Anything you want to add or clarify here?
> >
> > --
> > Denys
> >
> >
> > > On Sat, Aug 12, 2017 at 8:07 AM, Denys Dmytriyenko <denys@ti.com>
> wrote:
> > >
> > > > No, it's not an optional dependency, unfortunately:
> > > >
> > > > $ for i in lib*.so.*.*.*; do echo $i; arm-linux-gnueabihf-readelf -=
a
> $i |
> > > > grep wayland; done
> > > > libdbm.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > > libEGL.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > > libGLES_CM.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > > libGLESv2.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > > libglslcompiler.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > > libIMGegl.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > >     23: 0000f715     4 FUNC    GLOBAL DEFAULT   11
> > > > wayland_drm_buffer_get_fo
> > > >     39: 0000f6f9    26 FUNC    GLOBAL DEFAULT   11 wayland_drm_unin=
it
> > > >     91: 0000f66d    56 FUNC    GLOBAL DEFAULT   11
> wayland_drm_buffer_get
> > > >    119: 0000f6a5    84 FUNC    GLOBAL DEFAULT   11 wayland_drm_init
> > > >    123: 0000f719     4 FUNC    GLOBAL DEFAULT   11
> > > > wayland_drm_buffer_get_bu
> > > > libpvr2d.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > > libpvrDRMWSEGL.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > > libpvrGBMWSEGL.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > > libPVRScopeServices.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > > libpvr_wlegl.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-client.so.0]
> > > > libpvrws_WAYLAND.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-client.so.0]
> > > > libsrv_init.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > > libsrv_um.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > > libusc.so.1.14.3699939
> > > >  0x00000001 (NEEDED)                     Shared library:
> > > > [libwayland-server.so.0]
> > > >
> > > > --
> > > > Denys
> > > >
> > > >
> > > > On Fri, Aug 11, 2017 at 12:47:24AM +1200, Ankur Tyagi wrote:
> > > > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > > > ---
> > > > >  recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 7
> ++++---
> > > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/recipes-graphics/libgles/ti-
> sgx-ddk-um_1.14.3699939.bb
> > > > b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > > > > index 60f63aa..593e405 100644
> > > > > --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > > > > +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > > > > @@ -34,8 +34,9 @@ inherit update-rc.d
> > > > >  PR =3D "r26"
> > > > >  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2
> > > > omap5-sgx-ddk-um-linux"
> > > > >
> > > > > -DEPENDS +=3D "libdrm udev libgbm wayland libffi"
> > > > > -RDEPENDS_${PN} +=3D "libdrm libudev libgbm wayland libffi
> libdrm-omap"
> > > > > +WAYLAND =3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> > > > 'wayland', '', d)}"
> > > > > +DEPENDS +=3D "libdrm udev libgbm ${WAYLAND} libffi"
> > > > > +RDEPENDS_${PN} +=3D "libdrm libudev libgbm ${WAYLAND} libffi
> libdrm-omap"
> > > > >
> > > > >  RPROVIDES_${PN} =3D "libegl libgles1 libgles2
> omap5-sgx-ddk-um-linux"
> > > > >  RPROVIDES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev
> > > > omap5-sgx-ddk-um-linux-dev"
> > > > > @@ -63,7 +64,7 @@ FILES_${PN} +=3D  "${includedir}/*"
> > > > >  FILES_${PN} +=3D  "${sysconfdir}/*"
> > > > >
> > > > >  PACKAGES =3D+ "${PN}-plugins"
> > > > > -FILES_${PN}-plugins =3D "${libdir}/libsrv_init.so
> ${libdir}/libsrv_um.so
> > > > ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> > > > ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> > > > ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
> > > > > +FILES_${PN}-plugins =3D "${libdir}/libsrv_init.so
> ${libdir}/libsrv_um.so
> > > > ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> > > > ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> > > > ${libdir}/libpvrGBMWSEGL.so  ${@bb.utils.contains('DISTRO_FEATURES'=
,
> > > > 'wayland', '${libdir}/libpvrws_WAYLAND.so', '', d)}"
> > > > >  RDEPENDS_${PN} +=3D "${PN}-plugins"
> > > > >
> > > > >  ALLOW_EMPTY_${PN}-plugins =3D "1"
> > > > > --
> > > > > 2.7.4
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > meta-ti mailing list
> > > > > meta-ti@yoctoproject.org
> > > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > >
>

--089e0824ef2ccb122e05570f58ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Thanks for the info Eric.</div><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">So when=
 wayland is removed from DISTRO_FEATURES, QT uses eglfs QPA and SGX DDK UM =
uses=C2=A0<div class=3D"gmail_default" style=3D"display:inline">=E2=80=8B</=
div><span style=3D"font-family:arial,sans-serif">libpvrDRMWSEGL.so: EGLFS (=
Raw), then why hard coded dependency on wayland ?</span></div><div class=3D=
"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><span styl=
e=3D"font-family:arial,sans-serif"><br></span></div><div class=3D"gmail_def=
ault" style=3D"font-family:arial,helvetica,sans-serif"><span style=3D"font-=
family:arial,sans-serif">Why to package libraries in target rootfs if they =
are not needed ?</span></div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif"><span style=3D"font-family:arial,sans-serif=
"><br></span></div><div class=3D"gmail_default" style=3D"font-family:arial,=
helvetica,sans-serif"><span style=3D"font-family:arial,sans-serif">regards<=
/span></div><div class=3D"gmail_default" style=3D"font-family:arial,helveti=
ca,sans-serif"><span style=3D"font-family:arial,sans-serif">Ankur</span></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Aug 18=
, 2017 at 4:33 AM, Ruei, Eric <span dir=3D"ltr">&lt;<a href=3D"mailto:e-rue=
i1@ti.com" target=3D"_blank">e-ruei1@ti.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi, Denys:<br>
<br>
Yes and yes, we do need the wayland=C2=A0 libraries to be present at the ta=
rget file system because they are required by the SGX DDM UM binaries.<br>
The SGX DDK UM supports the following three (EGL) window systems and auto-d=
etect which one should be used.<br>
<div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-seri=
f;display:inline">=E2=80=8B=E2=80=8B</div>libpvrDRMWSEGL.so: EGLFS (Raw)<br=
>
libpvrGBMWSEGL.so: Wayland-Server, DRM owner such as kmscube, or QT QPA EGL=
FS_KMS.<br>
libpvrws_WAYLAND.so: Wayland Client<br>
<span class=3D"gmail-im gmail-HOEnZb"><br>
Best regards,<br>
<br>
Eric<br>
<br>
-----Original Message-----<br>
From: Dmytriyenko, Denys<br>
</span><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">Sent: Thursday, =
August 17, 2017 12:14 PM<br>
To: Ruei, Eric<br>
Cc: Ankur Tyagi; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctop=
roject.org</a>; R, Karthik<br>
Subject: Re: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for wayland in DIS=
TRO_FEATURES<br>
<br>
Thanks, Eric,<br>
<br>
As I was suspecting, wayland libs are required to be present for SGX to wor=
k even in no-Wayland mode. Good thing OE detects those .so dependencies and=
 automatically pulls them in for you.<br>
<br>
Have you tried removing Wayland pieces from the rootfs after the fact? I&#3=
9;m guessing SGX would stop working due to dynamic linker/loader not being =
able to resolve all the dependencies hardcoded in .so...<br>
<br>
--<br>
Denys<br>
<br>
<br>
On Thu, Aug 17, 2017 at 12:02:27PM -0400, Ruei, Eric wrote:<br>
&gt; Hi, Denys:<br>
&gt;<br>
&gt; Yes, we can make PLSDK image with Weston disabled by removing wayland =
from<br>
&gt; the DISTRO_FEATURES list.<br>
&gt; Conf/local.conf:<br>
&gt; DISTRO_FEATURES_remove =3D &quot;wayland&quot;<br>
&gt;<br>
&gt; Therefore QT will use eglfs as the default QPA.<br>
&gt;<br>
&gt; However, some of the wayland related libraries and components are stil=
l<br>
&gt; present at the target file system.<br>
&gt; There is no need to update ti-sgx-ddk-um_1.14.3699939 recipe and SGX s=
hould<br>
&gt; work by using libpvrDRMWSEGL.so.<br>
&gt;<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Eric<br>
&gt;<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: Dmytriyenko, Denys<br>
&gt; Sent: Wednesday, August 16, 2017 4:15 PM<br>
&gt; To: Ankur Tyagi<br>
&gt; Cc: <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a>; Ruei, Eric; R, Karthik<br>
&gt; Subject: Re: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for wayland i=
n DISTRO_FEATURES<br>
&gt;<br>
&gt; +Eric and Karthik.<br>
&gt;<br>
&gt; On Sat, Aug 12, 2017 at 02:10:50PM +1200, Ankur Tyagi wrote:<br>
&gt; &gt; So even if I added &quot;wayland&quot; in DISTRO_FEATURES_remove,=
 it would still<br>
&gt; &gt; be packaged in resulting image.<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t want to use x11, wayland and have also configured Qt =
to use<br>
&gt; &gt; eglfs qpa. But it seems wayland will be used anyhow. Am I correct=
 ?<br>
&gt;<br>
&gt; I suspect it will try to link/load the needed wayland libs, but I have=
n&#39;t tried it myself.<br>
&gt;<br>
&gt;<br>
&gt; Eric,<br>
&gt;<br>
&gt; Since you&#39;ve been playing with eglfs lately, can you please confir=
m/clarify<br>
&gt; whether SGX can work w/o Wayland?<br>
&gt;<br>
&gt;<br>
&gt; &gt; Old branch (daisy) was not having such dependency on wayland, may=
 I know<br>
&gt; &gt; why it is now ?<br>
&gt;<br>
&gt; The old 3D Graphics SDK supported 2 modes - X11 and raw FB. We haven&#=
39;t<br>
&gt; supported X11 for years. The new SGX DDK binaries are mostly for Wayla=
nd<br>
&gt; graphics stack, as far as I know, since that&#39;s what we support on =
our<br>
&gt; platforms.<br>
&gt;<br>
&gt;<br>
&gt; Karthik,<br>
&gt;<br>
&gt; Anything you want to add or clarify here?<br>
&gt;<br>
&gt; --<br>
&gt; Denys<br>
&gt;<br>
&gt;<br>
&gt; &gt; On Sat, Aug 12, 2017 at 8:07 AM, Denys Dmytriyenko &lt;<a href=3D=
"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; No, it&#39;s not an optional dependency, unfortunately:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; $ for i in lib*.so.*.*.*; do echo $i; arm-linux-gnueabihf-re=
adelf -a $i |<br>
&gt; &gt; &gt; grep wayland; done<br>
&gt; &gt; &gt; libdbm.so.1.14.3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; libEGL.so.1.14.3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; libGLES_CM.so.1.14.3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; libGLESv2.so.1.14.3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; libglslcompiler.so.1.14.<wbr>3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; libIMGegl.so.1.14.3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A023: 0000f715=C2=A0 =C2=A0 =C2=A04 FUNC=C2=
=A0 =C2=A0 GLOBAL DEFAULT=C2=A0 =C2=A011<br>
&gt; &gt; &gt; wayland_drm_buffer_get_fo<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A039: 0000f6f9=C2=A0 =C2=A0 26 FUNC=C2=A0 =
=C2=A0 GLOBAL DEFAULT=C2=A0 =C2=A011 wayland_drm_uninit<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A091: 0000f66d=C2=A0 =C2=A0 56 FUNC=C2=A0 =
=C2=A0 GLOBAL DEFAULT=C2=A0 =C2=A011 wayland_drm_buffer_get<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 119: 0000f6a5=C2=A0 =C2=A0 84 FUNC=C2=A0 =C2=A0=
 GLOBAL DEFAULT=C2=A0 =C2=A011 wayland_drm_init<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 123: 0000f719=C2=A0 =C2=A0 =C2=A04 FUNC=C2=A0 =
=C2=A0 GLOBAL DEFAULT=C2=A0 =C2=A011<br>
&gt; &gt; &gt; wayland_drm_buffer_get_bu<br>
&gt; &gt; &gt; libpvr2d.so.1.14.3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; libpvrDRMWSEGL.so.1.14.3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; libpvrGBMWSEGL.so.1.14.3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; libPVRScopeServices.so.1.14.<wbr>3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; libpvr_wlegl.so.1.14.3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-client.so.0]<br>
&gt; &gt; &gt; libpvrws_WAYLAND.so.1.14.<wbr>3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-client.so.0]<br>
&gt; &gt; &gt; libsrv_init.so.1.14.3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; libsrv_um.so.1.14.3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt; libusc.so.1.14.3699939<br>
&gt; &gt; &gt;=C2=A0 0x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library:<br>
&gt; &gt; &gt; [libwayland-server.so.0]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; Denys<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Fri, Aug 11, 2017 at 12:47:24AM +1200, Ankur Tyagi wrote:=
<br>
&gt; &gt; &gt; &gt; Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.=
tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 recipes-graphics/libgles/<a href=3D"http://ti-sgx=
-ddk-um_1.14.3699939.bb" rel=3D"noreferrer" target=3D"_blank">ti-<wbr>sgx-d=
dk-um_1.14.3699939.bb</a> | 7 ++++---<br>
&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 4 insertions(+), 3 deletions(-)<b=
r>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/recipes-graphics/libgles/<a href=3D"http:/=
/ti-sgx-ddk-um_1.14.3699939.bb" rel=3D"noreferrer" target=3D"_blank">ti-<wb=
r>sgx-ddk-um_1.14.3699939.bb</a><br>
&gt; &gt; &gt; b/recipes-graphics/libgles/<a href=3D"http://ti-sgx-ddk-um_1=
.14.3699939.bb" rel=3D"noreferrer" target=3D"_blank">ti-<wbr>sgx-ddk-um_1.1=
4.3699939.bb</a><br>
&gt; &gt; &gt; &gt; index 60f63aa..593e405 100644<br>
&gt; &gt; &gt; &gt; --- a/recipes-graphics/libgles/<a href=3D"http://ti-sgx=
-ddk-um_1.14.3699939.bb" rel=3D"noreferrer" target=3D"_blank">ti-<wbr>sgx-d=
dk-um_1.14.3699939.bb</a><br>
&gt; &gt; &gt; &gt; +++ b/recipes-graphics/libgles/<a href=3D"http://ti-sgx=
-ddk-um_1.14.3699939.bb" rel=3D"noreferrer" target=3D"_blank">ti-<wbr>sgx-d=
dk-um_1.14.3699939.bb</a><br>
&gt; &gt; &gt; &gt; @@ -34,8 +34,9 @@ inherit update-rc.d<br>
&gt; &gt; &gt; &gt;=C2=A0 PR =3D &quot;r26&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 PROVIDES +=3D &quot;virtual/egl virtual/libgles1 =
virtual/libgles2<br>
&gt; &gt; &gt; omap5-sgx-ddk-um-linux&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -DEPENDS +=3D &quot;libdrm udev libgbm wayland libffi&q=
uot;<br>
&gt; &gt; &gt; &gt; -RDEPENDS_${PN} +=3D &quot;libdrm libudev libgbm waylan=
d libffi libdrm-omap&quot;<br>
&gt; &gt; &gt; &gt; +WAYLAND =3D &quot;${@bb.utils.contains(&#39;DISTRO_<wb=
r>FEATURES&#39;, &#39;wayland&#39;,<br>
&gt; &gt; &gt; &#39;wayland&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; &gt; &gt; +DEPENDS +=3D &quot;libdrm udev libgbm ${WAYLAND} libff=
i&quot;<br>
&gt; &gt; &gt; &gt; +RDEPENDS_${PN} +=3D &quot;libdrm libudev libgbm ${WAYL=
AND} libffi libdrm-omap&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 RPROVIDES_${PN} =3D &quot;libegl libgles1 libgles=
2 omap5-sgx-ddk-um-linux&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 RPROVIDES_${PN}-dev =3D &quot;libegl-dev libgles1=
-dev libgles2-dev<br>
&gt; &gt; &gt; omap5-sgx-ddk-um-linux-dev&quot;<br>
&gt; &gt; &gt; &gt; @@ -63,7 +64,7 @@ FILES_${PN} +=3D=C2=A0 &quot;${includ=
edir}/*&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 FILES_${PN} +=3D=C2=A0 &quot;${sysconfdir}/*&quot=
;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 PACKAGES =3D+ &quot;${PN}-plugins&quot;<br>
&gt; &gt; &gt; &gt; -FILES_${PN}-plugins =3D &quot;${libdir}/libsrv_init.so=
 ${libdir}/libsrv_um.so<br>
&gt; &gt; &gt; ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.<=
wbr>so<br>
&gt; &gt; &gt; ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so<br>
&gt; &gt; &gt; ${libdir}/libpvrGBMWSEGL.so=C2=A0 ${libdir}/libpvrws_WAYLAND=
.so&quot;<br>
&gt; &gt; &gt; &gt; +FILES_${PN}-plugins =3D &quot;${libdir}/libsrv_init.so=
 ${libdir}/libsrv_um.so<br>
&gt; &gt; &gt; ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.<=
wbr>so<br>
&gt; &gt; &gt; ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so<br>
&gt; &gt; &gt; ${libdir}/libpvrGBMWSEGL.so=C2=A0 ${@bb.utils.contains(&#39;=
DISTRO_<wbr>FEATURES&#39;,<br>
&gt; &gt; &gt; &#39;wayland&#39;, &#39;${libdir}/libpvrws_WAYLAND.<wbr>so&#=
39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 RDEPENDS_${PN} +=3D &quot;${PN}-plugins&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY_${PN}-plugins =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; 2.7.4<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; ______________________________<wbr>_________________<br=
>
&gt; &gt; &gt; &gt; meta-ti mailing list<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoc=
toproject.org</a><br>
&gt; &gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta=
-ti" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>o=
rg/listinfo/meta-ti</a><br>
&gt; &gt; &gt;<br>
</div></div></blockquote></div><br></div></div>

--089e0824ef2ccb122e05570f58ca--
