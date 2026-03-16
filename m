Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780E9F506F6
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 22:20:08 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63413.1773699604898074873
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 15:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=guCQafI2;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.0, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVGFt7U26kTo6jDsbPDKFwg3N3mVCKczx/Q5nLKHrWGRdV9ywf7R1yo6snWCWYSrxjz58aiHJyB4WMMSAoa7Nasf4TwKdjyce2CjFe6SsUAy2lXLIBvWkY7tQeU8TdMUIsAPbJwVGqbykAdTDHyizDl2jLrv35hEnOzGzP2RfWHGWIYp2AslxrThtJUNxSxAYGjzt0+ot25NuldssCQaxBzETuflTEz5tOuWb8b0ZlK3lIWz5ArioudSMSvGSCLuY5XbVpM9uHwmT1bomUCwbF2OvTI5CzYrH7jgl2Ukm1EMvBcB1vDUzSdEgiz11rIOF9TvpPsR0XIkKqWEvanyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rr3X06ofAhnYTiGQ1S4Wgu7/l8YZsMJ1R2a6dcr/HEQ=;
 b=AreM9XbpSSHfAcNiSxScdVXwdJGzEmbQVmqx0ycAQXkjUCxepqprX3996b9zq7E3KolV1/HmI78QmOpHScKvdbB+QkS/zVSf1vMtkRq7qX317eq5QSpw92rLj9c3JArc3Nv05g9NHTM+FYGZIufo9uz0vXPpwNBIHy237AvMrwaSq1XfKZKfqGF3E9rKBj7ODoRC1ksgPJBBfOulPYndI9a6K/gD+gpyAp4HsksueKu2TjgZrobGja4xq1J4ehVK2efAB8Tdul/EWitNZ9MH2U1IAIB6mRzvLyvG2nLt8JLQMQfN/fkJHAvXKpdzyqdmMD0bQjCnFnBh9O1pPi5OPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rr3X06ofAhnYTiGQ1S4Wgu7/l8YZsMJ1R2a6dcr/HEQ=;
 b=guCQafI2Yiokwv6hlea6gmAhIjAqWLLyQpYd8vV/ztZ87Aejsb8Yax/6NhrMvi1RdL1CM9GCkU13VoQQGHJXQbhh4gz1OVudaVbTf7vXc2sVBtMy4juMv9/rPZZKG5cckbUSrdvdl2ngQx15GSlh7+jxNjKfAQnQwWPAWOk3LIQ=
Received: from BN9PR03CA0794.namprd03.prod.outlook.com (2603:10b6:408:13f::19)
 by CYXPR10MB7952.namprd10.prod.outlook.com (2603:10b6:930:d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Mon, 16 Mar
 2026 22:20:00 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:13f:cafe::ef) by BN9PR03CA0794.outlook.office365.com
 (2603:10b6:408:13f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 22:19:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 22:19:58 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 17:19:57 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 17:19:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 17:19:56 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GMJukO1549173;
	Mon, 16 Mar 2026 17:19:56 -0500
Message-ID: <bc7280a4-c758-487f-9780-f56eeb945993@ti.com>
Date: Mon, 16 Mar 2026 17:19:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] conf: machine: am62a: Fix
 overlays in KERNEL_DEVICETREE_PREFIX
To: Judith Mendez <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>
References: <20260316221815.2502448-1-jm@ti.com>
 <20260316221815.2502448-2-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260316221815.2502448-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|CYXPR10MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c2e332-0d9a-469e-e62d-08de83aa28c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Tsc1qcYLbXG27ThEJzaLRUYut39soFHqF9c6SsecN93BIWNQyt/i57rT4+GlW+RKbKx76/OF12GBxOPAqet+FY8IQi4fpksr5TUnAXJyOO+9TH2K8uq1Uv1K6lFgQ8+38w44ZHfXzjfF2v8fvP9LY5Br8y8geSt8FWz/Qju8vtyITI13Tu65pFrfyQQ/LEzveBzvgHA4lYXABZO5UDT+jIhaG3n7WuzO0KB6cN+fqtq/APQC/NynPujCDuFFuo5YpLC/SjCe8VRr9f6lYUBkopzmy3EcBYUaLgiKDnXZ/47RJ0DSTrD1zwHwS5w0Gg9H9GbqvLuQ9X2O0ctgNZz2N+SVOzp4Ygu4ZSsZBRi5CuvjUl7zfouarqNj9FtwkZlhUvv6hpRj4hRlMdkYh0MeMHl4IoPJFIr9KQwyyZFj/tmI3JOClLTI7035Edin0ZkS6Ubzef/Xiu1mR+lZYq8AqTMoLcHwiFWlOfVIIo/0HcgPCQWW4YOr4iK2qyV06h3/MNhr3wXgEmnCvbZGPImYQheIvB9ub0KIyZo12a20NuLeFyYEiV6ARPDU5JubeD8BkbhbiRV1o4RusJ3S69xKnWiAfz7pftNZAVBPnZomVz+CPGMIMfSj9YkKRkVSWRUqxHM94huIZS8bYXg0jMDeCvsDceyZ3NaBwG8x1EVLrZu2ee0YnPifkuD1rKaVShQplXYXuWje+kc4XoZFPL7LbseyGmcp7IMJsIWa6A/KxHTKSAJ06MiQ0Vr9+JNIpYyDx7uOABB0GK0DVkn5ketVKA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7/kJxJ6Hxpx2VotnCY7j3ijwdIYMRZGpc1cp9jTV4vB5Z1C4hJRas7mTrtiwpKZyxUet4VjaCyLxEK953S3vEmpzX4omu9AH9oVk4fozMno9PbAGa2360QNlvt/AUaOEqx9SN/Mqkg3vUjQKjJOesCb3M8fQNEaXU2NDDvNcUwr/kTLlQ+7i/53zevIB67Bs0taLLg0stgWIyjtA41BM2zbxx19s9OttaIsGKkvWV5jWN2MicTTQh/52E1lSIxGGuZGNritoVVxJEoajO3zquGTqOMCBMfyPAY64rqQUACvdNvCPXHBV3XoBGs4AdtPJXag8gx+DncWNKmnDAtL4B0TzcHcFowcL9HJ8C7iYlV6BgWI+vYRSZ1AELPZ84bcvenTlCb8l6P/i0GSE2xTtHFMqphzSjH5FiSpkJKI/RwWh6cOw7IsYLtoiqahk9xRs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 22:19:58.4042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c2e332-0d9a-469e-e62d-08de83aa28c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7952
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Mar 2026 22:20:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19724

On 3/16/26 5:18 PM, Judith Mendez wrote:
> There have been changes in k3-am62x* overlays due to conflicts
> in DT, so update KERNEL_DEVICETREE_PREFIX for AM62A SK appropriately.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am62axx-evm.conf | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
> index 32ae2490..01955470 100644
> --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
> @@ -6,7 +6,13 @@ require conf/machine/include/am62axx.inc
>   
>   KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-am62a7 \
> -    ti/k3-am62x-sk \
> +    ti/k3-am62x-sk-csi2 \

"ti/k3-am62x-sk" is already a prefix of "ti/k3-am62x-sk-csi2", does this change do anything?

Andrew

> +    ti/k3-am62x-sk-ecap-capture \
> +    ti/k3-am62x-sk-eqep \
> +    ti/k3-am62x-sk-hdmi \
> +    ti/k3-am62x-sk-lpm \
> +    ti/k3-am62x-sk-mcspi-loopback \
> +    ti/k3-am62x-sk-pwm \
>       ti/k3-fpdlink \
>       ti/k3-v3link \
>   "


