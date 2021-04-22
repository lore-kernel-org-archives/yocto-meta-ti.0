Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.8820.1619073324574146023
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Apr 2021 23:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HQGMsy2t;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13M6ZNXv018010;
	Thu, 22 Apr 2021 01:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619073323;
	bh=9NZhqBY+2R9qfbb+ebak0+NUrHDZbSgaOE57WcOcvfQ=;
	h=Subject:CC:References:To:From:Date:In-Reply-To;
	b=HQGMsy2tXzLoiJxQZHHvPkrauzu7spcFn7lS6bkBwH87ixheJ2MWBpdfS0P+fOQUT
	 IJGPwcgcaBFsZy8JJywnRgXzCgiDJCdDsrN5bKHma/+wq8uX1V4zsuiEKmb7fQW/au
	 Ugby2MBozRKzISHbuvHo28+faGEH0YfkrBHzTPqs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13M6ZNKH096133
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Apr 2021 01:35:23 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 22
 Apr 2021 01:35:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 22 Apr 2021 01:35:22 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13M6ZMse085771;
	Thu, 22 Apr 2021 01:35:22 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH 4/4] uio-module-drv: Build fix for linux kernel 5.10
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Suman Anna <s-anna@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Nishanth Menon
	<nm@ti.com>
References: <20210421205326.22047-1-praneeth@ti.com>
 <1677FADB0573C7FC.32615@lists.yoctoproject.org>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <467a5eff-39bf-f00a-4043-66f915e58063@ti.com>
Date: Thu, 22 Apr 2021 01:35:22 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1677FADB0573C7FC.32615@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/21/2021 3:53 PM, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> This update contains build fix for linux kernel 5.10
> * uio-module-drv: Replace ioremap_nocache with ioremap
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   recipes-bsp/uio-module-drv/uio-module-drv.inc |  7 +++-
>   ...Replace-ioremap_nocache-with-ioremap.patch | 35 +++++++++++++++++++
>   2 files changed, 41 insertions(+), 1 deletion(-)
>   create mode 100644 recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch
> 
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv.inc b/recipes-bsp/uio-module-drv/uio-module-drv.inc
> index f483010e..ab1beb9f 100644
> --- a/recipes-bsp/uio-module-drv/uio-module-drv.inc
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv.inc
> @@ -1,3 +1,5 @@
> +FILESEXTRAPATHS_prepend:= "${THISDIR}/${PN}:"
> +
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2b7c96eb2aed7b0f6f922214dbde9016"
>   
> @@ -9,7 +11,10 @@ PV = "2.2.1.0+git${SRCPV}"
>   
>   UIO_MODULE_DRV_GIT_URI = "git://git.ti.com/keystone-linux/uio-module-drv.git"
>   UIO_MODULE_DRV_GIT_PROTOCOL = "git"
> -SRC_URI = "${UIO_MODULE_DRV_GIT_URI};protocol=${UIO_MODULE_DRV_GIT_PROTOCOL};branch=${BRANCH}"
> +SRC_URI = " \
> +	${UIO_MODULE_DRV_GIT_URI};protocol=${UIO_MODULE_DRV_GIT_PROTOCOL};branch=${BRANCH} \
> +	file://0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch \
> +"

uio-module-drv.inc doesnt look like a right place. Will send v2 only for 
this patch.

>   
>   SRCREV = "${UIO_MODULE_DRV_SRCREV}"
>   
> diff --git a/recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch b/recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch
> new file mode 100644
> index 00000000..955ef558
> --- /dev/null
> +++ b/recipes-bsp/uio-module-drv/uio-module-drv/0001-uio-module-drv-Replace-ioremap_nocache-with-ioremap.patch
> @@ -0,0 +1,35 @@
> +From b5c4036dac06817bffd0be21c5fa1b7f75f74e4b Mon Sep 17 00:00:00 2001
> +From: Suman Anna <s-anna@ti.com>
> +Date: Mon, 19 Apr 2021 13:15:51 -0500
> +Subject: [PATCH] uio-module-drv: Replace ioremap_nocache with ioremap
> +
> +The ioremap_nocache is the same as the regular ioremap and its
> +definition has been dropped from the Linux kernel v5.6 onwards in
> +commit 4bdc0d676a64 ("remove ioremap_nocache and devm_ioremap_nocache")
> +[1]. The uio-module-drv module fails to build against these newer
> +kernels, so fix it by simply replacing ioremap_nocache with ioremap.
> +
> +[1]
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4bdc0d676a643140bdf17dbf7eafedee3d496a3c
> +
> +Signed-off-by: Suman Anna <s-anna@ti.com>
> +---
> + uio_module_drv.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/uio_module_drv.c b/uio_module_drv.c
> +index 5a67dd199e21..7cc6005d1f05 100644
> +--- a/uio_module_drv.c
> ++++ b/uio_module_drv.c
> +@@ -240,7 +240,7 @@ static ssize_t  uio_module_drv_transfer(struct file *file, char __user *buf,
> + 		return -EINVAL;
> + 	}
> +
> +-	virt_addr_p = ioremap_nocache(phys_addr, count);
> ++	virt_addr_p = ioremap(phys_addr, count);
> + 	if (!virt_addr_p) {
> + 		dev_err(uio_module_drv->dev, "Mapping of virtual memory failed\n");
> + 		return(-ENOMEM);
> +--
> +2.30.1
> +
> 
> 
> 
> 
> 
