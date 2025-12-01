Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0E4D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 10:23:29 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18802.1764584605162341844
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 02:23:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=FDIBfO5o;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.56, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTLvsQO5MAodC98jVCQnsqJtwiwOOJjCLj43A+Xfa2klMxdNFado73VddxgeD2RbK7VuZCz+VheiuZ6FGQsRf2puDrdur3Yx6v5kTxfRZEXf5DvZewVyczlCrpFC46NTg+76XbvFp/+y2vbSZ+AH6V0ZLncNcndSZ82ZENbpkQ27CNciFjeBtMhShcUsSKTU79z57sg5KYPWk7fRSkNupx2/jyZ/WfWRMxyB0eZLYUN0QvH7ABkzWXTzxbgxt1QiJJ5AZ+iuay0lqhm3aUGtWaBGh/sk5rQNT2coLTgOUgj9FuF5ZA+e+chdOWVpFeKL6Mb7/1JAldsXxcdY0E//uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCu8KopJJSPmpSO5TIJ6YPrtLbEO8EGRcf/3pZ1iwRI=;
 b=mE6w/48galIA0MCkyP6DFX4ntAslL2adzfY3qBnrBllAMxWwbtGJuarerkoeAwbXL6WRfAy90F46JkRHhoA9RXwvVc7svAmOQTcZ7UgkSx+QXHISagXNUVbv8tu5v+tesWP2i00lUvVJnLezsFAjr/TzQ9yqHA1Nw8/5koA/LfHrazbxAjKP7crI1OTckG5Ro3zaRG8bmRvb785Bcy5vIYHDT6ChzGszynlgUlrHLftv14YlIz+bcFSJylyZMLzh4gk32SeZsqOlAZKvIhFlA/GwF22op/+H6eEpF3u1crA7m7ObzwseqjWYwq15Y0UCQGvIg2w6pEIDj3qg17SxeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCu8KopJJSPmpSO5TIJ6YPrtLbEO8EGRcf/3pZ1iwRI=;
 b=FDIBfO5oRL+DGSIumt/Dtje0kkitjmvx03YD2l/buLfknwRpvsP0hScgPeBycpq7zR0I4zj5bJBbhutGiJ3qzmrR5vw5DNbMQYPzykt6ALSYulVpDPIsVbng8S8FavOfPY11KNxVng6ScaE70ACvk1njluY6GcEAGJ+xVAyamp0=
