Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E88EEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 19:25:57 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.342.1687289149285556592
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 12:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hwgICxxc;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35KJPl4u098640;
	Tue, 20 Jun 2023 14:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687289147;
	bh=Gk/iLNPoajh/DkgoSS8rX4Oh+2I2JBIURhQ17dPGdkk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=hwgICxxciifuXY/2JtXSBLBulibK52o6FH9rbOG5ZphXc5VW1dfWmjictRCVLT2oG
	 O725A5bE7+3Mz9Zd6Qbc5ZC8pxCdtykvDfV6Yu+p9TmZ1x5YQXIKbPc02lllcffS1h
	 /JNxY/U9rSqls7RDsb6k4EgCjFee4sXE/xBw6pWY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35KJPkvR094764
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jun 2023 14:25:47 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Jun 2023 14:25:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 14:25:46 -0500
Received: from [10.247.25.76] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35KJPkb3021627;
	Tue, 20 Jun 2023 14:25:46 -0500
Message-ID: <6cee690d-ccc6-7a5d-671a-9152632d3cab@ti.com>
Date: Tue, 20 Jun 2023 14:25:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: am335x-evm and
 am437x-evm: bump max_leb_cnt
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, Julien Panis <jpanis@baylibre.com>
References: <20230620170932.19093-1-reatmon@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230620170932.19093-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Jun 2023 19:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16747



On 6/20/2023 12:09 PM, Ryan Eatmon wrote:
> New features added require another increase to max_leb_cnt.

Julien,

Please review.


> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
>   meta-ti-bsp/conf/machine/am437x-evm.conf | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
> index 266f1f20..b41ae14a 100644
> --- a/meta-ti-bsp/conf/machine/am335x-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
> @@ -23,7 +23,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   # UBI: logical eraseblock size:    126976 bytes
>   # from ubiattach stdout:
>   # UBI device number 0, total 1988 LEBs
> -MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 10300"
> +MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 10700"
>   
>   # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
>   # from dmesg:
> diff --git a/meta-ti-bsp/conf/machine/am437x-evm.conf b/meta-ti-bsp/conf/machine/am437x-evm.conf
> index 6501a3ef..ca57a8fb 100644
> --- a/meta-ti-bsp/conf/machine/am437x-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am437x-evm.conf
> @@ -21,7 +21,7 @@ SERIAL_CONSOLES = "115200;ttyS0"
>   # UBI: logical eraseblock size:    253952 bytes
>   # from ubiattach stdout:
>   # UBI device number 0, total 994 LEBs
> -MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 5000"
> +MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 5100"
>   
>   # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
>   # from dmesg:

