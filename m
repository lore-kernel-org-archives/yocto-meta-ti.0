Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633D2CD6114
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 17:23:11 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.69403.1696872190000824477
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 10:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Fu1igJDK;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 399HN9WH123024
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Oct 2023 12:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696872189;
	bh=6VF4zAGlQZ69Ku/P9t2P2p/nTJ1ZHCVNjWO8KZ974j8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Fu1igJDKxyOHOoTamLENkUwNFDEvgXglrN134Gu/qhjZtwV/IZpJjuY12s55XXtv9
	 8h0jhtdOrfzYNRG8L+097lH6No2sPpb4YipMtaXuDDVljvkwM9S0JEcWeA6Std6/iG
	 l3AUHLeZtMgLbcYNYA0U/trR0mItl/Ufhh46UhEU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 399HN9q4023263
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Oct 2023 12:23:09 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Oct 2023 12:23:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Oct 2023 12:23:08 -0500
Received: from [10.247.18.57] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 399HN8oC020309;
	Mon, 9 Oct 2023 12:23:08 -0500
Message-ID: <41d3e554-c95b-470a-97a5-04e46aa5fca1@ti.com>
Date: Mon, 9 Oct 2023 12:23:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH v3 0/2] Remove PRU Ethernet firmwares for
 legacy devices
Content-Language: en-US
To: Ravi Gunasekaran <r-gunasekaran@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <reatmon@ti.com>
CC: <srk@ti.com>
References: <20231009070926.21629-1-r-gunasekaran@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20231009070926.21629-1-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Oct 2023 17:23:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17081



On 10/9/2023 2:09 AM, Ravi Gunasekaran wrote:
> Linux kernel 6.1 does not have support for PRU-ICSSM driver.
> So remove packaging of all the PRU-ICSSM firmwares for kernel 6.1
> based SDKs.
> 
> In the v2 version, it was suggested to have the changes in the SDK layer.
> But after discussion with meta-ti(Ryan) and meta-processor-sdk(Gyan)
> maintainers, it was decided to introduce a new .inc file that removes the
> packaging of the firmware and include it in the kernel recipes that don't
> have support for PRU-ICSSM in meta-ti. This series attempts to take that
> approach.
> 
> The support for PRU-ICSSM driver will be available in mainline and TI kernel
> towards the end of 2024. So until such time, this approach will be followed.
> 
> v2:https://serenity.dal.design.ti.com/patchwork/project/meta-ti/patch/20230908113836.12413-1-r-gunasekaran@ti.com/
> v1:https://serenity.dal.design.ti.com/patchwork/project/meta-ti/patch/20230908114439.13213-1-r-gunasekaran@ti.com/

For future reference, please do not post internal links.
Instead, use https://lists.yoctoproject.org/g/meta-ti/messages



> 
> Ravi Gunasekaran (2):
>    preuth-fw: Remove packaging of PRU-ICSSM firmwares
>    linux-ti-staging_6.1: Remove packaging of PRU-ICSSM firmwares
> 
>   meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 1 +
>   meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc           | 3 +++
>   2 files changed, 4 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc
> 
> 
> base-commit: 041271c30496bd1457cd2bd38e7d9b2f7b14372f

