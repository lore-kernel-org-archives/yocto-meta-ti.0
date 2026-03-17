Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7D3FD877D
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 14:10:30 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76874.1773756627375690386
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 07:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CXS95VxE;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.57, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQm/12XqKVjRCaJHXUPtYswzNfM8r5zeJxTbC2oMxdNiKS1q5yGib19ZQF1xSmuVpGqXdFD3rg3n5ejnovLz9YBFn/n0kowCMi1XA5VoVa7/WIgFO4Z97QO2Nq9AV3tLVqnSZFx8Sm/ZlHh4izSk/mYcrnE0Obu5Gm4bXuC0+6kXCIEgz2maa3mdnVBzcc1RuM2rDrnB71arpNhd7FqASRdjDYKh7ZkSZwgrS5osNOvhNVH1aSZRSoZkhr/nXDEdVgq+AJd5swAU4bC/W2SYZtx7HcCzCy4oB/gHdvSnKrsi1qNnFCEbgksneDuz4gw0lKsInMloPHU11GBvKz3wBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCMbcGxw05cOgThvkn1MXaET/GqKtV57BRTTqcXvils=;
 b=py//4ngmmJsA99Sc/orZbGL7Sz/vl9OoZdbIlWalfQOp7PE2nyPMAeVVWt0hyowY7gu+F1dLi3r52/AT7APbw4XXMFATPcFQc81q8HHQXMd/IF4GHZOiGLhj4nPnioQKm7tKI5074pz/NAaVZit2tuRJgVMaEumfkjJQoc61sg+psiwbdN3leydzZOIIURR+V752S7j/jPG9rQrVgPoEEQp8XWgwaLy4uRfO7qoWZl6ysCjn8GF3N53JicUrExl5BE8mHcVEwKN5q8o9f0e1Bz2b/S8aaEbIlk9OnJ3FM+3b2c32fnhkZx2cYxAc+tUlZHSxiVYe+ADZvaVBpkMANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCMbcGxw05cOgThvkn1MXaET/GqKtV57BRTTqcXvils=;
 b=CXS95VxEFyrey9H5Pj6FW4EKskqGhpZLzvUMclLUhCJzvZuv8uaUyYMlOeyOWMwb8xE04OHPRWNBn1ruociAmqJ/ulE0HVGiS5AT3rDlpfF4wmJdV8umylk/T9746x65Dd3dJW5VgoYyjDzCN3c+SULhkOu8UmfX14ctyEYsViM=
Received: from BY3PR05CA0041.namprd05.prod.outlook.com (2603:10b6:a03:39b::16)
 by LV0PR10MB997663.namprd10.prod.outlook.com (2603:10b6:408:33f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 14:10:25 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::b) by BY3PR05CA0041.outlook.office365.com
 (2603:10b6:a03:39b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Tue,
 17 Mar 2026 14:10:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 14:10:25 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 09:10:23 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 09:10:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 09:10:23 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HEANHQ3292710;
	Tue, 17 Mar 2026 09:10:23 -0500
Message-ID: <d10cb060-09e9-401c-af4e-2d1e58df0ca5@ti.com>
Date: Tue, 17 Mar 2026 09:10:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] conf: machine: am62a: Fix
 overlays in KERNEL_DEVICETREE_PREFIX
To: Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>
References: <20260316221815.2502448-1-jm@ti.com>
 <20260316221815.2502448-2-jm@ti.com>
 <bc7280a4-c758-487f-9780-f56eeb945993@ti.com>
 <d6465f94-c2a5-4ceb-b0bd-7f369f125c87@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <d6465f94-c2a5-4ceb-b0bd-7f369f125c87@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|LV0PR10MB997663:EE_
