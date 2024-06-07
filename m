Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE80C27C5F
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 18:08:02 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.49362.1717783680354753182
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Jun 2024 11:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=a+xTOB/O;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: u-kumar1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457I7xex121912
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 Jun 2024 13:07:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717783679;
	bh=AsSz3Cb/26dipqBA+eq7cNBi8B0+Q6OVr3w0rQ+KAPI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=a+xTOB/OW70AZAYHnIHNLfY9KSThRmUchXSfA6rhesvlsc8Trn25+2Y4CgkQcXiED
	 SS9/KaE/xJiHmnt0/xv2f8gfb5tF/Jxl2ljU/gpx9Fyzfp6+zLy/9KZDN0kLusHOWd
	 j7HrggkR1fIO61SumVOwyRciZGQ4+O5tv6Vvkn9M=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457I7xe8009666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 Jun 2024 13:07:59 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 13:07:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 13:07:59 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457I7v1h058540;
	Fri, 7 Jun 2024 13:07:58 -0500
Message-ID: <d4706965-c77f-40cc-b853-ffcac700d194@ti.com>
Date: Fri, 7 Jun 2024 23:37:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: add AM68-SK
 machine configuration
To: Aniket Limaye <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <m-chawdhry@ti.com>
References: <20240603125605.3796069-1-a-limaye@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20240603125605.3796069-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Jun 2024 18:08:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17712


On 6/3/2024 6:26 PM, Aniket Limaye wrote:
> As of commit [1] there will be a separate defconfig to build u-boot
> for j721s2-evm and am68-sk.
>
> Hence, introduce new yocto machine configs for am68-sk. This is done
> through a new am68.inc file as the am68-sk platform does not support GP.
> So j721s2-evm.inc is copied to am68.inc and updated accordingly.
>
> [1]: https://source.denx.de/u-boot/u-boot/-/commit/a96be9b8c05ea835d27f7c9bae03279b8bd5dcf2
>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
> [...]
> +OPTEEMACHINE = "k3-j784s4"

j784s4 ?


> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw"

