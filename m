Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 363F3E00DC3; Thu, 17 Aug 2017 09:33:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F08FE009A4
	for <meta-ti@yoctoproject.org>; Thu, 17 Aug 2017 09:33:31 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7HGXUSU022029;
	Thu, 17 Aug 2017 11:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1502987610;
	bh=JrzIGwdvM09M9effyS+2F89aflNi/uyHEG3lKxdZCcI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=lth3S3AQ1yYfhIGFjNm2ZYA7bFd21lrQ4Fg0ry/u/ZpHUb3K96PRoPCxn04G0MjqC
	YtzvoUGaQAQQcvq7Dd0QrBLu2hzcXQqWXtF2PVYvDk9ECy/VKKUa9lX0zqEM3eIqEp
	7Tm7SakKE06BUO3YbcsfGtTke1sSthjvxY//tUzQ=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7HGXUnd013888;
	Thu, 17 Aug 2017 11:33:30 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Thu, 17 Aug 2017 11:33:29 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for wayland in
	DISTRO_FEATURES
Thread-Index: AQHTFsxk+tA0O+Xr1UOSi4hyDiG7XqKIrm0wgABfWgD//69N8A==
Date: Thu, 17 Aug 2017 16:33:29 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A2539F361@DFLE09.ent.ti.com>
References: <1502369244-9597-1-git-send-email-ankur.tyagi85@gmail.com>
	<20170811200720.GQ19736@edge>
	<CADySD0HZjR_GWuEPwe0qF_XO+g4xPZfXiK3m+iDrpH4-VFSzvg@mail.gmail.com>
	<20170816201519.GG19736@edge>
	<009C030982313E4589C6BC55FBF1E82A2539F2E4@DFLE09.ent.ti.com>
	<20170817161336.GK19736@edge>
In-Reply-To: <20170817161336.GK19736@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 17 Aug 2017 16:33:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

Yes and yes, we do need the wayland  libraries to be present at the target =
file system because they are required by the SGX DDM UM binaries.=20
The SGX DDK UM supports the following three (EGL) window systems and auto-d=
etect which one should be used.
libpvrDRMWSEGL.so: EGLFS (Raw)
libpvrGBMWSEGL.so: Wayland-Server, DRM owner such as kmscube, or QT QPA EGL=
FS_KMS.
libpvrws_WAYLAND.so: Wayland Client

Best regards,

Eric

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, August 17, 2017 12:14 PM
To: Ruei, Eric
Cc: Ankur Tyagi; meta-ti@yoctoproject.org; R, Karthik
Subject: Re: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for wayland in DIS=
TRO_FEATURES

Thanks, Eric,

As I was suspecting, wayland libs are required to be present for SGX to wor=
k even in no-Wayland mode. Good thing OE detects those .so dependencies and=
 automatically pulls them in for you.

Have you tried removing Wayland pieces from the rootfs after the fact? I'm =
guessing SGX would stop working due to dynamic linker/loader not being able=
 to resolve all the dependencies hardcoded in .so...

--
Denys


On Thu, Aug 17, 2017 at 12:02:27PM -0400, Ruei, Eric wrote:
> Hi, Denys:
>=20
> Yes, we can make PLSDK image with Weston disabled by removing wayland fro=
m=20
> the DISTRO_FEATURES list.
> Conf/local.conf:
> DISTRO_FEATURES_remove =3D "wayland"
>=20
> Therefore QT will use eglfs as the default QPA.
>=20
> However, some of the wayland related libraries and components are still=20
> present at the target file system.
> There is no need to update ti-sgx-ddk-um_1.14.3699939 recipe and SGX shou=
ld=20
> work by using libpvrDRMWSEGL.so.
>=20
> Best regards,
>=20
> Eric
>=20
>=20
> -----Original Message-----
> From: Dmytriyenko, Denys=20
> Sent: Wednesday, August 16, 2017 4:15 PM
> To: Ankur Tyagi
> Cc: meta-ti@yoctoproject.org; Ruei, Eric; R, Karthik
> Subject: Re: [meta-ti] ti-sgx-ddk-um_1.14.3699939: check for wayland in D=
ISTRO_FEATURES
>=20
> +Eric and Karthik.
>=20
> On Sat, Aug 12, 2017 at 02:10:50PM +1200, Ankur Tyagi wrote:
> > So even if I added "wayland" in DISTRO_FEATURES_remove, it would still=
=20
> > be packaged in resulting image.
> >=20
> > I don't want to use x11, wayland and have also configured Qt to use=20
> > eglfs qpa. But it seems wayland will be used anyhow. Am I correct ?
>=20
> I suspect it will try to link/load the needed wayland libs, but I haven't=
 tried it myself.
