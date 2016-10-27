Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC857E00C45; Thu, 27 Oct 2016 14:26:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7CE2BE00C20
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2016 14:25:57 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9RLPuWk015017
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2016 16:25:56 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9RLPuS2032135
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2016 16:25:56 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Thu, 27 Oct 2016 16:25:56 -0500
From: "Pang, Ivan" <i-pang@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 1/2] ti-sysbios: update version to 6.46.1.38
Thread-Index: AQHSLxzDzYfiazRtik2OH9wi5+h2oaC6MkuAgAKk8AD///C1cA==
Date: Thu, 27 Oct 2016 21:25:55 +0000
Message-ID: <C45960711C772449A33A51ED1374F08A2F5B7BA1@DFLE08.ent.ti.com>
References: <1477440362-20066-1-git-send-email-i-pang@ti.com>
	<20161026001735.GW12745@edge> <20161027164026.GF12745@edge>
In-Reply-To: <20161027164026.GF12745@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] ti-sysbios: update version to 6.46.1.38
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
X-List-Received-Date: Thu, 27 Oct 2016 21:26:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

My apologies - didn't see that request for checksum explanation. We will be=
 doing an SDF with the recipe in meta-processor-sdk-internal for now, and r=
esubmit this PATCH with the requested detail afterwards.
Please skip this PATCH; we will re-send it early next week.

Ivan

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, October 27, 2016 11:40 AM
To: Pang, Ivan
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 1/2] ti-sysbios: update version to 6.46.1.38

On Tue, Oct 25, 2016 at 08:17:35PM -0400, Denys Dmytriyenko wrote:
> On Tue, Oct 25, 2016 at 07:06:01PM -0500, Ivan Pang wrote:
> > Signed-off-by: Ivan Pang <i-pang@ti.com>
> > ---
> >  .../bios/{ti-sysbios_6.45.01.29.bb =3D> ti-sysbios_6.46.01.38.bb}   | =
8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)  rename=20
> > recipes-ti/bios/{ti-sysbios_6.45.01.29.bb =3D>=20
> > ti-sysbios_6.46.01.38.bb} (32%)
>=20
> Now, we are talking, thanks!
>=20
>=20
> > diff --git a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb=20
> > b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> > similarity index 32%
> > rename from recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> > rename to recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> > index 6ab4e27..407b3b4 100644
> > --- a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> > +++ b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> > @@ -1,12 +1,12 @@
> >  require recipes-ti/bios/ti-sysbios.inc
> > =20
> > -PV =3D "6_45_01_29"
> > +PV =3D "6_46_01_38"
> >  PR =3D "r0"
> > =20
> > -LIC_FILES_CHKSUM =3D "file://manifest_bios_${PV}.html;md5=3Ddbcd89745f=
1745f24ace8171a96ed493"
> > +LIC_FILES_CHKSUM =3D "file://manifest_bios_${PV}.html;md5=3Dda86dca468=
e5dd80484dc83473ea32e3"
>=20
> Need a brief explanation why the checksum changed here. Specifically,=20
> if the license changed in any way from the existing BSD.

ping


> > -SRC_URI[sysbiosbin.md5sum] =3D "16cf6dc3c5cc9d2b877fa7d81dd12150"
> > -SRC_URI[sysbiosbin.sha256sum] =3D "efaf5f1d725f3fd06e45476109b1124c74c=
16c39c870d12929e071047c3e5a22"
> > +SRC_URI[sysbiosbin.md5sum] =3D "5aee070f73eb6f3d9aab2ff9c483f396"
> > +SRC_URI[sysbiosbin.sha256sum] =3D "3a04a584c3ee3221997b7d616ba45bbcc21=
ad241f4a4ab5c0f28c465d538af90"
> > =20
> >  TI_BIN_UNPK_CMDS=3D""
> >  TI_BIN_UNPK_ARGS =3D "--mode unattended --prefix ${WORKDIR}"
> > --
> > 1.9.1
> >=20
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

