Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1620.1576602961628081877
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Dec 2019 09:16:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ftKLLCOL;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2CF35E0126C; Tue, 17 Dec 2019 09:16:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05F5AE00942
	for <meta-ti@yoctoproject.org>; Tue, 17 Dec 2019 09:15:59 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHHFxnd064111
	for <meta-ti@yoctoproject.org>; Tue, 17 Dec 2019 11:15:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576602959;
	bh=HB6WvqH3sfxHY7yv0SptQcsTDp/CfvthNUaxuoswfck=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ftKLLCOLmr8v5j9Y+H4+CtivthNe9L1OapOSlbpoc7hCzWENIYw60u5S4HfinSbeH
	 D2tmyOuIeWDUtIbF0jJEdJqDnDXxNoK2NePEluJFLGbhPkgDEGJMFeOPHF3z9m0aOQ
	 bKgJe88QB9Thg9RE6Z9vpjPMW2cRl2jp5suqb7TI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHHFxe1119039
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 17 Dec 2019 11:15:59 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 11:15:59 -0600
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
 DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
 15.01.1847.003; Tue, 17 Dec 2019 11:15:59 -0600
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Saulnier, Nick" <nsaulnier@ti.com>,
        "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
CC: "Stiffler, Jacob" <j-stiffler@ti.com>
Subject: Re: [meta-ti][PATCH v3] pru-icss_git.bb: Update Manifest and PSSP commits
Thread-Topic: [meta-ti][PATCH v3] pru-icss_git.bb: Update Manifest and PSSP
 commits
Thread-Index: AQHVtJ+wvyGmf81sa02HD0iGaZe3u6e+kgpg
Date: Tue, 17 Dec 2019 17:15:59 +0000
Message-ID: <d7df7394110f48f9af43afb22b279671@ti.com>
References: <20191217060232.18195-1-nsaulnier@ti.com>
In-Reply-To: <20191217060232.18195-1-nsaulnier@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.67.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What's the change between v2 and v3? Please don't forget to mention changes=
 between patch revisions.

> -----Original Message-----
> From: Saulnier, Nick
> Sent: Tuesday, December 17, 2019 1:03 AM
> To: meta-ti@yoctoproject.org
> Cc: Saulnier, Nick; Dmytriyenko, Denys; Stiffler, Jacob
> Subject: [meta-ti][PATCH v3] pru-icss_git.bb: Update Manifest and PSSP
> commits
>=20
> - Updated the Software Manifest from 5.0 -> 6.0 to account for new proces=
sors,
> etc.
>=20
> - Updated to PRU Software Support Package v5.6.0
> 	updated manifest
> 	added PRU Getting Started Labs
> 	improved several examples
>=20
> Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
> ---
>  recipes-bsp/pru/pru-icss_git.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_g=
it.bb
> index 6508b6c2bcf3..88d28f37cc5b 100644
> --- a/recipes-bsp/pru/pru-icss_git.bb
> +++ b/recipes-bsp/pru/pru-icss_git.bb
> @@ -2,15 +2,15 @@ DESCRIPTION =3D "Programmable Real-time Unit Software
> Package"
>  HOMEPAGE =3D "http://processors.wiki.ti.com/index.php/PRU-ICSS"
>  LICENSE =3D "BSD-3-Clause & GPL-2.0 & PD"
>=20
> -LIC_FILES_CHKSUM =3D "file://PRU-Package-v5.0-
> Manifest.html;md5=3Da86a37c8b6396ad0ad6ae752f1aa8fcc"
> +LIC_FILES_CHKSUM =3D "file://PRU-Package-v6.0-
> Manifest.html;md5=3Dea854230556f47609efdaedca174b44c"
>=20
>  inherit update-alternatives
>=20
>  BRANCH =3D "master"
>  SRC_URI =3D "git://git.ti.com/pru-software-support-package/pru-software-
> support-package.git;protocol=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "1ff0393b3b9454fe9c58399c1b5d2db511e8049c"
> +SRCREV =3D "ff252a5e174f1b6aa42931744939f20d25d8e070"
>=20
> -PV =3D "5.5.0"
> +PV =3D "5.6.0"
>  PR =3D "r1"
>=20
>  require recipes-ti/includes/ti-paths.inc
> @@ -33,6 +33,7 @@ DEPENDS =3D "ti-cgt-pru-native"
>  S =3D "${WORKDIR}/git"
>=20
>  export PRU_CGT =3D "${TI_CGT_PRU_INSTALL_DIR}"
> +export PRU_SSP =3D "${S}"
>=20
>  SUBDIRS =3D "examples pru_cape/pru_fw lib/src labs"
>=20
> --
> 2.17.1

