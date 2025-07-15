Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C1DC83F2E
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 13:52:18 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.9010.1752587529417685420
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 06:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WtpoM6VQ;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56FDq5CO023668;
	Tue, 15 Jul 2025 08:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752587525;
	bh=khYT+Da7wSkbxiCXussE4L4B8CFZzL5NiJsf3jAx19s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WtpoM6VQJGBNKnSHRhK/91cI1qsNlN3WtOKWIKavg1UhxITlXeW4MTHyznDHRMIDx
	 8kAvsx03iFvKyG6RGDT3BFppYszpzoVTLrV3pFQvj6xQWYnsxqeOBz3IpvDnzSA6lJ
	 me64R5jkWdXk0Uo06r/lFnwP4QpJT7uA0C1CVn3g=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56FDq5wA1297414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 15 Jul 2025 08:52:05 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 08:52:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 08:52:05 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56FDq3og2995417;
	Tue, 15 Jul 2025 08:52:05 -0500
Message-ID: <ce36339b-578e-47c2-a02a-73f2099e2e9d@ti.com>
Date: Tue, 15 Jul 2025 08:52:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] conf: machine: add new BeagleBone Green Eco machine
To: Miguel Gazquez <miguel.gazquez@bootlin.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <thomas.petazzoni@bootlin.com>, <praneeth@ti.com>,
        <romain.gantois@bootlin.com>, <kory.maincent@bootlin.com>,
        <thomas.bonnefille@bootlin.com>, <denys@konsulko.com>,
        <robertcnelson@gmail.com>
References: <20250715-bbg_eco_machine-v1-0-6d1581129203@bootlin.com>
 <20250715-bbg_eco_machine-v1-2-6d1581129203@bootlin.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250715-bbg_eco_machine-v1-2-6d1581129203@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Jul 2025 13:52:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18786



On 7/15/2025 6:34 AM, Miguel Gazquez wrote:
> Add a new machine file for the BeagleBone Green Eco board.
> `ti33x.inc` takes care of much of the configuration, so not much is
> needed in this file.
> 
> Signed-off-by: Miguel Gazquez <miguel.gazquez@bootlin.com>
> ---
>   meta-ti-bsp/conf/machine/beaglebonegreen-eco-ti.conf | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/beaglebonegreen-eco-ti.conf b/meta-ti-bsp/conf/machine/beaglebonegreen-eco-ti.conf
> new file mode 100644
> index 0000000000000000000000000000000000000000..c0756b53690a492c44c1289f045587d91264ce05
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/beaglebonegreen-eco-ti.conf
> @@ -0,0 +1,9 @@
> +#@TYPE: Machine
> +#@NAME: BeagleBone Green Eco
> +#@DESCRIPTION: Machine configuration for the BeagleBone Green Eco board
> +
> +require conf/machine/include/ti33x.inc
> +
> +SERIAL_CONSOLES = "115200;ttyS0"
> +
> +KERNEL_DEVICETREE = "ti/omap/am335x-bonegreen-eco.dtb"

I'm not sure this machine is needed since the am335x-evm machine covers 
this (and all beaglebone machines).  We tend to not like targeted 
special machines like this as it increases the amount of builds/tests 
that we would need to do to ensure that nothing breaks.

Will the am335x-evm machine not work for you?


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

