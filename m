Return-Path: <gadiyar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7B9ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 19:37:27 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.41637.1661542643588387987
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Aug 2022 12:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FiIJ+84N;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: gadiyar@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27QJbMPG120543;
	Fri, 26 Aug 2022 14:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661542642;
	bh=sAMUnc2epwTMJOFvtpUJQFW2TFvcy4Nrxc2IlSawe4c=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=FiIJ+84NMppT0dzTRjZv6SnST8jjA7G8TtJ3T4xqh+9D2LQjr0a4Dcz9+7wBxbtZi
	 NLSZj7D+9k91dSYZ3Ptq0S9s9TNCFmagf+7PFKbfpOK1YiZq1kwitHBps3ZRe1QYuY
	 F57fHNAUxRgZur81lqp+ms+NF4o12Gpz5lWWfGqA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27QJbMOB012021
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Aug 2022 14:37:22 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 26
 Aug 2022 14:37:21 -0500
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2507.006; Fri, 26 Aug 2022 14:37:21 -0500
From: "Gadiyar, Anand" <gadiyar@ti.com>
To: "Davis, Andrew" <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
Subject: RE: [meta-ti][dunfell][PATCH 2/2] optee-os: Lower log level for AM62x
Thread-Topic: [meta-ti][dunfell][PATCH 2/2] optee-os: Lower log level for
 AM62x
Thread-Index: AQHYuYBgnvwvNZ+SQki4U93vU3Bh5K3BkzOg
Date: Fri, 26 Aug 2022 19:37:21 +0000
Message-ID: <b903bf1f9fea4d1dad0b753ec1ce3fc0@ti.com>
References: <20220826191641.31116-1-afd@ti.com>
 <20220826191641.31116-2-afd@ti.com>
In-Reply-To: <20220826191641.31116-2-afd@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.23.90]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Aug 2022 19:37:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14971

> From: Davis, Andrew <afd@ti.com>
>=20
> During resume from low power mode suspend OP-TEE prints some messages
> on the UART. It seems this UART is not powered at this point in the
> sequence breaking suspend/resume. We should track down the exact
> prints and quiet them. Until we get that fix upstream, lets lower
> the log level for this platform to unblock the LPM work.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>

Acked-by: Anand Gadiyar <gadiyar@ti.com>


> ---
>  recipes-security/optee/optee-os_%.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-
> security/optee/optee-os_%.bbappend
> index 4081b324..3cda8559 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -6,7 +6,7 @@ DEPENDS_append_ti-soc =3D " python3-cryptography-native"
>=20
>  EXTRA_OEMAKE_append_k3 =3D "${@ 'CFG_CONSOLE_UART=3D'+
> d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>=20
> -EXTRA_OEMAKE_append_am62xx-evm =3D " CFG_WITH_SOFTWARE_PRNG=3Dy"
> +EXTRA_OEMAKE_append_am62xx-evm =3D " CFG_WITH_SOFTWARE_PRNG=3Dy CFG_TEE_=
CORE_LOG_LEVEL=3D1"
>  EXTRA_OEMAKE_append_j721s2-evm =3D " CFG_WITH_SOFTWARE_PRNG=3Dy"
>  EXTRA_OEMAKE_append_j721s2-hs-evm =3D " CFG_WITH_SOFTWARE_PRNG=3Dy"
>=20
> --
> 2.36.1


