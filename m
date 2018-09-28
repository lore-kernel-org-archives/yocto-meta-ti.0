Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9EA0E00A0C; Fri, 28 Sep 2018 10:38:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,T_FILL_THIS_FORM_SHORT
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 590D8E009D9
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 10:38:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SHcDNI074603
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 12:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538156293;
	bh=YKC4zxYzl7mT+IcC8QysLMIYt2JQK/4PA/uvmk7mKoY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=bFCnmU9k7xA09NjH5Or7IsWG0xWQq/DLoudmQPSMNy4J0DKCUIG/LPE94LAh3kCea
	/K0Bz1OzNcaWIJxC9JMlswR+yZPxo6VR31f+GtGdQs17VOTQjjYLjvj1mrjGsX0Sy3
	Wec2Tgq2u0xB/5TGlTBTn2cMFqmBDgOXTTEUua8A=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SHcD8j009246
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 12:38:13 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 12:38:14 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Fri, 28 Sep 2018 12:38:14 -0500
From: "Xu, Jianzhong" <xuj@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] dsplib/mathlib: remove .metadata folder from
	packages
Thread-Index: AQHUV1C6PLTcHF8wo0msjrtgm6tAh6UGR34A//+tUPA=
Date: Fri, 28 Sep 2018 17:38:13 +0000
Message-ID: <52cc466fc4ff44c397ea6182ec51497b@ti.com>
References: <1538155548-33412-1-git-send-email-xuj@ti.com>
	<20180928173156.GF13888@beryl>
In-Reply-To: <20180928173156.GF13888@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.76]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] dsplib/mathlib: remove .metadata folder from packages
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
X-List-Received-Date: Fri, 28 Sep 2018 17:38:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, September 28, 2018 1:32 PM
To: Xu, Jianzhong
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] dsplib/mathlib: remove .metadata folder from=
 packages

On Fri, Sep 28, 2018 at 01:25:48PM -0400, Jianzhong Xu wrote:
> dsplib/mathlib: remove .metadata folder from dsplib and mathlib packages

The log says "remove", but that's not what the code does, it seems...

- Yeah. Maybe "don't add .metadata to packages" is better. Should I resend =
the patch?

> Remove .metadata folder from dsplib and mathlib packages.
> This folder prevents CCS from finding and installing dsplib and mathlib.
>=20
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  recipes-ti/dsplib/dsplib.inc   | 2 --
>  recipes-ti/mathlib/mathlib.inc | 2 --
>  2 files changed, 4 deletions(-)
>=20
> diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
> index 7180c4a..f369679 100644
> --- a/recipes-ti/dsplib/dsplib.inc
> +++ b/recipes-ti/dsplib/dsplib.inc
> @@ -49,7 +49,6 @@ do_install() {
> =20
>  	find -name "${DSPLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d ${D}${DSPL=
IB_INSTALL_DIR_RECIPE} \;
>  	mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/* ${D}${DSPLIB_INSTALL_DIR_R=
ECIPE}
> -	mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/.metadata ${D}${DSPLIB_INSTA=
LL_DIR_RECIPE}
>  	rm -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib
>  }
> =20
> @@ -62,7 +61,6 @@ do_deploy() {
>  	# and place the zip file in ${DEPLOYDIR}
>  	mkdir ./${DSPLIB_PACKAGE_NAME}
>  	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/* ./${DSPLIB_PACKAGE_NAME}
> -	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/.metadata ./${DSPLIB_PACKAGE_NAM=
E}
>  	zip -9 -y -r -q ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip ./${DSPLIB_PACK=
AGE_NAME}
>  	rm -r ./${DSPLIB_PACKAGE_NAME}
>  }
> diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.=
inc
> index 3e981e4..6aea085 100644
> --- a/recipes-ti/mathlib/mathlib.inc
> +++ b/recipes-ti/mathlib/mathlib.inc
> @@ -48,7 +48,6 @@ do_install() {
> =20
>  	find -name "${MATHLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d ${D}${MAT=
HLIB_INSTALL_DIR_RECIPE} \;
>  	mv ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/* ${D}${MATHLIB_INSTALL_DI=
R_RECIPE}
> -	mv ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/.metadata ${D}${MATHLIB_IN=
STALL_DIR_RECIPE}
>  	rm -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib
>  }
> =20
> @@ -61,7 +60,6 @@ do_deploy() {
>  	# and place the zip file in ${DEPLOYDIR}
>  	mkdir ./${MATHLIB_PACKAGE_NAME}
>  	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/* ./${MATHLIB_PACKAGE_NAME}
> -	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/.metadata ./${MATHLIB_PACKAGE_N=
AME}
>  	zip -9 -y -r -q ${DEPLOYDIR}/${MATHLIB_PACKAGE_NAME}.zip ./${MATHLIB_PA=
CKAGE_NAME}
>  	rm -r ./${MATHLIB_PACKAGE_NAME}
>  }
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

