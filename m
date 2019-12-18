Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.4402.1576627547597842039
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Dec 2019 16:05:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qx9EbBIc;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBI05kIX104642
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2019 18:05:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576627546;
	bh=gNqasFNvqclk3+IQDy8A/ACmM3L4/P42LBTrSOTcx5s=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=qx9EbBIcVysoh40nOmgm1L1pk9RqxLA8lZ9ZvnR6mTMclxKv4mUsvGyGRVcDRzx5+
	 NAgUIUw03i3x4/efQZVERWl2uGi9bSZt2yMXvkb4zX3dLr8X1Gjdj4so+mG/DKxpWR
	 sQLt46v8xsR1m47K+C53yYs29UoBhDTIOGpZsAYM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBI05ktx071444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2019 18:05:46 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 18:05:46 -0600
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
 DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
 15.01.1847.003; Tue, 17 Dec 2019 18:05:46 -0600
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [master/thud/ti2019.05][PATCH v2 2/3] ti-pdk-fetch: bump SRCREV for Processor SDK 6.2
Thread-Topic: [meta-ti] [master/thud/ti2019.05][PATCH v2 2/3] ti-pdk-fetch:
 bump SRCREV for Processor SDK 6.2
Thread-Index: AQHVtQyxMKwAjteRG0uw4sAdYGKCSae/A+GA
Date: Wed, 18 Dec 2019 00:05:46 +0000
Message-ID: <b4a9cf62429142a18222fce05cccc9a8@ti.com>
References: <1576608267-22695-2-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1576608267-22695-2-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.67.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Unable to find revision 7e19ea1c7e6e2d5a14e73d980ced0964e848c585 in branch =
master even from upstream


> -----Original Message-----
> From: meta-ti@lists.yoctoproject.org [mailto:meta-ti@lists.yoctoproject.o=
rg]
> On Behalf Of Jacob Stiffler via Lists.Yoctoproject.Org
> Sent: Tuesday, December 17, 2019 1:44 PM
> To: meta-ti@lists.yoctoproject.org
> Cc: meta-ti@lists.yoctoproject.org
> Subject: [meta-ti] [master/thud/ti2019.05][PATCH v2 2/3] ti-pdk-fetch: bu=
mp
> SRCREV for Processor SDK 6.2
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> v2 changes:
> * Use correct branch: release/PROCESSOR-SDK_06.02.00
>=20
>  classes/ti-pdk-fetch.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass =
index
> e7f8875..ac3b154 100644
> --- a/classes/ti-pdk-fetch.bbclass
> +++ b/classes/ti-pdk-fetch.bbclass
> @@ -1,9 +1,9 @@
>  TI_PDK_GIT_URI ?=3D "git://git.ti.com/processor-sdk/pdk.git"
> -TI_PDK_GIT_BRANCH ?=3D "master"
> +TI_PDK_GIT_BRANCH ?=3D "release/PROCESSOR-SDK_06.02.00"
>  TI_PDK_GIT_PROTOCOL ?=3D "git"
> -TI_PDK_SRCREV ?=3D "69b8b56273fe0c9085fb92d9bfcb7367b724c8af"
> +TI_PDK_SRCREV ?=3D "7e19ea1c7e6e2d5a14e73d980ced0964e848c585"
>=20
> -TI_PDK_VERSION ?=3D "2019.11.0"
> +TI_PDK_VERSION ?=3D "2019.12.0"
>=20
>  PV =3D "${TI_PDK_VERSION}"
>=20
> --
> 2.7.4

