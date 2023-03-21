Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98E7C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 15:50:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.17257.1679413812446222164
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 08:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GqGjmeeO;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32LFo4kd059594;
	Tue, 21 Mar 2023 10:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679413804;
	bh=LPeejHyn47glnWcTi7/dctbOIWDschVUFGb5BmVsUDU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GqGjmeeOZBErNA+FdtCD+yujN+H3wXAphT4TRkKH9Ugl+tPE6QLZo6MZZl81l+Xrx
	 sAgEyYsIWkgIjNB9fDQCZ448dcHFpf9wVx6XMV5DtUYhZDhrd6bzaJW3lBifU15pSQ
	 8b2ANelHL83vYI1pnyT4zTI8pIv+wWpqYAMbwD+M=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32LFo32p009074
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Mar 2023 10:50:03 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 21
 Mar 2023 10:50:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 21 Mar 2023 10:50:03 -0500
Received: from [10.250.35.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32LFo2Mt025723;
	Tue, 21 Mar 2023 10:50:02 -0500
Message-ID: <8ad44011-28c8-a2ec-1fc1-a314f6be6aef@ti.com>
Date: Tue, 21 Mar 2023 10:50:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-ti] [master/kirkstone][PATCH] ti-sgx-ddk-um: fix error in
 postinst with sysvinit+udev
Content-Language: en-US
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <linux@ew.tq-group.com>, Denys Dmytriyenko <denis@denix.org>
References: <20230320142534.2542288-1-matthias.schiffer@ew.tq-group.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230320142534.2542288-1-matthias.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Mar 2023 15:50:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16218

On 3/20/23 9:25 AM, Matthias Schiffer wrote:
> When sysvinit is in DISTRO_FEATURES, the update-rc.d class must only be
> inherited when the script referenced by INITSCRIPT_NAME actually exists,
> or the update-rc.d command in the generated postinst script will fail.
> 
> Reported-by: Denys Dmytriyenko <denis@denix.org>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---

Thanks handling this, LGTM,

Reviewed-by: Andrew Davis <afd@ti.com>

> 
> I have omitted a Fixes tag, as this applies to both master and kirkstone.
> The tags would be:
> 
> # kirkstone
> Fixes: f50f55102f92 ("ti-sgx-ddk-um: use udev for userspace initialization")
> 
> # master
> Fixes: 0b3fa09a5f0b ("ti-sgx-ddk-um: use udev for userspace initialization")
> 
> Let me know if I should send separate patches with the tags included.
> 
> 
>   .../libgles/ti-sgx-ddk-um_1.17.4948957.bb             | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index f1fbed15..73d7acb9 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -24,11 +24,16 @@ TARGET_PRODUCT:am65xx = "ti654x"
>   INITSCRIPT_NAME = "rc.pvr"
>   INITSCRIPT_PARAMS = "defaults 8"
>   
> -inherit update-rc.d
> -
>   PACKAGECONFIG ??= "udev"
>   PACKAGECONFIG[udev] = ",,,udev"
>   
> +def use_initscript(d):
> +    sysvinit = bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d)
> +    udev = bb.utils.contains('PACKAGECONFIG', 'udev', True, False, d)
> +    return sysvinit and not udev
> +
> +inherit ${@oe.utils.ifelse(use_initscript(d), 'update-rc.d', '')}
> +
>   RDEPENDS:${PN} += "libdrm libdrm-omap"
>   
>   RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
> @@ -42,7 +47,7 @@ do_install () {
>       with_udev=${@bb.utils.contains('PACKAGECONFIG', 'udev', 'true', 'false', d)}
>   
>       # Delete initscript if it is not needed or would conflict with the udev rules
> -    if $without_sysvinit || $with_udev; then
> +    if ${@oe.utils.ifelse(use_initscript(d), 'false', 'true')}; then
>           rm -rf ${D}${sysconfdir}/init.d
>           rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}
>       fi
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16216): https://lists.yoctoproject.org/g/meta-ti/message/16216
> Mute This Topic: https://lists.yoctoproject.org/mt/97732105/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

