Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8668E0094C; Mon, 24 Apr 2017 11:00:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [198.47.27.77 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21601E00777
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 11:00:51 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OI0odg027682
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 13:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493056850;
	bh=tmcrHhhbhQgg9wcoXllPduV8/EReCtabrgpx1QvsM3g=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=b8a/G5NGFJKtJ7I4SOUV216BsWWthWPwQkwMP3snLx4FQFyiiX6RDOP5Wjjj3sLPy
	uJg9Y/ofG1uaF+N/061QDdd/ihc2Un7RQsFGFA2NOIvtwYb8t2wRhEpQGF6mRV7S5Z
	27sl7LA7+5LoHeIxjdJDhp61+Pggi/m4BLjB1IgM=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OI0ocm018591
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 13:00:50 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 24 Apr 2017 13:00:50 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [morty/master][PATCH] mpm-transport: Update to new
	version 2.0.4.0
Thread-Index: AQHSvSSlowpE5gTanke2FaRnNIDPWaHUzw6g
Date: Mon, 24 Apr 2017 18:00:49 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490585C4ACA@DLEE11.ent.ti.com>
References: <1493056283-45773-1-git-send-email-sam.nelson@ti.com>
	<20170424180022.GF24846@edge>
In-Reply-To: <20170424180022.GF24846@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [morty/master][PATCH] mpm-transport: Update to new version 2.0.4.0
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
X-List-Received-Date: Mon, 24 Apr 2017 18:00:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Same as previous one. I missed putting morty/master.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, April 24, 2017 2:00 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [morty/master][PATCH] mpm-transport: Update to new
> version 2.0.4.0
>=20
> What's the difference from this:
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-
> ti/commit/?id=3Dc734db427cdb3a38614f5e132269a599fab9cdb1
>=20
>=20
> On Mon, Apr 24, 2017 at 01:51:23PM -0400, Sam Nelson wrote:
> > - Add INSANE_SKIP ldflags to avoid warning
> > - Add no-preserve-ownership to avoid host contamination warning
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-ti/mpm-transport/mpm-transport_git.bb | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb
> > b/recipes-ti/mpm-transport/mpm-transport_git.bb
> > index 0690807..bf02c0b 100644
> > --- a/recipes-ti/mpm-transport/mpm-transport_git.bb
> > +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> > @@ -15,15 +15,16 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >  SRC_URI =3D "git://git.ti.com/keystone-linux/mpm-
> transport.git;protocol=3Dgit;branch=3D${BRANCH}"
> >
> >  BRANCH =3D "master"
> > -# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.03.00
> > -SRCREV =3D "ba53217c5db1a6f9d21a0c8f50e9e30a6efa8be8"
> > +# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.04.00
> SRCREV
> > +=3D "e0e44fe55bef7ddf89f7ff3574f07fa906e72a37"
> >
> > -PV =3D "2.0.3.0"
> > +PV =3D "2.0.4.0"
> >  PR =3D "r0"
> >
> >  EXTRA_OEMAKE =3D "PDK_INSTALL_PATH=3D${STAGING_INCDIR}"
> >  EXTRA_OEMAKE_append_k2hk-evm +=3D "HYPLNK_TRANSPORT=3Dtrue
> SRIO_TRANSPORT=3Dtrue"
> >  EXTRA_OEMAKE_append_k2e +=3D "HYPLNK_TRANSPORT=3Dtrue"
> > +INSANE_SKIP_${PN} +=3D "ldflags"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > @@ -43,7 +44,7 @@ do_install() {
> >  	install -c -m 644 ${S}/include/* ${D}${includedir}/
> >
> >  	install -d ${D}${libdir}/
> > -	cp  -a ${S}/lib/* ${D}${libdir}/
> > +	cp  -a --preserve=3Dmode,timestamps --no-preserve=3Downership
> ${S}/lib/*
> > +${D}${libdir}/
> >
> >  	install -d ${D}${sysconfdir}/mpm/
> >  	install -c -m 644 ${S}/scripts/mpm_config.json
> > ${D}${sysconfdir}/mpm/mpm_config.json
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

