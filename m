Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0B7C77B7A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 17:45:25 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2080.1684431915951303324
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 May 2023 10:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YwxXj5SJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34IHjDeJ075026;
	Thu, 18 May 2023 12:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684431913;
	bh=6gpnqqbi/6l6wwAzJyXiRFGK/hPd1OVM3euGNI/ISxw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=YwxXj5SJRhU+EJBteWjCslbfVrozrCD8ee+JH7QLd5M3zT5rt98L5FphFsejHqwgF
	 enXEMllqPSyKy4tmAa20yLriqzDJsayldqGP92B/fIyFn/PTvR/1gq5KINf5jb3C/d
	 Mau0uAsfHvBVmffuYTfUjO12uj3cv1yKJxc5kKF4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34IHjDHi040102
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 May 2023 12:45:13 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 12:45:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 May 2023 12:45:13 -0500
Received: from [10.250.35.184] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34IHjCN6033865;
	Thu, 18 May 2023 12:45:12 -0500
Message-ID: <4b3ecd96-44d1-eeeb-7e58-704d4e041bcc@ti.com>
Date: Thu, 18 May 2023 12:45:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][kirkstone][PATCH v2 2/2] linux-ti-staging: Use vendored
 kernel-devicetree.bbclass
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, "Sapp, Randolph"
	<rs@ti.com>
References: <20230518161519.16296-1-reatmon@ti.com>
 <20230518161519.16296-2-reatmon@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230518161519.16296-2-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 May 2023 17:45:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16561

On 5/18/23 11:15 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> Change over to using the kernel_devicetree_vendor_dtb.bbclass to have
> the DTBs installed into the same vendored subdirectory that is in the
> kernel.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: - Fixed syntax of "1"
>      - Fixed name of custom kernel class to match the other patch.
> 
>   meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> index cdee548f..7c992ac5 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> @@ -3,7 +3,7 @@ SUMMARY = "Linux kernel for TI devices"
>   LICENSE = "GPL-2.0-only"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>   
> -inherit kernel
> +inherit kernel_vendor_dtb
>   
>   require recipes-kernel/linux/setup-defconfig.inc
>   require recipes-kernel/linux/kernel-rdepends.inc
> @@ -18,6 +18,9 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
>   KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
>   		      ${EXTRA_DTC_ARGS}"
>   
> +KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtbs"

Do we want this to be "dtbs" or "dtb"? Debian uses "dtb" which is the
far more common distro today and the one we plan to support in the near
term. I know I used "dtbs" in the U-Boot side patch for this, but I'm
having second thoughts and it's easy to switch it over in U-Boot..

Andrew

> +KERNEL_DTBVENDORED = "1"
> +
>   S = "${WORKDIR}/git"
>   
>   BRANCH = "ti-linux-6.1.y"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16558): https://lists.yoctoproject.org/g/meta-ti/message/16558
> Mute This Topic: https://lists.yoctoproject.org/mt/98994752/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/6695306/3619733/2033773410/xyzzy [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

