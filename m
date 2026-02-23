Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8848EEC2A9
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:44:35 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7577.1771886674722029703
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 14:44:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Pv7pZS2O;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.0, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuBBPDJf8UtEAxgayny5o7sCaQeIjKKsEJQnJOR/71p9rVYCUXbZgOF7LmHD1ab57Q9qxHH70xWXCiYJ6gFPr6x5QwgrEUzlY4C6g5HRcYIaTwwhcWuMvEsA1wOlFeWAvtpvZV8esBHOOd+Gy5GupatAl3Rami0VF4eyNT6CJEIks+ltvcVeAZnoCdUs9wTB4A6C5KMaMbaMvP5BQrC/q80xXsDQFll/FgHCj9kddtQQNnGgUgn/z8MnML97xA3B7xpBfiksQMsdnQd6WronJVUjbKF/3V7tHNr2B51GuT9i3wH73WSrZ+dSmxSDv21wv+Fy5hvn9rIR9MrCZhuAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbORU6AnQifQiApp7pbS2gfmoDU+XtaJbtAf5z152ok=;
 b=K+ewog4pv+hDcE2xbcTuk7tbVHiVcHklJpIN8V46dGsUfG1T81CWB1N2A+fnhO1Hng2MvMAddVJ7KlyyRCjwA9Iphhms3hRZW6UDnaWDp5M22gW8RzioIS+g07K9o6o7hc5npQR+MNtfC6qjcoXISe0Pw0scTiKik2kicdMx41EDdySR6aTKOvsmMSRkcMesdbkMNtLaIVFomld+8uAebfyFlmSKJFz+fODJCqEVLQfTb5MeD5ZENthDhE2zRNzSQCGKXfvww0SxYcV4zSezvk/ADhnmYp9gCjGHcqdhKeczEkBRcxhSs4N/2XYaho2ww4Rw6oJiOaiLsGesiVx1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbORU6AnQifQiApp7pbS2gfmoDU+XtaJbtAf5z152ok=;
 b=Pv7pZS2Ob7uLYwrCA/XJnPURK7eUxMnlQqMKwfRpDzx3YARQIoSs3q9oJYouBLXl9IX3eAFNJzQbEGByDKoPrurNW4z3Xw1QvgbEj2YW+cYQi0mXwdjfv9FRI9gUVCE0wqLieMTQyBnjhhrUvIKCkZdqKfbCypRnQam4lfP1U7I=
Received: from BN9PR03CA0882.namprd03.prod.outlook.com (2603:10b6:408:13c::17)
 by SJ0PR10MB4526.namprd10.prod.outlook.com (2603:10b6:a03:2d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:44:32 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:13c:cafe::1f) by BN9PR03CA0882.outlook.office365.com
 (2603:10b6:408:13c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 22:44:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:44:32 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:44:31 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:44:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 16:44:31 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NMiVa81132618;
	Mon, 23 Feb 2026 16:44:31 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Feb 2026 16:44:31 -0600
Message-ID: <DGMPEJHDVVAV.115WV93LJE8N@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] conf: beagley-ai: add beagley-ai-ti
 configuration
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>,
	<denys@konsulko.com>, <praneeth@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223202236.3642261-1-rs@ti.com>
 <75b44163-9157-476a-98af-384aeaa6c48c@ti.com>
 <ff5eecf3-37bd-4f59-8328-930d883f165c@ti.com>
 <DGMP1O03MM2D.1ACCARZ9FSNHW@ti.com>
 <7e3a364d-5547-4478-b461-28979e200a18@ti.com>
 <18970112B33DBA78.1454197@lists.yoctoproject.org>
