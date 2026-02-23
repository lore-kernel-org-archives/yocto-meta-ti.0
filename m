Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD041EEC2A8
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:44:05 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7525.1771886641615911706
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 14:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=J6kHWd1m;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.37, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ongb0rIAUzSaldQfR9nwdjBQ2Z1o2rXvr/B4hjvuyspyTjU1kybd6YD9ZYLQWIZUfzLVVvkKVw2OUmxd+DJoYrHfNNoNeAQHbCFXmw/0NqIg+S9PQ1pCvziwYviaj6DV5Tup7cKkfEe9mLflquGQEk7dOT90lULoBebCK7H3fgtw7B8xYJrh89yCLt8Z/Xb7IK58j0P+UCeHhl52B2Ie9e60CztPSXdBjaoNwnyYF1O3qrC3AidQJLDvTQ8FrgkSewLiRYkDTFLI1CJsDEaQE2qxyL+RXsGMyXgRNi8nqHizU4exGL/58sg+qfeqKfMbg80youNhPlVkTypSLUinbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wYruRjH8fD8nL3EKnoB3R4BIg3h2v/nLXcBUBJV8Z4=;
 b=Rmms0oryWpRS83MJR7hguGdORmT+BUyUoJ79q0j/mI4k1dOgdqsjXxWhM08p4oIW9dEx4ztllRAU66TWHFFegPE/LEeaaFcc+ApPZ919JQm/pJMmyHkIiVpXRRkYU03fVhfjcJeCCXupmOFaFKsgYHJIiW69AUEdoEZbI5y/7lX/3Qwa86+9HBnrGRModGTPITOjokc8YiniljAYJxTgO0RMdCPHZem20DpUxKZFHw+Xc+t2D9tubOveFg0tX36EivqZ/tyW6bOcwyX7wBuJJqgUod1f3PtwKgPy15LcWbEmfCOXmyM3BFe2YlUCyelW3vGyJoYhCDHmKjupmk6KIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wYruRjH8fD8nL3EKnoB3R4BIg3h2v/nLXcBUBJV8Z4=;
 b=J6kHWd1mS+pW05t+AF35PiwfqGqQRo1dnjquhhSApI9ZXk7X/OnGaMzBmHgT1fc/grNIJ+aHuOqPMBV5GegYKuTEnBEdg+iG74Q27v7DmXL/fnIp+IYoGjsjuxWVb6xi9shhxr9RRfbKajVilOVawg3eYgq/QbZl7GmFun4zxX8=
