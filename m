Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.171.1619105070045627262
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 08:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=k/p9NfWx;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: g-tammana@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13MFOSnG102043;
	Thu, 22 Apr 2021 10:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619105068;
	bh=gzAMblJJEOybPrz21pNAJgd3iIFuQwPEpoA8N8sXZrQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=k/p9NfWxAyh6CSiXEEhqabAmAqkCs9U723etmp3cHzT+Agd4tfChw/TuAG/9lZM9V
	 NC/YpPze9TLbdX1C7/SsVdUa8LXHD0LtkXaFkySjcEGlMlfxZ3bkuDhFi1b3cWFLhe
	 yDuS0n1nIFgzdKAlwDVeB67kk2FI5Kr+ONP/THBY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13MFOSq6023440
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Apr 2021 10:24:28 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 22
 Apr 2021 10:24:28 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
 DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
 15.01.2176.009; Thu, 22 Apr 2021 10:24:28 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        "Vutla, Lokesh"
	<lokeshvutla@ti.com>, "Anna, Suman" <s-anna@ti.com>,
        "Siraswar, Yogesh"
	<yogeshs@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [dunfell/master PATCH v2] uio-module-drv: Build fix for linux kernel 5.10
Thread-Topic: [dunfell/master PATCH v2] uio-module-drv: Build fix for linux
 kernel 5.10
Thread-Index: AQHXN0H2pgDxeIkkg0SkqJGkGSRUi6rAqJXQ
Date: Thu, 22 Apr 2021 15:24:28 +0000
Message-ID: <c9c3235e3ec64bdb8452ce07508b3989@ti.com>
References: <20210422063722.19732-1-praneeth@ti.com>
In-Reply-To: <20210422063722.19732-1-praneeth@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Bajjuri, Praneeth
>Sent: Thursday, April 22, 2021 1:37 AM
>To: Bajjuri, Praneeth <praneeth@ti.com>
>Cc: Denys Dmytriyenko <denys@konsulko.com>; Vutla, Lokesh
><lokeshvutla@ti.com>; Tammana, Gowtham <g-tammana@ti.com>; Anna, Suman <s-
>anna@ti.com>; Siraswar, Yogesh <yogeshs@ti.com>; meta-
>ti@lists.yoctoproject.org
>Subject: [dunfell/master PATCH v2] uio-module-drv: Build fix for linux
>kernel 5.10
>
>From: Praneeth Bajjuri <praneeth@ti.com>
>
>This update contains build fix for linux kernel 5.10
>* uio-module-drv: Replace ioremap_nocache with ioremap
>
>Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>

Reviewed-by: Gowtham Tammana <g-tammana@ti.com>

>---
> ...Replace-ioremap_nocache-with-ioremap.patch | 35 +++++++++++++++++++
> .../uio-module-drv/uio-module-drv_git.bb      |  4 +++
> 2 files changed, 39 insertions(+)
> create mode 100644 recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-
>module-drv-Replace-ioremap_nocache-with-ioremap.patch
>
>diff --git a/recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-
>drv-Replace-ioremap_nocache-with-ioremap.patch b/recipes-bsp/uio-module-
>drv/uio-module-drv/0001-uio-module-drv-Replace-ioremap_nocache-with-
>ioremap.patch
>new file mode 100644
>index 00000000..955ef558
>--- /dev/null
>+++ b/recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-drv-
>Replace-ioremap_nocache-with-ioremap.patch
>@@ -0,0 +1,35 @@
>+From b5c4036dac06817bffd0be21c5fa1b7f75f74e4b Mon Sep 17 00:00:00 2001
>+From: Suman Anna <s-anna@ti.com>
>+Date: Mon, 19 Apr 2021 13:15:51 -0500
>+Subject: [PATCH] uio-module-drv: Replace ioremap_nocache with ioremap
>+
>+The ioremap_nocache is the same as the regular ioremap and its
>+definition has been dropped from the Linux kernel v5.6 onwards in
>+commit 4bdc0d676a64 ("remove ioremap_nocache and devm_ioremap_nocache")
>+[1]. The uio-module-drv module fails to build against these newer
>+kernels, so fix it by simply replacing ioremap_nocache with ioremap.
>+
>+[1]
>+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit
>/?id=3D4bdc0d676a643140bdf17dbf7eafedee3d496a3c
>+
>+Signed-off-by: Suman Anna <s-anna@ti.com>
>+---
>+ uio_module_drv.c | 2 +-
>+ 1 file changed, 1 insertion(+), 1 deletion(-)
>+
>+diff --git a/uio_module_drv.c b/uio_module_drv.c
>+index 5a67dd199e21..7cc6005d1f05 100644
>+--- a/uio_module_drv.c
>++++ b/uio_module_drv.c
>+@@ -240,7 +240,7 @@ static ssize_t  uio_module_drv_transfer(struct file
>*file, char __user *buf,
>+ 		return -EINVAL;
>+ 	}
>+
>+-	virt_addr_p =3D ioremap_nocache(phys_addr, count);
>++	virt_addr_p =3D ioremap(phys_addr, count);
>+ 	if (!virt_addr_p) {
>+ 		dev_err(uio_module_drv->dev, "Mapping of virtual memory
>failed\n");
>+ 		return(-ENOMEM);
>+--
>+2.30.1
>+
>diff --git a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb b/recipes-
>bsp/uio-module-drv/uio-module-drv_git.bb
>index 6ac91875..cb61305f 100644
>--- a/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
>+++ b/recipes-bsp/uio-module-drv/uio-module-drv_git.bb
>@@ -2,6 +2,10 @@ DESCRIPTION =3D "User space IO (UIO) driver for on-chip
>modules"
>
> include uio-module-drv.inc
>
>+FILESEXTRAPATHS_prepend:=3D "${THISDIR}/${PN}:"
>+
>+SRC_URI +=3D "file://0001-uio-module-drv-Replace-ioremap_nocache-with-
>ioremap.patch"
>+
> # This package builds a kernel module, use kernel PR as base and append a
>local
> MACHINE_KERNEL_PR_append =3D "d"
> PR =3D "${MACHINE_KERNEL_PR}"
>--
>2.17.1

