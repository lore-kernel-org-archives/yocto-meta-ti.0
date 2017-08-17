Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6562E00D9D; Thu, 17 Aug 2017 09:13:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9D47E00A39
	for <meta-ti@yoctoproject.org>; Thu, 17 Aug 2017 09:13:41 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7HGDeOI030001;
	Thu, 17 Aug 2017 11:13:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1502986420;
	bh=SN6Hl5FkF2ts20X9t6rGNISOVTcD9aapimYcVZZQP8Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Qt16HCMvTA/fRatetA6FGm9bN2gAcBeYgSE1QQOARgGGD0nd+9VHJziIx/anx/70e
	iwo0rwQiYlv0Dg0101KJGsHR9suJ4+S8BvLFZXLZi7bDxfL0or/TVRYtQ9UFMUOr/F
	fkegCrOiZJLZx9siYXLm1+sCIgYH7cdn0hEqlf+U=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7HGDeY6016076;
	Thu, 17 Aug 2017 11:13:40 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 17 Aug 2017 11:13:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 17 Aug 2017 11:13:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7HGDdDu021592;
	Thu, 17 Aug 2017 11:13:40 -0500
Date: Thu, 17 Aug 2017 12:13:36 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20170817161336.GK19736@edge>
References: <1502369244-9597-1-git-send-email-ankur.tyagi85@gmail.com>
	<20170811200720.GQ19736@edge>
	<CADySD0HZjR_GWuEPwe0qF_XO+g4xPZfXiK3m+iDrpH4-VFSzvg@mail.gmail.com>
	<20170816201519.GG19736@edge>
	<009C030982313E4589C6BC55FBF1E82A2539F2E4@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <009C030982313E4589C6BC55FBF1E82A2539F2E4@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "R,
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
X-List-Received-Date: Thu, 17 Aug 2017 16:13:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, Eric,

As I was suspecting, wayland libs are required to be present for SGX to work 
even in no-Wayland mode. Good thing OE detects those .so dependencies and 
automatically pulls them in for you.

Have you tried removing Wayland pieces from the rootfs after the fact? I'm 
guessing SGX would stop working due to dynamic linker/loader not being able to 
resolve all the dependencies hardcoded in .so...

-- 
Denys


On Thu, Aug 17, 2017 at 12:02:27PM -0400, Ruei, Eric wrote:
> Hi, Denys:
> 
> Yes, we can make PLSDK image with Weston disabled by removing wayland from 
> the DISTRO_FEATURES list.
> Conf/local.conf:
> DISTRO_FEATURES_remove = "wayland"
> 
> Therefore QT will use eglfs as the default QPA.
> 
> However, some of the wayland related libraries and components are still 
> present at the target file system.
> There is no need to update ti-sgx-ddk-um_1.14.3699939 recipe and SGX should 
> work by using libpvrDRMWSEGL.so.
> 
> Best regards,
> 
> Eric
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Wednesday, August 16, 2017 4:15 PM
> To: Ankur Tyagi
> Cc: meta-ti@yoctoproject.org; Ruei, Eric; R, Karthik
> Subject: Re: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for wayland in DISTRO_FEATURES
> 
> +Eric and Karthik.
> 
> On Sat, Aug 12, 2017 at 02:10:50PM +1200, Ankur Tyagi wrote:
> > So even if I added "wayland" in DISTRO_FEATURES_remove, it would still 
> > be packaged in resulting image.
> > 
> > I don't want to use x11, wayland and have also configured Qt to use 
> > eglfs qpa. But it seems wayland will be used anyhow. Am I correct ?
> 
> I suspect it will try to link/load the needed wayland libs, but I haven't tried it myself.
> 
> 
> Eric,
> 
> Since you've been playing with eglfs lately, can you please confirm/clarify 
> whether SGX can work w/o Wayland?
> 
> 
> > Old branch (daisy) was not having such dependency on wayland, may I know
> > why it is now ?
> 
> The old 3D Graphics SDK supported 2 modes - X11 and raw FB. We haven't 
> supported X11 for years. The new SGX DDK binaries are mostly for Wayland 
> graphics stack, as far as I know, since that's what we support on our 
> platforms.
> 
> 
> Karthik,
> 
> Anything you want to add or clarify here?
> 
> -- 
> Denys
> 
> 
> > On Sat, Aug 12, 2017 at 8:07 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> > 
> > > No, it's not an optional dependency, unfortunately:
> > >
> > > $ for i in lib*.so.*.*.*; do echo $i; arm-linux-gnueabihf-readelf -a $i |
> > > grep wayland; done
> > > libdbm.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > > libEGL.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > > libGLES_CM.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > > libGLESv2.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > > libglslcompiler.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > > libIMGegl.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > >     23: 0000f715     4 FUNC    GLOBAL DEFAULT   11
> > > wayland_drm_buffer_get_fo
> > >     39: 0000f6f9    26 FUNC    GLOBAL DEFAULT   11 wayland_drm_uninit
> > >     91: 0000f66d    56 FUNC    GLOBAL DEFAULT   11 wayland_drm_buffer_get
> > >    119: 0000f6a5    84 FUNC    GLOBAL DEFAULT   11 wayland_drm_init
> > >    123: 0000f719     4 FUNC    GLOBAL DEFAULT   11
> > > wayland_drm_buffer_get_bu
> > > libpvr2d.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > > libpvrDRMWSEGL.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > > libpvrGBMWSEGL.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > > libPVRScopeServices.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > > libpvr_wlegl.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-client.so.0]
> > > libpvrws_WAYLAND.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-client.so.0]
> > > libsrv_init.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > > libsrv_um.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > > libusc.so.1.14.3699939
> > >  0x00000001 (NEEDED)                     Shared library:
> > > [libwayland-server.so.0]
> > >
> > > --
> > > Denys
> > >
> > >
> > > On Fri, Aug 11, 2017 at 12:47:24AM +1200, Ankur Tyagi wrote:
> > > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > > ---
> > > >  recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > > b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > > > index 60f63aa..593e405 100644
> > > > --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > > > +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > > > @@ -34,8 +34,9 @@ inherit update-rc.d
> > > >  PR = "r26"
> > > >  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2
> > > omap5-sgx-ddk-um-linux"
> > > >
> > > > -DEPENDS += "libdrm udev libgbm wayland libffi"
> > > > -RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
> > > > +WAYLAND = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> > > 'wayland', '', d)}"
> > > > +DEPENDS += "libdrm udev libgbm ${WAYLAND} libffi"
> > > > +RDEPENDS_${PN} += "libdrm libudev libgbm ${WAYLAND} libffi libdrm-omap"
> > > >
> > > >  RPROVIDES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
> > > >  RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev
> > > omap5-sgx-ddk-um-linux-dev"
> > > > @@ -63,7 +64,7 @@ FILES_${PN} +=  "${includedir}/*"
> > > >  FILES_${PN} +=  "${sysconfdir}/*"
> > > >
> > > >  PACKAGES =+ "${PN}-plugins"
> > > > -FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so
> > > ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> > > ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> > > ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
> > > > +FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so
> > > ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> > > ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> > > ${libdir}/libpvrGBMWSEGL.so  ${@bb.utils.contains('DISTRO_FEATURES',
> > > 'wayland', '${libdir}/libpvrws_WAYLAND.so', '', d)}"
> > > >  RDEPENDS_${PN} += "${PN}-plugins"
> > > >
> > > >  ALLOW_EMPTY_${PN}-plugins = "1"
> > > > --
> > > > 2.7.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > >

