Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73670C7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 22:01:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1753.1685484085455185777
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 15:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rxShOHEF;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UM1M5Y032199;
	Tue, 30 May 2023 17:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685484082;
	bh=xzY6/V6OxsQrtfvzCzMkai2X3udywc0sUVUlJhFh8oY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rxShOHEFIOiwDAHmYhlBPuGb75CTJ+EaDSIn494aFteEB//LKeemcGDj/6n9b+sty
	 IOokQ7746MOvlEHjAoCKspMUHqIhZ9qjkRMliOOcwsu3W25WIEgblZqDqNVOXlmvEL
	 GREv4NWhZ/GZd5EgtLJeY7Lw8zbOgKMzXAAAa9FM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UM1MWF127503
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 17:01:22 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 17:01:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 17:01:09 -0500
Received: from [10.250.34.213] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34UM197f066028;
	Tue, 30 May 2023 17:01:09 -0500
Message-ID: <7c873461-373d-df58-dba3-3aa15bd3059b@ti.com>
Date: Tue, 30 May 2023 17:01:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][master/kirkstone][PATCHv2 1/2] libgles: rename subdir
 to powervr-umlibs
Content-Language: en-US
To: <rs@ti.com>, <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230530215827.3737116-1-rs@ti.com>
 <20230530215827.3737116-2-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230530215827.3737116-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 22:01:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16642

On 5/30/23 4:58 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Move recipes to new subdir since we offer more than just libgles now.
> Reusing the naming convention of the subdirectory used for the km
> components for now.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   .../ti-img-rogue-umlibs_23.1.6404501.bb                           | 0
>   .../{libgles => powervr-umlibs}/ti-sgx-ddk-um/pvrsrvkm.rules      | 0
>   .../{libgles => powervr-umlibs}/ti-sgx-ddk-um_1.17.4948957.bb     | 0
>   3 files changed, 0 insertions(+), 0 deletions(-)
>   rename meta-ti-bsp/recipes-graphics/{libgles => powervr-umlibs}/ti-img-rogue-umlibs_23.1.6404501.bb (100%)
>   rename meta-ti-bsp/recipes-graphics/{libgles => powervr-umlibs}/ti-sgx-ddk-um/pvrsrvkm.rules (100%)
>   rename meta-ti-bsp/recipes-graphics/{libgles => powervr-umlibs}/ti-sgx-ddk-um_1.17.4948957.bb (100%)

But these are not "powervr" cores anymore :) Oh well, better
than "libgles"..

Acked-by: Andrew Davis <afd@ti.com>

> 
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
> rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
> rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> similarity index 100%
> rename from meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb

