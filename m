Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.88.1614193081706983386
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Feb 2021 10:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gCbQ0tfm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: g-tammana@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11OIvwfO044698;
	Wed, 24 Feb 2021 12:57:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614193078;
	bh=4K+++lXBGoEcKPrXY7MWvDk+l21uxFJIVEX+jSh1zYE=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=gCbQ0tfmzX46yJGQVfNgggpHq9ipoCjLKDOv6POj+Vaa7HhXrfBUgIBTGvT4pxNSg
	 z03Gmf88+zZpln09kMai6S8hmsKxGDu1mS0h30vjVHAWxob5ipwCeJITv9IcSIZ4CA
	 wniJklZN0FRyxU12daDMtdido0uj8UIL9B3/Abmg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11OIvwBN011624
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Feb 2021 12:57:58 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 24
 Feb 2021 12:57:57 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
 DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
 15.01.1979.003; Wed, 24 Feb 2021 12:57:57 -0600
From: "Gowtham Tammana" <g-tammana@ti.com>
To: Zan Dobersek <zan@falconsigh.net>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle arm-poky-linux-gnueabi compiler prefix
Thread-Topic: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle
 arm-poky-linux-gnueabi compiler prefix
Thread-Index: AQHXCoai2I6F1ufEfkG0ISNF1M0l96pnqD4A
Date: Wed, 24 Feb 2021 18:57:57 +0000
Message-ID: <3c3a7b165e474569a0ce474f2c5e7635@ti.com>
References: <20210224082509.14163-1-zan@falconsigh.net>
In-Reply-To: <20210224082509.14163-1-zan@falconsigh.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.149.103]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On
>Behalf Of Zan Dobersek
>Sent: Wednesday, February 24, 2021 2:25 AM
>To: meta-ti@lists.yoctoproject.org
>Subject: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle arm-
>poky-linux-gnueabi compiler prefix
>
>The additional patch for ti-sgx-ddk-km remaps the arm-oe-linux-gnueabi
>prefix
>to the arm-linux-gnueabihf preferred target. Same should be done for the
>arm-poky-linux-gnueabi prefix.

This looks ok. Btw what layer is being used when using this toolchain.

Gowtham

>Signed-off-by: Zan Dobersek <zan@falconsigh.net>
>---
> ...1-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
>OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-
>drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-o-
>gnueabi.patch
>index 071ce0ca..15105eac 100644
>--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
>OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
>OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
>@@ -17,7 +17,7 @@ index dead2f9..2ba3e5e 100644
>    ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
>     $(1)_compiler_preferred_target :=3D aarch64-linux-gnu
>    endif
>-+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-
>gnueabi,$$($(1)_compiler_preferred_target)),)
>++  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-
>gnueabi,$$($(1)_compiler_preferred_target)),)
> +   $(1)_compiler_preferred_target :=3D arm-linux-gnueabihf
> +  endif
>    ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-
>redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
>--
>2.30.0

