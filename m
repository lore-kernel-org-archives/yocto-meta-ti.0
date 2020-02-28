Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1527.1582926891224760030
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Feb 2020 13:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=auIABfIw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-radhakrishnan2@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SLso8B055247
	for <meta-ti@lists.yoctoproject.org>; Fri, 28 Feb 2020 15:54:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582926890;
	bh=DRGbhUMekpixaIosM8QC+hWTe4bCewg5UnaUgMvyEuc=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=auIABfIwMm9YLT6tus5UkFxx6/aqa7u/piaRdeKKNdo++zELAsyNOCbwlVAJ4Kd1X
	 OgKmPk4A8f2kl9tTFoQ+owC37j69VqaYAzNAESQSeG3yvUzG6tRlcZ+fOCOIKgMgWt
	 FYa9xa61Ed/RrwgVh9EUuYU+LHLPOirnLyn4doDI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01SLsonC045281
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 28 Feb 2020 15:54:50 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 28
 Feb 2020 15:54:50 -0600
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
 DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
 15.01.1847.007; Fri, 28 Feb 2020 15:54:50 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [thud/master][PATCH] ti-cgt-arm: Update to 18.12.5
Thread-Topic: [meta-ti] [thud/master][PATCH] ti-cgt-arm: Update to 18.12.5
Thread-Index: AQHV7lqf4eUsBkEg00KJRCLJmJJhDKgxJpOg
Date: Fri, 28 Feb 2020 21:54:50 +0000
Message-ID: <85c967f2c00c47698f3e7735482eabc5@ti.com>
References: <20200228140556.27387-1-m-radhakrishnan2@ti.com>
 <15F7A052FD69F43B.32147@lists.yoctoproject.org> <20200228171506.GG2466@beryl>
In-Reply-To: <20200228171506.GG2466@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.118.69]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

For processor sdk 6.3 we are using thud , right?

May I know why it cannot be applied to zeus?

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, February 28, 2020 12:15 PM
To: Radhakrishnan, Mahesh; meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [thud/master][PATCH] ti-cgt-arm: Update to 18.12.5

BTW, this does not apply on zeus.


On Fri, Feb 28, 2020 at 12:14:29PM -0500, Denys Dmytriyenko via Lists.Yoct=
oproject.Org wrote:
> On Fri, Feb 28, 2020 at 09:05:56AM -0500, Mahesh Radhakrishnan via Lists=
.Yoctoproject.Org wrote:
> > The License checksum has changed, but the license itself has not chang=
ed
>=20
> Would be nice to mention why the checksum has changed. Year update?
>=20
>=20
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >  .../{ti-cgt-arm_18.12.1.bb =3D> ti-cgt-arm_18.12.5.bb}        | 6 +++=
---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename recipes-ti/devtools/{ti-cgt-arm_18.12.1.bb =3D> ti-cgt-arm_18.=
12.5.bb} (81%)
> >=20
> > diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb b/recipes-ti/de=
vtools/ti-cgt-arm_18.12.5.bb
> > similarity index 81%
> > rename from recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
> > rename to recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
> > index eecde58f..9e651819 100644
> > --- a/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
> > +++ b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
> > @@ -2,7 +2,7 @@ SUMMARY =3D "TI ARM Code Generation Tools"
> >  HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/TICodegenera=
tionTools/download.htm"
> >  LICENSE =3D "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Cla=
use & BSL-1.0 & Hewlett-Packard & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Cl=
ause & PD & BSD-4-Clause"
> >  
> > -LIC_FILES_CHKSUM =3D "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=3Dab=
7a61241e90fcd144a756d88294cf30"
> > +LIC_FILES_CHKSUM =3D "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=3D79=
631eb21b2e5b7190cd3ff1dfd41108"
> >  
> >  require recipes-ti/includes/ti-unpack.inc
> >  require recipes-ti/includes/ti-staging.inc
> > @@ -27,8 +27,8 @@ do_install() {
> >      cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> >  }
> >  
> > -SRC_URI[cgt_arm_installer.md5sum] =3D "af2378cf8d5d6f200ef3329f5a0655=
29"
> > -SRC_URI[cgt_arm_installer.sha256sum] =3D "d90ae2360cd5b22912715ae7898=
d99352da1b97fd655f9a55d0d19a2a46bab0e"
> > +SRC_URI[cgt_arm_installer.md5sum] =3D "e9e668332cf86c965b4da9d1d48842=
6b"
> > +SRC_URI[cgt_arm_installer.sha256sum] =3D "da976143128c619a278cb4214a4=
295c409d100f9e65ad2f4d0d1039db7cf98f4"
> >  
> >  BINFILE_NAME =3D "cgt_arm_installer"
> >  
> > --=20
> > 2.17.1
> >=20
>=20
> >=20
>=20

>=20

