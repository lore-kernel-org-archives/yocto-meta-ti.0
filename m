Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F94F43832
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:43:39 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20761.1776264216812683403
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 07:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=tA6CmNTz;
 spf=pass (domain: ti.com, ip: 52.101.62.41, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v91L1ZQJ3RcJwxPGayOQ+E3+oJ9a1GSP9nQKRl2swYPyAdnzfETjYp9b8hwJPz+801SFlbyXCcyyktnWZ6xjAG1jRBFzYMf5H7J+RCraPShKmpcy8xjU8e4I387Ek27YvAh15XVM3yEJlVWcphSh8oLsyl/cn3ekfrOHnCY05WwhhaTKkVnWX32toh8q6SebNLgM/ioireLNQ3yGPJNj9wNmwJn9tV1x/UHbaYEQAO2C0O5eylc5mcXhM2zDgR21vM1XvljGqogOcR4N3yrxWEpzZhWgc7Rfh6UbZLbCjm76L4bKJfpi2+C8Hz+8JwNLrBtjxP0ywX2TpHV4BFxaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ok5zW2ipW1hbVi50wDHdvDbvpp4wTowl7G6E2CTQAOU=;
 b=Ho2KywSGusSZVMX0rF6/dXEVaeGAFo5jK8t25TUU1UIahGuDVl3DuPjyEQ8efirpHQ2TFl5H2dwM/2OjAhcyLl5/ArBapc/Vg6v+CLr3lRrqcgjv9zHaSmLumu07lExzkCOB5BuzDa0PRTxxIKhBfMYd64I+DdxK5jNFuOLzKF6AyMaYWcitY19fA7cN91kXQh2EVlwNz+4we8Je+pdtxA2vqsifsscILgr1wntwpaQFN/gyvNhyN6pWk2A2C98DMpH0OeXVLt3BW328onwN4NZZhvBfgh30o4NuwNnK0H2eCKHuMwRT0rU720MufX524TWPNh3nnZsBYo61CryXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ok5zW2ipW1hbVi50wDHdvDbvpp4wTowl7G6E2CTQAOU=;
 b=tA6CmNTzC/Kj6P8XrE8HcTh/2BpKmbjdyMip2O3+ElV37hcy0YmU3BD/7aMRLLgVVXKhmejfZD5B9VLajQRH+TVHeB+1V72i6zUDXVPW8rj+GfnHcbexRMgnpzTfKE5sTMkD/oZl7SVKvBVQnjaV19LYP56RBA4EbavWBw/Px2A=
Received: from PH7P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::22)
 by SA3PR10MB6969.namprd10.prod.outlook.com (2603:10b6:806:316::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 14:43:33 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::e0) by PH7P220CA0005.outlook.office365.com
 (2603:10b6:510:326::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Wed,
 15 Apr 2026 14:43:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 14:43:33 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 09:43:32 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 09:43:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 09:43:31 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63FEhVZK2403648;
	Wed, 15 Apr 2026 09:43:31 -0500
Message-ID: <6a59459c-9843-4a9c-9e43-b3697b7d4203@ti.com>
Date: Wed, 15 Apr 2026 09:43:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v1] conf: machine: j784s4: Move
 ti-eth-fw-j784s4 to EVM conf
To: Francesco Dolcini <francesco@dolcini.it>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Franz Schnyder
	<franz.schnyder@toradex.com>, Franz Schnyder <fra.schnyder@gmail.com>
