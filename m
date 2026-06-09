Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD652CD98C6
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 22:54:31 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8299.1781045662803083158
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 15:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=K1EF7QK1;
 spf=pass (domain: ti.com, ip: 40.107.200.56, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGDo0u1+zNJLAIMRRdZf1eaENcvahBij9Yb+8WbEGvkAPxgcgVmeQmQNO159iAt8jT6iFIJYQ76biUk23ofc5opdy7jLTHPAa8z7E4LiHqyoocxkC+48J896L0fkjTTTxER04phut+ttb1I4xyV8ZZoI1BvPv8wJadWlKSRz9bCxI1QH/QC/HcjTRoMn6tBwrdanGtZ1jrHuSUbOomcseBuB1K0S0gs+xQgz19DenpCTy+g4LCIL4FW5FjTTt4imX/4iqlvIu0dIVVOhflv07b5XUV/vsPqCafvtk1YTNmsOJS4bCAGMUc5q4PxM8DaKh0aEE5MlCbjYGNKT7qqixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvqNk4Tbs/gLLlRtNCCdpmDLEc03sqdHTeDf9kyQE/Q=;
 b=xOY4FnfGy6o9xH7gCCmT1D1XEBKZ6MsiwhbIjZ0DNCsl93RrklsG4SVd95aoCHfNia2+q1TmPcX1b6CPxCszoO5QXARtHY9ZpT6E74EA++aB+iflounKsRBRUwdlyZITziGYAF2tQuQXsk9qdpnRBNmrJBhNkCbI7ZQewWwNZw5KqGtHtrAq7aIPaf/kJzK2xqc9NZ3D+9hljD1W8rmF4iwRGVLkSUo0Jp9WftcNmDZUNC7aqSl+glEiIQpYY0wO2wQixTPI9V16w+UrFu+YckiCHHGWhL6rayVWHAEhly/J1dwaNimPJwkfBlYsF+JTYqd5/wx/Xs6Ams08qQVbsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvqNk4Tbs/gLLlRtNCCdpmDLEc03sqdHTeDf9kyQE/Q=;
 b=K1EF7QK1kk48X3nnnaHlMaZd78h1iBYsFZWAFtFgtzWb6x+HcYQG6/Yj1TveMr3zsfbJyC4I3aHb9kVO0xpb295z+BsTeYYpaFV48qb+uFyAYJyCm1qEEtdk5+tHlXzoZEIMqrPqV3VmiQYhdhvzFyEuw2c9DjlQAPGBygV0K8g=
Received: from BN9PR03CA0629.namprd03.prod.outlook.com (2603:10b6:408:106::34)
 by BY5PR10MB4371.namprd10.prod.outlook.com (2603:10b6:a03:210::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Tue, 9 Jun
 2026 22:54:18 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:106:cafe::28) by BN9PR03CA0629.outlook.office365.com
 (2603:10b6:408:106::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 22:54:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Tue, 9 Jun 2026 22:54:18 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 17:54:17 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 17:54:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 17:54:17 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659MsHb32019247;
	Tue, 9 Jun 2026 17:54:17 -0500
Message-ID: <a388f348-5fc2-4afe-bef4-f6e837aebd98@ti.com>
Date: Tue, 9 Jun 2026 17:54:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] conf: am62dxx-evm: Fixup packaged
 overlay list
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	<meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
References: <20260609202801.18252-1-jm@ti.com>
 <2da95be9-31a6-4224-9706-323e5d51c2fb@ti.com>
 <20260609205307.GJ23325@denix.org>
 <fe136348-e605-46f2-8cc1-52ff83578e33@ti.com>
 <20260609224658.GK23325@denix.org>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260609224658.GK23325@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|BY5PR10MB4371:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d060fe2-84df-4dd3-8783-08dec67a0999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	HZoUo0TVZZSCTpVESETrn41wCax1GZBSu8BWsjHTAbPnT3kou0xplM8CpaRIVP5fdzRCFX09hbWav8Ymn7/7UI/i+8LilbtbW4OosFSP8SAJW4OPhD3WbbR7OTl59ysvpcersfC0mWAKOMtYpZjICfvAXeEhum5ll4QCz6NcNu1cfEZr8HCGqdkCXtwQF30rx366xn1jOM2R47Tt+QaCqwNIpAwEQZkG+e1uj0n48IF2vURSXLlKXR+ZCmZye+AADgdo4raeYC9yEULB2nA4gUzpkR29C9OOJn9PmsKzmnef+Jd6kCUAxtaacVlYOBr4+7ZJ0MnfbFvfMU9H2DHHV6+mU0HtjrRGCcuBBvMuvFsJHA6VZBPu6zVW6wdzUmPtkamtnYeEzD7XsE5MKtwouUQ7Oj481FrETwW9pNC0wYkE58aWAIARUm3d/OpUdt/ygiB8ER3U0OZwA0nvqBPQHfd98cZcv/sA5QoXEry0wqOWZwUTG3w9sdUO14w1qxClurO+JVb/s1oENCMU3PlBWzIUJezFBL4kN14LE+52mvUf0rCTJrVL5NMeE7+05lAWqc6EDaawS77ArDqMuetY5oJCj7GCiW/3RDtaHAESlXGWq4u00HIrIxVwi6GyGFlW01y6DVpjTBqXdnQxtEqJcX/JXHvisUwcaayc7dt+VrZUMRV2bj/dVAoW9FckjPwDAPvYPWkM5x2X/ByjdZlOBTXmbvouFW9BHUno5RcsDh0=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0J5CXnSILpBzhM0gf19PtKpUWtEPMLvK8OApEstkgmKG0lrJNBu34aVsfEAKH2G2Ix23njhmHDVl32MqcSbURDDLB7z9At63Tc59he8ItfGCYUzB9DBtv07pa0n43wMjPGQvCZBhUgUdjUvC5NrFaZj3GKfj8q37KOAOet0zKQem4M4J6VEMrs/lLU0pzo9/NulylHaK/q0Zz4cwtm66Vmn8EHCXg1oCZYWY5cnVLUnZrML6vdfHs1a5uReO6cZCAi6/iGF+a+b84MC8KN0DctnTu44GtpmN1zLB+Y7kbUcbHr91mRJV2BD+TWCe+139amRg/mWo7nW0cdWis9KjvqQ7keimShgOvu6N/t4O4pze9EthGmFoI9ZGq+EE5XTWRefGftlG66ZKKKwjbiq4Bsfme4d5Ro+CpuGUWT5ZwlMZmVyJIB/57fiachrTLpi7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 22:54:18.1420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d060fe2-84df-4dd3-8783-08dec67a0999
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4371
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 22:54:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20004

On 6/9/26 5:46 PM, Denys Dmytriyenko wrote:
> On Tue, Jun 09, 2026 at 04:07:51PM -0500, Judith Mendez wrote:
>> Hi Denys,
>>
>> On 6/9/26 3:53 PM, Denys Dmytriyenko wrote:
>>> On Tue, Jun 09, 2026 at 03:45:05PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>>
>>>> I assume this is for wrynose as well?  If so, please make sure to
>>>> add it on the subject going forward.
>>>>
>>>>
>>>> On 6/9/2026 3:28 PM, Judith Mendez wrote:
>>>>> Some k3-am62x-sk* overlays no longer apply to AM62A/AM62D boards,
>>>>> update overlay list packaged for AM62D mostly to include the new
>>>>> k3-am62a7-sk-mcan.dtbo without dropping applicable overlays.
>>>>>
>>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>>> ---
>>>>>   meta-ti-bsp/conf/machine/am62dxx-evm.conf | 9 ++++++++-
>>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
>>>>> index ef9df2f7..c776ffbf 100644
>>>>> --- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
>>>>> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
>>>>> @@ -7,7 +7,14 @@ require conf/machine/include/am62dxx.inc
>>>>>   KERNEL_DEVICETREE_PREFIX = " \
>>>>>       ti/k3-am62d2 \
>>>>>       ti/k3-am62a7-sk-edgeai \
>>>>> -    ti/k3-am62x-sk \
>>>>> +    ti/k3-am62x-sk-csi2 \
>>>>> +    ti/k3-am62x-sk-ecap-capture \
>>>>> +    ti/k3-am62x-sk-eqep \
>>>>> +    ti/k3-am62x-sk-hdmi \
>>>>> +    ti/k3-am62x-sk-lpm \
>>>>> +    ti/k3-am62x-sk-mcspi-loopback \
>>>>> +    ti/k3-am62x-sk-pwm \
>>>
>>> Why are these needed? Shouldn't the first removed more generic prefix cover
>>> them all?
>>
>> Its explained in the commit message, some of the am62x-sk* overlays
>> no longer apply to am62a or am62d. I did not go test each overlay,
>> but for now, I removed the overlays that no longer apply to am62a/
>> am62d with this change
> 
> Yeah, I saw the commit message, but I understood it backwards - it sounded
> like the prefix functionality no longer worked with a generic prefix and you
> needed to list the overlays more explicitly. While in reality the generic
> prefix now is too broad and it picks up unneeded overlays for this platform.
> 
> Please disregard my previous question, but if you are going to re-send the
> patch, you might want to rephrase the commit message a bit more clearer...
> 

Sorry denys, recieved your comment before sending out v2, if needed, i
will send v3.

~ Judith

