Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C7DE9E2E8
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 00:52:31 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34231.1770857548253222380
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 16:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=cdQoazOd;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.5, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRi2/JWkYK5WaAhRbj266p/CmqmEzHuwb3csmwiiJzR3KLru0ZAW0TfS85QmRDmGIccLQtBxqVtkcJG0QfMQST720Vqmp9g2PtMvnYQytAoIMAvfoOtkoYvvaDy1iI8CbPW6LhnOyU8GZKQIQPnqUoVBwgbokI4DyE4iRY4bObiFNDm5/K9jJoaJU5/YiuD1N7G53AzhTTB9ZvFeMavkVYDiKlNyXN9PqatewtOsmIUborbn8Z+HcQP9Ztug/GticTUs2WHl2J4/OM6EPPYs+nXedNCj3Vvklpaj691KC64tc2fludCs2TyFHTnDpfWbFhVPG4iiX299GaTJTIDELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXG07VUWNrc1FkRsv3YM13RAWL02K8BFcAOXJ0bzupU=;
 b=xruYyI5losg1SwzWMMlvPmFNdne2O+Fd55kMvGRZveN9YobA1IohGpl3EZ9OD+/jRCC1zXEt7hlBtoV/3RdsY74Ayb0N7dt9HEieBBFcCcYDDxGDgekAfeLY/E93GwX+Rz8xSjO6OT85impSfOv16nQBjG0otA063QohdqASA2RUyE6vG4iDBwEZBzrvIobPIH+MXU//Hy4yuF9N5Jz1QdhfO6RWdxWlNYDKGwmG6OXWFCk1IDf8bjuTnrLcuRNNWutlmp9iShA5Cix8W+jUIdCOR1dg3ddw2DXGUbHtY3cBI6AQTQI/wl6D5rfX6Qi+zLvppWsWG7ZVRsH9ARzEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXG07VUWNrc1FkRsv3YM13RAWL02K8BFcAOXJ0bzupU=;
 b=cdQoazOdwfhaNXITO/UXDSMnUwU+Zu4S9Ml/M94ZJaWNWjNpkyLvbFaqTbhfb7dpVfZpT3ST1aduiYDQJFw/QIli/w4B4cfnWupg1qftafW9SWWuFwT0nxOsNFGTnIvTM8tm0x/iowPr+t+N/ybiDvvnokVkAff5KlSLNhHLcNU=
