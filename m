Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DD67E00BB7; Wed, 20 Feb 2019 16:16:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64DCCE00872
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2019 16:15:59 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1L0Fw4Q071305
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2019 18:15:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550708158;
	bh=i+Lr6vFj6RMttTeosozbj/IvnJ28V0OQuc+Vgen0seY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=J6LRcYY+JO/vd9rNrdjo7riJRSP83Czwl7coo9qUZG/k8UkL+OQkZqEZecQnE4zbL
	iVQrUj3V0mpZGSYf+1WyiSDejE2jl27JduNdi4BxkXw9aLV3xoEtZLJU+H2zy/kX9O
	0ZgE25ps3ezBJSzHf485mDt7Kp5Q+8wJVWZDpi+o=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1L0FwY4013857
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2019 18:15:58 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 20 Feb 2019 18:15:58 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1591.008; Wed, 20 Feb 2019 18:15:58 -0600
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti][master][PATCH] ti-gc320-driver: move to k4.19
Thread-Index: AQHUx987NReQNZ5F0keKKOMRBNBYC6XpqJoA//+8hfA=
Date: Thu, 21 Feb 2019 00:15:58 +0000
Message-ID: <4e9ec19649cc45eb8ae81ce8e2203bb5@ti.com>
References: <20190218231230.14092-1-g-tammana@ti.com>
	<20190220221609.GC11501@beryl>
In-Reply-To: <20190220221609.GC11501@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.30.184]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master][PATCH] ti-gc320-driver: move to k4.19
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
X-List-Received-Date: Thu, 21 Feb 2019 00:16:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, February 20, 2019 4:16 PM
> To: Tammana, Gowtham
> Cc: meta-ti@yoctoproject.org; Balagopalakrishnan, Anand; Ruei, Eric
> Subject: Re: [meta-ti][master][PATCH] ti-gc320-driver: move to k4.19
>=20
> On Mon, Feb 18, 2019 at 05:12:30PM -0600, Gowtham Tammana wrote:
> >   - Updated the recipe to pick sources for k4.19
> >   - Removed the gcc8 workaround patch as the new srcrev include those f=
ixes
> >
> > Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> > ---
> ...
> > diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > index 1a6bc5da..551a3512 100644
> > --- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > +++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
> > @@ -9,12 +9,11 @@ MACHINE_KERNEL_PR_append =3D "e"
> >  PR =3D "${MACHINE_KERNEL_PR}"
> >
> >  # Need to branch out with ${PV} var
> > -BRANCH =3D "ti-${PV}-k4.14"
> > +BRANCH =3D "ti-${PV}-k4.19"
> >
> > -SRCREV =3D "a36799d9329efcfff19e30e690156d5ebf7e0c55"
> > +SRCREV =3D "9b59e596b4adefabbb686ce8845edef8114558fd"
> >
> > -SRC_URI =3D "git://git.ti.com/graphics/ti-gc320-
> driver.git;protocol=3Dgit;branch=3D${BRANCH} \
> > -	file://0001-Kbuild-bypass-gcc8-stringop-overflow-
> error.patch;striplevel=3D2"
> > +SRC_URI =3D "git://git.ti.com/graphics/ti-gc320-
> driver.git;protocol=3Dgit;branch=3D${BRANCH}
>=20
> This change lost the closing quote in SRC_URI, leading to parse errors.
> Please at least build-test your patches before submitting them! Thanks.

An oversight from my side on choosing the patchset, apologies.
Thanks for the fix.

=20
> >  S =3D "${WORKDIR}/git/src"
> >
> > --
> > 2.20.1
> >

