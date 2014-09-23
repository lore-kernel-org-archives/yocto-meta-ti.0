Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01EF2E0084F; Tue, 23 Sep 2014 11:05:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47897E00786
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:05:31 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NI5UIj018814
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:05:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NI5UZX017032
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 13:05:30 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 23 Sep 2014 13:05:31 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
Thread-Topic: [meta-ti] [for master 3/6] ipumm-fw: Updated ipumm firmware
	for latest IPC version
Thread-Index: AQHP10qJ1oz6ypl0BUmUsRFVoXQMPJwPAqRg
Date: Tue, 23 Sep 2014 18:05:30 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C73B84A@DFLE08.ent.ti.com>
References: <1411488036-32089-1-git-send-email-a0393906@ti.com>
	<1411488036-32089-4-git-send-email-a0393906@ti.com>
	<20140923162156.GQ6303@edge>
In-Reply-To: <20140923162156.GQ6303@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [for master 3/6] ipumm-fw: Updated ipumm firmware for latest IPC version
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
X-List-Received-Date: Tue, 23 Sep 2014 18:05:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This looks like it really needs to be two separate recipes.  Maybe split ou=
t the few common pieces in a .inc file and have machine specific stuff in s=
eparate recipe files.

Currently everything is compatible with omap-a15 (SOC) but this build will =
fail unless you are building for dra7xx or omap5-evm. So it probably will m=
ake sense for the COMPATIBLE_MACHINE in the new recipes to depend on the ac=
tual machine and not the SOC family.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Tuesday, September 23, 2014 11:22 AM
> To: R, Karthik
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [for master 3/6] ipumm-fw: Updated ipumm firmware
> for latest IPC version
>=20
> On Tue, Sep 23, 2014 at 09:30:33PM +0530, Karthik Ramanan wrote:
> > * This includes the error handling support.
> > * Minor bug fixes
> >
> > Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > ---
> >  recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb |   36
> +++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >  create mode 100644 recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
> >
> > diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
> > b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
> > new file mode 100644
> > index 0000000..f32d228
> > --- /dev/null
> > +++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
> > @@ -0,0 +1,36 @@
> > +DESCRIPTION =3D "Firmware for IPU "
>=20
> What kind of firmware for IPU this is? It doesn't need to be very detaile=
d, but
> spelling out some generic "purpose" of the firmware would be nice.
>=20
>=20
> > +LICENSE =3D "TI-TSPA"
> > +
> > +
> > +LIC_FILES_CHKSUM_dra7xx-evm =3D "file://MMIP-${PV}-
> Manifest.doc;md5=3D8206ccaf28c2932afb5afd9c9575287c"
> > +LIC_FILES_CHKSUM_omap5-evm =3D "file://MMIP-${PV}-
> Manifest.doc;md5=3D39a593dd8fc2a9654c74f679ed329c45"
> > +
> > +COMPATIBLE_MACHINE =3D "omap-a15"
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +SRC_URI =3D ""
> > +SRC_URI_append_dra7xx-evm =3D
> "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_06_00/e
> xports/ipumm-${MACHINE}-
> 3.00.06.00.tar.gz;protocol=3Dftp;name=3D${MACHINE}"
> > +
> > +SRC_URI_append_omap5-evm  =3D
> "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/e
> xports/ipumm-${MACHINE}-
> 3.00.04.02.tar.gz;protocol=3Dhttp;name=3D${MACHINE}"
>=20
> Why not set SRC_URI_dra7xx-evm and SRC_URI_omap5-evm directly?
>=20
>=20
> > +# DRA7xx checksums
> > +SRC_URI[dra7xx-evm.md5sum] =3D
> "8e1ae40eb10d631318d001463fa11d79"
> > +SRC_URI[dra7xx-evm.sha256sum] =3D
> "30c275146c34d11dbc2dfd568f0bbc3098a13cd981eee8a7a9766cb07d2f1ca
> 5"
> > +
> > +# OMAP5 checksums
> > +SRC_URI[omap5-evm.md5sum] =3D
> "1572073ebd4f6d127c4e8cf47d270b6a"
> > +SRC_URI[omap5-evm.sha256sum] =3D
> "2fdb469f19e3c9984854f5bc82444fca4d7da869f5e645da22ec0d5beaa5cc65
> "
> > +
> > +S =3D "${WORKDIR}/ipumm-${MACHINE}-${PV}"
> > +
> > +TARGET_dra7xx-evm =3D "dra7-ipu2-fw.xem4"
> > +TARGET_omap5-evm =3D "ducati-m3-core0.xem3"
> > +
> > +do_install() {
> > +        mkdir -p ${D}${base_libdir}/firmware
> > +        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGE=
T}
> > +}
> > +
> > +FILES_${PN} +=3D "${base_libdir}/firmware/${TARGET}"
> > +
> > +PR =3D "r2"
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

