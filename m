Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46DFEE007D5; Fri,  6 Nov 2015 13:56:43 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0189E0071C
	for <meta-ti@yoctoproject.org>; Fri,  6 Nov 2015 13:56:41 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA6Luepu002865
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2015 15:56:40 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA6LueUO009155
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2015 15:56:40 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Fri, 6 Nov 2015 15:56:40 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 2/2] omap5-sgx-ddk-um-linux: bump SRCREV and
	other changes to support wayland/DRM on AM4
Thread-Index: AQHRGABM5ieFk/ib30etU02dGNAoUZ6Pi5MQ
Date: Fri, 6 Nov 2015 21:56:40 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926AEC545@DLEE08.ent.ti.com>
References: <1446666795-21381-1-git-send-email-h-gou@ti.com>
	<1446666795-21381-3-git-send-email-h-gou@ti.com>
	<20151105192913.GP25957@edge>
In-Reply-To: <20151105192913.GP25957@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] omap5-sgx-ddk-um-linux: bump SRCREV and other changes to support wayland/DRM on AM4
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
X-List-Received-Date: Fri, 06 Nov 2015 21:56:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, November 05, 2015 2:29 PM
> To: Gou, Hongmei
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 2/2] omap5-sgx-ddk-um-linux: bump SRCREV
> and other changes to support wayland/DRM on AM4
>=20
> On Wed, Nov 04, 2015 at 02:53:15PM -0500, Hongmei Gou wrote:
> > * Support wayland/DRM mode
> > * Remove powervr.ini which is no longer needed
> > * Add plugins package to include the necessary .so files
> >
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> >  .../libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini           |  3 --=
-
> >  recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb    | 10
> ++++++++--
> >  2 files changed, 8 insertions(+), 5 deletions(-)  delete mode 100644
> > recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
> >
> > diff --git
> > a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
> > b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
> > deleted file mode 100644
> > index 0657ab8..0000000
> > ---
> > a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini
> > +++ /dev/null
> > @@ -1,3 +0,0 @@
> > -[default]
> > -WindowSystem=3Dnull_libdrm.so
> > -DisableHWTQTextureUpload=3D1
> > diff --git
> > a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > index cd01d6f..557c442 100644
> > --- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > @@ -12,14 +12,14 @@ BRANCH_ti43x =3D "am4/k4.1"
> >  SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-um-
> linux.git;protocol=3Dgit;branch=3D${BRANCH}"
> >  SRCREV_omap-a15 =3D "d63cd6469fff610317a8e1c986f227bb3e7922f6"
> >  SRCREV_ti33x    =3D "188575c7ba16c00a15499ed88a126af2506fdba5"
> > -SRCREV_ti43x    =3D "188575c7ba16c00a15499ed88a126af2506fdba5"
> > +SRCREV_ti43x    =3D "fdf4c0b594ca142a68aabb4c3f82b75be50b46cc"
> >
> >  INITSCRIPT_NAME =3D "pvr-init"
> >  INITSCRIPT_PARAMS =3D "defaults 8"
> >
> >  inherit update-rc.d
> >
> > -PR =3D "r11"
> > +PR =3D "r12"
> >  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2"
> >
> >  RDEPENDS_${PN} +=3D "libdrm"
> > @@ -50,8 +50,14 @@ FILES_${PN} +=3D  "${includedir}/* /usr/share/sgx-li=
b/"
> >  FILES_${PN} +=3D "${sysconfdir}/init.d/pvr-init"
> >  FILES_${PN} +=3D "${sysconfdir}/powervr.ini"
> >
> > +PACKAGES =3D+ "${PN}-plugins"
> > +FILES_${PN}-plugins =3D ""
>=20
> Quick question - have you tried other platforms, like am5, to see if they
> complain about empty ${PN}-plugins package? You may need to set
> ALLOW_EMPTY_${PN}-plugins =3D "1", if it causes problems.

Thanks for the suggestion. "ALLOW_EMPTY_${PN}-plugins =3D "1"" is indeed ne=
eded for am5. We have submitted the v2 patch with the suggested change.

>=20
>=20
> > +FILES_${PN}-plugins_ti43x =3D "${libdir}/libsrv_init.so ${libdir}/libs=
rv_um.so
> ${libdir}/libglslcompiler.so ${libdir}/libpvrws_WAYLAND.so
> ${libdir}/libpvrws_KMS.so "
> > +RDEPENDS_${PN} +=3D "${PN}-plugins"
> > +
> >  INHIBIT_PACKAGE_STRIP =3D "1"
> >
> >  INSANE_SKIP_${PN} +=3D "dev-so ldflags useless-rpaths"
> > +INSANE_SKIP_${PN}-plugins =3D "dev-so"
> >
> >  CLEANBROKEN =3D "1"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

