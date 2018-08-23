Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3587AE00718; Thu, 23 Aug 2018 12:23:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C126FE003D7
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 12:23:58 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7NJNwD3082440
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 14:23:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535052238;
	bh=tYGx+eam0R7LG+3WxhMjyotSFnDfg8h8qEi/kKOhBZ8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=v9kgcPz6xWwE8phHH0YnbHbmumbWadXj0R7L0E2eo1vPyO7oB/yXJxicRtwoNG+NR
	RTPi1pKmKQQNrZmY4ADg0TiFChy6CQJUUafhWRldRgGnBnSaqYkttOZXwK0rQiJLqB
	KMAxfWt9zqo/oXbLbuXZLOg7qF7tKUv6gA7a3Zh4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NJNwsP001865
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 14:23:58 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 23 Aug 2018 14:23:57 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Thu, 23 Aug 2018 14:23:57 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko][PATCH] ti-pdk: Add tool chain dependencies for
	am65xx platform
Thread-Index: AQHUOmqdUkI9rSwTTU+Ar+Fznsk6sqTMZrQQgAFuJoD//9NfMA==
Date: Thu, 23 Aug 2018 19:23:57 +0000
Message-ID: <086f20d586f043bbb6aa57697b9b0470@ti.com>
References: <1534972730-13639-1-git-send-email-sam.nelson@ti.com>
	<20180822225012.GM29422@beryl>
	<517a413655f74fe1b30c8a3ac2044258@ti.com>
	<20180823160412.GP29422@beryl>
In-Reply-To: <20180823160412.GP29422@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.135]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko][PATCH] ti-pdk: Add tool chain dependencies for am65xx platform
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
X-List-Received-Date: Thu, 23 Aug 2018 19:23:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, August 23, 2018 12:04 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org; Zhang, Hao
> Subject: Re: [meta-ti] [rocko][PATCH] ti-pdk: Add tool chain dependencies=
 for
> am65xx platform
>=20
> On Wed, Aug 22, 2018 at 07:14:16PM -0400, Nelson, Sam wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Wednesday, August 22, 2018 6:50 PM
> > > To: Nelson, Sam
> > > Cc: meta-ti@yoctoproject.org; Zhang, Hao
> > > Subject: Re: [meta-ti] [rocko][PATCH] ti-pdk: Add tool chain dependen=
cies
> for
> > > am65xx platform
> > >
> > > On Wed, Aug 22, 2018 at 05:18:50PM -0400, Sam Nelson wrote:
> > > > Adds the dependency on toolchain needed for A53 and R5 cores
> > > >
> > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > ---
> > > >  classes/ti-pdk.bbclass | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> > > > index 7ad6205..f0d14a7 100644
> > > > --- a/classes/ti-pdk.bbclass
> > > > +++ b/classes/ti-pdk.bbclass
> > > > @@ -9,6 +9,8 @@ DEPENDS_append_omap-a15 =3D " ti-cgt-arm-native"
> > > >  DEPENDS_remove_ti33x =3D "ti-cgt6x-native"
> > > >  DEPENDS_remove_ti43x =3D "ti-cgt6x-native"
> > > >  DEPENDS_append_omapl1 =3D " ti-cgt-arm-native"
> > > > +DEPENDS_remove_am65xx-evm =3D "gcc-arm-none-eabi-native ti-cgt6x-
> > > native"
> > >
> > > Will gcc-arm-none-eabi-native recipe be removed?
> >
> > My understanding is gcc-arm-none-eabi-native will still be used for A15=
.
>=20
> That's strange, because both armv7 and armv8 versions of baremetal Linaro
> gcc
> were added by Hao recently...

Checked with Hao to confirm.
Looks like we cannot use baremetal gcc linaro for a15 currently. =20
(we may move to use baremetal gcc linaro later)
So this patch has to stay in the current form for now.

>=20
>=20
> > > > +DEPENDS_append_am65xx-evm =3D " ti-cgt-arm-native gcc-linaro-
> baremetal-
> > > aarch64-native"
> > > >
> > > >  S =3D "${WORKDIR}/git"
> > > >  B =3D "${WORKDIR}/build"
> > > > @@ -42,6 +44,8 @@ export TOOLCHAIN_PATH_M4 =3D
> > > "${M4_TOOLCHAIN_INSTALL_DIR}"
> > > >  export TOOLCHAIN_PATH_Arm9 =3D "${M4_TOOLCHAIN_INSTALL_DIR}"
> > > >  export C6X_GEN_INSTALL_PATH =3D
> > > "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> > > >  export CL_PRU_INSTALL_PATH =3D "${TI_CGT_PRU_INSTALL_DIR}"
> > > > +export TOOLCHAIN_PATH_GCC_ARCH64 =3D
> > > "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN}"
> > > > +export TOOLCHAIN_PATH_R5 =3D "${M4_TOOLCHAIN_INSTALL_DIR}"
> > > >
> > > >  export ROOTDIR =3D "${B}"
> > > >  export BIOS_INSTALL_PATH =3D "${SYSBIOS_INSTALL_DIR}"
> > > > --
> > > > 1.9.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti

