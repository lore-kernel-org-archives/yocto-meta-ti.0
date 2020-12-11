Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.7898.1607698284775749217
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 06:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gV9n7f2p;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id D6C1038C1368
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2020 14:51:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BBEpNXO087947
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2020 08:51:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607698283;
	bh=zEm2pK0VsV0DWfILhvmqXUG+ktu6qoOp3rz7c9b0f6E=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=gV9n7f2p+KlVGPekYTaewqYosM3dEmbiLYAjD5qu/v87q/8hrM5xv9s6SSqZeOuND
	 Tg561XNeVC8P7a3IsxlrNEtHTtEV89m5g4YPISqguSHNvMJQEuJCDWs1V1IQF7OciC
	 xODB0bg/sNg0yWEYb6gbvWFyQMQATwnI/tyJGjmg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BBEpNU8069604
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2020 08:51:23 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Dec 2020 08:51:22 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
 DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
 15.01.1979.003; Fri, 11 Dec 2020 08:51:22 -0600
From: "Gowtham Tammana" <g-tammana@ti.com>
To: "Murphy, Dan" <dmurphy@ti.com>,
        "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Subject: Re: [EXTERNAL] [meta-ti] [dunfell/master] [PATCH] ti-sysbios: upgrade 6.76.03.01 -> 6.76.04.02
Thread-Topic: [EXTERNAL] [meta-ti] [dunfell/master] [PATCH] ti-sysbios:
 upgrade 6.76.03.01 -> 6.76.04.02
Thread-Index: AQHWz8Jj8aTFWxZGIEOFqfNs2pfoJqnx+igA
Date: Fri, 11 Dec 2020 14:51:22 +0000
Message-ID: <bea5488ac8a74c069e2b19f0c1a66599@ti.com>
References: <20201211133436.10566-1-dmurphy@ti.com>
In-Reply-To: <20201211133436.10566-1-dmurphy@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.42.213]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On
>Behalf Of Dan Murphy via lists.yoctoproject.org
>Sent: Friday, December 11, 2020 7:35 AM
>To: meta-ti@yoctoproject.org
>Cc: Murphy, Dan <dmurphy@ti.com>
>Subject: [EXTERNAL] [meta-ti] [dunfell/master] [PATCH] ti-sysbios: upgrade
>6.76.03.01 -> 6.76.04.02
>
>Signed-off-by: Dan Murphy <dmurphy@ti.com>
>---
> .../{ti-sysbios_6.76.03.01.bb =3D> ti-sysbios_6.76.04.02.bb}  | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
> rename recipes-ti/bios/{ti-sysbios_6.76.03.01.bb =3D> ti-
>sysbios_6.76.04.02.bb} (68%)
>
>diff --git a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb b/recipes-ti/bios/ti=
-
>sysbios_6.76.04.02.bb
>similarity index 68%
>rename from recipes-ti/bios/ti-sysbios_6.76.03.01.bb
>rename to recipes-ti/bios/ti-sysbios_6.76.04.02.bb
>index d242510f801e..237b48929739 100644
>--- a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
>+++ b/recipes-ti/bios/ti-sysbios_6.76.04.02.bb
>@@ -1,13 +1,13 @@
> require recipes-ti/bios/ti-sysbios.inc
>
> PE =3D "1"
>-PV =3D "6_76_03_01"
>+PV =3D "6_76_04_02"

PV not needed here as it is already specified in the recipe name.

Thanks,
Gowtham

> PR =3D "r0"
>
> LIC_FILES_CHKSUM =3D
>"file://manifest_bios_${PV}.html;md5=3D5cf40699c51b26d36fc01647c0b27fb1"
>
>-SRC_URI[sysbiosbin.md5sum] =3D "647243209d66d5dd35503b0ec5a84ab9"
>-SRC_URI[sysbiosbin.sha256sum] =3D
>"b762b7f2343d26d367f952488e529046785128005158cc921c3baef08e97116a"
>+SRC_URI[sysbiosbin.md5sum] =3D "9766b12ea6dd4b3a035cdb6be54c5071"
>+SRC_URI[sysbiosbin.sha256sum] =3D
>"d68ca3ba862f8f83a5bf7084af326ffa9fcb64e39c866f98384d87c0ceca29be"
>
> TI_BIN_UNPK_CMDS =3D ""
> TI_BIN_UNPK_ARGS =3D "--mode unattended --prefix ${WORKDIR}"
>--
>2.29.2

