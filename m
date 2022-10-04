Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5060C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 19:38:29 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.15046.1664912307305776976
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 12:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oHBiBIUw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 294JcM23018136;
	Tue, 4 Oct 2022 14:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664912302;
	bh=LaXXbzS9h5FdCtS66QeD1ZaxrrfxqgXzlLqyXR/EeoE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=oHBiBIUwmpXrTxfG9TouEgjQhIJhm9283HDea+gOmbSQzwpY7ffRmqesJFI6V/00Y
	 Vrk+bcQ0Mz+bROGaIubjjgjpLNfqoaWkq03imw8fWYXQiuWId6KuDYxGcRcAF66+XV
	 r5YyQRbBL8Wg5mKRrq77LOYJ52AuQP6UcJSADdYQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 294JcMcK111501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Oct 2022 14:38:22 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 4 Oct
 2022 14:38:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 4 Oct 2022 14:38:11 -0500
Received: from [10.250.32.190] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 294JcB3x030360;
	Tue, 4 Oct 2022 14:38:11 -0500
Message-ID: <91d1794f-ed22-7f0f-ad4a-b33ba93500f9@ti.com>
Date: Tue, 4 Oct 2022 14:38:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti] [master/kirkstone][PATCH 61/65] conf: machine: Make
 multi-certificate image the default
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <20220913035541.2364351-1-denis@denix.org>
 <20220913035541.2364351-62-denis@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220913035541.2364351-62-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Oct 2022 19:38:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15105

On 9/12/22 10:55 PM, Denys Dmytriyenko wrote:
> From: Andrew Davis <afd@ti.com>
> 
> Only the first two K3 devices do not support multi-cert boot so
> lets make multi-cert the default and only add back sysfw.itb
> for these two devices.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> Reviewed-by: lines be preserved?

By who?..

> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---