Received: from MN0PR05CA0026.namprd05.prod.outlook.com (2603:10b6:208:52c::8)
 by LV2PR10MB997777.namprd10.prod.outlook.com (2603:10b6:408:378::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 00:52:26 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::98) by MN0PR05CA0026.outlook.office365.com
 (2603:10b6:208:52c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 00:52:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 00:52:26 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 18:52:25 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 18:52:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 18:52:25 -0600
Received: from [128.247.81.145] (ula0226330.dhcp.ti.com [128.247.81.145] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61C0qPPc2153349;
	Wed, 11 Feb 2026 18:52:25 -0600
Message-ID: <d0aabf72-f9b8-4864-b07e-7a0d4b3bab93@ti.com>
Date: Wed, 11 Feb 2026 18:52:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [meta-ti-bsp] SERIAL_CONSOLES defined at SoC level
To: <ivitro@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <vitor.soares@toradex.com>,
	<francesco.dolcini@toradex.com>
References: <4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|LV2PR10MB997777:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ea29de-691f-48b8-695c-08de69d0fd9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UTlnbGlLZWo2bEd2bS9pR2ljNzhUYXNsT2padUFPcXk0cS9kdXB1VGI0T3RM?=
 =?utf-8?B?YkdxSUdIT0F1bjNXRmtFbGRiekZyRVRBY2lzS2U5ZDdib2d6WE5DMkEydHls?=
 =?utf-8?B?U2k2TDVBRTFaN3pvYWIxdHYzeXdFTk5oc2VkUXZyS2lTaitlMXpyVWNmM3B4?=
 =?utf-8?B?bldBa0paeXpKbXF3VkxvWnFaNDRDUVN1NE40ZHdlNm93YWpRS09lR05XVVZw?=
 =?utf-8?B?RFAzK0NQYnNGejdjcDdXdEJaK3FRRW1zVFJJMlR0RmtpekVuQ0hqVUtUcGNW?=
 =?utf-8?B?UjFSM2FIREdXNnY4S25YT3VKOFFlQUpwL2tQd213NFVjTnh1T09ZL29rWSt5?=
 =?utf-8?B?VUxDdUVWcnpBcFdQa0xIY0pyTkgvZDFGNGNmWkM2c2tkQTY5VDlKVGdFYnRM?=
 =?utf-8?B?eUdUcG1WZ1ZmL3ZDMkh4WGtYTkxEc1NMcGlQWC9CdUlJazAyQXE2WFZIVnI1?=
 =?utf-8?B?WnlETG16RDg2NnZMeG9oS2U5Smx4SnVsWjFOdzRWMzhKZERmNEErVzZBVDBB?=
 =?utf-8?B?dlU5SkFjWWpVZ1VpOTJJOFJqTmQrUjhOdVpDUkxMSXRXY2hGNnBBZ04rRkVV?=
 =?utf-8?B?RE5tMFdjZ001b1dud0JJOU5NM2dnTGFCWVh3cGRQUFNTYi9hYXNHNUlKdXVK?=
 =?utf-8?B?YUoxRjJPMjRMZCt3MUFZSk5OeXVaN3VrMThEY0RvN2FrQTlKa3JkSzdrSm9R?=
 =?utf-8?B?UTlCVnRUWE5oSnVneUhMWTFtNzVuT1c5aWdCSStxTitzczhjc0hHeTc3T0Fa?=
 =?utf-8?B?ZHhaekZ1K3JPbHN1c3g3dUpESENpTjZtV2VheUNzNGJ5dkw0b3BubW1JdVlG?=
 =?utf-8?B?WEpIVkhYaGlyM0s4aStScklJRmdsYXFHUlA5a1R5ZkRTUVQ2RTNpQUZybGZH?=
 =?utf-8?B?WTY5bVoyS0FxaFFBY0laSzlXc1p0RE9DcldHb2Vlc084WGRvWHUyTWFMMmxz?=
 =?utf-8?B?V0owZkhXczJjQnpMbUdENzVKUHZPN0gwM0p1WUdXZFE4OStvWWJqcE5rT252?=
 =?utf-8?B?MmVnM0NaK1ZTY3JDL25iMGhlRHdoUDVpdStLUUM0aHN2R0FCR0ZlYjhwQzhm?=
 =?utf-8?B?SkVJVnl2NkZGdktMcEZXLzdUb1g4WG90d2I0dHlBYmN6bWhDRkdjdlV2SlVM?=
 =?utf-8?B?c0d6SGRBMWVIS20xTmp2SVBhTG12T0hVSGxBVndSZ3EwZXowUDJjV0dDMm01?=
 =?utf-8?B?Vi9hY0RKT2dPaWRBcGZ2dEgzZEtRU0lBK3JETTlGSUlIb1pvdUllK0drZXBk?=
 =?utf-8?B?VS9jeEN1aGZPY1JxVkpnQzZaaEZwaXVMeDc3a2RXS1Y4UkJPOXN2ZTJ5L1NI?=
 =?utf-8?B?cCtmSk9rbG1OdDdCYm5odG9oNXJjUGZDTFhTZWNIVVhGT1pFYmMrbEY1Z3RZ?=
 =?utf-8?B?ZXZ2djlVd044Z0lXTHlJQ3NJY1RhMEY2N2tKTVU0Z3h5dVNWUlhnT3JCblMx?=
 =?utf-8?B?cUhjWUNvU2lNYkNkamt4a1AwNjR6ei9DcTNtK0JsZFVYZDV6TzVNb2hpbWx0?=
 =?utf-8?B?OXE1QldxNlJkNUpOWEFPckNuS1VRMjV0UENDR1c4czdlZ1E4STlmNDlGb2ha?=
 =?utf-8?B?enFFU1JRVzFsbUpuMzE3VldGQmFrOU9CWDREL3p0ZG9KZ3EvdmV2RVJnazBY?=
 =?utf-8?B?ZXJpMlpJc05tTVFiTnE2RVpINitSRCtFVE5nNTZPQzczYzh0OGlSbkRlYll3?=
 =?utf-8?B?eUIrTmxhME9oNk9IcTl4QlR4alJpeE1DLzAwWXFEVlpLT0tkL0VPeW5DZnpR?=
 =?utf-8?B?ZnFGNnZUcTUyNTRsQTZtQ1pVSmZyS2NXak1adndmTDA3OG1MTmxjZnFmaW9J?=
 =?utf-8?B?L1VodTI1dEpzWUNEZ1JmTUxFeWlhRGR4WVVmMVljdCt6aTJGWE11WHRGY0Zq?=
 =?utf-8?B?NlRocDlycEFBWEhnTWN0M3Q1RWJ0YU14SytZUENINWVIbk1sY3VxVEZGaUpn?=
 =?utf-8?B?QTNaWVdlRWZtOTRnUkhQMHF3ak5HWGowV2ErVlBBK2dwaG9MY3ZnOTEvTjMw?=
 =?utf-8?B?NGxycWZKOXJCbWN5a01qY3hDR3gvcWphZzRTYVpOcWZyOGZnU3U5WkpHczRu?=
 =?utf-8?B?T3lNTk83d3grMVM2OVBFQ0NROFVYQnBlUHRVaXE0dGZpTXZaQzhXNmY3TE04?=
 =?utf-8?B?M3hKZ2tIMmV1SDFIbHZQcEp6NEhkMG00VEUwWXd1SlJORHR2WUN3cUJlb2F5?=
 =?utf-8?B?OFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	o7AfntL77Woc/SMCH/9LkIG/QCmuDF9CtKxPyfRGBP9cU0zh0f+n8zygjUDFn9cXMN83wCU9xGqVHp6Kw7RewUI9IafNJWVXl4ES2Lwu+JcZZVbno6zCTXdP0vd/39k0sNOslusgSWNk98KRbdR69M1ZApoLHy8hicAg7NUAkWoh9DDK3/PlYw9gr35KtZ4p4Zbd/0sHClT3epmrqHEfbaRruIAB9G3Nf2JjeXnJcrsf6UXm7c64preBgXrrehwwvm1Jg9cSBdVZZgm4yWTuzVZmw/W+Xdjm/b3ww/px1yXOcarMKNMCqJgkxW2uGLGBWe3m7eyxMudRKZRwL2OikUDvfSLGivSqW5n81JduZ6NZaMp79bxWDwCo7L2irSLUAJxXIl2Ni59ZQAyRYtIt+F6vB0iDdRdkJeoRSIqmkaVDT2FAAWnWgrBUV0pPeWOF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 00:52:26.1083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ea29de-691f-48b8-695c-08de69d0fd9e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR10MB997777
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 00:52:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19495

On 2/11/26 11:15 AM, Vitor Soares via lists.yoctoproject.org wrote:
> Hi,
>                                         
> While working on our Toradex Aquila AM69 SoM support, we noticed that k3.inc
> defines:
>                                         
> SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
> 
> This caused systemd to enable serial-getty@ttyS0.service on our board, where
> ttyS0 maps to main_uart4 - a user-facing UART, not a debug/console UART. The
> getty continuously outputs a login prompt, interfering with the interface.
> 
> This made us question whether SERIAL_CONSOLES belongs in SoC-level include files
> at all. Our understanding is that the console getty is already handled
> automatically by systemd-getty-generator from the console= kernel command
> line argument, which makes SERIAL_CONSOLES potentially redundant for the console
> UART. Any additional UARTs beyond the console are board-specific and arguably
> belong in each machine config rather than a shared SoC include.
> 
> We are not 100% certain about this reasoning and would love to hear the
> rationale behind the current approach. Are we missing something? Would it make
> sense to either remove SERIAL_CONSOLES from the SoC includes or at minimum use
>   a weak assignment (?=) to allow boards to override cleanly?

We simply noticed almost all our EVM boards used the same console UARTs and so
refactored the definition into a more common place. But yes you are correct
that a file like k3.inc seems like it should contain only items common to all
users of the K3 SoC family, and not simply common to TI EVM boards. Changing
the assignment in k3.inc to a weak one seem reasonable (although I think you
can still just override regular assignments after you include k3.conf in
your board conf)

Andrew

> 
> Thanks,
> Vitor Soares
> Toradex
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19482): https://lists.yoctoproject.org/g/meta-ti/message/19482
> Mute This Topic: https://lists.yoctoproject.org/mt/117760181/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


