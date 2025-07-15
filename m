Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040D0C83F2D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 13:52:18 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.9200.1752587529738357252
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 06:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ssywPogY;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56FDq4kj2624168;
	Tue, 15 Jul 2025 08:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752587524;
	bh=Spms3UaKrf8NhJlUxhGomnt9WCSY52Uqk/TShRgJ7aY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ssywPogYOYEJjUNuxaLQ783BhaK+194a2naC0TwvKG/f1diw+PgUlynDZ4uMNxT+q
	 OVWKY0vm19kLZ+Ll+jC3+QtOktkNVDMleez4B4su0jsqjY3ZsDIUGLd+or+6v+e9tE
	 mjDib9ZdTnfXjB7kQ5kar3Xi5Y3GK0lu0/uMmJ6w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56FDq3cn2770864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 15 Jul 2025 08:52:04 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 08:52:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 08:52:03 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56FDq3of2995417;
	Tue, 15 Jul 2025 08:52:03 -0500
Message-ID: <40c291ff-c3ee-4d9f-a45a-3affb088cf7e@ti.com>
Date: Tue, 15 Jul 2025 08:52:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] conf: machine: add BeagleBone Green Eco to
 KERNEL_DEVICETREE
To: Miguel Gazquez <miguel.gazquez@bootlin.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <thomas.petazzoni@bootlin.com>, <praneeth@ti.com>,
        <romain.gantois@bootlin.com>, <kory.maincent@bootlin.com>,
        <thomas.bonnefille@bootlin.com>, <denys@konsulko.com>,
        <robertcnelson@gmail.com>
References: <20250715-bbg_eco_machine-v1-0-6d1581129203@bootlin.com>
 <20250715-bbg_eco_machine-v1-1-6d1581129203@bootlin.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250715-bbg_eco_machine-v1-1-6d1581129203@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Jul 2025 13:52:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18787



On 7/15/2025 6:34 AM, Miguel Gazquez wrote:
> Add am335x-bonegreen-eco devicetree to KERNEL_DEVICETREE in ti33x.inc
> 
> Signed-off-by: Miguel Gazquez <miguel.gazquez@bootlin.com>
> ---
>   meta-ti-bsp/conf/machine/include/ti33x.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
> index 7e9eb48c52737e74750565e639956334162432e2..0a0730eae104371d65548588b3333839857a3a50 100644
> --- a/meta-ti-bsp/conf/machine/include/ti33x.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
> @@ -28,6 +28,7 @@ KERNEL_DEVICETREE = " \
>       ti/omap/am335x-boneblack.dtb \
>       ti/omap/am335x-boneblue.dtb \
>       ti/omap/am335x-bonegreen-wireless.dtb \
> +    ti/omap/am335x-bonegreen-eco.dtb \
>       ti/omap/am335x-bonegreen.dtb \
>       ti/omap/am335x-chiliboard.dtb \
>       ti/omap/am335x-cm-t335.dtb \

NAK.  As has been mentioned several times on this list, we do not update 
KERNEL_DEVICETREE directly.  As we support multiple kernel versions with 
each branch, we cannot have a single KERNEL_DEVICETREE that works for 
all kernel versions.

To that end we setup the KERNEL_DEVICETREE_PREFIX variable that will 
pattern match and change the value for KERNEL_DEVICETREE based on the 
available matching DTBs in the given kernel.  The only kernel version 
that uses KERNEL_DEVICETREE is the mainline (aka latest stable) kernel. 
And the value for this variable is automatically updated to include all 
of the available DTBs in the mainline kernel at the time we update the 
recipe to that version.

As the KERNEL_DEVICETREE_PREFIX already has an entry that will pick up 
this new DTB when it is available, this change is not needed.

Right now this new DTB is only available on linux-next and has not made 
it into any released kernels.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

