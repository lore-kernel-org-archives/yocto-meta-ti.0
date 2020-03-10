Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.1168.1583865237392750672
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Mar 2020 11:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uj+dn9Z6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-radhakrishnan2@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02AIXuQU002614
	for <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2020 13:33:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583865236;
	bh=+D8/6LzsLHtNr6Ntm25tZ3Cy5TG0isSKgHaTsFx3LE8=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=uj+dn9Z6E+g2Kz6SP8HfrY0kCFz35TDx/xdsbwWUSkSJGaCb1X0/IS0JOtE6KZoOq
	 Y9Ii4rT32N8/ZjreubIQaIECl/A+i9TLJ0Mfq10g5wMDwkHzvNBLYvjN9TR+HIC6y2
	 NuGSwNEEPD21KJbYrjwIBnfBTgLTAebw+VqKMDq0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02AIXunc052844
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2020 13:33:56 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 10
 Mar 2020 13:33:56 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
 DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
 15.01.1847.007; Tue, 10 Mar 2020 13:33:56 -0500
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [thud/master][PATCH] sciclient-rtos: SRCREV update, adding steps to generate sysfw.bin
Thread-Topic: [meta-ti] [thud/master][PATCH] sciclient-rtos: SRCREV update,
 adding steps to generate sysfw.bin
Thread-Index: AQHV9wahznwTVb0J/0CAgE+V0lrDJ6hCJq5Q
Date: Tue, 10 Mar 2020 18:33:56 +0000
Message-ID: <c2683e37482b4a3b84f89993a57fbb49@ti.com>
References: <20200226213750.32020-1-m-radhakrishnan2@ti.com>
 <15F75F9B6D48606D.22756@lists.yoctoproject.org>
 <15F890DA7571B9C2.27899@lists.yoctoproject.org> <20200310180632.GX2301@beryl>
In-Reply-To: <20200310180632.GX2301@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.118.69]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes. Sciclient is only for K3 devices I have addressed the review comment a=
nd sent a v2 patch for the same.



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, March 10, 2020 2:07 PM
To: Radhakrishnan, Mahesh; meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [thud/master][PATCH] sciclient-rtos: SRCREV update,=
 adding steps to generate sysfw.bin

Ping again. Any feedback?

On Mon, Mar 02, 2020 at 01:42:14PM -0500, Denys Dmytriyenko via Lists.Yoct=
oproject.Org wrote:
> Ping.
>=20
> On Thu, Feb 27, 2020 at 04:28:33PM -0500, Denys Dmytriyenko via Lists.Yo=
ctoproject.Org wrote:
> > On Wed, Feb 26, 2020 at 04:37:50PM -0500, Mahesh Radhakrishnan via Lis=
ts.Yoctoproject.Org wrote:
> > > ---
> > >  recipes-bsp/sciclient/sciclient-rtos_git.bb | 40 ++++++++++++++++++=
+--
> > >  1 file changed, 38 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-b=
sp/sciclient/sciclient-rtos_git.bb
> > > index 6a3d79c3..ca3894fa 100644
> > > --- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > > +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > > @@ -7,14 +7,15 @@ TI_PDK_COMP =3D "ti.drv.sciclient"
> > >  PE =3D "1"
> > >  
> > >  LICENSE =3D "BSD-3-Clause"
> > > -LIC_FILES_CHKSUM =3D "file://sciclient.h;beginline=3D1;endline=3D31=
;md5=3D7224b2eeca1444815f1737bfcdfa892a"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D99d7639a81c1ba1f16fd=
070a928ffddb"
> > >  
> > >  COMPATIBLE_MACHINE =3D "k3"
> > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > >  
> > > -PR =3D "r0"
> > > +PR =3D "r1"
> > >  
> > >  DEPENDS_append =3D " osal-rtos common-csl-ip-rtos"
> > > +DEPENDS_append_k3 =3D " openssl-native"
> >=20
> > Isn't it redundant since the recipe is only compatible with "k3"?
> >=20
> >=20
> > >  # Build with make instead of XDC
> > >  TI_PDK_XDCMAKE =3D "0"
> > > @@ -60,6 +61,41 @@ do_compile() {
> > >      tar -cf sciclient.tar --exclude=3D'*.tar' ./*
> > >  }
> > >  
> > > +
> > > +do_compile_prepend_am65xx-hs-evm() {
> > > +
> > > +    cd ${SCICLIENT_ROOTPATH}
> > > +
> > > +    # Saving the GP firmware to a different GP name
> > > +    cp ${CP_ARGS} ./soc/V0/sysfw.bin ./soc/V0/sysfw-gp.bin
> > > +    
> > > +    cd ${SCICLIENT_ROOTPATH}/tools
> > > +    # Create the .bin file for HS
> > > +    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x-hs ${PDK=
_INSTALL_DIR}/packages
> > > +    cd -
> > > +}
> > > +
> > > +do_compile_prepend_am65xx-evm() {
> > > +
> > > +    cd ${SCICLIENT_ROOTPATH}/tools
> > > +
> > > +    # Create the .bin file for GP, PG1
> > > +    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x ${PDK_IN=
STALL_DIR}/packages
> > > +    # Create the .bin file for GP, PG2
> > > +    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x_pg2 ${PD=
K_INSTALL_DIR}/packages
> > > +    
> > > +    cd -
> > > +}
> > > +
> > > +
> > > +do_compile_prepend_j7-evm() {
> > > +
> > > +    cd ${SCICLIENT_ROOTPATH}/tools
> > > +    # Create the .bin file for GP
> > > +    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh j721e ${PDK_IN=
STALL_DIR}/packages
> > > +    cd -
> > > +}
> > > +
> > >  do_install() {
> > >      cd ${SCICLIENT_ROOTPATH}
> > >      install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/scicli=
ent
> > > --=20
> > > 2.17.1
> > >=20
> >=20
> > >=20
> >=20
>=20
> >=20
>=20

>=20

