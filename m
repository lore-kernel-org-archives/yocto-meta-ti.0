Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A124FED9E6
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 15:26:51 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78603.1773761209867511822
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 08:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=udvZ9r54;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.23, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xg9YDX4ZDLOeMqf/6EU/sXfa341tGLEGEMC4YYSqOoBTtfxXMNNjwKMkPnofgJWqQrQDKjmQd0tUa8P/9Qq/oYayX9yFekBHvfJDlX3L65OXtbJR8R7sbH3IiWk91n4wbM7EO9XZohTJ7zamdH3zZVT8DaWTgVncr31URHTtmxSUovHHUdLtJG5siAbp/T8LTXFETY3+Rca5xXDHBMZvHdCWn/XMrlbcAon3w1MpD/sO8YzRnh0x9n5r7qoq+tkBHakz2n0/A1Rjw+VVxk0LWEPX6Fz3+6+kMLme1VrTfml3pbmB7G4kmyVXI377i1/S2PE0XL70tLIMMFEFpMxF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxTJLsOhp3q1hZYDoeMGn2f+i25+dkfwOPHSAVO/DWA=;
 b=RMz+8Cct2hQhwuV+bkPAElcPzksGukimmgxk+/gThGmZiT679xUDlPAtMiEWf/Um7jm7+fS31+Vu15qVdOIMw0sMVKmrYcCTDoeGe+0fLqJ05FnxOrXL/onVLO2DLoqdcWi0PsrKIU58se5X4HJ9HYkNGUo/F1Z61QV7QwClXRgPzM25R2beAcPCRXWVXGeez105OTXjDf8Jq5Q7M02W35GaV0cqvjWDgzU5LvFtMUiAfX7CkzcttgzhsuNbWqb4HzwNwyqFenlhRaGfQ1X3H0FiTbsfKDE78pwGEwPcChvug/3XgkaZkl7q/Dyo/XGi/rCRo3+HKqPaxJYvQf2m7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxTJLsOhp3q1hZYDoeMGn2f+i25+dkfwOPHSAVO/DWA=;
 b=udvZ9r54tlhDaMrCr2aZ6tVsAIm9bizcGwgG4lN/qvQ4FQsIS20qHaiO2cz/Fd7V68KDcKGPq7T/u8UzwZ5I3jQ6gRNB91cbhfGCuCU88MJ4Q0U25Wqwfn3keyfG7iXFMFbzTphOjxrgS4POSjvMReXRGCD1ZyLARz3YtpTv9jE=
Received: from BL1P221CA0037.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::12)
 by IA1PR10MB7198.namprd10.prod.outlook.com (2603:10b6:208:3f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 15:26:47 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:208:5b5:cafe::27) by BL1P221CA0037.outlook.office365.com
 (2603:10b6:208:5b5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 15:27:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 15:26:45 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 10:26:21 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 10:26:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 10:26:21 -0500
Received: from [10.249.32.142] ([10.249.32.142])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HFQLuZ2921188;
	Tue, 17 Mar 2026 10:26:21 -0500
Message-ID: <2d5ff5b1-0ea6-44b7-8c12-9c1ff489b9f1@ti.com>
Date: Tue, 17 Mar 2026 10:26:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] conf: machine: am62a: Fix
 overlays in KERNEL_DEVICETREE_PREFIX
