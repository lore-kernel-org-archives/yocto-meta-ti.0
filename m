Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB5DC636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 14:33:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.84934.1675780419835126687
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 06:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tRLn68GO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 317EXdxV053838;
	Tue, 7 Feb 2023 08:33:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675780419;
	bh=Ie41fewFWNDTGE9ZYJKlU+mYBUbsGkyxhpmYhI9SwS0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tRLn68GOkY2CW2OE6C9Var42ox1x1EQkz0aUC45fedIjIYlFeIc0Y59jJL+uByPPS
	 zUgAyljLNpPi7MYCMZvDhh+TH0+7r5cKdzgARYE5RmOlS+Ons4sgR/jSX46dKRKsxl
	 P1k/qUQEM86E7xbAfk2JytKoGy0lYcD76BpuTAVE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 317EXdJc045561
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Feb 2023 08:33:39 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Feb 2023 08:33:38 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Feb 2023 08:33:38 -0600
Received: from [10.249.37.35] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 317EXcsc014811;
	Tue, 7 Feb 2023 08:33:38 -0600
Message-ID: <bc216d83-dfba-1b13-5e88-2a704a59f8d0@ti.com>
Date: Tue, 7 Feb 2023 08:33:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: j721s2: Add ehrpwm
 overlay for am68-sk
To: <sinthu.raja@mistralsolutions.com>, <recipes-eatmon@ti.com>,
        <denys@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sinthu Raja <sinthu.raja@ti.com>
References: <20230207134926.3800-1-sinthu.raja@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230207134926.3800-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 14:33:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15733

On 2/7/23 7:49 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The AM68 SK has PWM output pins connected to its RPi headers. Add
> overlay file to enable PWM pins.
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>   conf/machine/j721s2-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
> index 7c120dcc..7e0f1246 100644
> --- a/conf/machine/j721s2-evm.conf
> +++ b/conf/machine/j721s2-evm.conf
> @@ -17,6 +17,7 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am68-sk-bb-csi2-ov5640.dtbo \
>       ti/k3-am68-sk-bb-rpi-cam-imx219.dtbo \
>       ti/k3-am68-sk-fpdlink-fusion.dtbo \
> +    ti/ k3-am68-sk-rpi-hdr-ehrpwm.dtbo \

           ^ extra space? have you tested this patch?

Andrew

>       ti/k3-am68-sk-som-ddr_mem_carveout.dtbo \
>       ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
>       ti/k3-j721e-fpdlink-imx390-cm-0-1.dtbo \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15730): https://lists.yoctoproject.org/g/meta-ti/message/15730
> Mute This Topic: https://lists.yoctoproject.org/mt/96807109/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

