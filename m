Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94C5C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 09:08:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.46924.1719997689268899058
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jul 2024 02:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rSWiWws9;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-ravikumar@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4639881Y026467;
	Wed, 3 Jul 2024 04:08:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719997688;
	bh=NudfXU6FqR/f7EdKhlDLzZ4h8oa3wvI2p8Ot3HKj4o0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rSWiWws979fceFx1JJgQoZ/pB8WP/MZJl7tLQ4Yz9SsW7dlRxUWHuby1YYnuVSAqB
	 NAJTLH3TZcJUzxZF9eWV8/YCllB9X3q1pKWPw0kARvJ3W6Jci64Jy/yUhlHC/bc824
	 9bhZlg8uXJ8FkU0ByH8+/nH8DwEQ7/NO850OBTeo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4639886h054143
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Jul 2024 04:08:08 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 3
 Jul 2024 04:08:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 3 Jul 2024 04:08:08 -0500
Received: from [10.24.69.154] (edgeaisrv1.dhcp.ti.com [10.24.69.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4639846S060193;
	Wed, 3 Jul 2024 04:08:05 -0500
Message-ID: <5ca44ba6-5c02-4d3b-be1d-469224bc257f@ti.com>
Date: Wed, 3 Jul 2024 14:38:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH 3/3] conf: machine: am69-sk: Pick
 overlays for IMX219 and FPD-Link
To: Vaishnav Achath <vaishnav.a@ti.com>, <reatmon@ti.com>, <praneeth@ti.com>,
        <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <a-limaye@ti.com>, <m-chawdhry@ti.com>,
        <j-luthra@ti.com>
References: <20240627083431.1096889-1-vaishnav.a@ti.com>
 <20240627083431.1096889-4-vaishnav.a@ti.com>
Content-Language: en-US
From: Rahul T R <r-ravikumar@ti.com>
In-Reply-To: <20240627083431.1096889-4-vaishnav.a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jul 2024 09:08:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17819

On 27/06/24 14:04, Vaishnav Achath wrote:
> J721E SK, AM68 SK and AM69 SK have similar connectivity
> for CSI2 RPi connector and the same overlays can be reused,
> thus pick the J721E SK CSI2 IMX219, fusion overlay and
> AM68 SK V3Link fusion overlay for AM69 SK also.
>
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am69-sk.conf | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf b/meta-ti-bsp/conf/machine/am69-sk.conf
> index 6341a6fa..aff06a02 100644
> --- a/meta-ti-bsp/conf/machine/am69-sk.conf
> +++ b/meta-ti-bsp/conf/machine/am69-sk.conf
> @@ -11,6 +11,9 @@ KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am69-sk \
>       ti/k3-fpdlink \
>       ti/k3-v3link \
> +    ti/k3-am68-sk-v3link-fusion \
> +    ti/k3-j721e-sk-csi2-dual-imx219 \
> +    ti/k3-j721e-sk-fpdlink-fusion \
>   "
Reviewed-by: Rahul T R <r-ravikumar@ti.com>
>   
>   KERNEL_DEVICETREE = " \

