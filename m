Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465D0C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 19:42:19 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.25551.1739389331411989080
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 11:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yqCHXaTt;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CJg9eD498571
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 13:42:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739389329;
	bh=nILv3+GMjuCvQuT4oFlC41ZIUUA2WgQF+13T800np8I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yqCHXaTtAjzuM6ACyQTXWghBIGCK3EsnsOGJcAjGvq5O4+fkmAYvHJo5psXPRnu2N
	 vTjUz7O0QMcaI/bOiWFijjLZ2+jN9N5PPbIWpVio5iTFac8t5BD336cWzPJEQSD4sE
	 xqjLtouNT65qICAyMRDM3Zy1pMcJrAaQr1fLtNHs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51CJg9f3103571
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Feb 2025 13:42:09 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 13:42:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 13:42:08 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CJg8KJ119764;
	Wed, 12 Feb 2025 13:42:08 -0600
Message-ID: <1240a4e9-215c-406e-baca-020c7faeaa5e@ti.com>
Date: Wed, 12 Feb 2025 13:42:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] HACK: conf: machine: am64x: Use new
 sdimage efti wks template
To: <jm@ti.com>, <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20250211231115.139972-1-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250211231115.139972-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Feb 2025 19:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18301

On 2/11/25 5:11 PM, Mendez, Judith via lists.yoctoproject.org wrote:
> Currently am64x boards are failing SD card boot since standard
> boot is the current boot method for the boards. With standard
> boot, the grub shell is invoked and the grub.cfg used to pass
> kernel parameters to Linux. Normally we would like to use grub
> class to modify the kernel parameters passed to Linux but
> since this is not currently working with SERIAL_CONSOLES nor
> GRUB_OPTS, lets make a template that includes our own custom

Why do SERIAL_CONSOLES nor GRUB_OPTS work here? Should explain
that in this message.

Looks like there is a comment that this needs fixed[0]. Since it
affects you now, might be good to go fix this upstream.

For now, this seems like a GRUB issue. Why do we use GRUB again,
isn't one bootloader enough?.. uboot-extlinux-config.bbclass
doesn't seem to have this issue, and the resulting extlinux.conf
can be used directly by U-Boot (or used by GRUB if we really want
to have a middle layer bootloader that only ends up breaking FIT,
DT overlays, rproc loading, security, etc..)

<rant>
GRUB makes no sense on embedded, and it never did as we don't
have an x86 legacy BIOS, the only reason anyone still uses GRUB.
systemd-boot and efistub are the future for EFI capable systems
like ours. Simple, better security, and already available in
Yocto, let's switch already..
</rant>

Andrew

[0] https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/grub-efi-cfg.bbclass#n22

> console= and let am64x conf use this.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/am64xx.inc  | 2 ++
>   meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in | 8 ++++++++
>   2 files changed, 10 insertions(+)
>   create mode 100644 meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
> 
> diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
> index 49e996c8..be65aa6e 100644
> --- a/meta-ti-bsp/conf/machine/include/am64xx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
> @@ -34,3 +34,5 @@ TFA_BOARD = "lite"
>   OPTEEMACHINE = "k3-am64x"
>   
>   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
> +
> +WKS_FILE = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi-csl.wks.in", "sdimage-2part.wks", d)}"
> diff --git a/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
> new file mode 100644
> index 00000000..6dc69a17
> --- /dev/null
> +++ b/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
> @@ -0,0 +1,8 @@
> +# short-description: Create SD card image with 2 partitions and EFI support
> +# long-description: Creates a partitioned SD card image for TI platforms that
> +# supports EFI.  Boot files are located in the first vfat partition with extra
> +# reserved space.  We cannot use a GPT here.
> +
> +bootloader --timeout=5 --append="rootfstype=ext4 console=ttyS2,115200n8"
> +part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
> +part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18300): https://lists.yoctoproject.org/g/meta-ti/message/18300
> Mute This Topic: https://lists.yoctoproject.org/mt/111133257/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

