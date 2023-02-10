Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA0BC636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 17:39:04 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.151.1676050738453713728
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 09:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=n7vG1Fti;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31AHcuTr093407;
	Fri, 10 Feb 2023 11:38:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676050736;
	bh=jYKpgYPDgocMn+VkXDmA0GxyzAwBIUl3RslH7XkkBZo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=n7vG1Ftij8/wayEaI45h90phXJZmzligsuU/+PkAVa2ppmL43hT34O4bbVtvMhcdQ
	 uBw+JZqkA/x922FNRDnuLpAoBrYLqZywktoDV7R1ruHvNBUgDeEX9w5hlyyiB6ROE2
	 9s+jGtkDhTIPk2r3XrkMUs01DhpUHmibWqPt105A=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31AHcu2B077815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Feb 2023 11:38:56 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 10
 Feb 2023 11:38:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 10 Feb 2023 11:38:56 -0600
Received: from [10.247.29.106] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31AHcuQB013004;
	Fri, 10 Feb 2023 11:38:56 -0600
Message-ID: <83803796-1df3-517b-b0ad-b519375929cd@ti.com>
Date: Fri, 10 Feb 2023 11:38:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [meta-ti] [dunfell][PATCH] conf: machine: am62xx-lp-evm: Add OLDI
 Panel overlay
Content-Language: en-US
To: <a-bhatia1@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
CC: Meta-TI List <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
References: <20230210035401.21933-1-a-bhatia1@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20230210035401.21933-1-a-bhatia1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 17:39:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15794



On 2/9/2023 9:54 PM, Aradhya Bhatia via lists.yoctoproject.org wrote:
> Add the Microtips OLDI Panel DT overlay for AM62 LP SK.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   conf/machine/am62xx-lp-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/am62xx-lp-evm.conf b/conf/machine/am62xx-lp-evm.conf
> index 3230b84df90e..5efca18d1af0 100644
> --- a/conf/machine/am62xx-lp-evm.conf
> +++ b/conf/machine/am62xx-lp-evm.conf
> @@ -11,6 +11,7 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am625-skeleton.dtb \
>       ti/k3-am625-sk-lpmdemo.dtb \
>       ti/k3-am625-sk-csi2-ov5640.dtbo \
> +    ti/k3-am62x-lp-sk-oldi-panel.dtbo \


how about conf/machine/am62xx-evm.conf ?any reason why this panel 
support cannot be added on AM62 SK board?



>   "
>   
>   SPL_BINARY = "tispl.bin_HS"	
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15789): https://lists.yoctoproject.org/g/meta-ti/message/15789
> Mute This Topic: https://lists.yoctoproject.org/mt/96869927/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

