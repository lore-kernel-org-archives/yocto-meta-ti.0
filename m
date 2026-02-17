Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFE0E9A02B
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 17:59:48 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18308.1771351179646448314
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 09:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=PoEzOqZC;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.49, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncoZVao70IFcjdOvDfD5dVlA+/CJM4rL+wKSqBNE77z90QBxRfcb22EF+pDmQyzOQ6/AUfGeafAXUxq3QpiIkW0S+q7w66lhXlXI0H07AbVEzdN6/Udjb6sONfIFBUGdClHRqafZAo0SqR07npoCJaKdhGs0A/7AqQi5vHLYuvdkZ625x7trAiAEJTyxXvmv0kdUWfYn6GH8p/GPrPNLqJzcbQpjLBNAavw6Nl1hssoGEqH1CxVdTJDNljSPm8jyDy7bhi7DZbdbKYVH+vC/xfCP/IwnJXUw89ImimeQvYgx/mq0+OEdSq8JaUVP2bdu9dSxBvuUS5YSbtF0DCBnIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=va2k2xsqaKH+FI+2GN/bKssC58XX/Z7i34oF0KQXv3Q=;
 b=WvNz0ORBfUeyV0mCRcNEg/MVg94tPx19Fvn/sEQNBUZP1S+LLsP5CzAaAAIy1cdHMyS/jduk1Xt4SgAlZOXEma0t9facPpQuROod++iRGRjpu9Pijdfqk4968wOqSh6bWzUc1zoGZPBeNBEtLCXpAW0f/H2CGMAfpOfXl/vxqCEcJ6y14bPHisUU36fHi1m5vOaVWUHIyo928IFCxld72wUkGlIYPWWNaPfNrar3IBapGJmN3lIp01Mke6xq1dQekteKAowg/sE3Wos1rn7iBf270fFNgqeHBTRNSHLfcEa813Mb2m7ifKtBQmSZt/cHQmUZxE9ZT6GqeJ7FHxlaww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=va2k2xsqaKH+FI+2GN/bKssC58XX/Z7i34oF0KQXv3Q=;
 b=PoEzOqZCLb/mnH4C9yl16EyCc5UdcYaiqSWN5UpbCnycdgD339KUDUOC7pqkyv44fhoe5TlpWWTPeWwftzvd3PdLjXcd64kXsq2K/3Itfi4+DXRQ+Q6oy67jCajCu8teYDTqmahV70GTAP1ce3STCo6RjEs9l9RGyPzSjCq8WWs=
