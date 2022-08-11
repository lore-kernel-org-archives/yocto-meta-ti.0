Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C73AC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 20:35:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.3011.1660250131694643803
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 13:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mu16Ys16;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: jm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27BKZUfK097421
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 15:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660250130;
	bh=Gjv2KEaQFgRjVtIIUSBY6NhqV0CNCpelJlz+eLuF1pU=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=mu16Ys16JUI1Hw7Wkaq40rXId8O5MPBFGyhL/8mnu8vCl7EbdvINdh1+ovnLIzhHS
	 /MjWTLKc/vuGZGiE8vJ9lbWXRKf9mS5e7E/RKVjaMO+QnMqpCS8eBxWk9YbHShcHyi
	 Lc0k/ayWuS1TIxdsXaQNVLsYpj8inATxeFRtKoI0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27BKZUcW052633
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 15:35:30 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 11
 Aug 2022 15:35:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 11 Aug 2022 15:35:30 -0500
Received: from [128.247.81.102] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27BKZUJU112029;
	Thu, 11 Aug 2022 15:35:30 -0500
Message-ID: <dd7b4663-6cf0-e1f5-9c84-d5e766c541ae@ti.com>
Date: Thu, 11 Aug 2022 15:35:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [dunfell/master PATCHv2] trusted-firmware-a: upgrade to v2.7
Content-Language: en-US
To: Praneeth Bajjuri <praneeth@ti.com>
References: <20220811155724.10175-1-praneeth@ti.com>
CC: Andrew Davis <afd@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon
	<reatmon@ti.com>
From: "Mendez, Judith" <jm@ti.com>
In-Reply-To: <20220811155724.10175-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Aug 2022 20:35:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14953



On 8/11/2022 10:57 AM, Praneeth Bajjuri wrote:
> upgrade arm-trusted-firmare to v2.7
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> Tested-by: Judith Mendez <jm@ti.com>
> ---
> 
> *Changes from v1: removed linux-fw recipe update, that was a mistake.
> 
>   recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

I have verified on J721e as well.

regards,

Judith Mendez

