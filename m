Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.4416.1576627602041857173
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Dec 2019 16:06:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=e7GN54/6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-stiffler@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBI06fUM000573
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2019 18:06:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576627601;
	bh=4VbVciN1RPmBpA4bk4MEguXnSzbMgKm5QAuYpNJBkI0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=e7GN54/6hXPlKgfRyLkqqxOTCi2RGmfGxI+e3P5FrSkkgYAmub26Z6xULhont/7jF
	 EH9DmZ0oHcME9kQFQZIM6WMsKqZAcuSo0FoIig8CJeTOL2I9F5KTjuzfCIVgOAqdp9
	 289//kEk18yK3bJRjeVo9TLwAnWBXMlAhVpCJ4V0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBI06fCD072712
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2019 18:06:41 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 18:06:40 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
 DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
 15.01.1847.003; Tue, 17 Dec 2019 18:06:40 -0600
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [master/thud/ti2019.05][PATCH v2 2/3] ti-pdk-fetch: bump SRCREV for Processor SDK 6.2
Thread-Topic: [meta-ti] [master/thud/ti2019.05][PATCH v2 2/3] ti-pdk-fetch:
 bump SRCREV for Processor SDK 6.2
Thread-Index: AQHVtQytigLf30d0aUaTcEYOQ9g5oqe/aEYA//+bmCA=
Date: Wed, 18 Dec 2019 00:06:40 +0000
Message-ID: <c8079105153c42a2b09592210f9081db@ti.com>
References: <1576608267-22695-2-git-send-email-j-stiffler@ti.com>
 <b4a9cf62429142a18222fce05cccc9a8@ti.com>
In-Reply-To: <b4a9cf62429142a18222fce05cccc9a8@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.87.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yeah, I sent out a v2 a few hours ago to try to preempt this.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, December 17, 2019 7:06 PM
To: Stiffler, Jacob; meta-ti@lists.yoctoproject.org
Subject: RE: [meta-ti] [master/thud/ti2019.05][PATCH v2 2/3] ti-pdk-fetch: =
bump SRCREV for Processor SDK 6.2

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

