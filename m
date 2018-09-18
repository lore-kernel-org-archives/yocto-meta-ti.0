Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E96F9E00AF4; Tue, 18 Sep 2018 05:50:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0899E00566
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2018 05:50:51 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8ICooZH086371
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2018 07:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537275050;
	bh=O6kmwsdnfwFAmQl8Rq0AvpCC/z84AfTuPR2RcPNgHng=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Cpe0x8AXrBiL6kAYdAZW2hOJ98rIM1XndAVi8ay8dhWew2X/ChTCmpSkLMvF3Lho1
	c0f9MIMEYibIquDTU+8RoXf4C1aDAHWe6m81OUTlmkt2PLqsQis0bRMESOJD06X7Ww
	J7LX3V9ukluOitC7M5Qfd/myKfsV/AUcMBG3knyI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8ICooEf016422
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2018 07:50:50 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 18 Sep 2018 07:50:50 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Tue, 18 Sep 2018 07:50:51 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko][PATCH] ti-cgt-arm: Update to add
	rtsv7R4_A_le_v3D16_eabi.lib
Thread-Index: AQHUTuhrEy+xqO1bTEynhfWJeo8xhKT1/fmw
Date: Tue, 18 Sep 2018 12:50:51 +0000
Message-ID: <955fb3e90736452caa12330f2f5d0cea@ti.com>
References: <1536979805-18343-1-git-send-email-sam.nelson@ti.com>
	<20180918004042.GI12296@beryl>
In-Reply-To: <20180918004042.GI12296@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.139.144]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko][PATCH] ti-cgt-arm: Update to add rtsv7R4_A_le_v3D16_eabi.lib
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
X-List-Received-Date: Tue, 18 Sep 2018 12:50:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, September 17, 2018 8:41 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [rocko][PATCH] ti-cgt-arm: Update to add
> rtsv7R4_A_le_v3D16_eabi.lib
>=20
> On Fri, Sep 14, 2018 at 10:50:05PM -0400, Sam Nelson wrote:
> > rtsv7R4_A_le_v3D16_eabi.lib library is not included in the cgt package.
> > This library is built dynamically during linking during a single build.
> > Bu in case of parallel make, dynamic creation of libraries causes
> > failures.
> > Hence building and adding the library to the package.
>=20
> Is this applicable to all platforms?

It only affects platforms that use armv7 cores. On second thought this can =
be modified to be added only for applicable platforms.

>=20
>=20
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>t
> > ---
> >  recipes-ti/devtools/ti-cgt-arm.inc | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/t=
i-cgt-
> arm.inc
> > index 436fab1..b9f7566 100644
> > --- a/recipes-ti/devtools/ti-cgt-arm.inc
> > +++ b/recipes-ti/devtools/ti-cgt-arm.inc
> > @@ -9,12 +9,20 @@ require recipes-ti/includes/ti-paths.inc
> >
> >  S =3D "${WORKDIR}/ti-cgt-arm-${PV}"
> >
> > +PR =3D "r1"
> > +
> >  SRC_URI =3D "http://software-
> dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=3D
> ${BINFILE_NAME}"
> >
> >  BINFILE =3D "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
> >  TI_BIN_UNPK_ARGS =3D "--prefix ${S}"
> >  TI_BIN_UNPK_CMDS =3D ""
> >
> > +do_compile_append() {
> > +    cd ${S}/ti-cgt-arm_${PV}.LTS
> > +    export PATH=3D${PATH}:${S}/ti-cgt-arm_${PV}.LTS/bin
> > +    lib/mklib --pattern=3Drtsv7R4_A_le_v3D16_eabi.lib
> > +}
> > +
> >  do_install() {
> >      install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> >      cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

