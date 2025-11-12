Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B674ECD6E7E
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 15:01:39 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10802.1762945139500813248
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 02:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PohNdsqo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.4, mailfrom: gehariprasath@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGnvlIW+8iZEfNe6+Bf7M0ey2AduLar4PiqTBvUhBUJJ/LGY09y0nwpVrDgVfQVtwDsJ7k7AMYTNhpahHCutBYjBSYUHiPuuWNoqR+oEmS8LLIiBs02sNBteD5CPTW00OfW343lGe3UNvDdXDaUWjISwdloLcVmGk44Feigy72WMUeIahrI6PIJbxXIQLAyYXi/GhYRtRnII4cbOxezkRD+aQqh8nTw6iAwt6O4LMu8uaP3WXKhy/XrNIPAVgDeoMvGRT53KAtjkMuQypRdWrdQbUSZwwJd2OfaqNKWnQTwr66C/Cs2nXlKcG0K7kIvgi+Iy2djwX+3r7CRMdL84Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CghkYfp5+mXjmM0vU0PXYkA4nk1YKRto/U1XObJBBQ=;
 b=JG7PPPt7J47RO8ImsWg5WNVyhhUftWkzENg7gJ6ASN58p43sn9q1dOcuUWIymdQS9EvrrrM25CWivxpG3+ilWjgvgtLOgbVhg3ieXjL5yd1gkb+nGnaQ3Q6qldKIeoYlctGgKLVoeB7uP6eTLCeyaTeI3qzPn6Kj9iBPl8eQFU+U6rEES1Nj8SvLYAXNtL/TQ8Kmp+8bmnPQ0JOg8zeMst+R04VKbkA+wueTfE6Hut2JU1SLWjhsLtT6oalGEpacLCjnWv1JP8x8A8jUe4jlRvoQ5spHIsrHmiDGXKwwNL1n+rrOoXU1ASk9U6dD3xAbTyhgZCHKhHRcZlbBr92h5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CghkYfp5+mXjmM0vU0PXYkA4nk1YKRto/U1XObJBBQ=;
 b=PohNdsqoMNh4+H1pX6c3JfiuRiNE9wp5pvmKDIZm+BCs0S2AmqOerXpnKT0hTHTsdi96o157Vvip5/nArRDXJRSD3IqerB5NQNxLU7zdAq91Yvcbyx3zwUaUqqLqhPnpOE9s12ucpZSsRiU57sFT7THk4lfh+3EcB1Un5ri/nAA=
Received: from SJ0PR13CA0140.namprd13.prod.outlook.com (2603:10b6:a03:2c6::25)
 by MN6PR10MB7544.namprd10.prod.outlook.com (2603:10b6:208:46c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 10:43:59 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::5f) by SJ0PR13CA0140.outlook.office365.com
 (2603:10b6:a03:2c6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 10:43:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 10:43:58 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 04:43:52 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 04:43:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 04:43:52 -0600
Received: from [172.24.235.213] (gehariprasath.dhcp.ti.com [172.24.235.213])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACAhoTl2518222;
	Wed, 12 Nov 2025 04:43:51 -0600
Message-ID: <7a9a4f33-29a9-40f8-b0c7-9451d1199d66@ti.com>
Date: Wed, 12 Nov 2025 16:13:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] conf: machine: j722s: Fix overlay name in KERNEL_DEVICETREE_PREFIX
To: Anurag Dutta <a-dutta@ti.com>, <meta-ti@lists.yoctoproject.org>,
	<denis@denix.org>, <reatmon@ti.com>