Received: from BLAPR03CA0157.namprd03.prod.outlook.com (2603:10b6:208:32f::27)
 by DS0PR10MB6224.namprd10.prod.outlook.com (2603:10b6:8:d2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Mon, 23 Feb 2026 22:43:57 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:32f:cafe::a2) by BLAPR03CA0157.outlook.office365.com
 (2603:10b6:208:32f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 22:44:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:43:55 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:43:55 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:43:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 16:43:55 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NMhsTD1132005;
	Mon, 23 Feb 2026 16:43:54 -0600
Message-ID: <092333ba-564e-4d75-9c4d-4a37307ac054@ti.com>
Date: Mon, 23 Feb 2026 16:43:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-ti
 configuration
To: Ryan Eatmon <reatmon@ti.com>, <rs@ti.com>, <denys@konsulko.com>,
	<praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260223202236.3642261-1-rs@ti.com>
 <75b44163-9157-476a-98af-384aeaa6c48c@ti.com>
 <ff5eecf3-37bd-4f59-8328-930d883f165c@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <ff5eecf3-37bd-4f59-8328-930d883f165c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|DS0PR10MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7151cc-134e-407b-a695-08de732d06e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|4022899009|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lxuE/sFwXwppi8QFb8cP78c5Xsw1UEJlQDCSlrknGVVdfSg8MU6bZNop0Rh6?=
 =?us-ascii?Q?Uo76CoGv8NTE77wGk08XgJRPpv22WP13+rTbw+ZVJvY8nw05+KML8jKrPJKI?=
 =?us-ascii?Q?Tb6cbJwgcmk5yJOFiDg7JKnWCPU0/0xwIOUhR17bP/CkYC1dlXs68qg32cwI?=
 =?us-ascii?Q?Silbu1W0o+xgcN5atl3rAzm9W8RU/8toOe36wY2fOPhbV7f4P11Q9RG/Nz5U?=
 =?us-ascii?Q?7dS6rZbcZ0blj5XEstwmPz35caH8DFcaWk71bjCX4j3M0ZijNGkNG8223qLp?=
 =?us-ascii?Q?GLQ7eIedWImG8UJCJcs1x0Eviu6AeNem9/YWK6CEJ+FtchmYUBUP6SrO5Mtq?=
 =?us-ascii?Q?ocSNnckLNqG4tBz+hcJxjRLYoHA7y6ir5G1wCMSPFNywlnu++0oSSxK9T8Ib?=
 =?us-ascii?Q?J/GOelkxR1DwuL0Dv3QBfzn2+h/87pILr38QtEUX0n++uv8cPaJa/hVGsn5w?=
 =?us-ascii?Q?RAMF5VpDc6a6t1WIitQAkSQcmLptUXD17fei/oPiYDG4xFe+gPzMrI3K4Pyp?=
 =?us-ascii?Q?kJkitRvA0hiXJ2s7E6M/zl9dmZKZqfAP/HBIX1pdHsD7C/0WDmImXWs2XOK6?=
 =?us-ascii?Q?LRDwJYgp52JpnT0aI7cVKiY5JCVSk4BltHqix0hT43tqakLAB++epudgSkIw?=
 =?us-ascii?Q?SmOjMcsWeLA0cMsJDxSxg3H7V0MoBxLYEk7l9qAkEZ/dadosx0enehZ3SmVe?=
 =?us-ascii?Q?aw8j+wnu6Ol3XioX+MaJBv0uAxs21ruNHk7SLg1DzrJD9cMw4z8YuW1gRtn4?=
 =?us-ascii?Q?TmxqL2fXiQitAQdQZ/69mnVT9DXXPK8Jx1pmdxzhRJbscUwwAQLic5qEA5W3?=
 =?us-ascii?Q?vhelCgIwQmL3qtdtinHTsoyf2I0IcAn3xuoDJHgOqF/2X6qnLQedyH7c3vWg?=
 =?us-ascii?Q?EZsltJfvYqMnVgbGumWQ2h5FVfOC01aym/8OkLUkayemZ7GB/dkmH1cfPRVO?=
 =?us-ascii?Q?BKoTUh53g92fSCYJ64bBGVrB4y6DtwnA1YiLALWJkbNp5LA0/5568HI+Az/8?=
 =?us-ascii?Q?n5CdgayZwc2DhUuGyFb4Dz20xYQ+NYYNqg8pnNar4GwjmzLAx/FhXYxwVb6d?=
 =?us-ascii?Q?07ZoPrwuNHOvO+vH3+ihpoHnYnkKFVvNfejo18SwfnWqQgAEWgE69k9tKFkg?=
 =?us-ascii?Q?VF9JEFRXjIEeRLRmVQtrxJRtwLvlXHMQ8Msbz5PNU/zWO94KUUJ2mcTJ9EYO?=
 =?us-ascii?Q?LRWbbygvRhYpSpTx+qtf2zUHOLmQ8/eCNTOP7Nx3coaHMloMTM+btFwLRxvb?=
 =?us-ascii?Q?z7JwRqNp4Kw+ZbeCxUch9ysHho2PfF9UprkvOprFIeOqymjZyn6QGp5u11ID?=
 =?us-ascii?Q?AJlYOmpeDGzDdIfcG1tGkbTjF9HajdY8FrWT21X7nIVD6MhgusoWmMeubehP?=
 =?us-ascii?Q?uhXuf0Lw2zewlUHFmh8Ij+QCJYiHdz7e6j617ybkPDAkDN/D0LkFxbz5rXFi?=
 =?us-ascii?Q?eMlYZvGJ0V9jLTML0F/3g7T1rznwSe4kf+xlLowsgcwTPXIr1oGCW5aE9pGc?=
 =?us-ascii?Q?S9A+wrlBnnwGNpiIXo1SdoZ7pivrlaqRAADaobmsMLEwq5KEDZXq8DetUZ5A?=
 =?us-ascii?Q?O666zz3Ts3py8Hnpr5LOmMGy0IqJuJfPHvpZhB5DEUWdA7qD/33Amst3g4LT?=
 =?us-ascii?Q?O9H+WdfTpmrNwfecilX8nObCwL5coE6nlLs3pva8Jz6WG7VHsoSRfl35cpvQ?=
 =?us-ascii?Q?f08MdQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(4022899009)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SSBx1CntqTIsV9saaC2OBKzF7oTlaG3Gaz9oBXVDlNvREOaf6cnawZi56tlOKhociUqASXDICR5YRfJZ4WQnWZCZ/C64wqaOWpax8ZitoRYBB46/1TH6D89rUYyMzLwVD6xiz7JKWzLjExbltouaJORIovtrPDEFek2o4CRUHDmWeTCpNl1YBOpWl3qVD/bcZEZOhmlBXXKkLc4SBBN0pp+RMwkQ8C4f132fym+HmGl8V4T/jIKR6SEJRMCO7s1kZfnK+t1x/wR8R5sG48FVHFoG7RGzRPzC8jNfE878GSFGConZwuYYdqdTbpKQlHFWkw4cPpwA4cjCdPOOZ+s6/iXvyzp62F20/aOLIP/MzH9bZa8i0hLQWQMNVFzumPjM9jJhKnSnJlWQiUNqaml9LhlK9uq4ZYoBqRu7yTdodOv+PEfA5NO60NiLW8NRTA1Z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:43:55.8402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7151cc-134e-407b-a695-08de732d06e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6224
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 22:44:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19575

On 2/23/26 3:54 PM, Ryan Eatmon wrote:
>=20
>=20
> On 2/23/2026 3:51 PM, Andrew Davis wrote:
>> On 2/23/26 2:22 PM, Randolph Sapp via lists.yoctoproject.org wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Add a TI configuration for the BeagleY-AI development board.
>>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf |=C2=A0 7 +++++=
++
>>> =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti.conf=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 16 ++++++++++++++++
>>> =C2=A0 2 files changed, 23 insertions(+)
>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.c=
onf
>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf b/meta-ti=
-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>> new file mode 100644
>>> index 00000000..88d0888b
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>> @@ -0,0 +1,7 @@
>>> +#@TYPE: Machine
>>> +#@NAME: BeagleY-AI (R5F)
>>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (R5F core)
>>> +
>>> +require conf/machine/include/k3r5.inc
>>> +
>>> +UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
>>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti.conf b/meta-ti-bsp/=
conf/machine/beagley-ai-ti.conf
>>> new file mode 100644
>>> index 00000000..088cbd62
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>> @@ -0,0 +1,16 @@
>>> +#@TYPE: Machine
>>> +#@NAME: BeagleY-AI (A53)
>>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (A53)
>>> +
>>> +require conf/machine/include/j722s.inc
>>> +
>>> +KERNEL_DEVICETREE_PREFIX =3D " \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am67a \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-j722s \
>>> +"
>>> +
>>> +KERNEL_DEVICETREE =3D " \
>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am67a-beagley-ai.dtb \
>>> +"
>>> +
>>> +UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"
>>
>> This defconfig doesn't work if you select an older BSP.
>>
>> Thinking on this, the only difference we should have between this machin=
e
>> config and the one already in meta-beagle is the default selected BSP
>> (bsp-ti-6_12 vs bb_org-6_12). Why can't we just have the one config and
>> select the BSP with TI_PREFERRED_BSP? We could do that externally
>> from the build env, or with a branding.
>>
>> The issue with this patch is we would now have two configs for the same
>> hardware, and there is no TI produced BeagleY, so having the machine
>> config for it in this layer just seems wrong. I have the same complaint
>> for beagleplay-ti and beaglebadge-ti, we should drop those too and fix
>> them in the same way.
>=20
> The difference between the two platforms is that one is supported by TI a=
nd one is not.=C2=A0 We do not answer questions or support the meta-beagle =
boards.=C2=A0 Those are supported by the community (aka Denys).=C2=A0 But t=
he beagleplay-ti board using the TI kernel and TI uboot is supported.=C2=A0=
 We will answer questions about them.
>=20

And selecting TI kernel and TI uboot is done by simply setting
TI_PREFERRED_BSP =3D "ti-6_12", why do we need to clone files for this?

> It was a decision from Sitara management to do this.
>=20

To do what? Support BeagleY, sure that is fine, we also support Wayland
for instance, but we don't go and clone it and rebrand it Wayland-TI=E2=84=
=A2.

We support community projects by working in those communities, in this
case the community project is "meta-beagle". So let's add support for
our TI BSP to that project, not fork bits of it into our meta-ti project.

Anyway to close the loop on the two threads,

> I don't necessarily hate that idea. Guessing this is hinging on Andrew's =
idea of
> overriding the BSP provider variable directly for our internal testing?

We could at very least start with this "beagley-ai-ti.conf" do nothing but
the following two lines:

require meta-beagle/conf/machine/beagley-ai.conf
TI_PREFERRED_BSP =3D "ti-6_18"

This would remove any duplication at least, but does introduce a reverse
dependency from meta-ti towards meta-beagle. So the first option of a
BSP provider override as needed is still my strong preference.

Andrew

> That's why we name them differently to draw a distinction between the two=
.
>=20
>=20
>> Andrew
>>
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#19562): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/19562
>>> Mute This Topic: https://lists.yoctoproject.org/mt/117964418/3619733
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com=
]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>
>=20


