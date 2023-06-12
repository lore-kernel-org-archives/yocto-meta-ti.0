Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72756C88CB2
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 22:44:12 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.395.1686609845023517712
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 15:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mP9Ch1XB;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35CMi2c5101315;
	Mon, 12 Jun 2023 17:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686609842;
	bh=dYWn5hK3LodxFdSsMrajkmEdlBZ4mUnT3GbQMJnPWFs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=mP9Ch1XBXGVMPN0PRjzdPW40bDbgnmp/kL7e+F0BAouR+f5s3PvcQVZB4Rumzzfdb
	 9q51dqpCIYNgCzlOMQqBoUWefDjEhIu37+pV8wt0okNcgM/XqN/jFaULmMn5OA/f7n
	 aK1FOZWMsKpKrN40MbxGejz6G0Sca0YxjV7NdvXU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35CMi2Q1036698
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Jun 2023 17:44:02 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Jun 2023 17:44:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Jun 2023 17:44:02 -0500
Received: from [10.247.28.33] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35CMi1aI031421;
	Mon, 12 Jun 2023 17:44:01 -0500
Message-ID: <9206bc8d-3190-ad46-45a4-7d9059caaa07@ti.com>
Date: Mon, 12 Jun 2023 17:44:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-ti][master/kirkstone][PATCH] conf: am335x-evm and
 am437x-evm: bump max_leb_cnt
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, Julien Panis <jpanis@baylibre.com>,
        "Panis,
 Julien" <jpanis@ti.com>
References: <20230611010538.21692-1-reatmon@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230611010538.21692-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Jun 2023 22:44:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16710



On 6/10/2023 8:05 PM, Ryan Eatmon wrote:
> New features added require an increase to max_leb_cnt.

+Julien (Please review)


> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
>   meta-ti-bsp/conf/machine/am437x-evm.conf | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
> index 9301406b..266f1f20 100644
> --- a/meta-ti-bsp/conf/machine/am335x-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
> @@ -23,7 +23,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   # UBI: logical eraseblock size:    126976 bytes
>   # from ubiattach stdout:
>   # UBI device number 0, total 1988 LEBs
> -MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 9900"
> +MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 10300"
>   
>   # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
>   # from dmesg:
> diff --git a/meta-ti-bsp/conf/machine/am437x-evm.conf b/meta-ti-bsp/conf/machine/am437x-evm.conf
> index 98602add..6501a3ef 100644
> --- a/meta-ti-bsp/conf/machine/am437x-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am437x-evm.conf
> @@ -21,7 +21,7 @@ SERIAL_CONSOLES = "115200;ttyS0"
>   # UBI: logical eraseblock size:    253952 bytes
>   # from ubiattach stdout:
>   # UBI device number 0, total 994 LEBs
> -MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 4800"
> +MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 5000"
>   
>   # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
>   # from dmesg:

