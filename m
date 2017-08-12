Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C3FAE00C81; Fri, 11 Aug 2017 19:11:14 -0700 (PDT)
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
	*      [74.125.82.51 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 555D9E00C7E
	for <meta-ti@yoctoproject.org>; Fri, 11 Aug 2017 19:11:11 -0700 (PDT)
Received: by mail-wm0-f51.google.com with SMTP id i66so4174465wmg.0
	for <meta-ti@yoctoproject.org>; Fri, 11 Aug 2017 19:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fvkTO8kbLYSy9ChX07pq4ucjhPx9KDwELjYdnIVsIrw=;
	b=Z4LB+YDrmW8AWjmmcVWmVmV/lnLcUw6Fx0lef/epVdnDC3uMsdF0fKJ3f0Hwv+tC5t
	PuHXee7uaPg8OC2zqdoklyzFnVg32oZWuUmAzSjAJrJlkI1UcgY9OMfsmpXCD/7e/2My
	EebeHeOHIJWPp5yfsX1tLJTU1wLeB3TKyZjJeN4L+R3fWtPD4TjQ4IBgWQ3G/EhHwA+w
	O21qVQkr9cCW0JeOMQhd7fqTwkQMUaLuuIU4wYmm8fNdba2vDRJx6niACj38zV1OELGs
	/shudTdoPksevLzgPuWYr2RsjdfSrxEZ/JZ+lLWpYifB5WN3HISEeRhGofTa50MAIc9w
	QR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fvkTO8kbLYSy9ChX07pq4ucjhPx9KDwELjYdnIVsIrw=;
	b=iO7f0yU/yvv+EpUkw40uFrRa2QKI0Yr2bqYwCalypZTuNwdxIr36/7FWZ+Pj/SlAtv
	jsGFLjPn7Zc+yFUGW6eBjAlHkWNF8agXB0iqdjnwn3Cxtd4GEa4/wtfZDUqQ9EYNeyo6
	UzzjKyWiJgT3olU1yQELtE4NOqgomjKNpzaKJ5uhBo6YTySfXjuKU3rGQEtAHKxz5j/O
	Hdxzr0ZV94STQ/9vwAvNQ6CsmqKLU8gqJ8fYR1LR45L8hxjwRFnH9Kt7FAJPMgUeeSiB
	xuU0jDfekr0dKNXx0kyAvtSSWmkIvrefeCxfrAt1U0NpEYH4SFqw6+Du883ph/xGQMf+
	O9jQ==
X-Gm-Message-State: AHYfb5hP4lhbGZI4KmWW9CU8LWggIj8zYCYFlGEIasABpqwp0BnaXJ2w
	BjrgPqHh4G8A2ZvpQydNfUrrFhUO1w==
X-Received: by 10.80.205.210 with SMTP id h18mr17227978edj.196.1502503871058; 
	Fri, 11 Aug 2017 19:11:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.175.65 with HTTP; Fri, 11 Aug 2017 19:10:50 -0700 (PDT)
In-Reply-To: <20170811200720.GQ19736@edge>
References: <1502369244-9597-1-git-send-email-ankur.tyagi85@gmail.com>
	<20170811200720.GQ19736@edge>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 12 Aug 2017 14:10:50 +1200
Message-ID: <CADySD0HZjR_GWuEPwe0qF_XO+g4xPZfXiK3m+iDrpH4-VFSzvg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Sat, 12 Aug 2017 02:11:14 -0000
Content-Type: multipart/alternative; boundary="94eb2c1af848821a85055684f18d"

--94eb2c1af848821a85055684f18d
Content-Type: text/plain; charset="UTF-8"

So even if I added "wayland" in DISTRO_FEATURES_remove, it would still be
packaged in resulting image.

I don't want to use x11, wayland and have also configured Qt to use eglfs
qpa. But it seems wayland will be used anyhow. Am I correct ?

Old branch (daisy) was not having such dependency on wayland, may I know
why it is now ?

regards
Ankur

On Sat, Aug 12, 2017 at 8:07 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> No, it's not an optional dependency, unfortunately:
>
> $ for i in lib*.so.*.*.*; do echo $i; arm-linux-gnueabihf-readelf -a $i |
> grep wayland; done
> libdbm.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
> libEGL.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
> libGLES_CM.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
> libGLESv2.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
> libglslcompiler.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
> libIMGegl.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
>     23: 0000f715     4 FUNC    GLOBAL DEFAULT   11
> wayland_drm_buffer_get_fo
>     39: 0000f6f9    26 FUNC    GLOBAL DEFAULT   11 wayland_drm_uninit
>     91: 0000f66d    56 FUNC    GLOBAL DEFAULT   11 wayland_drm_buffer_get
>    119: 0000f6a5    84 FUNC    GLOBAL DEFAULT   11 wayland_drm_init
>    123: 0000f719     4 FUNC    GLOBAL DEFAULT   11
> wayland_drm_buffer_get_bu
> libpvr2d.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
> libpvrDRMWSEGL.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
> libpvrGBMWSEGL.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
> libPVRScopeServices.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
> libpvr_wlegl.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-client.so.0]
> libpvrws_WAYLAND.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-client.so.0]
> libsrv_init.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
> libsrv_um.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
> libusc.so.1.14.3699939
>  0x00000001 (NEEDED)                     Shared library:
> [libwayland-server.so.0]
>
> --
> Denys
>
>
> On Fri, Aug 11, 2017 at 12:47:24AM +1200, Ankur Tyagi wrote:
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > index 60f63aa..593e405 100644
> > --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > @@ -34,8 +34,9 @@ inherit update-rc.d
> >  PR = "r26"
> >  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2
> omap5-sgx-ddk-um-linux"
> >
> > -DEPENDS += "libdrm udev libgbm wayland libffi"
> > -RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
> > +WAYLAND = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> 'wayland', '', d)}"
> > +DEPENDS += "libdrm udev libgbm ${WAYLAND} libffi"
> > +RDEPENDS_${PN} += "libdrm libudev libgbm ${WAYLAND} libffi libdrm-omap"
> >
> >  RPROVIDES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
> >  RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev
> omap5-sgx-ddk-um-linux-dev"
> > @@ -63,7 +64,7 @@ FILES_${PN} +=  "${includedir}/*"
> >  FILES_${PN} +=  "${sysconfdir}/*"
> >
> >  PACKAGES =+ "${PN}-plugins"
> > -FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so
> ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
> > +FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so
> ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> ${libdir}/libpvrGBMWSEGL.so  ${@bb.utils.contains('DISTRO_FEATURES',
> 'wayland', '${libdir}/libpvrws_WAYLAND.so', '', d)}"
> >  RDEPENDS_${PN} += "${PN}-plugins"
> >
> >  ALLOW_EMPTY_${PN}-plugins = "1"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>

