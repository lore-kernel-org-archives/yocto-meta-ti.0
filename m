Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCE6C77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 08:17:22 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.3598.1685089034666368382
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 May 2023 01:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cRWIqcYu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34Q8HDjw001329
	for <meta-ti@lists.yoctoproject.org>; Fri, 26 May 2023 03:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685089033;
	bh=+q/rdDUUIskxl1FmHdQ1JuenycgmCSJfF3eeTIcy+24=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=cRWIqcYu7RgwCcx3QwfrSewz50PE/mPYeqYBS5PocoFBLv3D+zVOH8zraDLJuB2EJ
	 4KD+PHfNaNxFLYQlaR9oQaqCCwNfOLeX9XfHIKoGYvMq0kejtndrGl/7IRO7fa9RP+
	 B4uR6pjuJHEbzat0UOiMXsCRBEAPnuGP4gq17Gwo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34Q8HDg9029519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 26 May 2023 03:17:13 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 May 2023 03:17:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 May 2023 03:17:13 -0500
Received: from [172.24.221.38] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34Q8HBGi085184;
	Fri, 26 May 2023 03:17:12 -0500
Message-ID: <00ba0083-71f1-b585-5060-aa572681984a@ti.com>
Date: Fri, 26 May 2023 03:17:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [kirkstone/master PATCH] ipc: ti-rpmsg-char: Update library to
 0.6.1
Content-Language: en-US
To: Hari Nagalla <hnagalla@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <reatmon@ti.com>
References: <20230526044448.20318-1-hnagalla@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230526044448.20318-1-hnagalla@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 May 2023 08:17:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16597



On 5/25/2023 11:44 PM, Hari Nagalla wrote:
> Update the ti-rpmsg-char library to 0.6.1 version to fix rpmsg_ctlr
> id on v6.1 kernel when multiple channels are created.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> ---
>   meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> index bff55258..84873923 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -7,10 +7,10 @@ PROTOCOL = "https"
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
>   
> -# 0.6.0 release
> -SRCREV = "600ec4dd56d73cc7ad62082c63244183b34f77a5"
> +# 0.6.1 release
> +SRCREV = "510e90d0a75bc21d79020669d2ea03f8222f3b8d"
>   
> -PV = "0.6.0+git${SRCPV}"
> +PV = "0.6.1+git${SRCPV}"
>   
>   S = "${WORKDIR}/git"
>   

