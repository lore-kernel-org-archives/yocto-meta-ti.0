Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5AC2C30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 09:06:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.46183.1719997610891545166
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jul 2024 02:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lT/gZuxp;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-ravikumar@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46396mg7089428;
	Wed, 3 Jul 2024 04:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719997608;
	bh=JdXDXWoO1mIYsE68oVSOzc5vmaSW+WnpN8yBuYTFqmk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lT/gZuxpWNOmlgYMxyrJao89aBHfxgsslJ9Od2ViqyXAj9H/EQCc0re45mqEIzMb9
	 8TK0h9XbH3xiU2Nmc8YbEoL72VPxg7V4NTdsBCkNJYqnn2zHBSf6gvc/oPrVXWhzYi
	 wuC8v1XXkDbbPVUkBO0VpnL1Q8ub9j1Zm7t1f7+0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46396mJH002951
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Jul 2024 04:06:48 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 3
 Jul 2024 04:06:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 3 Jul 2024 04:06:48 -0500
Received: from [10.24.69.154] (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46396iej058622;
	Wed, 3 Jul 2024 04:06:45 -0500
Message-ID: <273292d5-368a-4994-8a4b-7b5c74d4b6bf@ti.com>
Date: Wed, 3 Jul 2024 14:36:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH 1/3] conf: machine: j784s4-evm: Pick
 overlays for CSI2 and FPD-Link
To: Vaishnav Achath <vaishnav.a@ti.com>, <reatmon@ti.com>, <praneeth@ti.com>,
        <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <a-limaye@ti.com>, <m-chawdhry@ti.com>,
        <j-luthra@ti.com>
References: <20240627083431.1096889-1-vaishnav.a@ti.com>
 <20240627083431.1096889-2-vaishnav.a@ti.com>
Content-Language: en-US
From: Rahul T R <r-ravikumar@ti.com>
In-Reply-To: <20240627083431.1096889-2-vaishnav.a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jul 2024 09:06:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17817

On 27/06/24 14:04, Vaishnav Achath wrote:
> J784S4 and J721S2 EVM has similar connectivity for MIPI CSI2
> connector and the same overlays can be reused, thus pick the
> J721S2 CSI2 OV5640 and J721S2 EVM fusion overlays for J784S4.
>
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> ---
>   meta-ti-bsp/conf/machine/j784s4-evm.conf | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> index e451bf47..770701f7 100644
> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> @@ -11,6 +11,8 @@ KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-j784s4 \
>       ti/k3-fpdlink \
>       ti/k3-j7200-evm-mcspi-loopback \
> +    ti/k3-j721s2-evm-csi2-ov5640 \
> +    ti/k3-j721s2-evm-fusion \

Reviewed-by: Rahul T R <r-ravikumar@ti.com>

>       ti/k3-am69-sk \
>       ti/k3-v3link \
>   "

