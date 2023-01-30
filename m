Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435F0C54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 17:02:29 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.46912.1675098148184672629
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 09:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FmcpRI7u;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30UH2PVq095239;
	Mon, 30 Jan 2023 11:02:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675098145;
	bh=XRrvmJ5rJxocjElkfz1vuGSD6WbCx/WX5lzNJ+8R7JA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FmcpRI7uzyLd2x6AO0DWs1zKwdwgAStnTgq/QD1Pn2XOoHV+1/kMN8VSsRtSJuJ8B
	 CBlsAyrk4UewnuaetRfqOfvOoth3aydzyhTxqYrsmIesSWldewSUvrzgWL3JD//ZMf
	 wrFbSb+s46AID/ulCjdb05wN/80Ad2qPLIDPPFvg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30UH2P31045028
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 30 Jan 2023 11:02:25 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 30
 Jan 2023 11:02:25 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 30 Jan 2023 11:02:25 -0600
Received: from [10.249.38.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30UH2PIX051921;
	Mon, 30 Jan 2023 11:02:25 -0600
Message-ID: <74d5bfd6-556b-6194-ca78-771d86509e5f@ti.com>
Date: Mon, 30 Jan 2023 11:02:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][master/kirkstone][PATCH] bsp: multiconfig: k3r5: allow
 customization by donwstream layers
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: <ricardo@foundries.io>, Jose Quaresma <jose.quaresma@foundries.io>
References: <20230130152000.705123-1-jose.quaresma@foundries.io>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230130152000.705123-1-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 17:02:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15701



On 1/30/2023 9:20, Jose Quaresma wrote:
> This patch adds the possibility to change some bitbake variable
> that cannot be changed anywhere else, one of then is the TMPDIR.
> 
> Using the same TMPDIR it is very sensitive and prone to several errors
> when used in more complex situations.
> This configuration forces that all native packages have to be the same between all
> machines and this requirement is very easy to break.
> Suppose you use a macinhe override somewhere on a native recipe
> and this requirement is no longer met.
> Many of these anomalies can be verified with the use of the rm_work and
> create-spdx bitbake classes.
> 
> A previous attempt [1] had already been made but was refused
> but this way it can be done without side effects for other users.
> 
> [1] https://lists.yoctoproject.org/g/meta-ti/message/14767


So the difference between this patch and the previous one, is that you 
are now included a file that is not there normally so that you can put 
the contents of the previous patch in the new include file to get around 
the issue in the archiver.

I'm not saying I'm opposed to this approach (yet), I'm just trying to 
understand the entire story.

Did you find anything in looking at fixing the archiver to better 
support the multi-config issue?



> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>   meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> index deb07210..b69c5d6d 100644
> --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> @@ -3,3 +3,5 @@ MAINMACHINE := "${MACHINE}"
>   DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MAINMACHINE}"
>   
>   MACHINE:append = "-k3r5"
> +
> +include conf/multiconfig/k3r5.inc
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15699): https://lists.yoctoproject.org/g/meta-ti/message/15699
> Mute This Topic: https://lists.yoctoproject.org/mt/96629864/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

