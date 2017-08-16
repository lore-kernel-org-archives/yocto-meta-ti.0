Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C8C5E00D2A; Wed, 16 Aug 2017 13:15:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F05D0E00C1A
	for <meta-ti@yoctoproject.org>; Wed, 16 Aug 2017 13:15:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7GKFO9M001276;
	Wed, 16 Aug 2017 15:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1502914524;
	bh=Nh7sPwTVrbWj9V2vrQVVJVJHshgvKkdoZKpxtKTPGpA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GquaGPpCzfZP2xVLDbuiyStDYCuH0I1SAx0Gtzft5MGvsFnuLlKpoOTKFYXL9LV/l
	1/Dw8zlavKgYh+O53xwg+8YV1rThxi/rZHjaiFug8uDEcV0LBPfjOkvHIGHEfu+mc8
	N5+7uf/8hnjyX6hl+XXQ7/ZfXj4FjtMvyN9hc8Io=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7GKFOGZ024209;
	Wed, 16 Aug 2017 15:15:24 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 16 Aug 2017 15:15:24 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 16 Aug 2017 15:15:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 16 Aug 2017 15:15:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7GKFN4w009013;
	Wed, 16 Aug 2017 15:15:23 -0500
Date: Wed, 16 Aug 2017 16:15:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20170816201519.GG19736@edge>
References: <1502369244-9597-1-git-send-email-ankur.tyagi85@gmail.com>
	<20170811200720.GQ19736@edge>
	<CADySD0HZjR_GWuEPwe0qF_XO+g4xPZfXiK3m+iDrpH4-VFSzvg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0HZjR_GWuEPwe0qF_XO+g4xPZfXiK3m+iDrpH4-VFSzvg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, "R, Karthik" <karthik.ramanan@ti.com>
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
X-List-Received-Date: Wed, 16 Aug 2017 20:15:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

+Eric and Karthik.

On Sat, Aug 12, 2017 at 02:10:50PM +1200, Ankur Tyagi wrote:
> So even if I added "wayland" in DISTRO_FEATURES_remove, it would still be
> packaged in resulting image.
> 
> I don't want to use x11, wayland and have also configured Qt to use eglfs
> qpa. But it seems wayland will be used anyhow. Am I correct ?

I suspect it will try to link/load the needed wayland libs, but I haven't 
tried it myself.


Eric,

Since you've been playing with eglfs lately, can you please confirm/clarify 
whether SGX can work w/o Wayland?


> Old branch (daisy) was not having such dependency on wayland, may I know
> why it is now ?

The old 3D Graphics SDK supported 2 modes - X11 and raw FB. We haven't 
supported X11 for years. The new SGX DDK binaries are mostly for Wayland 
graphics stack, as far as I know, since that's what we support on our 
platforms.


Karthik,

Anything you want to add or clarify here?

-- 
Denys


> On Sat, Aug 12, 2017 at 8:07 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > No, it's not an optional dependency, unfortunately:
> >
> > $ for i in lib*.so.*.*.*; do echo $i; arm-linux-gnueabihf-readelf -a $i |
> > grep wayland; done
> > libdbm.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> > libEGL.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> > libGLES_CM.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> > libGLESv2.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> > libglslcompiler.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> > libIMGegl.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> >     23: 0000f715     4 FUNC    GLOBAL DEFAULT   11
> > wayland_drm_buffer_get_fo
> >     39: 0000f6f9    26 FUNC    GLOBAL DEFAULT   11 wayland_drm_uninit
> >     91: 0000f66d    56 FUNC    GLOBAL DEFAULT   11 wayland_drm_buffer_get
> >    119: 0000f6a5    84 FUNC    GLOBAL DEFAULT   11 wayland_drm_init
> >    123: 0000f719     4 FUNC    GLOBAL DEFAULT   11
> > wayland_drm_buffer_get_bu
> > libpvr2d.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> > libpvrDRMWSEGL.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> > libpvrGBMWSEGL.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> > libPVRScopeServices.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> > libpvr_wlegl.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-client.so.0]
> > libpvrws_WAYLAND.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-client.so.0]
> > libsrv_init.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> > libsrv_um.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> > libusc.so.1.14.3699939
> >  0x00000001 (NEEDED)                     Shared library:
> > [libwayland-server.so.0]
> >
> > --
> > Denys
> >
> >
> > On Fri, Aug 11, 2017 at 12:47:24AM +1200, Ankur Tyagi wrote:
> > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > ---
> > >  recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > > index 60f63aa..593e405 100644
> > > --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > > +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > > @@ -34,8 +34,9 @@ inherit update-rc.d
> > >  PR = "r26"
> > >  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2
> > omap5-sgx-ddk-um-linux"
> > >
> > > -DEPENDS += "libdrm udev libgbm wayland libffi"
> > > -RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
> > > +WAYLAND = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> > 'wayland', '', d)}"
> > > +DEPENDS += "libdrm udev libgbm ${WAYLAND} libffi"
> > > +RDEPENDS_${PN} += "libdrm libudev libgbm ${WAYLAND} libffi libdrm-omap"
> > >
> > >  RPROVIDES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
> > >  RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev
> > omap5-sgx-ddk-um-linux-dev"
> > > @@ -63,7 +64,7 @@ FILES_${PN} +=  "${includedir}/*"
> > >  FILES_${PN} +=  "${sysconfdir}/*"
> > >
> > >  PACKAGES =+ "${PN}-plugins"
> > > -FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so
> > ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> > ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> > ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
> > > +FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so
> > ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> > ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> > ${libdir}/libpvrGBMWSEGL.so  ${@bb.utils.contains('DISTRO_FEATURES',
> > 'wayland', '${libdir}/libpvrws_WAYLAND.so', '', d)}"
> > >  RDEPENDS_${PN} += "${PN}-plugins"
> > >
> > >  ALLOW_EMPTY_${PN}-plugins = "1"
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> >

