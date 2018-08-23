Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 248B4E00546; Wed, 22 Aug 2018 17:11:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 698F1E00474
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 17:11:03 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7N0B3YK054481
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 19:11:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534983063;
	bh=jvtn35T8E8vjKMSPlmMPBBrbBWXS8+4axNC9ZUbtQlE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=kwAW/YjjUz5tvg/tL6ahz4vyLOcrmFZMu4j70dmBUVC1FTVV7Id/l6iDJMrmOA4+H
	V4DIfFV8+VKLIfmxEPFp5QpsF4i3voaSdr3u2VUqYu5lw05COMiR7T6iADmNtDyqsL
	gcd0YjzlX80YaVnrmmMdiFOz1yjp/M963pR3B2uE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N0B34x014661
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 19:11:03 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 22 Aug 2018 19:11:02 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Wed, 22 Aug 2018 19:11:02 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko][PATCH 1/4] ti-pdk-build-rtos: Update to new
	version 1.0.0.10
Thread-Index: AQHUOmo7yOCwKpp+10uinY9q3HICaqTMatQAgABdBID//66swA==
Date: Thu, 23 Aug 2018 00:11:02 +0000
Message-ID: <2ce84e2453c54ef29acc0faece42a0bc@ti.com>
References: <1534974652-28676-1-git-send-email-sam.nelson@ti.com>
	<20180822224727.GJ29422@beryl>
	<c2b488e8352948d994a4a4988bce5b2e@ti.com>
	<20180823000123.GO29422@beryl>
In-Reply-To: <20180823000123.GO29422@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.191.59]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko][PATCH 1/4] ti-pdk-build-rtos: Update to new version 1.0.0.10
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
X-List-Received-Date: Thu, 23 Aug 2018 00:11:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, August 22, 2018 8:01 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [rocko][PATCH 1/4] ti-pdk-build-rtos: Update to ne=
w
> version 1.0.0.10
>=20
> On Wed, Aug 22, 2018 at 07:28:53PM -0400, Nelson, Sam wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Wednesday, August 22, 2018 6:47 PM
> > > To: Nelson, Sam
> > > Cc: meta-ti@yoctoproject.org
> > > Subject: Re: [meta-ti] [rocko][PATCH 1/4] ti-pdk-build-rtos: Update t=
o new
> > > version 1.0.0.10
> > >
> > > On Wed, Aug 22, 2018 at 05:50:49PM -0400, Sam Nelson wrote:
> > > > Add support for am65xx-evm
> > > >
> > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > ---
> > > >  recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 9 ++++-----
> > > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/rec=
ipes-ti/ti-
> > > pdk-build/ti-pdk-build-rtos_git.bb
> > > > index c838d71..fd716d7 100644
> > > > --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> > > > +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> > > > @@ -4,25 +4,24 @@ LIC_FILES_CHKSUM =3D
> > > "file://makerules/env.mk;beginline=3D1;endline=3D31;md5=3D10503e8de
> > > >
> > > >  require recipes-ti/includes/ti-paths.inc
> > > >
> > > > -PV =3D "01.00.00.09A"
> > > > +PV =3D "01.00.00.10"
> > > >  PR =3D "r0"
> > > >
> > > >  PDK_BUILD_GIT_URI =3D "git://git.ti.com/keystone-rtos/processor-pd=
k-
> > > build.git"
> > > >  PDK_BUILD_GIT_PROTOCOL =3D "git"
> > > >  PDK_BUILD_GIT_BRANCH =3D "master"
> > > >
> > > > -# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.09A"
> > > > -PDK_BUILD_SRCREV =3D
> "4870d6cfcab92dfedae8ed28054fdc61169e28b1"
> > > > +# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.10"
> > > > +PDK_BUILD_SRCREV =3D
> "f06835474e51a5fd63cf23bab0d2f42b0f73f19d"
> > > >
> > > >  BRANCH =3D "${PDK_BUILD_GIT_BRANCH}"
> > > >  SRC_URI =3D "\
> > > >
> > >
> ${PDK_BUILD_GIT_URI};protocol=3D${PDK_BUILD_GIT_PROTOCOL};branch=3D${BR
> > > ANCH} \
> > > > -    file://0001-comp_mk-Allow-doxygen-support-to-be-overridden.pat=
ch
> \
> > >
> > > ???
> >
> > This patch is already part of the new baseline. So can be removed..
>=20
> Then you'd want to remove corresponding file.

Yes. will do.
>=20
>=20
> > > >      "
> > > >
> > > >  SRCREV =3D "${PDK_BUILD_SRCREV}"
> > > >
> > > > -COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-
> a15|keystone|omapl1|c66x"
> > > > +COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-
> > > a15|keystone|omapl1|c66x|am65xx-evm"
> > >
> > > k3?
> >
> > Yes k3.
>=20
> I meant maybe you want to use "k3" isntead of "am65xx-evm" here?

Ok. Got it.

>=20
>=20
> > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > >
> > > >  S =3D "${WORKDIR}/git/"
> > > > --
> > > > 1.9.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti

