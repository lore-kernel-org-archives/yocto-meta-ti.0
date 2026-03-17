Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC8FFED9E8
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 15:29:21 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78661.1773761354128169759
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 08:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=IW3RdlyN;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.4, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1j81S9AEHYTvQPQoet8qAQ3mP98WzL0Xk0Gy22DAxW3MeOrfFGcoy6ZFcEinioeV5Bc0b8InQJCG66v3SaPpwg1/sEAGqK4C9Kwv+EGpnHNRFKLHo2ik4IzZZ3wQaq/btXQ0LYTfRHfFagk/+EJkAdhst9J8wUK1eu4U/Y/WiXjDirT9FMsQG33SpVNW/WesJXjxZktAdGO6yWjXynWkoIrkwGC0lWQ9h4OPjZNw9uuiEp6IuG8GOtvj+ARgxGwMJpt7ImYHZE3c9zB4gvv0ezEmyXHsJodWcPPxg7Kwf9LpEAFaypqlhQXBEwGjCXsnj8/PZyl3xdupzXSuzd3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lN0R83erdH0WaQH6pZLaiZ63asoLEMlPpL436e8ZiKw=;
 b=w/OYEBlkMxodOvtJMP17q6b1rkPWwBZXLsVqp7ohujgQRxqfxHgOcfX2VdVmO0X0f5g+Ka5n1vaNvBXwNGy+P4g8eoK7RE9AaNneInlJRjaZ0H/X06ueDBiKjntHJI4Ez+93IZeLA+7APURe2pBelQJeraVZE4kvSSWZDs3Aiwzj9ivaJN38vZPjX4QUH1OWRNoUh2+mt8CiZpYpQKE7t2amTi5VjXZ6Nr+VgaBEXMFZXzPZ3wI/EGpJ4Awjsqyob4Q61LU3bLzV+4Udk26pAizEMxwqPvJ7vues0uGw+alVceDaxjiScmXNdnLqVRQBkh3qI4uzI1yzjYk7eIzF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lN0R83erdH0WaQH6pZLaiZ63asoLEMlPpL436e8ZiKw=;
 b=IW3RdlyNO3yIUTOI9WZrA3LRA9R+B/iKWti69C5/KHdSUSMddXvRa11Xo9zO94MISoE3wM8IE7a0g2F/CHe7ngWPTsaXfoxGd5gEGEqEOFZxrew3Dz0beRcdH3Hne4tCJ/ln5Ciy4x+appX2zuQKYWxi+NB4DnYuRTSzX7GuIxw=
Received: from CH5PR03CA0007.namprd03.prod.outlook.com (2603:10b6:610:1f1::25)
 by CH5PR10MB997743.namprd10.prod.outlook.com (2603:10b6:610:2ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 15:29:11 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:610:1f1:cafe::2c) by CH5PR03CA0007.outlook.office365.com
 (2603:10b6:610:1f1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 15:29:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 15:29:11 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 10:29:06 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 10:29:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 10:29:06 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HFT5UC2923928;
	Tue, 17 Mar 2026 10:29:05 -0500
Message-ID: <bd3453bf-74b1-42ca-8be9-a79fa5c97953@ti.com>
Date: Tue, 17 Mar 2026 10:29:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] conf: machine: am62a: Fix
 overlays in KERNEL_DEVICETREE_PREFIX
To: Judith Mendez <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>
References: <20260316221815.2502448-1-jm@ti.com>
 <20260316221815.2502448-2-jm@ti.com>
 <bc7280a4-c758-487f-9780-f56eeb945993@ti.com>
 <d6465f94-c2a5-4ceb-b0bd-7f369f125c87@ti.com>
 <d10cb060-09e9-401c-af4e-2d1e58df0ca5@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <d10cb060-09e9-401c-af4e-2d1e58df0ca5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|CH5PR10MB997743:EE_
