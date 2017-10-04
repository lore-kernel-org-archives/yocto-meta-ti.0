Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67FCFE00D4F; Tue,  3 Oct 2017 17:09:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30F31E00D48
	for <meta-ti@yoctoproject.org>; Tue,  3 Oct 2017 17:09:47 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9409lhu016950
	for <meta-ti@yoctoproject.org>; Tue, 3 Oct 2017 19:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507075787;
	bh=JlOGbVHO1G4CQEqFWx77NU+N+aiC0oelEZUj2fyhkdM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=wr39hxNaOBdE3NlScGTDMe02+14bd3T0ebVfJqSe7HqcNelOPfXiecNGO1+uWptLT
	g/GtVdQ60fwomM6LgSOxYabFArdIJfUwTlWLcBnCt8yL0wI4BocLsbkCRTzZTvHNdq
	YU+KDXcH20obcKu774OndpYAV6d2tkVsIzH8m3Pk=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9409l8L030505
	for <meta-ti@yoctoproject.org>; Tue, 3 Oct 2017 19:09:47 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Tue, 3 Oct 2017 19:09:47 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [morty/master][PATCH 2/4] ti-sysbios: Add recipe for
	new version 6.52.00.12
Thread-Index: AQHTPIC53uHDVttD+0y1tnkW+1iyeaLS0FwA
Date: Wed, 4 Oct 2017 00:09:45 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490586DAE9C@DLEE11.ent.ti.com>
References: <1507029285-5066-1-git-send-email-sam.nelson@ti.com>
	<1507029285-5066-2-git-send-email-sam.nelson@ti.com>
	<20171003194912.GU8393@edge>
In-Reply-To: <20171003194912.GU8393@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [morty/master][PATCH 2/4] ti-sysbios: Add recipe for new version 6.52.00.12
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
X-List-Received-Date: Wed, 04 Oct 2017 00:09:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,
The old version will need the old version of gcc. So I left both the gcc an=
d bios old versions. ( My thinking is, if anybody want to use the old versi=
on of bios, they need to set the preferred version to be gcc 4).
Let me know if this makes sense.
With regards,
Sam

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, October 3, 2017 3:49 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [morty/master][PATCH 2/4] ti-sysbios: Add recipe f=
or
> new version 6.52.00.12
>=20
> Sam,
>=20
> You seem to be updating baremetal gcc from version 4 to version 6, but he=
re
> you are adding new sysbios version, leaving old one alone. Will it break =
the old
> version of sysbios or does it build/work fine with the new gcc?
>=20
> On Tue, Oct 03, 2017 at 07:14:43AM -0400, Sam Nelson wrote:
> > Linux installer binary file name has changed compared to previous
> > version Break backward compatibilty for A15 gcc tools: requires
> > gcc-arm-none- eabi-6-2017-q1-update or later
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-ti/bios/ti-sysbios_6.52.00.12.bb | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644 recipes-ti/bios/ti-sysbios_6.52.00.12.bb
> >
> > diff --git a/recipes-ti/bios/ti-sysbios_6.52.00.12.bb
> > b/recipes-ti/bios/ti-sysbios_6.52.00.12.bb
> > new file mode 100644
> > index 0000000..2bbe881
> > --- /dev/null
> > +++ b/recipes-ti/bios/ti-sysbios_6.52.00.12.bb
> > @@ -0,0 +1,16 @@
> > +require recipes-ti/bios/ti-sysbios.inc
> > +
> > +PV =3D "6_52_00_12"
> > +PR =3D "r0"
> > +
> > +LIC_FILES_CHKSUM =3D
> "file://manifest_bios_${PV}.html;md5=3Dca549c223d732e6f69efc449795c4eeb"
> > +
> > +SRC_URI[sysbiosbin.md5sum] =3D "3c16af0843b5b6c5ff10512d1b586665"
> > +SRC_URI[sysbiosbin.sha256sum] =3D
> "4a2b9b76f52a57f02725337db9361787eae4c917d7cf989a697ed41eb4a1e70
> 1"
> > +
> > +TI_BIN_UNPK_CMDS =3D ""
> > +TI_BIN_UNPK_ARGS =3D "--mode unattended --prefix ${WORKDIR}"
> > +
> > +BINFILE =3D "bios_${PV}.run"
> > +SRC_URI =3D "http://software-
> dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/sysbios/${PV}/exp=
o
> rts/${BINFILE};name=3Dsysbiosbin"
> > +
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

