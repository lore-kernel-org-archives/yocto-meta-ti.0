Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4E64E0088C; Mon,  9 Nov 2015 14:50:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0FC9E007C9
	for <meta-ti@yoctoproject.org>; Mon,  9 Nov 2015 14:50:40 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA9ModYN004541
	for <meta-ti@yoctoproject.org>; Mon, 9 Nov 2015 16:50:39 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA9ModLC019480
	for <meta-ti@yoctoproject.org>; Mon, 9 Nov 2015 16:50:39 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Mon, 9 Nov 2015 16:50:39 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] omap5-sgx-ddk-um-linux: bump SRCREV and
	update powervr.ini and .so inclusion for AM3
Thread-Index: AQHRGyFFzT9c/b14HUKNtOsf+uepIp6US6sg
Date: Mon, 9 Nov 2015 22:50:38 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926AEE0B7@DLEE08.ent.ti.com>
References: <1446680984-26212-1-git-send-email-h-gou@ti.com>
	<20151109190252.GV25957@edge>
In-Reply-To: <20151109190252.GV25957@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] omap5-sgx-ddk-um-linux: bump SRCREV and update powervr.ini and .so inclusion for AM3
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
X-List-Received-Date: Mon, 09 Nov 2015 22:50:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The patch is rebased and submitted.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, November 09, 2015 2:03 PM
> To: Gou, Hongmei
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] omap5-sgx-ddk-um-linux: bump SRCREV and
> update powervr.ini and .so inclusion for AM3
>=20
> This would need to be rebased due to v2 of previous patch.
>=20
>=20
> On Wed, Nov 04, 2015 at 06:49:44PM -0500, Hongmei Gou wrote:
> > * Bump SRCREV for DRM FLIP mode support, and update powervr.ini
> correspondingly
> > * Add plugins package to include the necessary .so files
> >
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> >  recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini | 3
> ++-
> >  recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb       | 7 =
++++-
> --
> >  2 files changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-
> linux/ti33x/powervr.ini b/recipes-graphics/libgles/omap5-sgx-ddk-um-
> linux/ti33x/powervr.ini
> > index 0657ab8..5b5608e 100644
> > --- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini
> > +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini
> > @@ -1,3 +1,4 @@
> >  [default]
> > -WindowSystem=3Dnull_libdrm.so
> > +WindowSystem=3DlibpvrDRMWSEGL_FRONT.so
> > +#WindowSystem=3DlibpvrDRMWSEGL.so
> >  DisableHWTQTextureUpload=3D1
> > diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.b=
b
> b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > index 557c442..b8a0445 100644
> > --- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > @@ -6,12 +6,12 @@ LIC_FILES_CHKSUM =3D "file://OMAP5-Linux-Graphics-
> DDK-UM-Manifest.doc;md5=3D360d293d
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> >  BRANCH_omap-a15 =3D "master"
> > -BRANCH_ti33x =3D "am4/k4.1"
> > +BRANCH_ti33x =3D "am3/k4.1"
> >  BRANCH_ti43x =3D "am4/k4.1"
> >
> >  SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-um-
> linux.git;protocol=3Dgit;branch=3D${BRANCH}"
> >  SRCREV_omap-a15 =3D "d63cd6469fff610317a8e1c986f227bb3e7922f6"
> > -SRCREV_ti33x    =3D "188575c7ba16c00a15499ed88a126af2506fdba5"
> > +SRCREV_ti33x    =3D "b535b96043ae2206e0c3d24b66599ca0fbe706d3"
> >  SRCREV_ti43x    =3D "fdf4c0b594ca142a68aabb4c3f82b75be50b46cc"
> >
> >  INITSCRIPT_NAME =3D "pvr-init"
> > @@ -19,7 +19,7 @@ INITSCRIPT_PARAMS =3D "defaults 8"
> >
> >  inherit update-rc.d
> >
> > -PR =3D "r12"
> > +PR =3D "r13"
> >  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2"
> >
> >  RDEPENDS_${PN} +=3D "libdrm"
> > @@ -53,6 +53,7 @@ FILES_${PN} +=3D "${sysconfdir}/powervr.ini"
> >  PACKAGES =3D+ "${PN}-plugins"
> >  FILES_${PN}-plugins =3D ""
> >  FILES_${PN}-plugins_ti43x =3D "${libdir}/libsrv_init.so ${libdir}/libs=
rv_um.so
> ${libdir}/libglslcompiler.so ${libdir}/libpvrws_WAYLAND.so
> ${libdir}/libpvrws_KMS.so "
> > +FILES_${PN}-plugins_ti33x =3D "${libdir}/libsrv_init.so ${libdir}/libs=
rv_um.so
> ${libdir}/libglslcompiler.so ${libdir}/libpvrDRMWSEGL.so
> ${libdir}/libpvrDRMWSEGL_FRONT.so "
> >  RDEPENDS_${PN} +=3D "${PN}-plugins"
> >
> >  INHIBIT_PACKAGE_STRIP =3D "1"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