X-MS-Office365-Filtering-Correlation-Id: 8995c1e2-f877-422c-9867-08de842eef6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	uGgCJvWMh9S+xc0ow80uFuP7x85W/q7mJOzl05XEMqTu3zX9RF+6A/X4weaqGhWcKzCp8Q10TcbCw0G6HbT+6O2WiUHHL+9J0n48UjS2vAxmv7unOT66g1JkpYGZM0GF1Kzf4Rdom4J6rIgmg5VOleoysD5rIHo3WnfMxI7N82LshIvag6cb777ilYUSgyual39ynltmP/hhXvmShljMCDQdjrq3oK6nQsqVOedsNPujHg3/wxio3LUxi4tklvnXIpTKYCSv+iKpnog0GIHbV8eoCdqRfuFdxmtuSXInZ6r7jE3YE6ZTI2LQsHYlja12UDgz8B+ypJyesu9T2MV6nZpck/FNu39osEVpmCG0Tfx0SQ40tAra2LxyNLovSEqq/UtciLBCYL8VATBuNv8hBp+sFrLIYRIteU8RG6rwdjGDwiqSabHKRC7SlxCNZXq2RvMyIeQqK43g1fywkbj4IdP0g2kL0CIEFE0BlnFD6DYkuaSjF8Y2/GASnGzi4tDmNrRlt7UsYdxNd+c6zqxJBJJmGrRWy4HIJ4RTXMUz8PZ4yotBkIYrkiobkYnyecPh32ASG6FtOoa5tIDs/fMepz9dbLZbcC5EeRW9bsRwrWJ8y65gBPnz5eycIRtcK/0JP0hjw8hjPFkVxF5y+5LBMSYxo8BavsDD6FW4P2QFU7FalxT2QglJYNB8iR2iXjd/dGvmMB3N8e9t7/wF3M00ogL0Y+KmijS+4u+eVfef7oQYglmunQR/yBazoXT5kayn0Bjzq3f/M92PcT3+YdAm8Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	e+8CQ7RY/L7/8d4lTq28/A2cdVfQUa618dOyp4Af0HeFDJ12+3i2NP0oNlTDGRjNEulYmLyl/+xSfgRQ3SkkbMxOqkHmR5xwKoY9KaPbOw7Q6Gd/cd0yQD06mkO2b4L8AS2IM3dhsrpvbo5cOSaZzccCwOH/YQilLLXNHqTzqon3yn8auCKsCws3+hJhtQIc6UIb+7Z75I9K9plBZ1TFE8IrefQM2ENApdEWfBbyQ0C95p0CuubI+xQ48gUji6t6OtzPD0Wb1w8Ft8Fs9hCq1vbk6XIlcncTz/EwsI8hW/i83x9ckX+VIpmpGRbhmbnnVXK2yRZg6d6EHROIOfO554nlZMk99bfOhjVvlhsZLLoiGNYL9HXCYLOBWfkQJEjrKmDwjIWEAe+DsHQQOgcwOdS+CqGoZocdSqhoaOSCx9QFr9iIs/fbjG0uhZHzivL9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 14:10:25.2284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8995c1e2-f877-422c-9867-08de842eef6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997663
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 14:10:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19740

Hi Andrew, Ryan,

On 3/17/26 8:21 AM, Ryan Eatmon wrote:
>=20
>=20
> On 3/16/2026 5:19 PM, Andrew Davis wrote:
>> On 3/16/26 5:18 PM, Judith Mendez wrote:
>>> There have been changes in k3-am62x* overlays due to conflicts
>>> in DT, so update KERNEL_DEVICETREE_PREFIX for AM62A SK appropriately.
>>>
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/am62axx-evm.conf | 8 +++++++-
>>> =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/=20
>>> conf/machine/am62axx-evm.conf
>>> index 32ae2490..01955470 100644
>>> --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
>>> +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
>>> @@ -6,7 +6,13 @@ require conf/machine/include/am62axx.inc
>>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62a7 \
>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2 \
>>
>> "ti/k3-am62x-sk" is already a prefix of "ti/k3-am62x-sk-csi2", does=20
>> this change do anything?

I am removing ti/k3-am62x-sk first andrew.
>=20
> Andrew,
>=20
> If you are right, then this locks the machine down to not pick up future=
=20
> additions under the ti/k3-am62x-sk pattern in the future.=C2=A0 That's wh=
at=20
> it does...=C2=A0 which would not be "Good (TM)" if you are correct.

Some ti/k3-am62x-* overlays no longer apply to am62a platform. We can
keep ti/k3-am62x-sk but it will cause confusion since at least the
following overlays no longer apply to am62a:

k3-am62x-sk-dmtimer-pwm.dtso
k3-am62x-sk-mcan.dtso

Is there some kind of blacklist for overlays not to be included for a
platform?

~ Judith



>>
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-ecap-capture \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-eqep \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-lpm \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-mcspi-loopback \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-pwm \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-v3link \
>>> =C2=A0 "
>>
>=20


