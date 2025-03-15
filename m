Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43E8C28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 13:50:19 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.9858.1742046616814640571
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 15 Mar 2025 06:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CdtDFY8b;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52FDoAX91886312
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 15 Mar 2025 08:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742046610;
	bh=Ps4F7qivc3WHPs5+OKTeK30/bnP5kvZB7GOos3LxjFw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CdtDFY8b3QAsExjM268ZnJow8bouJL9+tt/EyvbpuhXmFQthmSYVS1NM+8cbi97/e
	 7S4OoLhSnk6AGLMthK8QTnEhwe4iKqSknACgN6Zt68iKMxlcQAAHmpvUmyzbLZLf8D
	 uvCCDep0+B2dy1h3SPX9vSjBHNz8/oiUO5QdLu3A=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52FDo9cT000906
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 15 Mar 2025 08:50:10 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 15
 Mar 2025 08:50:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 15 Mar 2025 08:50:09 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52FDo7ML115074;
	Sat, 15 Mar 2025 08:50:08 -0500
Message-ID: <c195321b-c9d3-4666-8818-83246c9d1fca@ti.com>
Date: Sat, 15 Mar 2025 19:20:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] jailhouse: revert changes for
 am62lxx
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Paresh Bhagat <p-bhagat@ti.com>,
        <jweyer@aecontrols.com>
References: <20250315014726.2806459-1-denis@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20250315014726.2806459-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 15 Mar 2025 13:50:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18390

Hi Paresh & Denys,

On 15/03/25 07:17, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> This reverts commit 31b423275aa2bc685a1348218bda16894a35ad8b.
>
> This uses an unpublished/uncommitten change - more details:
> https://lists.yoctoproject.org/g/meta-ti/topic/111318869



Instead of reverting the entire commit which enabled
Jailhouse support in AM62L, can't we just update
the SRCREV to point to a valid commit under ti-jailhouse?

Something that Jared tried to suggest at [0]


[0]: https://lists.yoctoproject.org/g/meta-ti/message/18333


--
Chirag



> Cc: Paresh Bhagat <p-bhagat@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-ti-bsp/conf/machine/am62lxx-evm.conf            |  1 -
>   meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc         | 10 +++++-----
>   meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc    | 10 +++++-----
>   meta-ti-bsp/recipes-kernel/linux/ti-extras.inc       | 10 +++++-----
>   meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb |  4 ----
>   meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc |  5 ++---
>   6 files changed, 17 insertions(+), 23 deletions(-)

