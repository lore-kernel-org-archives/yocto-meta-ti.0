Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C4DFE00D3D; Thu, 17 Aug 2017 08:54:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, URIBL_SBL,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  1.6 URIBL_SBL Contains an URL's NS IP listed in the SBL blocklist
	*      [URIs: yoctoproject.org]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60959E009A4
	for <meta-ti@yoctoproject.org>; Thu, 17 Aug 2017 08:54:49 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7HFsmUD029648;
	Thu, 17 Aug 2017 10:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1502985288;
	bh=PHoAtPca5Fq6Y/GWJ9l/6d67AJ1H3Ffwes4MJeOeYb8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=M4tKeja2ED7QT5ZKL0iSpB4haCLWmjMaYEWFg8NeCVFIMLcDLiurX50/j+ABADk00
	mLL+jVxpmTW0vXT3WfF+CFnDhVmoParehIN4PuWdRndhjU7l+E959Ap7ys3gCdLBIE
	8AuR6ZDNee1LaTwdwVMDlRsRK5ub7EjXvPayv0II=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7HFslE3017164;
	Thu, 17 Aug 2017 10:54:48 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7HFsjvI032114;
	Thu, 17 Aug 2017 21:24:46 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0294.000; Thu, 17 Aug 2017 21:24:44 +0530
From: "R, Karthik" <karthik.ramanan@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Ankur Tyagi <ankur.tyagi85@gmail.com>
Thread-Topic: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for wayland in
	DISTRO_FEATURES
Thread-Index: AQHTFsxmnBtlfB5gk0Wfezgb0RBhI6KItHxg
Date: Thu, 17 Aug 2017 15:54:43 +0000
Message-ID: <24B88602B5904F49971CAF899152529B82106DAA@DBDE04.ent.ti.com>
References: <1502369244-9597-1-git-send-email-ankur.tyagi85@gmail.com>
	<20170811200720.GQ19736@edge>
	<CADySD0HZjR_GWuEPwe0qF_XO+g4xPZfXiK3m+iDrpH4-VFSzvg@mail.gmail.com>
	<20170816201519.GG19736@edge>
In-Reply-To: <20170816201519.GG19736@edge>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.171.115]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 17 Aug 2017 15:54:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys, Ankur,

Wasn't able to look at this one today.=20
I will come back to you on this either tomorrow or latest by Monday.

Regards
Karthik

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, 17 August, 2017 1:45 AM
To: Ankur Tyagi
Cc: meta-ti@yoctoproject.org; Ruei, Eric; R, Karthik
Subject: Re: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for wayland in DIS=
TRO_FEATURES

+Eric and Karthik.

On Sat, Aug 12, 2017 at 02:10:50PM +1200, Ankur Tyagi wrote:
> So even if I added "wayland" in DISTRO_FEATURES_remove, it would still=20
> be packaged in resulting image.
>=20
> I don't want to use x11, wayland and have also configured Qt to use=20
> eglfs qpa. But it seems wayland will be used anyhow. Am I correct ?

I suspect it will try to link/load the needed wayland libs, but I haven't t=
ried it myself.


Eric,

Since you've been playing with eglfs lately, can you please confirm/clarify=
=20
whether SGX can work w/o Wayland?


> Old branch (daisy) was not having such dependency on wayland, may I know
> why it is now ?

The old 3D Graphics SDK supported 2 modes - X11 and raw FB. We haven't=20
supported X11 for years. The new SGX DDK binaries are mostly for Wayland=20
graphics stack, as far as I know, since that's what we support on our=20
platforms.


Karthik,

Anything you want to add or clarify here?

--=20
Denys


> On Sat, Aug 12, 2017 at 8:07 AM, Denys Dmytriyenko <denys@ti.com> wrote:
>=20
> > No, it's not an optional dependency, unfortunately:
> >
> > $ for i in lib*.so.*.*.*; do echo $i; arm-linux-gnueabihf-readelf -a $i=
 |
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
> >     91: 0000f66d    56 FUNC    GLOBAL DEFAULT   11 wayland_drm_buffer_g=
et
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
> > >  PR =3D "r26"
> > >  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2
> > omap5-sgx-ddk-um-linux"
> > >
> > > -DEPENDS +=3D "libdrm udev libgbm wayland libffi"
> > > -RDEPENDS_${PN} +=3D "libdrm libudev libgbm wayland libffi libdrm-oma=
p"
> > > +WAYLAND =3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> > 'wayland', '', d)}"
> > > +DEPENDS +=3D "libdrm udev libgbm ${WAYLAND} libffi"
> > > +RDEPENDS_${PN} +=3D "libdrm libudev libgbm ${WAYLAND} libffi libdrm-=
omap"
> > >
> > >  RPROVIDES_${PN} =3D "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux=
"
> > >  RPROVIDES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev
> > omap5-sgx-ddk-um-linux-dev"
> > > @@ -63,7 +64,7 @@ FILES_${PN} +=3D  "${includedir}/*"
> > >  FILES_${PN} +=3D  "${sysconfdir}/*"
> > >
> > >  PACKAGES =3D+ "${PN}-plugins"
> > > -FILES_${PN}-plugins =3D "${libdir}/libsrv_init.so ${libdir}/libsrv_u=
m.so
> > ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> > ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> > ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
> > > +FILES_${PN}-plugins =3D "${libdir}/libsrv_init.so ${libdir}/libsrv_u=
m.so
> > ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> > ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> > ${libdir}/libpvrGBMWSEGL.so  ${@bb.utils.contains('DISTRO_FEATURES',
> > 'wayland', '${libdir}/libpvrws_WAYLAND.so', '', d)}"
> > >  RDEPENDS_${PN} +=3D "${PN}-plugins"
> > >
> > >  ALLOW_EMPTY_${PN}-plugins =3D "1"
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> >

