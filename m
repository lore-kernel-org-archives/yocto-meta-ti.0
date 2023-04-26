Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350E4C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 23:36:19 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8213.1682552172175044534
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 16:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GMTqAH5Y;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QNa7qx091873;
	Wed, 26 Apr 2023 18:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682552167;
	bh=24aG/ZHhfQqN0s6ENpjAm/lpAei/K/lTdLOV9jmlyoU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GMTqAH5Yy4ymQ5Q3BrOjZ8uifcjTUVQrlCB5aXThsLiyreEUoohX/136aIfG53JV8
	 ID33pb+dHfc3aVviDFEMZB/XNtyQPXgGuVUXsSh7iODE2SMlx+GhwetEITuhS//d62
	 hE0DsaPlincZ9G7s0X5sNbiy48CSdlQvrR7318GQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QNa7GF046396
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Apr 2023 18:36:07 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Apr 2023 18:36:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Apr 2023 18:36:07 -0500
Received: from [10.250.35.77] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QNa1Ui048526;
	Wed, 26 Apr 2023 18:36:01 -0500
Message-ID: <3f089614-3f49-783e-1726-f344fb089c6a@ti.com>
Date: Wed, 26 Apr 2023 18:36:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-ti][kirkstone][PATCH 0/4] Enable vulkan proper
Content-Language: en-US
To: <rs@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230426215538.3502212-1-rs@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230426215538.3502212-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Apr 2023 23:36:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16437

On 4/26/23 4:55 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Properly enable Vulkan with all WSI extensions enabled. Attempt some
> light packaging changes to the graphics umlibs recipe so we can decrease
> the number of check we have to skip, and the checks become a little more
> targeted.
> 

Nothing too crazy here, for the series,

Reviewed-by: Andrew Davis <afd@ti.com>

> Randolph Sapp (4):
>    ti-img-rogue-umlibs: bump srcrev, add vulkan, update deps
>    pvr-mesa: add new vulkan configuration options and wsi
>    cairo: resolve opengl version
>    ti-img-rogue-umlibs: package firmware separately
> 
>   .../recipes-graphics/cairo/cairo_%.bbappend   |  5 +++
>   .../ti-img-rogue-umlibs_23.1.6404501.bb       | 33 +++++++++++++++----
>   .../recipes-graphics/mesa/pvr-mesa.inc        |  6 +++-
>   3 files changed, 36 insertions(+), 8 deletions(-)
>   create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> 

