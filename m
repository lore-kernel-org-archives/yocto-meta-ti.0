Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 529E1E00950; Mon,  1 Oct 2018 05:17:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,T_FILL_THIS_FORM_SHORT
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06178E00826
	for <meta-ti@yoctoproject.org>; Mon,  1 Oct 2018 05:15:17 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w91CFHTn105914
	for <meta-ti@yoctoproject.org>; Mon, 1 Oct 2018 07:15:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538396117;
	bh=QYFbEJMqilOWSFH8NJZLMgMqcY40hDMHtiVK2DT36aw=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=jrRz2vqW5nql9PyknqCo0sUhF9G8CJaPjqjZyG5ZSwQNcJXIDg2RVJFRp7cu4DwCR
	YAofp31KTl4hsR5IsClKKbRL/OkGZ3TIvus6/d3zO8eAvVG5fFaoCWmTXGUJhmxequ
	eaHw7WOhEvzL17oSU3TmXFCmEGUOeEdGm819yxQ4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w91CFHn7001062
	for <meta-ti@yoctoproject.org>; Mon, 1 Oct 2018 07:15:17 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 1 Oct 2018 07:15:17 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Mon, 1 Oct 2018 07:15:17 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Xu, Jianzhong" <xuj@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [EXTERNAL] [meta-ti] [PATCH v2] dsplib/mathlib: do not
	install/deploy .metadata
Thread-Index: AQHUV1XNL1NVIR+Y10isMOKV4nViQaUKUhLQ
Date: Mon, 1 Oct 2018 12:15:17 +0000
Message-ID: <d9d6d96deafc4d80bddb8ce0b76edb68@ti.com>
References: <1538157891-64788-1-git-send-email-xuj@ti.com>
In-Reply-To: <1538157891-64788-1-git-send-email-xuj@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [PATCH v2] dsplib/mathlib: do not install/deploy .metadata
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
X-List-Received-Date: Mon, 01 Oct 2018 12:17:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Can you please backport this to the ti2018.03 branch?

Thank you,
Jake

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Xu, Jianzhong
> Sent: Friday, September 28, 2018 2:05 PM
> To: meta-ti@yoctoproject.org
> Subject: [EXTERNAL] [meta-ti] [PATCH v2] dsplib/mathlib: do not
> install/deploy .metadata
>=20
> dsplib/mathlib: do not install/deploy .metadata
>=20
> Do not install/deploy .metadata folder for dsplib and mathlib packages.
> This folder prevents CCS from finding and installing dsplib and mathlib.
>=20
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
> Changes from previous version:
> * Log has been modified to better reflect code change.
> ---
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
>=20
>  	find -name "${DSPLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d
> ${D}${DSPLIB_INSTALL_DIR_RECIPE} \;
>  	mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/*
> ${D}${DSPLIB_INSTALL_DIR_RECIPE}
> -	mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/.metadata
> ${D}${DSPLIB_INSTALL_DIR_RECIPE}
>  	rm -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib
>  }
>=20
> @@ -62,7 +61,6 @@ do_deploy() {
>  	# and place the zip file in ${DEPLOYDIR}
>  	mkdir ./${DSPLIB_PACKAGE_NAME}
>  	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/*
> ./${DSPLIB_PACKAGE_NAME}
> -	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/.metadata
> ./${DSPLIB_PACKAGE_NAME}
>  	zip -9 -y -r -q ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip
> ./${DSPLIB_PACKAGE_NAME}
>  	rm -r ./${DSPLIB_PACKAGE_NAME}
>  }
> diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.=
inc
> index 3e981e4..6aea085 100644
> --- a/recipes-ti/mathlib/mathlib.inc
> +++ b/recipes-ti/mathlib/mathlib.inc
> @@ -48,7 +48,6 @@ do_install() {
>=20
>  	find -name "${MATHLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d
> ${D}${MATHLIB_INSTALL_DIR_RECIPE} \;
>  	mv ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/*
> ${D}${MATHLIB_INSTALL_DIR_RECIPE}
> -	mv ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/.metadata
> ${D}${MATHLIB_INSTALL_DIR_RECIPE}
>  	rm -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib
>  }
>=20
> @@ -61,7 +60,6 @@ do_deploy() {
>  	# and place the zip file in ${DEPLOYDIR}
>  	mkdir ./${MATHLIB_PACKAGE_NAME}
>  	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/*
> ./${MATHLIB_PACKAGE_NAME}
> -	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/.metadata
> ./${MATHLIB_PACKAGE_NAME}
>  	zip -9 -y -r -q ${DEPLOYDIR}/${MATHLIB_PACKAGE_NAME}.zip
> ./${MATHLIB_PACKAGE_NAME}
>  	rm -r ./${MATHLIB_PACKAGE_NAME}
>  }
> --
> 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

