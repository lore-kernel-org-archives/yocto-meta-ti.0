Return-Path: <vigneshr@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BE4C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 15:40:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.11651.1682523651116941440
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 08:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZwRvC0MZ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vigneshr@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QFeoQ8033822
	for <meta-ti@lists.yoctoproject.org>; Wed, 26 Apr 2023 10:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682523650;
	bh=iWtFol+oSyT0hz72n0lwJ3WJwE6Cx1T6IN7EKJsPufM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZwRvC0MZlz+m2EVWQw73rttLEIGU5ECeBD3i9POx475S8SKj3kic5qEKAdR9bqTWe
	 LquXBh3TVfV8jwXDR2SuvgG1PwCslGB9X7Vf6UAJ81K63qByBO2knesvwN94nydr7W
	 ktLpd0WwvcEmBn+/WfyPOpirUKLJ+Gp9TgYMFSb8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QFeoBL052163
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 26 Apr 2023 10:40:50 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 26
 Apr 2023 10:40:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 26 Apr 2023 10:40:50 -0500
Received: from [10.249.133.214] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QFekWr025561;
	Wed, 26 Apr 2023 10:40:47 -0500
Message-ID: <a9e4677f-c376-a0e4-4bf4-b9adff5924b8@ti.com>
Date: Wed, 26 Apr 2023 21:10:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-ti] [kirkstone][PATCH v2] recipes-ti: Add recipe and
 patches for jailhouse
Content-Language: en-US
To: <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
References: <20230426120608.17812-1-p-bhagat@ti.com>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
In-Reply-To: <20230426120608.17812-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Apr 2023 15:40:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16430



On 4/26/2023 5:36 PM, Paresh Bhagat via lists.yoctoproject.org wrote:
> Add and enable Jailhouse support for TI's k3-am625-sk similarly to how other
> TI platforms were added and enabled in the past by adding platform-specific
> configuration variables for the root cell DTB overlay, and the Linux demo inmate
> DTB, configuration, and Kernel command line settings.
> 
> Migrate the jailhouse recipe to kirkstone from dunfell.
> 
> Switch to latest upstream source tree for jailhouse. The TI Jailhouse repo has
> gone stale and now upstream is really the happening place where new development
> happens including for new devices such as AM62x. Hence go ahead and switch to
> using the upstream repo.
> 
> Enable additional console on ttyS3 (usually mapped to main_uart1) and ttyS2 for
> the Linux demo inmate to use.
> 
> Add patches for the Jailhouse source tree for am62xx.
> 
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>

> Signed-off-by: paresh-ti <p-bhagat@ti.com>

You are supposed to sign-off with your legal name.

See: https://wiki.linuxfoundation.org/dco

Regards
Vignesh