Received: from CH2PR14CA0025.namprd14.prod.outlook.com (2603:10b6:610:60::35)
 by CY8PR10MB7377.namprd10.prod.outlook.com (2603:10b6:930:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 17:59:37 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::4f) by CH2PR14CA0025.outlook.office365.com
 (2603:10b6:610:60::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 17:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 17:59:36 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 11:59:35 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 11:59:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 11:59:34 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HHxY8w3263207;
	Tue, 17 Feb 2026 11:59:34 -0600
Message-ID: <1beef843-dc57-4716-9ee1-bfcf3dff282f@ti.com>
Date: Tue, 17 Feb 2026 11:59:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v2] ti-core-initramfs: Change assignment
 of IMAGE_BOOT_FILES
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260217161041.786432-1-reatmon@ti.com>
 <1148f430-063d-4aa7-8e52-8e8378112ee6@ti.com>
 <decd99f6-a660-4010-a856-329ba6c6c677@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <decd99f6-a660-4010-a856-329ba6c6c677@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|CY8PR10MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: e7374de1-a643-4461-f22b-08de6e4e502e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OSHEtTMRY7Gpb1Dk3hcd5dPqSFpSJhuYmjqiWfFWrnw/9LEH367Wk58D6ddZ?=
 =?us-ascii?Q?V1ReL0GMNxwHxEOqSuxwxZCwarK9xRr+3scgXmOLaakiugKDI7eQLLUHCONZ?=
 =?us-ascii?Q?vdiVxirudlgYu63x4fHi23H0HcZJVj29X2JcgOnjoYPQ74PX7uB7h43nPFHa?=
 =?us-ascii?Q?exrC/q8sEtVwAjQ11PCyeoDlAgqWXc3borgBSKwfm2vBTHWieto715FfGTZ1?=
 =?us-ascii?Q?TS4vT+2VLp9d7fufXtiFfAe8hjG7OgwHoqVxJH/xIaq+SgaVyluM56kbz+gj?=
 =?us-ascii?Q?y5626/G0Mj2Z1tlaYIZPd1ZK2UozinCauXm4sy08lvwqY6DWKiBdxX5ab9zr?=
 =?us-ascii?Q?Tw4Ca+zWTcT3mSCXF+9TmTlgfHA9AWJ2XtzCXFfOKUCCwZrm/8b0eYPU8YAz?=
 =?us-ascii?Q?Zfw8jvSJdAljL9rG27hvfe/sm5+YQ6JqdzauMw4J6Sfwpcb/r70vCQsg8N5D?=
 =?us-ascii?Q?SLyaIFQ7Or6cK4i6EPB0fhbDmLfBGCSVqx0WQFtFgDjNsNqarv7ZG5PNJdKj?=
 =?us-ascii?Q?f8hkIQF7uArZbYc0HOZ9UL0AaxChhVM33KCce/cnYbixJaPXkCBVl1U28BYv?=
 =?us-ascii?Q?9ckPwSr/k6gm8bhxr7GhyqSJG696Rg9W3GWP3kr5s9Ewb2AEIHUwfLI8E2jt?=
 =?us-ascii?Q?wJPZMLmhIwv5uXuzAxQUVq64vSF3w1UKTZfFkP1b9SHCT3tVqU0NQzzDM4f9?=
 =?us-ascii?Q?vTUpmgLAfVpkwQ79hVVOjBLOboEaeGqCDJY+ZUKD0y0z6cajQd3X77Yu+VuD?=
 =?us-ascii?Q?9rc8yj/RAcEFOhtC5Xi3JdFHIpbNG7qUeZUDhjWyeEbaGe2MUNOYIV5LjPhW?=
 =?us-ascii?Q?bahCw6ycb52iJuM15C+wFdP5N2xsBLdMFOWzWJ2wLesw5St1J5QHZOYH/qci?=
 =?us-ascii?Q?YEV5FodlJolRuyqjXNqfEFlZv1v4F0tA3SASRmlbiSFx6RL1Mh6WDfh3vtqn?=
 =?us-ascii?Q?P/+IU9N3JikVYsh3Fvge95ismyr5HDL+e6f2IHZCxZQ5uTU64GxTuKjttGCN?=
 =?us-ascii?Q?g28Qcinio0dTc69KlrpGnMIgWa2pD/exhNJwLuJBEKjEl9hZ3sM6sCZfjU/v?=
 =?us-ascii?Q?5lv1lhXIBlUMiNUGJQy2xeDXhc0+myTxoqVxllGHjGXm7b8026nqOTYvZZ6x?=
 =?us-ascii?Q?O9UxaRx4Wfo0mg78EQzp6kZDVW67RDujGabo0Fmc7L+h7vG5O4/1mf9l+erM?=
 =?us-ascii?Q?3t0YdNzPbPVPcq7iFQB1LVe5/OghJFgpGb5o00YKHdBBwN1nxbjvyflyL4jb?=
 =?us-ascii?Q?U5k0RLL6mQn2OqiVvOYFl+J1GBqgEQ+Qv/0CaajbHL9vcUN715GVl7Gqqn/z?=
 =?us-ascii?Q?nql6EE8hTx04K8c+KfpKfQmQ698ivdF2MkmfLearvIWeYfyXsQ76yNOVYuD1?=
 =?us-ascii?Q?IL+aS39mfUWXbg3h52Xim1+160biGo0YhHTuRGZaY2J46wYu3mbUO3b3hq/e?=
 =?us-ascii?Q?QhQ39FRYYQng+eXaxlet9gMWocynhxJsyax5OmkW4n0S8+M81KhpcMy1XLV4?=
 =?us-ascii?Q?iGg6FTUGXJlqrVPoCvPAamN9RhPY3hIjzBC8uuU1fTwDznhxcyvzto/Ae32p?=
 =?us-ascii?Q?Sn2qin7n1uY+q4ttkjPq9/GN/s0uGDzM7CaGlc8g4PjwSWThNNzqwo46ThcS?=
 =?us-ascii?Q?AQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(4022899009)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PT5gJrewNn4I6xBbklMf/FhN/7FRiia4MEWoEOihFA4EVozueoZjAHC/jeDwkzFQtoVq2sANXZcrstb1U4OilEemY56SrnpoZ6s5wgDsT4Qt+MWrlSgaYrbV31+BiZ85QzeqqSYFKIoBiFQ5NxuQ52ISg6kgXwtvaZtrSQpao4l9i1PmZ1qV0eyfRxNj1een949N6btnBfRgJ/W2injHO+/pOm78FHXBJGgLAhscqVSXKJMwnkpfPttCSWcAXG/bFylkW8VL0zIZkNfm7mU37ZSJRnUGpROqR9ecQreaEhAD5fXnucmorD2ttiKG8Shky1MEtMt1YOw6ZQu1sdK8WH/FxTanq8oUj9X7mtBMRPEALeYor5ZY4Hs4gDrQP2iIWbF6axNzlSIx/QrrEHmw4ZzKTxgmxfM29+jZy69TJQG4CyYgsrgRUdeh9n2D/2ev
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 17:59:36.4052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7374de1-a643-4461-f22b-08de6e4e502e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7377
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 17:59:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19530