References: <20260415114107.1643556-1-fra.schnyder@gmail.com>
 <20260415115820.GA26023@francesco-nb>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260415115820.GA26023@francesco-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|SA3PR10MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: b176ac89-49d1-4349-7a49-08de9afd5e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+5lOZ23qHEzSbvJ8GfN8iz/NeBMuL9U3T0U9X+oTAILbKCQB0x3KkuZ1PjXDZ2clz7Pc2l55jnA5Vbskyped9+T29Es9qRvK376M87A6wlul+UvXHXDau/F1dbw+smOkFsVQ01B5HDClMlee1X5t95SeBn6Ist8BHRlgUiFVB3PYdzOjMFXGfMz6UHk+/1ILD3RbljnsQVJVJgYXzJDlikRpR9B58/d5E7fWaAOnEvnO3r2Kf7WaMiq+42lKJ8ttIkN5v3MgvCfkHl7r1+gE3GdIJRsDQo0vJvDXgARxQDonGKul4zcKhZzZ2J2omzSukojSKgEl5pjs+1mEv9ibZNL4PeuxM+8RUBk5HGtMQAR/ospEWRgmvaBv1o146d23+TSEdb9f77Crab677OJx4Lf6c9IgDVd8EOl00hGTrEV4v835t0BB+37N2TfyTvx3LvbI9VIyY+ftpLFLcC0YvG8roS/intdW113M3XP6ui9ENVJWyu8+ve+K3HMh/YSnJcCYAHE5SKdM9XL13lMQZ9oL4IV5s6St8mji9L+TPGm06ThFWsx3FtWpQuca7oVJk+6/u9QLN+KOn2ZJlQva8YjZeOb5TGyCTEAK5Ax6BqwXgmb3bR0/aE3PAdqpEGHWUH+9CPvYCcsRPTfizyw4Z+zB6N/ab1vbdFbxrOYuUd5vwwXsoCrdoV1ViFYq69K4WHq2NKhuURO0bcmgn8ChEdvla9+BLFBT2g91h8KqOQRKZhGdeNsCTZd8qbGAbwA7H5e41V0d8ICj5aqOdwH4ZNQRa08RAa/Y+J0PeOHcuEo=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Qh3JQDumwzWGvPX7Ngyeg578qnsn7bf2WglY8sO5pPO8I5ckflk1st0x6tx8MTnr1cqYVZLB8xPBLz5DdPj4JTZ/k3/mzgQ/zEIO7cDUhijV0ebl1bEPaD9ZHCH9bdfUFTkJQZ7LyOxK3D++/iBGGpFeiuNBz3JmYkXhV1jfGP11GyIzhoXOHT/Es0ki+1tCh44rF949I5ogeMd+lRA3UcJbFH8kAo6q7+GIJlEe5DV22bzPretdhx6l2RrmhXPeDKkj7wJn6KzFR/tiIhB/5jQuRaXf0Eedl6fryKlSTsLMT8UgsYC7f6j1Qwhu4ZHVBHyEKD3OX19LhxDDZV/tcQqPkG6C6AgbxGPz+94qVmHp1k/YQgc1PC4RlBJsV4Q3V4IpSBThCxn9Ey84lFebR9sdWNfq5pj6++rHlcIIZEZOSPSwMHavZsgqOWzp7yg+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 14:43:33.6170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b176ac89-49d1-4349-7a49-08de9afd5e8d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6969
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 14:43:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19850

On 4/15/26 6:58 AM, Francesco Dolcini wrote:
> +Andrew
> 
> Hello Ryan,
> 
> On Wed, Apr 15, 2026 at 01:41:04PM +0200, Franz Schnyder wrote:
>> From: Franz Schnyder <franz.schnyder@toradex.com>
>>
>> The `ti-eth-fw-j784s4` firmware is added in the generic J784s4 SoC
>> include, which is therefore used for all the J784s4-based machines.
>> That firmware seems to be developed specifically for the EVM, as it
>> takes control of pins used for the Ethernet board setup on the EVM. On
>> non-EVM boards, like the Aquila-AM69, those signals are used for other
>> functions, so enabling the firmware in the SoC include is too broad
>> and breaks functionality.
>>
>> Move the machine-essential recommend from the SoC include
>> to the EVM configuration.
>>
>> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> 
> This seems to be the 3rd time, in a relatively short time, in which
> we are affected by your decision to put into the SoC file, configuration
> that are not about the SOC
> 
>   1 - the initramfs topic [https://lore.kernel.org/yocto-meta-ti/78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com/]
>   2 - the console uart [https://lore.kernel.org/yocto-meta-ti/4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com/]

I thought we solved this one by making the console selection more easily
updated in the board files. If we want to go one step further and remove
the defaults from the SoC level and always select the board specific UART
in each board config I wouldn't oppose that either.

>   3 - this firmware
> 

This firmware was a miss on our part, we were not aware that it was
not generic for all boards using this SoC but instead does some EVM
specific pinmuxing. I've looked into the FW source and can see where
that happens, I'll work to see how we can fix that. In the mean time
I agree then we should move this firmware to the board level (as the
patch does).

> 
> Can I ask TI once more to rethink this considering that meta-ti is used
> by users of your SoC, but not of your EVK/SK ?
> 

We do think a lot about external users of meta-ti, we even made a whole
split out reference layer (meta-beagle) that we treat like a normal vendor
layer so that we can more easily identify when we are making bad assumptions
that only apply to our EVM/SK boards. Yes we do still sometimes get it wrong,
and so we are very happy that you are providing the feedback that you have
and helping point out those cases.

If I'm not mistaken the initramfs topic is the only outstanding case
where what goes in the SoC file vs board files is still open and we
should continue to try to find the best solution.

Thanks,
Andrew

> Thanks,
> Francesco
> 


