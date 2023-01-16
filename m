Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68F5C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 16:48:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.172065.1673887718253657391
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Jan 2023 08:48:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qZqPXEz0;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30GGmYIu027347;
	Mon, 16 Jan 2023 10:48:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673887714;
	bh=ZkauYsXb5xfauipdX2BeZKuub/6IgdprFlHtCfodc5A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qZqPXEz0mvuzZAgJsWFnl90yB8yfxmO82Cf95bSE7VqpOl2GCvp5QIRqQNV7aWyei
	 Mn+SfZId84/ArOaYgnvD+a7fJCnpYaeJcdUIUEyo+OK9GV0BUJaDMkopufNFpksm/c
	 k+uPs/0Ud1tjhDCv3Ko7ej4NGinVaTonGIyqMLcQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30GGmYsC022451
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Jan 2023 10:48:34 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 16
 Jan 2023 10:48:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 16 Jan 2023 10:48:34 -0600
Received: from [10.250.34.87] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30GGmX0A077592;
	Mon, 16 Jan 2023 10:48:33 -0600
Message-ID: <4604d911-0dc1-9c3d-e182-95cd79ace9a7@ti.com>
Date: Mon, 16 Jan 2023 10:48:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][PATCH 1/3] ti-k3-secdev: move from meta-ti-extras to
 meta-ti-bsp
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: <ricardo@foundries.io>, Jose Quaresma <jose.quaresma@foundries.io>
References: <20230116121626.885219-1-jose.quaresma@foundries.io>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230116121626.885219-1-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Jan 2023 16:48:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15570

On 1/16/23 6:16 AM, Jose Quaresma wrote:
> The meta-ti-bsp layer is still broken for K3 HS platforms.
> 
> The patch [1] makes the check-layer happy again as it does not
> fail any more during bitbake parsing but it will be difficult
> for the end user to discover this dependency on meta-ti-extras.
> On the other side, meta-ti-extras depends on meta-ti-bsp so
> this is a circular dependency.
> 
> Currently the layer is broken for am62xx-evm/am64xx-evm machines:
> 
> | ERROR: Nothing PROVIDES 'ti-k3-secdev-native' (but mc:k3r5:/srv/oe/build/conf/../../layers/meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb DEPENDS on or otherwise requires it). Close matches:
> |  libtspi-dev-native
> |  makedevs-native
> 
> [1] - 8e43835c ti-sci-fw: make dependency on meta-ti-extras soft
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   .../recipes-ti/secdev/ti-k3-secdev_git.bb                       | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename {meta-ti-extras => meta-ti-bsp}/recipes-ti/secdev/ti-k3-secdev_git.bb (96%)
> 
> diff --git a/meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> similarity index 96%
> rename from meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb
> rename to meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> index 3763c339..fd3bd120 100644
> --- a/meta-ti-extras/recipes-ti/secdev/ti-k3-secdev_git.bb
> +++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> @@ -4,7 +4,7 @@ SECTION = "devel"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://manifest/k3-secdev-0.2-manifest.html;md5=f632a78870cc64550078d7b3cbac0892"
>   
> -require recipes-ti/includes/ti-paths.inc
> +include recipes-ti/includes/ti-paths.inc
>   
>   # Native host tool only
>   COMPATIBLE_MACHINE = "null"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15567): https://lists.yoctoproject.org/g/meta-ti/message/15567
> Mute This Topic: https://lists.yoctoproject.org/mt/96304962/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

