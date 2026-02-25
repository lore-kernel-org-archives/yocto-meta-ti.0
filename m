Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF729FD375F
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 13:45:53 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45302.1772027145659679646
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 05:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=IqdlESNI;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.40, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRaNyQHAJ1ITGw7h7a6a/DfYzR7TedkqSeEMlj12oZlksH4Y+1JIx1jLMb0ePZSdl2cjAv7D/khxv0im5e6F6aGBNled6yBHGTIqKGKGG6XbCpTs2nPxGZmqeQF2FrBgU7wOFkp/49WRGAhby4/7efLugx0T69qrj9639xBFygcqSgO4cMwViB34MY91i/gT/c2txop1EdoEeCYuvW+8OlziNwGZ/5dQcLB7kM5cjqCKxyLxmR122XOKTkK/IrPd09a/rBZikeWYMA3OVxd4iVO+F6vwFRumS0lonEkH+He2yU0Xrbcv4ObcnT1X+4k6yk+Q450aPNg06BLqvaoziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGDfVovjPnb1DWQ7xwuwdL2Qww/Ob82k974XAOZFZpA=;
 b=U9iuJucxFP8fIL9LAefD9Fwv+2B4MUe3/LYk+GW509VpFDi5MobseuVE+fJd3So//Ua6Ka0EiZDYrPqiyQnGXuJbYmXF1Ry0lpDRH5JpWPveSNuKBCiGik/I49qiacv5s9r0R+eh27vxI4kH8pitUfwkbajr8ANMHuhAYT+Jmy0WmA/GBPkHQhpOsZJfGD3c/rD+iwAHPxhWW6S2CZ/HaEfGgL1ROUGmvsouFNs+xrnRGvZ7EkS9XB3YxZxf2t3ji6wUXXHQXs5EqNURBDHivh991lmSRVUQLqS7OOh3YdokZC2YaNtoIQTnxVu8BkSAYIrgMzrfNYFXLKyqhanmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGDfVovjPnb1DWQ7xwuwdL2Qww/Ob82k974XAOZFZpA=;
 b=IqdlESNIBYl7HgmrdeiplRpPC7Z0m72HhzllR14Spah1flDNoBLRvc7DfGsgxXYAuQNyerU7mq5pn6zYHpgr1rNa2Ok4/H4nX/L2QBI6WzqFZ6quOed6nX/XhbxjLgO9DYfJ0fgmeQQr1pyhNSqYulzi82CQ5Nbk37UpNzabvPs=
Received: from BYAPR02CA0071.namprd02.prod.outlook.com (2603:10b6:a03:54::48)
 by PH8PR10MB6598.namprd10.prod.outlook.com (2603:10b6:510:225::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 13:45:43 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::89) by BYAPR02CA0071.outlook.office365.com
 (2603:10b6:a03:54::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 13:45:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 13:45:42 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 07:45:41 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 07:45:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 07:45:41 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PDjeKV038155;
	Wed, 25 Feb 2026 07:45:40 -0600
Message-ID: <a786e795-8c3c-4b2f-9006-0a961e6a93b4@ti.com>
Date: Wed, 25 Feb 2026 07:45:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 1/4 v2] ti-rpmsg-char: Set DISABLE_STATIC
 = ""
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260225025155.2981821-1-reatmon@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260225025155.2981821-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|PH8PR10MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f2077d-e75c-4efd-f5bb-08de74742b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|82310400026|36860700013|34070700014;
X-Microsoft-Antispam-Message-Info: 
	O9HhRdZVJLROaGaqMtsmS3EYqqvEA8tcpfLNWUPwBTKVEzIPX5wEmIlMGo0BYhl9F3EBE96GUaHk+YIDGnciZa6Z6siMYp5+6iDbGqKeEZDs3oAv4NJr34gdK2Mx7bz7Ve1lxjrlmT7xJBGRn3rCagvcjFX05jd0lR9HZ/rV+itql/sxACiXOYMlppbOATdeVykVW+H9Qj8j7yeQ+SbxAUkmgIs0CzcQNWqkfwg1z9Lzy4Lzn/iX8WqNbXVFOHMyE4fesDcxtQowjENq36dY3/YP8Jfo5yZiLmHWjAHqCD6cEoC65s5u4qTrbOuKEpBSJrHEowCPKlnkFdayD43GHSu829A3DDL2JRlhac+hcUj1+6yLXLPEswVOuxt11LhJ7Xkx6yzVKn27wGsUiQioc20b82F7tlftk4dDhOC51cHbhZjh8t/51OWj+EtsIG9HeRYH2vEAfkW8mQofBIOxXmPTJF99ztVJ+TQftkIotbLuSdkthQFilXvOt3hyRQNsJvn/hVJ9Ce7ZDDjvjv12atzG9f12fwFIJJSG6BKWWmP2J0IIHG+Ny6iIle54fxf4AY3ufC8yye7rSUbKtL5XUC9wkodz8TNcVzGiTU3vT8/eCD6FC1yICYh5MRsXR49TyPwsIV7aB8iJLFvQ6eXIB+lmAlNViAruR9T2WX0g3kSXnv/QEgdSojKNw+ljt/ac+OeoP82L1dujwrRs7oAlTkP4ybX6lVMol9OMYTIZOY1e+X4NJZzFEUOr6iyYbG3lmGYt4ZzXg3Eo0Q7DjERNww==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(82310400026)(36860700013)(34070700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+IgTFf8kBT808xz2uSpOtDim6F+stSx2YB/TfteeUXX0zkgXHYm+wn4sUeDumjTC5dHlAKH0xZ3f2LaoxFUaqdyViomfWJG7KtarT6guv6D6p5WK3soAD5NMrSg38rUW+cC9UUCQAOuqkhZk3ELIxBkPjxolihkxOe+XulWvldVxeaReTCXSRNaspnvEswiHoq8CCeVlKwYuX1EqlwXpThG1/gdXqURG2mja53Q7L9RFiDonKWmAyelNp73ysZb59MDPdxr6FvtToJPA8llmfPXil4jfhn/e4dRmGXpbisUMGUZXyvhXhFsT87OwoGQeMThi0WpVQIOw6/MEK4WYJu6BgWypCe5uRa040Egd5VGuOhzkIHPH9HexHEVfzR2f9fRiAEoPqBAvKSSiIo4LvtTeTwaN11LRObx+9X/iV/ad+4JiM8uvfG4croaUyc+5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:45:42.5192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f2077d-e75c-4efd-f5bb-08de74742b68
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6598
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 13:45:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19606

On 2/24/26 8:51 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> As of [1], static libs are disabled by default.  But this package relies
> on static libs, so we need to allow for building them.
> 

Too bad this project uses static libs at all, there is no reason for it,
I even have a PR[0] to switch this project to CMake and over to using
dynamic libs that has been sitting for +1 year :(

(for those interested with access to our internal bitbucket)
[0] https://bitbucket.itg.ti.com/projects/RPMSG/repos/ti-rpmsg-char/pull-requests/14/overview

> [1] https://git.openembedded.org/openembedded-core/commit/?id=03fc931bfe9ea3fa9f33553e6020cbc067b24291
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Moved the setting from the .inc into the .bb file.
> 
>   meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb
> index 63711a3b..50565300 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char_git.bb
> @@ -5,3 +5,5 @@ require ti-rpmsg-char.inc
>   inherit autotools pkgconfig
>   
>   PR = "r0"
> +
> +DISABLE_STATIC = ""
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19601): https://lists.yoctoproject.org/g/meta-ti/message/19601
> Mute This Topic: https://lists.yoctoproject.org/mt/117988928/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