On 2/17/26 11:53 AM, Ryan Eatmon wrote:
>=20
>=20
> On 2/17/2026 11:23 AM, Andrew Davis wrote:
>> On 2/17/26 10:10 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>> The +=3D setting was overriding the weak ?=3D assignment of IMAGE_BOOT_=
FILES
>>> in k3.inc.=C2=A0 This resulted in nothing going into the boot partition=
 of the
>>
>> Could the weak assignment in k3.inc be changed to a +=3D? Seems like tha=
t
>> would have the same effect and prevent any future issues like this.
>=20
> I would say no.=C2=A0 That is the default list.=C2=A0 If a platform needs=
 something else then it can simply set IMAGE_BOOT_FILES to something else.=
=C2=A0=C2=A0 But if it was a +=3D, then the platform would need to use :rem=
ove to remove things it does not want.
>=20

Given this patch, isn't the need for :remove now also true
for `ti-core-initramfs.cpio.xz`? IMAGE_BOOT_FILES seems to
be a purely additive list, I can't image some K3 platform
wanting to remove say `tiboot3.bin`..

Andrew

>=20
>> Andrew
>>
>>> wic image.=C2=A0 Change to :append to force this to occur after all oth=
er
>>> settings of IMAGE_BOOT_FILES in the conf files have processed.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> v2: Fix spelling error in commit message.
>>>
>>> =C2=A0 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/m=
eta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>>> index 9d3cc612..475234a1 100644
>>> --- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>>> @@ -20,4 +20,4 @@ do_image_wic[depends] +=3D "${@ '${TI_CORE_INITRAMFS_=
IMAGE}:do_image_complete' if
>>> =C2=A0 TI_WKS_INITRAMFS ?=3D "${@ ',initrd=3D${TI_CORE_INITRAMFS_IMAGE_=
FILE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
>>> -IMAGE_BOOT_FILES +=3D "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getV=
ar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
>>> +IMAGE_BOOT_FILES:append =3D " ${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if=
 d.getVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#19524): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/19524
>>> Mute This Topic: https://lists.yoctoproject.org/mt/117859038/3619733
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com=
]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>
>=20