CC: <u-kumar1@ti.com>
References: <20251112061742.2741418-1-a-dutta@ti.com>
From: Hari Prasath <gehariprasath@ti.com>
In-Reply-To: <20251112061742.2741418-1-a-dutta@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|MN6PR10MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b0510e-82b3-4b39-5a84-08de21d862e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VUYxQlRYQmlFWjZqVEZGTld6eWwxQ1QveEJhdCs1bEdsR3BMb0Z5TmZjZEFW?=
 =?utf-8?B?SmJ5WHNiUVROTnp2dGJZdUcvckpjUnkwV3JsNlN6Z3AvOWsybnlpQXB4Tm1t?=
 =?utf-8?B?Y1ZuNXZxZDNJT3B3azJCMG9MTlZEY1ppUXgxajdVZzhnVUh5eWZyVmNwbksy?=
 =?utf-8?B?VlFjaEZQeVpHSjd0cFdzYlJmVWdndy95TWpqcnFDR3FvTmRlN2d6eHlZS0ZJ?=
 =?utf-8?B?MEZ3S2g1bDZvY0l4dmVEbm9lVVRxNHhvVHNadERwVFhQVWM0dkxyOEVWOU96?=
 =?utf-8?B?eFEvcndZeitiOTVzeFlhdXZLOFNDQW8wcnFnZFJHbUlDdC85U3JLNFhGRTBZ?=
 =?utf-8?B?a1dEcEFSYWkrVjhYclVFRlVIcEsxdEZ2RnRJWFBMUE9KZkxUd2JCV0YvcDJQ?=
 =?utf-8?B?bEpZWEFaeGRQUytVaXBDMDV4QXdoTE5odFpZZzN2dTB2QzYwREhuVktoNWNv?=
 =?utf-8?B?M0Q3Y3A0UU1ncG1Vam1nVjNmSEMxQk9tWWlYQnFvRWJsV1JpK2pUL0UvZlRl?=
 =?utf-8?B?bEYrN2haU3ZWa2tpejdBK3JzUUFoOG5sNmlrTkVZaVZhSFg5a0ZHa1JlVWJV?=
 =?utf-8?B?dXpVSnZvUHkzUy9mUk5UUnhHZGp2TC8ycGFFTHdIZXZ0UnBjU00rMmV5Nm56?=
 =?utf-8?B?ak1oNFQzcVEyUG5lWUU0eTlNOWNicDhSdW5UNTRIbGEyT1NCYTVwK1E3ajA2?=
 =?utf-8?B?bHdmbzZ3L3Z5aUt5OXJTZGN5dFBCQTNCN1VESmxpYTRhcG1UTE15SWZ4WkNT?=
 =?utf-8?B?YWpmbzFFMFRYSFFGZ2Q3ZStpOHB2bUE4UHg3cUFZakJVS2tLL2F2QUp2YUpD?=
 =?utf-8?B?QmMrbzlYbk5BWEY3WUVna0NkUVd1cVg1RjFEcW03eG5TZmZURXVqSzFESG1o?=
 =?utf-8?B?T0pSWVlSc2cvRkdWaE0wWTJUbG15a3dlYmliZEFFcUFueFB1OXZJa2J4SDAw?=
 =?utf-8?B?STFsbDBRclFhUWF2NWNUcmtMZjdUR2s4Y1YzTFA3RTNPbjNzcDgyWG1ZZXlW?=
 =?utf-8?B?N25ZMU8yQTZkeVVMcFRaWUJBdmloendkbXU4bmUxWG9vbkZ4OWdxc0REbFFs?=
 =?utf-8?B?aDY1VDkyL25xOUV6ZVhsVGpaZ1VJUXczaGdkOFFuMzZidFIrOUJuLzhiVHE3?=
 =?utf-8?B?cTNWbnpsbFRUUFluK2x2WmZVWkpNekk5MEU2SDF0TUlvUkZFdEJHeHdYS0g3?=
 =?utf-8?B?S0p0bDJXNjN6b2JiTXdSdU4yekxmNVNFQ2dMOWVhUTBpbXFLaDFtSVNRQWlx?=
 =?utf-8?B?UlBPRFJLdXFIMW9NT3VjQnVsMXBRb201WnJnb016Rjd2TmNQT1VHWUh4cnVv?=
 =?utf-8?B?a1hsTUp1MWI2SWNTTW9lR0RlUmZDSURLTWtiUHl4aEVZWjBjSUI5c0p1M0Qx?=
 =?utf-8?B?bWhuR01HSnhZejNDYXJoSU9Vd0dxR3dNay9UT1dmRWx1dHRibk1kVnBhMEFq?=
 =?utf-8?B?NnRRTWI3RTJKVDdieEI4RWYzSGo4ci9QMjNyTGIzU0ZNOENoZWpoamtGQklV?=
 =?utf-8?B?TEF6em5NSllrMUZCaCttUUpYSmR1bUYyS3FWZkZYQWQybUU4YnV6d1VaWHps?=
 =?utf-8?B?cWlVODhkWENuWGdMMjhJdGFBbUNsUWZUSHV3RzJ5L2l0T04zbjBoRXREc3Vq?=
 =?utf-8?B?NmxNVVpOYVVwSmJ0RXZGU3lZczU4Uk5KVmZ4TG10YmNackxlRlJaUDFCY3kz?=
 =?utf-8?B?UHFrSmhBZ3JUWi90T25WTXlqVmxDT3l1VzdKNE1rRk80aHVOOHFramliMStB?=
 =?utf-8?B?WnZ1blNwK1JBZkNRQTlCWlpGNzgvMm42elhmTlVLSE1uWWtXbHU0SjNNSHJv?=
 =?utf-8?B?UW85eE8wK0hUVGlqaFQ2UFpIUy9yRmdpaUFxaTZ2TGtTY1VYcEZHc2ZRY3hB?=
 =?utf-8?B?T05XU1JTeFZDZVhFazJoN0hkSDlibmJFczNGRUFDZnJhK283UUlGYkcvMHFj?=
 =?utf-8?B?Q0k0dU1GMnd2d1NWRnNPc3hsSVJqNXI5YWpFN1RickxtMHdDTER4Y215ZkZL?=
 =?utf-8?B?K3NZaG8vWTBmdUt4ZTVNWjUwRnpGZ3p5OEFiYVNZaUt3MEdHdklHa0wzb01C?=
 =?utf-8?B?VExlZVhOcysvdG5LRWxiTVVra3NXL1lHQXZ6SDBVbmJDY0hQK2d3eHpaQm1O?=
 =?utf-8?Q?Q4lg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 10:43:58.7888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b0510e-82b3-4b39-5a84-08de21d862e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7544
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Nov 2025 15:01:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19272

On 12/11/25 11:47 am, Anurag Dutta wrote:
> Currently, the overlay mentioned in KERNEL_DEVICETREE_PREFIX in case
> of j722s is "k3-am625-sk-mcspi-loopback" which is incorrect as it has
> been renamed recently. Change the overlay to "k3-am62x-sk-mcspi-loopback"
> in order to carry out SPI loopback tests successfully.
> 
> Fixes: 3b2097d72758 ("conf: machine: j722s: Change overlay in KERNEL_DEVICETREE_PREFIX")
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>

After confirming the renaming of overlay,

Acked-by: gehariprasath <gehariprasath@ti.com>

> ---
>   meta-ti-bsp/conf/machine/j722s-evm.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
> index 52a6cfbd..8d69a23e 100644
> --- a/meta-ti-bsp/conf/machine/j722s-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
> @@ -7,7 +7,7 @@ require conf/machine/include/j722s.inc
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-j722s \
>       ti/k3-fpdlink \
> -    ti/k3-am625-sk-mcspi-loopback \
> +    ti/k3-am62x-sk-mcspi-loopback \
>       ti/k3-v3link \
>   "
>   