To: Judith Mendez <jm@ti.com>, Andrew Davis <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>
References: <20260316221815.2502448-1-jm@ti.com>
 <20260316221815.2502448-2-jm@ti.com>
 <bc7280a4-c758-487f-9780-f56eeb945993@ti.com>
 <d6465f94-c2a5-4ceb-b0bd-7f369f125c87@ti.com>
 <d10cb060-09e9-401c-af4e-2d1e58df0ca5@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <d10cb060-09e9-401c-af4e-2d1e58df0ca5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|IA1PR10MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: d5554ae8-ba88-4677-9806-08de843999b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	nbh8yQas7f+cAZkWTslgF0oK3rHxYTr4wrVE1IPvZW6Ou4cmfsTJnrJVWuP8tSPG+rHAyFug02debVjMMtw00dlsXLH9BMkCZwQUsOMjLKozXHDP9sImdeDSyrorGyAMwspgxde/GgxWsFB14gtGeD5S2fWJSbxUwTEakiD6IveCnRJLHN7H45VaojB9Wvfg/HX88sluWk4NnK1gBzbOshw/xRBEInxzKAiw7k7aex+YgTGkRLQN18P+VntPeq+5anUiUQScyTA8Z+YmdDc0lsOkTjil2RfxWTWHdX5v6Q+6ozyOmYzT+EpISP7OuG5XqmFGOsJCNBlD9hM0KNi98xI3deMS9TUxJbhV1/GDp3NwEFqLcViTGwIdZ9QWf3b+Fg+3HHaS10p+JbukhFnLdhUaZ0eG3BnSPvzmTq4up2cTvbLcfgyb44CF3S4O/cEge5ffOYj/sYTZcbYheJDS2svKLAn02XtAKLSpPXis2cWRFK/e9na3FdNM/l2gP8gq6h4UGJ/WGaM2ApArPJsHhbLgpm3NV+h80wO8TR+NgzehcWfzNtb/vYP6cs9FQdPFKMdGXUkoYE/G7F5MM42pqjKOhuoh0YFyTIgVfyFSZBmbLp+fsN6uHElDgVps+sljRuyBEDg+efdrjbnOHIVgg9z7ToDLA59Ln1eXeScsdf0GLn+3oWIxGjgxee00rWJIH2aKH5iN+FF6W4vDxyZdEOb148A+IY4hIrpE5KTRb8FdDQ3E8eC6yTOe/uDitnf7UYYdrgo/RvTNf65IE4tOVg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jmQDPo7/3uAxYGxdgNY63BHhUL/kLCd2JTtJ0BDMmbJ2focdoMFR5lG8V4+8aOgmdY/O5lF8Lc1pz7etzxLtTsy13HKOWnT0p6p0kmrN69z0HOgs/pcaT7axcJff4I8T/DgSQON25FndFqWw03ofkAl5gcu7Dw2cBQZpnCgUVIo6ZMIYjRJ8GHVMEzvisUdJTXCYfaVK8iIAsY2ETV5xbVJCiFXKMVNcT3YcJTg4nD7ZZlWr+N0ACAj9Z1nORQqQJjYlVzGY2igTy4bB4NbX+YqYy1z6hzXXMEJzq9A9EKi3feCpjJvewoms8NutAYI/N0YTHul/yReJDbnxyim2yNyKAFBymntiCy3q/N0jrVyT8Cx2gHTpbM1+RQpTBdUsuUUmLW6xTEoPrjNaJBpe2ak3eBYlHRPLgYqJN+pxRvLRmbmrRimn/H+x5GmzKFQe
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 15:26:45.9099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5554ae8-ba88-4677-9806-08de843999b9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7198
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 15:26:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19744



On 3/17/2026 9:10 AM, Judith Mendez wrote:
> Hi Andrew, Ryan,
>=20
> On 3/17/26 8:21 AM, Ryan Eatmon wrote:
>>
>>
>> On 3/16/2026 5:19 PM, Andrew Davis wrote:
>>> On 3/16/26 5:18 PM, Judith Mendez wrote:
>>>> There have been changes in k3-am62x* overlays due to conflicts
>>>> in DT, so update KERNEL_DEVICETREE_PREFIX for AM62A SK appropriately.
>>>>
>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>> ---
>>>> =C2=A0 meta-ti-bsp/conf/machine/am62axx-evm.conf | 8 +++++++-
>>>> =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf=20
>>>> b/meta-ti-bsp/ conf/machine/am62axx-evm.conf
>>>> index 32ae2490..01955470 100644
>>>> --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
>>>> @@ -6,7 +6,13 @@ require conf/machine/include/am62axx.inc
>>>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62a7 \
>>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2 \
>>>
>>> "ti/k3-am62x-sk" is already a prefix of "ti/k3-am62x-sk-csi2", does=20
>>> this change do anything?
>=20
> I am removing ti/k3-am62x-sk first andrew.
>>
>> Andrew,
>>
>> If you are right, then this locks the machine down to not pick up=20
>> future additions under the ti/k3-am62x-sk pattern in the future. =20
>> That's what it does...=C2=A0 which would not be "Good (TM)" if you are=20
>> correct.
>=20
> Some ti/k3-am62x-* overlays no longer apply to am62a platform. We can
> keep ti/k3-am62x-sk but it will cause confusion since at least the
> following overlays no longer apply to am62a:
>=20
> k3-am62x-sk-dmtimer-pwm.dtso
> k3-am62x-sk-mcan.dtso
>=20
> Is there some kind of blacklist for overlays not to be included for a
> platform?

There is not.  So this might be the best way.


> ~ Judith
>=20
>=20
>=20
>>>
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-ecap-capture \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-eqep \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-lpm \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-mcspi-loopback \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-pwm \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
>>>> =C2=A0 "
>>>
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