In-Reply-To: <18970112B33DBA78.1454197@lists.yoctoproject.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|SJ0PR10MB4526:EE_
X-MS-Office365-Filtering-Correlation-Id: af97f4e5-6a35-44c4-18b0-08de732d1c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZGx0dmN5dFlmRXNIb3l3MFg5VGdzNVJTU1FpanR1clJWd3ppVDE0Zm8yS2dq?=
 =?utf-8?B?ZzdweUs1TVZ3TDBOUXlFT1BkZnB2ZUhoZ0h2WnBvSGRmcmMveFBXWVhFS3VY?=
 =?utf-8?B?RjFoQUFBSlVEeWY3RUp1YkZlYjVjaG8vRTRJMUFublJqS0VTdFBEWVZrTXhX?=
 =?utf-8?B?MnpzbCtiWHVkejZIaEc2cTNDRWV2TzM0MUxIdXUybklwNkhhY3lYVGF3aDI3?=
 =?utf-8?B?MHlOL1hIdW85TGV1eWtJU2d3L21nSTRXeWhKYzI1QkkxU2NLMTFyRndsYWhV?=
 =?utf-8?B?L2ZRS2dPWlNBSkYzZFltS29VQ3JlWXZhVVA5YU03YlZreE5qT3B3WFZRUTEv?=
 =?utf-8?B?LzI4anpwajJ6OWRqeTZSR1dEaVNtQ2JNZS9OU1RaYnZ5UWEvdVc2ZG52VmFm?=
 =?utf-8?B?Z1J0M05xcTBJcDNXTVozTUtsTEhpZGQyeVFPZE5pYXkzRmdacktSdFcxNjRQ?=
 =?utf-8?B?bVYycDJKcVVuRitqbGFmdkswUVJoU0VmeUJRUGpwc245dVcyNTQzNmFXL2tD?=
 =?utf-8?B?QVg5RXRvRkNyRWFTRUMrdmdSbzd1a1ZkeFplbXFuRW1JcHVKQitBTjN3bFps?=
 =?utf-8?B?MFQyVWZ0OEdhL2tKelJUa1VvQ0h2bDI5OEtwa0o0L0xJL0RWaUdIRVpXY3p0?=
 =?utf-8?B?czE0SzkyWnhHK1llY1ZBNkg1WEg0K2VTSWZIT3MrNUUvSmZvU2NjcGNPbnI3?=
 =?utf-8?B?b0duWFFTY1ZPUy9ZY1Z1andkUEtydVUxSk5sOTZZbVBlVThXbGxDQk9kekJv?=
 =?utf-8?B?TjNjdkl6YXZtNWpBN0EzUEhhUURRbXpOLytrc2VIcnpyWVM4SFl6cHlJQnlD?=
 =?utf-8?B?UWJqb3E1OHJsMkc4Um9DczFlTk93UEFqb3lmZmlFc09mYm5YY0ZORTgvYkVL?=
 =?utf-8?B?M3BvblV1cHowR0JEUWJKMGJyNGNLbWpJWGNXeVdqclpydVYxb1BLS1ZmSUtQ?=
 =?utf-8?B?dHIyeTlQTFlyMHM1azhJNjNIUzZNcVVXdVlwN0huM0ZYRDZpWk0zbmkwUFVG?=
 =?utf-8?B?YlhLUDdXNkdrb3YrT1dUbGVOYVhYQ1FPMkdmLzdCejVVVjlrQ3dBVmVrWWc4?=
 =?utf-8?B?WnNvUEFFUzRaKzJPS0F0ZGZ4WTJGVkFQcHlzUysxd2VMYkNkQS9LazczU0ZQ?=
 =?utf-8?B?YlI5WHZzbXdiVHRFdDBOYVFQTXBPaHNXcHFlWERCYnhGd1FLTVJmRlpyclNa?=
 =?utf-8?B?bmRjejBDUitGRE5GQW1Ba21VTHNpNFlYS1dYRDdTSjZlVWlOZFR6aCttTjRP?=
 =?utf-8?B?U3hoRWducXVHeS9iaFEzNzVPdGV5YmlXdHNoM0xWNldDZFhEZThZWmNkb3V5?=
 =?utf-8?B?UmFEKzFvKzhlMDZ2OU1OSlNNdDVhY1VpeUI5NUhtcUpqZ0J5cm9hY0hiM1Aw?=
 =?utf-8?B?REZsakNPajNUNkNjOEdiZ3BuTkk4bURIZXllc2VPUERsczhwUUhBSytSek4v?=
 =?utf-8?B?S0c0aXZVOW1rZ0liemR5NE0vRXAzWXMyMVZDOUluYVRCVGhUVjRISnphZlhB?=
 =?utf-8?B?TXVtUmxrQjhZS0NPemM3SjZhWmtaRkRyazk1S2R1OHN6OE5xaTRNaFlWSEdI?=
 =?utf-8?B?TjJsM1RrSmc2bXUxRjNyelNaajF0cWRDdHZnenppbUR1VWZhVUlDMGwrRGF5?=
 =?utf-8?B?VGhNTlBSWE9MNElHQUo1ekwvSFJldW1sSjMxMzNqNEc5UDZNbHlEVzlDTjNY?=
 =?utf-8?B?dmpjamJXdUM5TDZ4eC9uRG9Uck0xYTZOQ3NPZmFxRkgxMUVZOWlVb2NyY1A1?=
 =?utf-8?B?VWtNQzRDbFc4ZUhTQ3YyVkN4SUcrajB6di9Sb3FpSHRnUVV6S3BiRVN4QlRs?=
 =?utf-8?B?VlRWaVVOMUxHWGtRQU5DbDhMRG1rb1VBWFRPdFB4b2t5RVFnVGFrdWxWbHhj?=
 =?utf-8?B?VGlsQjJHMlpObVRKTXRaQXkvWWkrVWxkdzBKZDdiRUxSUDh3QmtrMnB4aVF3?=
 =?utf-8?B?aVhqSCttUTdUeFJxNU1QYWZqNVR1RHVqUTVrTDZPWjlEV2E1aGxRWmxMYkdn?=
 =?utf-8?B?Yko1d3N5ZGRtNVFqdmxpbWhsMjh2SUNsalJYbUo4dm9Pbmlid1JWRWlaLzFs?=
 =?utf-8?B?aVZ6VnZBRnJRa0VtWVR6VWNETUk3MGU3Q3ppS1AwSnBVWHpGUkhnamFIaExF?=
 =?utf-8?B?SWZ3YnNoUHpNelM5M2RBbnpsYmNmUmVFU2lzMHQwMWp0cTN4c2RiS25HdmQy?=
 =?utf-8?B?RHpKMGFtdWJ3MVBJaGhMZ3VoaFZCdWJEemYxUGZaendEQk9keE80T0FvQ3Bu?=
 =?utf-8?B?S0ZPT3ZwZ0pPb0ZlelFFZEF2YUJBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BYnJKnkmIb6a9AzP6yhg4OwM/vFKsQ/HE8qDHiwzr5dgggpdgqO1xrScioOYkOnFfORCqQNg2QYsLmIktmVe6KVRhmQbEDrdz0l1wNZ+9ouvsCXxAtMpa1GnflNPh5wvw2nrToW4mYby8yi38w6BsvDK9wGO6Twc8/A+IVxV9XKHEqyyLODdFBtzsKQw5QrEoeJ/Q7jRFQ5lenH16T4KdBHO4lkjS569N7ihufpOF7doKe+ylXTi3yGgRtpxZU/dbHoprAfW3wEszgrpXch8inZBvgWU25VhKhsOeVRsHfp4Z1Z1MlCzhrTm8RwzFBE9sIbd0dNvpov5Hz2wbjic6pdGSk+WEh3OqLLxXnf688+cKrDd/IrlzgNWir412UjhwTx2RJlHTtFjJ2FRZHmGvB22edkHjwurY6N/oOVcMQLDfOMirjtZbasOerKcd1Bk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:44:32.0066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af97f4e5-6a35-44c4-18b0-08de732d1c74
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4526
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 22:44:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19576

