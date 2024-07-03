Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3CCC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 09:07:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.46195.1719997655499914847
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jul 2024 02:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=o9rmbtLS;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: r-ravikumar@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46397Wse016571;
	Wed, 3 Jul 2024 04:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719997652;
	bh=nhBhiCIhJiJW+2g9ls9KRWplkFResFUxdJEPGgDcvGE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=o9rmbtLSAliHorgGI4Sinquft+a9cwEBxkLU2sYTz6sXqznzg8LnDdZOvpgaDjVRH
	 We+BKBVOdSR9SeCMJDluu1trIoq/yioyKaItjvgVMraAjWAz67Xahb0RFUZG7ruP4Q
	 avRxO8SOJFad6Vsl5SEOrbXzKc//tCXAZNsX2Uk0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46397WdD025938
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Jul 2024 04:07:32 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 3
 Jul 2024 04:07:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 3 Jul 2024 04:07:31 -0500
Received: from [10.24.69.154] (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46397Rp1059446;
	Wed, 3 Jul 2024 04:07:28 -0500
Message-ID: <da35c0d3-a0e5-4cbe-a758-183f316194c1@ti.com>
Date: Wed, 3 Jul 2024 14:37:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH 2/3] conf: machine: am68-sk: Pick
 overlays for IMX219 and FPD-Link
To: Vaishnav Achath <vaishnav.a@ti.com>, <reatmon@ti.com>, <praneeth@ti.com>,
        <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <a-limaye@ti.com>, <m-chawdhry@ti.com>,
        <j-luthra@ti.com>
References: <20240627083431.1096889-1-vaishnav.a@ti.com>
 <20240627083431.1096889-3-vaishnav.a@ti.com>
Content-Language: en-US
From: Rahul T R <r-ravikumar@ti.com>
In-Reply-To: <20240627083431.1096889-3-vaishnav.a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jul 2024 09:07:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17818


On 27/06/24 14:04, Vaishnav Achath wrote:
> J721E SK and AM68 SK have similar connectivity for CSI2 RPi
> connector and the same overlays can be reused, thus pick the
> J721E SK CSI2 IMX219 and fusion overlays for AM68 SK also.
>
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am68-sk.conf | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-ti-bsp/conf/machine/am68-sk.conf b/meta-ti-bsp/conf/machine/am68-sk.conf
> index 00b81b77..894c4e87 100644
> --- a/meta-ti-bsp/conf/machine/am68-sk.conf
> +++ b/meta-ti-bsp/conf/machine/am68-sk.conf
> @@ -11,6 +11,8 @@ KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am68-sk \
>       ti/k3-fpdlink \
>       ti/k3-v3link \
> +    ti/k3-j721e-sk-csi2-dual-imx219 \
> +    ti/k3-j721e-sk-fpdlink-fusion \
>   "
>   
Reviewed-by: Rahul T R <r-ravikumar@ti.com>
>   KERNEL_DEVICETREE = " \

