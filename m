Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A6ECD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 23:11:11 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33769.1781133064187202381
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 16:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=EPNd0VvE;
 spf=pass (domain: ti.com, ip: 52.101.62.24, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DH+qJvQCphc4dG4i1b+1HvUKwYfSxrrOOligVp8S0beU5VemyEgRD7gBiLEt+VqpD6Xj8U4cL0g9kE3MRADyU3WCAATqiQesTaRBDf+iXWpoUQtHcCVEjPe9yDu7QiTINyArpVJ20hVhpT28Z9rHf7AqR27XQRLLQMq+PLT8z9y61bi9rBO2Wuf4THI/j8qajePgnDZRW7X3IZcxdCl/WDaAjwLps6Xs8XtxhF4DV7/fhg1a84qxfqPWKTcniJybOwpLSTB4JuQj02OjH2P8bVOy6MoGcvTzNBmLFihiV0SHc1vm3IrlcEf3g8/9Sk9733K7hCiLsFzWHMpI7ogQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QH2gYtV2OZlgVvXkXyKA4A3mY5jovZOTcnIRIm+oNKQ=;
 b=Ps6XxkMq6NWVcPf39+OqUi9r1uho9RoxanqC7EAfYqCRtnG2a+s02/QWBaWUd9aCaRe2xD5C7aRo9XXI1UZNnxBD9YAd0zHhgoFO/15VwXlCplH8fDyrRZLKg1M/YfYS+1dFyYr0koltkuuYNunhvZsTBfhFZnjF6lqKL4zqZybudxxl3BFO0VxkT2x3wd66OVthImGS4SdyI87oIArlfcZWsjemlbKshq1vZcTMrjpY6362p1Q7DmC/kGXDXx+Ic8zQCrNwSAEaVE8ubiX1of3/9QkaXeJgIFrFPlPcLG+eGuFtlNqZlEM/gk6/zMEDoJpjdXNWLPSIj8U9lGYg4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QH2gYtV2OZlgVvXkXyKA4A3mY5jovZOTcnIRIm+oNKQ=;
 b=EPNd0VvEzlPl9JgjgELdMBrbFFLXariK8SPIp8Cl1Q4ed1Nl5QZWtfD5ITpj7bqDCQQHNSG/+nQPbUVcAmjSNewtaQBpeUfc2dfPkihEcR/fEbGQSrtJFuOoze+cjM5d/DTJ4ciFRVHz4V3bM79xXz9oG5Nj5Bj5V3XAwnJqE/k=
Received: from BN9PR03CA0629.namprd03.prod.outlook.com (2603:10b6:408:106::34)
 by DS0PR10MB997624.namprd10.prod.outlook.com (2603:10b6:8:315::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 23:11:02 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:106:cafe::47) by BN9PR03CA0629.outlook.office365.com
 (2603:10b6:408:106::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 23:11:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 23:11:00 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 18:10:59 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 18:10:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 18:10:58 -0500
Received: from [128.247.81.216] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65ANAwHE077325;
	Wed, 10 Jun 2026 18:10:58 -0500
Message-ID: <34825ca9-9b5c-4706-a2ff-6f5311fde8b0@ti.com>
Date: Wed, 10 Jun 2026 18:10:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from
 v24.0.1 -> v25.2.8
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <18B7DA0BBD971E15.267903@lists.yoctoproject.org>
 <150e8bb6-2aba-4292-8053-51231e3e0928@ti.com>
 <20260610230522.GL23325@denix.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20260610230522.GL23325@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|DS0PR10MB997624:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0e7860-0c64-43ce-f25b-08dec7458962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|22082099003|18002099003|3023799007|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	ttAxleiVcd/gvNB6N9xo3jOCUOFhGX4apubhQjpog7wKGDQ4oS7kUjNwWQMAJxyekmQPBK7drZRhgTC0MIFmRr9SnQhuuPhVeiD1JTcXuGTPegYg1ACFW/Ur4XKrnSwdiHxLHAFrhbfA9yMGM2mq+PqMDsRtpwtOHeZRAthkjM8bLkQz6ldWFywexUWnMfMs3bOF+vegL/tVFn8Uh+al6EE/qH2+EQMK7OCSUyJ7SXx2tW7JUlcBm/R+YtPOUmTuXOZtAtRmagAe0DRAAiiOCR0deK9gSBGOtwXZY/UjhdLKNDwwZokgWal5GE4QMAJS5MfxjhhXpa1Ms0KvjofSvauvQcHWMgZOe1OtBEOej0XlzCJ88pJ7zUvhpY/kEC00eiFuqJ3e7Hfk8yoHsN2S/60vSWNJ6HDVg8IvFS+QiuIIpocN/Lx29cCjGSZJ0Pw2j5V+ZKsnOi1b+2BmIRr1Fuws9STl6TO9W8Z7z8NBgyFUrt7wM0DCDTb4CB39g0b9T40KWVe+pBuXQvvHsjZizPIIqy8Po5d2xWgeByKE8GMSpUGbMd95dP6wdIgDHTa3J0x5LHlZUtPOm6hsVwYpGt54MF51qgVXYIOP7pXIuiREA9gGWd68YxqEIarjJsvgkTnj5X4eEwpBPQ89waygmVUR8FauE8T82q+mPKhGPZ3ulJk3O0/rfHA1lhBFHYQqHHYTsy/OlI1ZtvD+hEiNGtp6J0e6uZ1IwsLxn9U6PQs=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	L10+0HN7O8ZjSANRfLEgFytEp2wTxJf+8Ix2HrGYOTpzeJ3//i0fEh1zALAInJpu9HKNObEtMOrhuHdZAuAk3pNOTJv6KaSEHZIY4PcZlA7LBmP9pPwpUDHvmBjS+80N7G10hXt54RkUoIU/AB6SOwO0w994AZN8e0FCxCD6DYQAPaAOTRMtVn2J079o/7I+cxTYxczo1LLx3FsTC803ayCstRf/6gfGKHhoPS/DSV+62Q2iuYwVZCGlfSrB4YhAVoRLN1gguwjPQnZPLfAYjM9o4WpFhV3uSKh8CY68EuOnetvWQPwe93EhlkO2QcoayA0VlqptG0kMTwCZEg7yLnuhNwvvGq18Fgpf/EWqNXcOKAWs0AXDL0z5QGu82oF5ujUDEYaPaB/Vx6en6fRDw6loJzwrLhGa2oYzm6VJtitwCekkOYx+fUoBaUEev2aU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 23:11:00.3643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0e7860-0c64-43ce-f25b-08dec7458962
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997624
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jun 2026 23:11:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20015

Dear Denys,


I remembered your previous advice on this and tried this out before=20
sending both patches.

The diff that is generated is too complex and difficult to read.=20
Especially with the way git thinks mesa-pvr-25.inc file was created.

To make up for this, I have described the changes for the=20
mesa-pvr_25.1.8.bb in the commit message. And the changes on=20
mesa-pvr-25.inc can be tracked via oe-core, commit sha: 2c0c7c3e5b71.


If this is still of interest, I can send the formatted patch.


Kind Regards,

Antonios

On 6/10/26 6:05 PM, Denys Dmytriyenko wrote:
> Please use -C and/or -M options when generating the patch, so there's a c=
lear
> diff between 24 and 25 .inc files. Thanks.
>
>
> On Wed, Jun 10, 2026 at 05:58:44PM -0500, Antonios Christidis via lists.y=
octoproject.org wrote:
>> Dear Ryan Denys,
>>
>>
>> Let me know your thoughts on the overall patch. I am particularly
>> interested on your opinions on the following change:
>>
>> On 6/10/26 5:51 PM, Antonios Christidis via lists.yoctoproject.org wrote=
:
>>> BSP_MESA_PVR_VERSION:bsp-ti-6_18: =3D "2%"
>>
>> I wish there was a way to use syntax like
>> "BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%|25%" or even
>> "24.0.1|25.2.8".=C2=A0Is there a better way of enabling this logic ?
>>
>> Also already aware of the extra ":" post-pended to the variable, I
>> can send a v3 if that's all the feedback.
>>
>>
>> Kind Regards,
>>
>> Antonios

