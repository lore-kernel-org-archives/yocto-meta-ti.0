Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 809EFE00887; Tue, 23 Sep 2014 11:02:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BBDAAE00876
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:01:40 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NI1cdg022720
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:01:38 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NI1ceZ014268
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:01:38 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 23 Sep 2014 13:01:38 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-ti] [for master 2/6] dspdce-fw: Updated dspdce firmware
	for latest IPC version
Thread-Index: AQHP10mztnSRF3T3N0ywiaI2FE7L9ZwPAdYA
Date: Tue, 23 Sep 2014 18:01:37 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C73B7F6@DFLE08.ent.ti.com>
References: <1411488036-32089-1-git-send-email-a0393906@ti.com>
	<1411488036-32089-3-git-send-email-a0393906@ti.com>
	<20140923161549.GN6303@edge>
In-Reply-To: <20140923161549.GN6303@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [for master 2/6] dspdce-fw: Updated dspdce firmware for latest IPC version
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
X-List-Received-Date: Tue, 23 Sep 2014 18:02:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Tuesday, September 23, 2014 11:16 AM
> To: R, Karthik
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [for master 2/6] dspdce-fw: Updated dspdce firmwar=
e
> for latest IPC version
>=20
> On Tue, Sep 23, 2014 at 09:30:32PM +0530, Karthik Ramanan wrote:
> > Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > ---
> >  recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb |   26
> +++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >  create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
> >
> > diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb b/recipes-
> bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
> > new file mode 100644
> > index 0000000..20cd7c8
> > --- /dev/null
> > +++ b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
> > @@ -0,0 +1,26 @@
> > +DESCRIPTION =3D "Firmware for DSP "
>=20
> ^^^ Do you want to clarify what kind of firmware for DSP this is?
>=20
> Otherwise looks fine.
>=20
>=20
> > +LICENSE =3D "TI-TSPA"
> > +LIC_FILES_CHKSUM =3D "file://DSPDCE-${PV}-
> Manifest.doc;md5=3Db8feda5a3ed8197d05993c0d0ff5590e"
> > +
> > +COMPATIBLE_MACHINE =3D "dra7xx-evm"
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +SRC_URI =3D "
> http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00_00_04/ex
> ports/dspdce-${MACHINE}-1.00.00.04.tar.gz;protocol=3Dftp"
> > +
> > +S =3D "${WORKDIR}/dspdce-${MACHINE}-${PV}"
> > +
> > +SRC_URI[md5sum] =3D "72722b12e90c26a85f7f1b56d749cad0"
> > +SRC_URI[sha256sum] =3D
> "64057db41dbee5a992db88129a9154f27c67cfbba8efdc0f09b7de38df4d58e
> b"
> > +
> > +TARGET =3D "dra7-dsp1-fw.xe66"
> > +
> > +do_install() {
> > +        mkdir -p ${D}${base_libdir}/firmware
> > +        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGE=
T}
> > +}
> > +
> > +FILES_${PN} +=3D "${base_libdir}/firmware/${TARGET}"
> > +
> > +INSANE_SKIP_${PN} =3D "arch"
> > +
> > +PR =3D "r2"
[Franklin] Can you also move this PR up? Usually it goes somewhere below th=
e Description and above the SRC_URI. Also setting it to r0 would be good si=
nce this is the first time this recipe has existed.
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