--94eb2c1af848821a85055684f18d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">So even if I added &quot;wayland&quot; in DISTRO_FEATUR=
ES_remove, it would still be packaged in resulting image.<br><br>I don&#39;=
t want to use x11, wayland and have also configured Qt to use eglfs qpa. Bu=
t it seems wayland will be used anyhow. Am I correct ?<br><br></div><div cl=
ass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Old =
branch (daisy) was not having such dependency on wayland, may I know why it=
 is now ?<br><br></div><div class=3D"gmail_default" style=3D"font-family:ar=
ial,helvetica,sans-serif">regards<br></div><div class=3D"gmail_default" sty=
le=3D"font-family:arial,helvetica,sans-serif">Ankur<br></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Sat, Aug 12, 2017 at 8:07 AM=
, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" t=
arget=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">No, it&#39;s not an optional dependency, unfortunately:<br>
<br>
$ for i in lib*.so.*.*.*; do echo $i; arm-linux-gnueabihf-readelf -a $i | g=
rep wayland; done<br>
libdbm.so.1.14.3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
libEGL.so.1.14.3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
libGLES_CM.so.1.14.3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
libGLESv2.so.1.14.3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
libglslcompiler.so.1.14.<wbr>3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
libIMGegl.so.1.14.3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
=C2=A0 =C2=A0 23: 0000f715=C2=A0 =C2=A0 =C2=A04 FUNC=C2=A0 =C2=A0 GLOBAL DE=
FAULT=C2=A0 =C2=A011 wayland_drm_buffer_get_fo<br>
=C2=A0 =C2=A0 39: 0000f6f9=C2=A0 =C2=A0 26 FUNC=C2=A0 =C2=A0 GLOBAL DEFAULT=
=C2=A0 =C2=A011 wayland_drm_uninit<br>
=C2=A0 =C2=A0 91: 0000f66d=C2=A0 =C2=A0 56 FUNC=C2=A0 =C2=A0 GLOBAL DEFAULT=
=C2=A0 =C2=A011 wayland_drm_buffer_get<br>
=C2=A0 =C2=A0119: 0000f6a5=C2=A0 =C2=A0 84 FUNC=C2=A0 =C2=A0 GLOBAL DEFAULT=
=C2=A0 =C2=A011 wayland_drm_init<br>
=C2=A0 =C2=A0123: 0000f719=C2=A0 =C2=A0 =C2=A04 FUNC=C2=A0 =C2=A0 GLOBAL DE=
FAULT=C2=A0 =C2=A011 wayland_drm_buffer_get_bu<br>
libpvr2d.so.1.14.3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
libpvrDRMWSEGL.so.1.14.3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
libpvrGBMWSEGL.so.1.14.3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
libPVRScopeServices.so.1.14.<wbr>3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
libpvr_wlegl.so.1.14.3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-client.so.0]<br>
libpvrws_WAYLAND.so.1.14.<wbr>3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-client.so.0]<br>
libsrv_init.so.1.14.3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
libsrv_um.so.1.14.3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
libusc.so.1.14.3699939<br>
=C2=A00x00000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Shared library: [libwayland-server.so.0]<br>
<br>
--<br>
Denys<br>
<br>
<br>
On Fri, Aug 11, 2017 at 12:47:24AM +1200, Ankur Tyagi wrote:<br>
&gt; Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.c=
om">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-graphics/libgles/<a href=3D"http://ti-sgx-ddk-um_1.14.36=
99939.bb" rel=3D"noreferrer" target=3D"_blank">ti-<wbr>sgx-ddk-um_1.14.3699=
939.bb</a> | 7 ++++---<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-graphics/libgles/<a href=3D"http://ti-sgx-ddk-um_=
1.14.3699939.bb" rel=3D"noreferrer" target=3D"_blank">ti-<wbr>sgx-ddk-um_1.=
14.3699939.bb</a> b/recipes-graphics/libgles/<a href=3D"http://ti-sgx-ddk-u=
m_1.14.3699939.bb" rel=3D"noreferrer" target=3D"_blank">ti-<wbr>sgx-ddk-um_=
1.14.3699939.bb</a><br>
&gt; index 60f63aa..593e405 100644<br>
&gt; --- a/recipes-graphics/libgles/<a href=3D"http://ti-sgx-ddk-um_1.14.36=
99939.bb" rel=3D"noreferrer" target=3D"_blank">ti-<wbr>sgx-ddk-um_1.14.3699=
939.bb</a><br>
&gt; +++ b/recipes-graphics/libgles/<a href=3D"http://ti-sgx-ddk-um_1.14.36=
99939.bb" rel=3D"noreferrer" target=3D"_blank">ti-<wbr>sgx-ddk-um_1.14.3699=
939.bb</a><br>
&gt; @@ -34,8 +34,9 @@ inherit update-rc.d<br>
&gt;=C2=A0 PR =3D &quot;r26&quot;<br>
&gt;=C2=A0 PROVIDES +=3D &quot;virtual/egl virtual/libgles1 virtual/libgles=
2 omap5-sgx-ddk-um-linux&quot;<br>
&gt;<br>
&gt; -DEPENDS +=3D &quot;libdrm udev libgbm wayland libffi&quot;<br>
&gt; -RDEPENDS_${PN} +=3D &quot;libdrm libudev libgbm wayland libffi libdrm=
-omap&quot;<br>
&gt; +WAYLAND =3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;=
, &#39;wayland&#39;, &#39;wayland&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +DEPENDS +=3D &quot;libdrm udev libgbm ${WAYLAND} libffi&quot;<br>
&gt; +RDEPENDS_${PN} +=3D &quot;libdrm libudev libgbm ${WAYLAND} libffi lib=
drm-omap&quot;<br>
&gt;<br>
&gt;=C2=A0 RPROVIDES_${PN} =3D &quot;libegl libgles1 libgles2 omap5-sgx-ddk=
-um-linux&quot;<br>
&gt;=C2=A0 RPROVIDES_${PN}-dev =3D &quot;libegl-dev libgles1-dev libgles2-d=
ev omap5-sgx-ddk-um-linux-dev&quot;<br>
&gt; @@ -63,7 +64,7 @@ FILES_${PN} +=3D=C2=A0 &quot;${includedir}/*&quot;<b=
r>
&gt;=C2=A0 FILES_${PN} +=3D=C2=A0 &quot;${sysconfdir}/*&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGES =3D+ &quot;${PN}-plugins&quot;<br>
&gt; -FILES_${PN}-plugins =3D &quot;${libdir}/libsrv_init.so ${libdir}/libs=
rv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.<wbr>so=
 ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so=C2=A0 ${libdir}/libpvrG=
BMWSEGL.so=C2=A0 ${libdir}/libpvrws_WAYLAND.so&quot;<br>
&gt; +FILES_${PN}-plugins =3D &quot;${libdir}/libsrv_init.so ${libdir}/libs=
rv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.<wbr>so=
 ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so=C2=A0 ${libdir}/libpvrG=
BMWSEGL.so=C2=A0 ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;=
wayland&#39;, &#39;${libdir}/libpvrws_WAYLAND.<wbr>so&#39;, &#39;&#39;, d)}=
&quot;<br>
&gt;=C2=A0 RDEPENDS_${PN} +=3D &quot;${PN}-plugins&quot;<br>
&gt;<br>
&gt;=C2=A0 ALLOW_EMPTY_${PN}-plugins =3D &quot;1&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listinfo/met=
a-ti</a><br>
</font></span></blockquote></div><br></div></div>

--94eb2c1af848821a85055684f18d--
