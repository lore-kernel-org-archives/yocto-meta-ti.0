Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F54C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 20:42:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.680.1647981760178339359
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 13:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xkhWon/v;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MKgdGC006715;
	Tue, 22 Mar 2022 15:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647981759;
	bh=XxqvsxVqsp/v8PAHj+2XxLHIzP4AY+MoAsbKeL7eDak=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xkhWon/vLVbqa7h+2tUynQSCLi2Xo+d8RJJaNSqPU7AShpmRdb1MAGp2J/OWCF3bw
	 6MtnV2EHJtw1WfXitW+LgiqSS954Db0Pw8cpThfNOAtJWUcDiIP+uc2uG0IDbXyTgT
	 Ks/T8tVcOQT/WKp/Nz+VmmQyTQRP6a982lgp0FKs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MKgdYZ033436
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 15:42:39 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 15:42:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 15:42:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MKgcXh047931;
	Tue, 22 Mar 2022 15:42:38 -0500
Date: Tue, 22 Mar 2022 15:42:38 -0500
From: Nishanth Menon <nm@ti.com>
To: <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell][PATCH 04/11] HACK: recipes-ti:
 ti-rtos-metadata: Make am62x point to am64x
Message-ID: <20220322204238.xxxhosja3of5cg62@discourse>
References: <20220322162528.15298-1-reatmon@ti.com>
 <20220322162528.15298-5-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220322162528.15298-5-reatmon@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 20:42:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14540

On 11:25-20220322, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Nishanth Menon <nm@ti.com>
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> index e435676f..4f320e4c 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> @@ -14,6 +14,7 @@ PLAT_SFX_j7 = "/j721e"
>  PLAT_SFX_j7200-evm = "/j7200"
>  PLAT_SFX_am65xx = "/am65xx"
>  PLAT_SFX_am64xx = "/am64x"
> +PLAT_SFX_am62xx = "/am64x"


NAK -> I know I authored these initial patches during silicon bringup,
but please do squash and cleanup the patches prior to posting
upstream.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