Received: from BN9PR03CA0155.namprd03.prod.outlook.com (2603:10b6:408:f4::10)
 by LV8PR10MB7725.namprd10.prod.outlook.com (2603:10b6:408:1e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 10:23:22 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::e5) by BN9PR03CA0155.outlook.office365.com
 (2603:10b6:408:f4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 10:23:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 10:23:22 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 04:23:19 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 04:23:19 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 04:23:19 -0600
Received: from [172.24.235.46] (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B1ANG5c262057;
	Mon, 1 Dec 2025 04:23:16 -0600
Message-ID: <016b4df2-8377-49bc-8e0d-addbf1f4c056@ti.com>
Date: Mon, 1 Dec 2025 15:53:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH] meta-ti-bsp: include: am62axx.inc: Add
 TPS6594 regulator and core modules to initramfs image
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
	<gehariprasath@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <denys@konsulko.com>
References: <20251201100941.95152-1-m-shah@ti.com>
 <ef33f353-327c-4f28-9f67-e4b8dbb6baa9@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <ef33f353-327c-4f28-9f67-e4b8dbb6baa9@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|LV8PR10MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 2468d938-e8f1-4c7e-37ba-08de30c3a7b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|4022899009|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0J5fkJn7Tf4ffId1Hxd2gUz9g/ZZEKzc3RTlgfHLjc54Gya48o4IqNSFFVy2?=
 =?us-ascii?Q?zj4UGHASc/8kSJssgbvIXaFTrVY5YLokw0LKu5D/tDzpG/j98NcRRU4OW4xc?=
 =?us-ascii?Q?7LDBh+kEPHS1d8bAGHOPoYLNlsQzNWU11eBKgmNw3shMUEcOZW/mjWWvcgGX?=
 =?us-ascii?Q?jlnuTSRruUdbQoqqXrUV2+LaP4kUESb8820dtfo8QVpauaTUkpRQsT9VlFbG?=
 =?us-ascii?Q?mX0gMfrjOeBL9OyhWERAFM7DOaZgtR7Nb6+EwlqJMBNgdkJMNOP46jTXYAuh?=
 =?us-ascii?Q?iOz4kv0Ryo9Z2vhhOiB82dqy7dMe2Ve9I0+upNd4Az4tAkRtnIeX2MxfQNzX?=
 =?us-ascii?Q?bOjjZ+jofK87rbpeUOUD5hmYc4HO/9XLroejfq2SEW1wvDqJIGxgsmFnyAyj?=
 =?us-ascii?Q?XM6IYpVvjGuXhquyiQt0lOYkWpMJGrkxXM/s3HPM5ZhDRxCUAooBPp++WvzT?=
 =?us-ascii?Q?kg/aUONZYN8UasFNyveHsJ5aVw6Zhku73CDW9xn2yTq0cBDIP4Xs2TbvzLDX?=
 =?us-ascii?Q?Qaoe3vygzMAgNHGQSdH1S+tyleLWT+jAAbYVYMc8ohWpm7Ql/ikBbbCVy3Xx?=
 =?us-ascii?Q?fB+OlrOLzssKKy3vhZyi4TvF6UaM3KG22lfo93/Nz4g05xGNyVQBUA2QjODD?=
 =?us-ascii?Q?gKOg7f6LSLWvYQ235obKabacHlQCRuYEb6ZYso5WDGY8ALYnfR+5pCevHf4K?=
 =?us-ascii?Q?ghlrosar4MFc9Y/yXbQ6i2PdH1ZRXDHS3wi7/Qe/sSKwmJCBejfMwxQNeA34?=
 =?us-ascii?Q?/KCnjjHCkNUs4U6DTD0rWGXHi1cNN8MH1hUk+HKIokQ22yPu2QRN4P9kCT9p?=
 =?us-ascii?Q?Ym6mjsX8yZBlsielb3hd7UIhKeslEKK/FiztbZcir7QX2dNJ045ZqvEoSIoP?=
 =?us-ascii?Q?ZKUhpp79ToGtPyp2fk1oa22gP6521Dw5dWO3rkTXEkzNriwao5Acc5MElc35?=
 =?us-ascii?Q?6xVT+deDkkjF2JKPmGTHCf3PEQCOmq+bpkXxfPSV52Bwo6PvG5CXkNfRcAfx?=
 =?us-ascii?Q?386IY8+E7x0Q469hBqpiylknXNNXJdA53eoal4oUKRRJJ4Q/igP2pLjdQXrl?=
 =?us-ascii?Q?whH/d5A95SQV3p01D2iYDcJXaiQ5P+2lHPjk2QpIs0baSVQRi+k4lLvbuwUI?=
 =?us-ascii?Q?S0ACkzNFwgsA3CUdDzTJmvuWNKAOF8BO8SIzL74ryymOjmyR8MCy2ypfX6Vb?=
 =?us-ascii?Q?OgAAXExFHF1HTXMGCCfb46k+dU2Lku7CwVw++eK+q1fkgIQzBNEW6s6juEj9?=
 =?us-ascii?Q?XdjuD+jmH1Ybl8XjkWzEY4n0GKLDxkqXNkYiiz99zAl9A+K6HVd8580CDxh4?=
 =?us-ascii?Q?quHbCZR0w1FOe6+0PxVHqpik7vK0Q095qxoKzoFxFfXhoUMtXNoHpwgS7HsD?=
 =?us-ascii?Q?5BjbnPxnaSObYRRDy6yesDDEcD7FRt4AXCZIvwLBe9WhPNGT+rbMEPHThvw8?=
 =?us-ascii?Q?qTDDj/Kcjda5ISSYAbbH+1PEOvzLankbUbQP6qd7vh/0lVhLIMRMr6EBEggQ?=
 =?us-ascii?Q?1iIEgblazYfxEXQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(4022899009)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 10:23:22.2160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2468d938-e8f1-4c7e-37ba-08de30c3a7b0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7725
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 01 Dec 2025 10:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19312

Hello Chirag,

On 01/12/25 15:46, Chirag Shilwant wrote:
> Hi,
> On 01/12/25 15:39, Moteen Shah via lists.yoctoproject.org wrote:
>> Add TPS6594 core and regulator driver modules in the initramfs image so
>> that the SD card can be probed for am62axx as it is dependent on=20
>> regulator
>> to get the SD card probing and eventually boot from it.
>>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>> Bootlogs with this patch applied:=20
>> http://serenity.dal.design.ti.com:7777/ecagupigod.yaml
>> Bootlogs without this patch applied:=20
>> http://serenity.dal.design.ti.com:7777/kiweziviha.yaml
>
>
> meta-ti is a public mailing list [0]
> Please avoid internal serenity links.
>
> Use gist.github [1] for attaching logs
>
> Chirag
> --=20
>
> [0] - https://lists.yoctoproject.org/g/meta-ti
>
> [1] - https://gist.github.com/

My bad, missed using the public link, will send a respin after some=20
initial reviews, thanks for pointing out.

Regards,
Moteen

>
>
>>
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62axx.inc | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am62axx.inc
>> index b66a2227..08111f82 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62axx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
>> @@ -12,5 +12,5 @@ OPTEEMACHINE =3D "k3-am62x"
>> =C2=A0 =C2=A0 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
>> =C2=A0 -TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline=C2=A0 =3D "=20
>> kernel-module-tps6594-i2c"
>> -TI_INITRAMFS_KERNEL_MODULES:append:bsp-next=C2=A0 =3D "=20
>> kernel-module-tps6594-i2c"
>> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline=C2=A0 =3D "=20
>> kernel-module-tps6594-i2c kernel-module-tps6594-regulator=20
>> kernel-module-tps6594-core"
>> +TI_INITRAMFS_KERNEL_MODULES:append:bsp-next=C2=A0 =3D "=20
>> kernel-module-tps6594-i2c kernel-module-tps6594-regulator=20
>> kernel-module-tps6594-core"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#19308):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/19308
>> Mute This Topic: https://lists.yoctoproject.org/mt/116553566/7030289
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>> [c-shilwant@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

