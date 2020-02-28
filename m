Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.1513.1582926838881599161
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Feb 2020 13:53:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=J+PcY8q3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: m-radhakrishnan2@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SLrv3D033526;
	Fri, 28 Feb 2020 15:53:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582926837;
	bh=OZR7ladbYJ6R62XQ0DZo8EsiMRnsKOQW9narmR1eXpQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=J+PcY8q3R5wk4Buovmyb9l16ygYsdyOkvaFqwaxk9z7fHmpOpHiFe4X0XpqLAijoZ
	 jDdmY6peHLvON9ttmWvsz7uIa1gGTkibnrGfPds3bG17OsoIwoPQu/c1rUSW8qSPif
	 6j6o0QUo0H0Fp+BftAhPyPfeKC5dcYDmwQvbnW48=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01SLrvhG071469;
	Fri, 28 Feb 2020 15:53:57 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 28
 Feb 2020 15:53:57 -0600
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
 DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
 15.01.1847.007; Fri, 28 Feb 2020 15:53:57 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [thud/master][PATCH] ti-cgt-arm: Update to 18.12.5
Thread-Topic: [meta-ti] [thud/master][PATCH] ti-cgt-arm: Update to 18.12.5
Thread-Index: AQHV7lqJ4eUsBkEg00KJRCLJmJJhDKgxJfMw
Date: Fri, 28 Feb 2020 21:53:57 +0000
Message-ID: <8fe56a187f414806ae85f96e6897bb96@ti.com>
References: <20200228140556.27387-1-m-radhakrishnan2@ti.com>
 <20200228171429.GF2466@beryl>
In-Reply-To: <20200228171429.GF2466@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.118.69]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It was the version number update which caused the checksum to change.
Sent the v2 patch with corrected msg commit.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, February 28, 2020 12:14 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org; meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [thud/master][PATCH] ti-cgt-arm: Update to 18.12.5

On Fri, Feb 28, 2020 at 09:05:56AM -0500, Mahesh Radhakrishnan via Lists.Y=
octoproject.Org wrote:
> The License checksum has changed, but the license itself has not changed

Would be nice to mention why the checksum has changed. Year update?


> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  .../{ti-cgt-arm_18.12.1.bb =3D> ti-cgt-arm_18.12.5.bb}        | 6 +++--=
-
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename recipes-ti/devtools/{ti-cgt-arm_18.12.1.bb =3D> ti-cgt-arm_18.12=
.5.bb} (81%)
>=20
> diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb b/recipes-ti/devt=
ools/ti-cgt-arm_18.12.5.bb
> similarity index 81%
> rename from recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
> rename to recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
> index eecde58f..9e651819 100644
> --- a/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
> +++ b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "TI ARM Code Generation Tools"
>  HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/TICodegenerati=
onTools/download.htm"
>  LICENSE =3D "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Claus=
e & BSL-1.0 & Hewlett-Packard & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clau=
se & PD & BSD-4-Clause"
>  
> -LIC_FILES_CHKSUM =3D "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=3Dab7a=
61241e90fcd144a756d88294cf30"
> +LIC_FILES_CHKSUM =3D "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=3D7963=
1eb21b2e5b7190cd3ff1dfd41108"
>  
>  require recipes-ti/includes/ti-unpack.inc
>  require recipes-ti/includes/ti-staging.inc
> @@ -27,8 +27,8 @@ do_install() {
>      cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
>  }
>  
> -SRC_URI[cgt_arm_installer.md5sum] =3D "af2378cf8d5d6f200ef3329f5a065529=
"
> -SRC_URI[cgt_arm_installer.sha256sum] =3D "d90ae2360cd5b22912715ae7898d9=
9352da1b97fd655f9a55d0d19a2a46bab0e"
> +SRC_URI[cgt_arm_installer.md5sum] =3D "e9e668332cf86c965b4da9d1d488426b=
"
> +SRC_URI[cgt_arm_installer.sha256sum] =3D "da976143128c619a278cb4214a429=
5c409d100f9e65ad2f4d0d1039db7cf98f4"
>  
>  BINFILE_NAME =3D "cgt_arm_installer"
>  
> --=20
> 2.17.1
>=20

>=20