On Mon Feb 23, 2026 at 4:35 PM CST, Randolph Sapp via lists.yoctoproject.or=
g wrote:
> On Mon Feb 23, 2026 at 4:31 PM CST, Ryan Eatmon wrote:
>>
>>
>> On 2/23/2026 4:27 PM, Randolph Sapp wrote:
>>> On Mon Feb 23, 2026 at 3:54 PM CST, Ryan Eatmon wrote:
>>>>
>>>>
>>>> On 2/23/2026 3:51 PM, Andrew Davis wrote:
>>>>> On 2/23/26 2:22 PM, Randolph Sapp via lists.yoctoproject.org wrote:
>>>>>> From: Randolph Sapp <rs@ti.com>
>>>>>>
>>>>>> Add a TI configuration for the BeagleY-AI development board.
>>>>>>
>>>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>>>> ---
>>>>>>  =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf |=C2=A0 7 +=
++++++
>>>>>>  =C2=A0 meta-ti-bsp/conf/machine/beagley-ai-ti.conf=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 16 ++++++++++++++++
>>>>>>  =C2=A0 2 files changed, 23 insertions(+)
>>>>>>  =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti-k3=
r5.conf
>>>>>>  =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/beagley-ai-ti.co=
nf
>>>>>>
>>>>>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>>>>> b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>>>>> new file mode 100644
>>>>>> index 00000000..88d0888b
>>>>>> --- /dev/null
>>>>>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti-k3r5.conf
>>>>>> @@ -0,0 +1,7 @@
>>>>>> +#@TYPE: Machine
>>>>>> +#@NAME: BeagleY-AI (R5F)
>>>>>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (R5F core)
>>>>>> +
>>>>>> +require conf/machine/include/k3r5.inc
>>>>>> +
>>>>>> +UBOOT_MACHINE =3D "am67a_beagley_ai_r5_defconfig"
>>>>>> diff --git a/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>>>>> b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>>>>> new file mode 100644
>>>>>> index 00000000..088cbd62
>>>>>> --- /dev/null
>>>>>> +++ b/meta-ti-bsp/conf/machine/beagley-ai-ti.conf
>>>>>> @@ -0,0 +1,16 @@
>>>>>> +#@TYPE: Machine
>>>>>> +#@NAME: BeagleY-AI (A53)
>>>>>> +#@DESCRIPTION: Machine configuration for the BeagleY-AI (A53)
>>>>>> +
>>>>>> +require conf/machine/include/j722s.inc
>>>>>> +
>>>>>> +KERNEL_DEVICETREE_PREFIX =3D " \
>>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am67a \
>>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-j722s \
>>>>>> +"
>>>>>> +
>>>>>> +KERNEL_DEVICETREE =3D " \
>>>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am67a-beagley-ai.dtb \
>>>>>> +"
>>>>>> +
>>>>>> +UBOOT_MACHINE =3D "am67a_beagley_ai_a53_defconfig"
>>>>>
>>>>> This defconfig doesn't work if you select an older BSP.
>>>>>
>>>>> Thinking on this, the only difference we should have between this mac=
hine
>>>>> config and the one already in meta-beagle is the default selected BSP
>>>>> (bsp-ti-6_12 vs bb_org-6_12). Why can't we just have the one config a=
nd
>>>>> select the BSP with TI_PREFERRED_BSP? We could do that externally
>>>>> from the build env, or with a branding.
>>>>>
>>>>> The issue with this patch is we would now have two configs for the sa=
me
>>>>> hardware, and there is no TI produced BeagleY, so having the machine
>>>>> config for it in this layer just seems wrong. I have the same complai=
nt
>>>>> for beagleplay-ti and beaglebadge-ti, we should drop those too and fi=
x
>>>>> them in the same way.
>>>>
>>>> The difference between the two platforms is that one is supported by T=
I
>>>> and one is not.  We do not answer questions or support the meta-beagle
>>>> boards.  Those are supported by the community (aka Denys).  But the
>>>> beagleplay-ti board using the TI kernel and TI uboot is supported.  We
>>>> will answer questions about them.
>>>>
>>>> It was a decision from Sitara management to do this.
>>>>
>>>> That's why we name them differently to draw a distinction between the =
two.
>>>>
>>>=20
>>> That really is unfortunate. Inclusion of meta-beagle in meta-ti does no=
t make
>>> that clear, and the layer README(s) don't offer that information freely=
 either.
>>
>> I would rather drop the beagleboard-ti and all TI versions of the beagle=
=20
>> boards and just rely on meta-beagle and what beagle officially supports.
>>
>
> I don't necessarily hate that idea. Guessing this is hinging on Andrew's =
idea of
> overriding the BSP provider variable directly for our internal testing?

I've been informed that both paths should be easily traversable. It's not j=
ust
for testing purposes. As to what should be the default behavior, I'm gettin=
g
mixed messages. If we want to unify to a single machine configuration then =
the
default behavior must be defined.

