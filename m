Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A8AC004C0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 15:51:02 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.124594.1698076252568552846
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 08:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qyP6kpzz;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39NFoi7i013724;
	Mon, 23 Oct 2023 10:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698076244;
	bh=1AN4cfqo/SuwTK/QuiX88oHNRIg00HzQAE4rRfRYWQw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qyP6kpzzWV+oY+sIjec9Mj8hhNolDdNv3Gu76Ik0mddcvhg2U68KP6Yj2K0CZmiNC
	 MDj1ZN0buvLGIo70k2fg03NMWlDNvp5NqG/5QAQAe1sazYJTOW49IuHb9NbzBbAENV
	 KBz4Cu7UUPklUa2kI8GfMoYX9q5opXOhDEk+aznM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39NFoigc066571
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Oct 2023 10:50:44 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Oct 2023 10:50:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Oct 2023 10:50:44 -0500
Received: from [10.250.38.120] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39NFohgk043188;
	Mon, 23 Oct 2023 10:50:43 -0500
Message-ID: <190bcd54-29fd-4c2c-a39e-18e7fe42c4bd@ti.com>
Date: Mon, 23 Oct 2023 10:50:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/kirkstone][PATCH 5/5] conf: beagle*: recommend
 essential FW images for Beagle devices
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20231020204458.546852-1-denis@denix.org>
 <20231020204458.546852-5-denis@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231020204458.546852-5-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Oct 2023 15:51:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17166

On 10/20/23 3:44 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Set MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS per platform to list recommended
> essential FW images to be added to rootfs by default.
> 
> Correct beagle-x15 to pull devicetrees and kernel image as well.
> 

Would it be better to have the bb.org kernel pull in `kernel-rdepends.inc` like
the other kernels and get all these RDEPENDS/RRECOMMENDS from that?

Andrew

> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-ti-bsp/conf/machine/beagle-x15.conf      | 2 ++
>   meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 3 +++
>   meta-ti-bsp/conf/machine/beaglebone.conf      | 2 ++
>   meta-ti-bsp/conf/machine/beagleplay.conf      | 3 +++
>   4 files changed, 10 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
> index be27705c..3b857165 100644
> --- a/meta-ti-bsp/conf/machine/beagle-x15.conf
> +++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
> @@ -19,3 +19,5 @@ MACHINE_GUI_CLASS = "bigscreen"
>   SERIAL_CONSOLES = "115200;ttyS2"
>   
>   UBOOT_MACHINE = "am57xx_evm_config"
> +
> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-zimage"
> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> index 2f9c7288..3f5a027e 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
> @@ -24,4 +24,7 @@ ti/k3-j721e-sk.dtb \
>   "
>   
>   MACHINE_GUI_CLASS = "bigscreen"
> +
>   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-image"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw vxd-dec-fw"
> diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
> index 2d811d0d..45944ce8 100644
> --- a/meta-ti-bsp/conf/machine/beaglebone.conf
> +++ b/meta-ti-bsp/conf/machine/beaglebone.conf
> @@ -23,3 +23,5 @@ MACHINE_FEATURES += "screen"
>   SERIAL_CONSOLES = "115200;ttyS0"
>   
>   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-zimage"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3"
> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
> index 6a0f697f..4dd550a1 100644
> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
> @@ -42,4 +42,7 @@ ti/k3-am625-sk-rpi-hdr-pwm.dtbo \
>   "
>   
>   MACHINE_GUI_CLASS = "bigscreen"
> +
>   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-image"
> +
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += ""
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17160): https://lists.yoctoproject.org/g/meta-ti/message/17160
> Mute This Topic: https://lists.yoctoproject.org/mt/102089684/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/6695306/3619733/2033773410/xyzzy [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

