Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6151C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 08:30:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.43000.1670315438008747442
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Dec 2022 00:30:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JYfZeGo1;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-luthra@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B68UamK003383;
	Tue, 6 Dec 2022 02:30:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670315436;
	bh=NmlOCdIxKxolwDirpo2cicJtas4UtC8LFmUMUIJK8Dw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JYfZeGo1T0+o8gegweHJSoQu4EXb8vUG3Ogq94VBtzLc5aQjkFq95XQ/N/ps4+kB3
	 lsfI2rwFvylBoENymFbqdCwptHTt2FwKv7RiKPZWf+QpEmcW9pgivI/aYMDMMpOSuW
	 Xs8zY2wdE1MLBpm7OONEoDauiscuCoLuEZZEa4mU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B68UaDw045610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Dec 2022 02:30:36 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 6
 Dec 2022 02:30:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 6 Dec 2022 02:30:36 -0600
Received: from [172.24.145.60] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B68UXI0040423;
	Tue, 6 Dec 2022 02:30:34 -0600
Message-ID: <56f7dbf8-a257-849e-9a2f-d7b886da2543@ti.com>
Date: Tue, 6 Dec 2022 14:00:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [dunfell][PATCH] conf: machine: am62xx: Add missing overlays for
 AM625 SK
Content-Language: en-US
To: <a-bhatia1@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
CC: Meta-TI List <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Vibhore Vardhan
	<vibhore@ti.com>,
        Judith Mendez <jm@ti.com>
References: <20221205114518.17263-1-a-bhatia1@ti.com>
From: Jai Luthra <j-luthra@ti.com>
In-Reply-To: <20221205114518.17263-1-a-bhatia1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Dec 2022 08:30:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15409

Hi,

Sorry my last reply didn't reach the list, sending it again -

On 05/12/22 17:15, a-bhatia1@ti.com wrote:
> Add the overlay files, over AM625 SK, for the following:
> 
> 1. Technexion OV5640 Camera
> 2. Enhanced Capture (ECAP)
> 3. HDMI Audio Output
> 4. MCAN Transceiver
> 5. Microtips OLDI Panel
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>

For 1 & 3,

Tested-by: Jai Luthra <j-luthra@ti.com>

> ---
>   conf/machine/am62xx-evm.conf | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
> index cbab26dd15c8..3d9e3b903487 100644
> --- a/conf/machine/am62xx-evm.conf
> +++ b/conf/machine/am62xx-evm.conf
> @@ -11,6 +11,11 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am625-skeleton.dtb \
>       ti/k3-am625-sk-lpmdemo.dtb \
>       ti/k3-am625-sk-csi2-ov5640.dtbo \
> +    ti/k3-am625-sk-csi2-tevi-ov5640.dtbo \
> +    ti/k3-am625-sk-ecap-capture.dtbo \
> +    ti/k3-am625-sk-hdmi-audio.dtbo \
> +    ti/k3-am625-sk-mcan.dtbo \
> +    ti/k3-am625-sk-oldi-panel.dtbo \
>   "
>   
>   UBOOT_MACHINE = "am62x_evm_a53_defconfig"

Thanks,
Jai