>=20
>=20
> Eric,
>=20
> Since you've been playing with eglfs lately, can you please confirm/clari=
fy=20
> whether SGX can work w/o Wayland?
>=20
>=20
> > Old branch (daisy) was not having such dependency on wayland, may I kno=
w
> > why it is now ?
>=20
> The old 3D Graphics SDK supported 2 modes - X11 and raw FB. We haven't=20
> supported X11 for years. The new SGX DDK binaries are mostly for Wayland=
=20
> graphics stack, as far as I know, since that's what we support on our=20
> platforms.
>=20
>=20
> Karthik,
>=20
> Anything you want to add or clarify here?
>=20
> --=20
> Denys
>=20
>=20
> > On Sat, Aug 12, 2017 at 8:07 AM, Denys Dmytriyenko <denys@ti.com> wrote=
:
> >=20
> > > No, it's not an optional dependency, unfortunately:
> > >
> > > $ for i in lib*.so.*.*.*; do echo $i; arm-linux-gnueabihf-readelf -a =
$i |
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
> > >     91: 0000f66d    56 FUNC    GLOBAL DEFAULT   11 wayland_drm_buffer=
_get
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
> > > >  PR =3D "r26"
> > > >  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2
> > > omap5-sgx-ddk-um-linux"
> > > >
> > > > -DEPENDS +=3D "libdrm udev libgbm wayland libffi"
> > > > -RDEPENDS_${PN} +=3D "libdrm libudev libgbm wayland libffi libdrm-o=
map"
> > > > +WAYLAND =3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> > > 'wayland', '', d)}"
> > > > +DEPENDS +=3D "libdrm udev libgbm ${WAYLAND} libffi"
> > > > +RDEPENDS_${PN} +=3D "libdrm libudev libgbm ${WAYLAND} libffi libdr=
m-omap"
> > > >
> > > >  RPROVIDES_${PN} =3D "libegl libgles1 libgles2 omap5-sgx-ddk-um-lin=
ux"
> > > >  RPROVIDES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev
> > > omap5-sgx-ddk-um-linux-dev"
> > > > @@ -63,7 +64,7 @@ FILES_${PN} +=3D  "${includedir}/*"
> > > >  FILES_${PN} +=3D  "${sysconfdir}/*"
> > > >
> > > >  PACKAGES =3D+ "${PN}-plugins"
> > > > -FILES_${PN}-plugins =3D "${libdir}/libsrv_init.so ${libdir}/libsrv=
_um.so
> > > ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> > > ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> > > ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
> > > > +FILES_${PN}-plugins =3D "${libdir}/libsrv_init.so ${libdir}/libsrv=
_um.so
> > > ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so
> > > ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so
> > > ${libdir}/libpvrGBMWSEGL.so  ${@bb.utils.contains('DISTRO_FEATURES',
> > > 'wayland', '${libdir}/libpvrws_WAYLAND.so', '', d)}"
> > > >  RDEPENDS_${PN} +=3D "${PN}-plugins"
> > > >
> > > >  ALLOW_EMPTY_${PN}-plugins =3D "1"
> > > > --
> > > > 2.7.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > >

