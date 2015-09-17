Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84207E00D58; Thu, 17 Sep 2015 15:04:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 306D2E00D48
	for <meta-ti@yoctoproject.org>; Thu, 17 Sep 2015 15:03:56 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8HM3twg005207
	for <meta-ti@yoctoproject.org>; Thu, 17 Sep 2015 17:03:55 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8HM3tAh021350
	for <meta-ti@yoctoproject.org>; Thu, 17 Sep 2015 17:03:55 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 17 Sep 2015 17:03:56 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] dspdce-fw: add recipe to build dspdce-fw
	from git source
Thread-Index: AQHQ8YZf6haMSPPfA0GR3VlcWJ6y2Z5BRX0g
Date: Thu, 17 Sep 2015 22:03:55 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926ABC114@DLEE08.ent.ti.com>
References: <1442421520-8125-1-git-send-email-h-gou@ti.com>
	<20150917202046.GH18085@edge>
In-Reply-To: <20150917202046.GH18085@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] dspdce-fw: add recipe to build dspdce-fw from git source
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
X-List-Received-Date: Thu, 17 Sep 2015 22:04:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, September 17, 2015 4:21 PM
> To: Gou, Hongmei
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] dspdce-fw: add recipe to build dspdce-fw
> from git source
>=20
> What's the version? The recipe is not versioned and you don't set PV...

The version would be 1.00.00.06. Will sync up with automotive team to apply=
 the tag, and add PV in the v2 patch.

>=20
> Also, is it really machine-specific? It is only compatible with DRA7 and =
AM57,
> but it doesn't seem to differentiate between them in the build steps.

Yes, this is machine-specific and compatible with DRA7 and AM57 only. The b=
uild steps for DRA7 and AM57 are common.

>=20
> --
> Denys
>=20
>=20
> On Wed, Sep 16, 2015 at 12:38:40PM -0400, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> >  recipes-bsp/dspdce-fw/dspdce-fw_git.bb | 54
> ++++++++++++++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> >
> > diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-
> bsp/dspdce-fw/dspdce-fw_git.bb
> > new file mode 100644
> > index 0000000..79ba68c
> > --- /dev/null
> > +++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> > @@ -0,0 +1,54 @@
> > +DESCRIPTION =3D "Firmware for DSP for an example application called
> copycodectest"
> > +LICENSE =3D "TI-TSPA"
> > +LIC_FILES_CHKSUM =3D
> "file://src/ti/framework/dce/dce.c;startline=3D1;endline=3D31;md5=3D2c6e9=
aba6e
> d75f22b1a2b7544b1c809d"
> > +
> > +COMPATIBLE_MACHINE =3D "dra7xx"
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +SRC_URI =3D "git://git.ti.com/glsdk/dspdce.git;protocol=3Dgit"
> > +SRCREV =3D "71e8fbf8e4f91b60680cf18a0c202a222e9ae3ba"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +require recipes-ti/includes/ti-paths.inc
> > +require recipes-ti/includes/ti-staging.inc
> > +
> > +PR =3D "r0"
> > +
> > +DEPENDS =3D "ti-xdctools ti-sysbios ti-codec-engine ti-framework-
> components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
> > +
> > +export HWVERSION=3D"ES10"
> > +export BIOSTOOLSROOT=3D"${STAGING_DIR_TARGET}/usr/share/ti"
> > +
> > +export XDCVERSION=3D"ti-xdctools-tree"
> > +export BIOSVERSION=3D"ti-sysbios-tree"
> > +export IPCVERSION=3D"ti-ipc-tree"
> > +export CEVERSION=3D"ti-codec-engine-tree"
> > +export FCVERSION=3D"ti-framework-components-tree"
> > +export XDAISVERSION=3D"ti-xdais-tree"
> > +export OSALVERSION=3D"ti-osal-tree"
> > +
> > +export IPCSRC=3D"${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
> > +export C66XCGTOOLSPATH=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-
> c6x"
> > +
> > +do_configure() {
> > +    cd ${S}
> > +    make unconfig
> > +    make vayu_config
> > +}
> > +
> > +do_compile() {
> > +    cd ${S}
> > +    make dspbin
> > +}
> > +
> > +TARGET =3D "dra7-dsp1-fw.xe66"
> > +
> > +do_install() {
> > +        mkdir -p ${D}${base_libdir}/firmware
> > +        cp ${S}/dra7xx-c66x-dsp.xe66 ${D}${base_libdir}/firmware/${TAR=
GET}
> > +}
> > +
> > +INSANE_SKIP_${PN} =3D "arch"
> > +
> > +FILES_${PN} +=3D "${base_libdir}/firmware/${TARGET}"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