X-MS-Office365-Filtering-Correlation-Id: db982946-3fbf-4ce5-42b0-08de8439f081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	vXW8cmi8rEzsF51P5FdYBb4F3LzN7a8IJZNI5Gy5qUuUDnX7erC/KJXSgSjE1LPX8WvA3xM3rRXHiCk24WhcUhyqiefe9lEQZiUp43UzcEKM2VeD5njytF4sf99KBVO+U0YzSncol5lKUIz7hzgD/RuXDHfzTWt2jyJ4AL13d53HfGDEEqFZhvUQvVWuXS1Pcrj6fPpnhFF6NlZYMY4upK2OHjUTr0SP88fELXMduiHcwfqdfe0avRbf6AGQMkBKKTrc8PQMEq+RCbKUx0CSdNJKIFssPJMbPeRZA/wJqjoOvnzuMwFEnK0Doqkr5qlPZcLVogVIVYY9wd0Lu+nY0394BVovMtZV+74hgG6ypycmaMVNlJdI3dGu3ij/y263d6jYQucQ4imMItDdJzfpUhxuSM5COUgr5KPbJJbdSyVRV380p3HB+1Td3vb1UZ9Kp3Jo2qos4QjICYu0FZwpxoFbHw773f+esLMfSYIRjQK8gRKhFFfuyKpT73q6JUqXCIXF8VPjFCGvoFj6w52aVJVzYHaecvHtNl6DLXjtVJktIL0P80AGcc31LEJ5jH7YT6q65zLtV7RxGMgQQOK+D5UNnvHwNc/pxepWTtQZMB6lb0vZFk8rl+a+U1FYdrqTqmKFmmiaV49uNsIhe+86aSEgIYV8w47pV1Xiiyu6r594peXBhVzCHzTitILqAo8SbRfTsxpuKUk6TuQaDudqbBIiNGWj8pLaqGaggblrj9vICAdrzzsLzz/FqLfB9r9MdTDm0yMD12Yn/6ca3PJKkg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YRp5NoYSQlIFCUbL2iD05Tuo9pLPYOQCktxBGuggTy1/vt5xkqk0jCjz0NpYN5/4UquGe2bBD1+etahBtgifMUJBurEO5MdU96On2/oEN6+fySaaFXmjwmAt9piZ7p21JmH4MBXU3NFhx0IpdKCiQHgUbzcbs27ntmHpUDG9P2ArnNBbjwmXJnBjZo72bYmnayZvFzsNZhY4DFv8QklZ+hoAafOlVe2BDzHXHpzfUpEQ1bb0ROT2ctTT+GRaTg9CPxIS6M7ncAONsj8y9T3GOTRh0O0yfaY5yzgzN+WiPMKaD6tP8mQd1wkjmCGgr9w+hTSgioI97PjiRCMUYSE0vA/5/uuz64pnLYVIqDdBiGe3ITKjRCoOozm4HpB1MAiCXJv7qOkrCiD5Iy1qKvyrTqAezZdhwc5+loT5alEzxXYBoQe1BuFDcURcxv3mNd/Z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 15:29:11.5264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db982946-3fbf-4ce5-42b0-08de8439f081
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR10MB997743
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 15:29:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19745

On 3/17/26 9:10 AM, Judith Mendez wrote:
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
>>>> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/ =
conf/machine/am62axx-evm.conf
>>>> index 32ae2490..01955470 100644
>>>> --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
>>>> @@ -6,7 +6,13 @@ require conf/machine/include/am62axx.inc
>>>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62a7 \
>>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2 \
>>>
>>> "ti/k3-am62x-sk" is already a prefix of "ti/k3-am62x-sk-csi2", does thi=
s change do anything?
>=20
> I am removing ti/k3-am62x-sk first andrew.
>>
>> Andrew,
>>
>> If you are right, then this locks the machine down to not pick up future=
 additions under the ti/k3-am62x-sk pattern in the future.=C2=A0 That's wha=
t it does...=C2=A0 which would not be "Good (TM)" if you are correct.
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
>=20

There is no issue with adding extra DTB and DTBO files. This is always
the case as one machine config often supports multiple similar boards.
It is up to the user/bootloader to pick up and apply the correct DTB
and overlays for the given board.

Andrew

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


