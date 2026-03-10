Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5956EFD4F11
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 17:59:22 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1723.1773165556337244762
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 10:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ROBLe9i4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.59, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDWP+J4lJYXJf47qdlGUQRYAMxqBfRwYnVSLZMWvQQkF2dqWYwBzDmg1X/sScmXS1v0pqbNMqXa98CGV7kqJ+FSElTVg/XZ6gj6J79Kelm3TWagxhtHmWNWl3JDBuOpMFIMgoU2yeA/XJPcEl9xmjXk7JkbRpLyWFOFTXhNUxJr3qxn96u4KdAsp1g4glGkyZDK2vsihkruynJXTX41HlgZZNm5g2ShEmQN4CAclC8lODw0fsiIWJaTR1iE4IAhqLdvbujDmECS9+1B1XHauNAHh/hOSkfOYkFGDe22T9bt1dLdlIaBqHXSrP1EPoH3HpqhbSxLgKnM9Dy8tUVVjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjSmZS6Ox6sD3kpSayLZR0V4cMJWq50GVSJOlVqcs8M=;
 b=ivmoyREMO6a+bStBs53pecvhaQrMYIz37wK13cH0SPKwLOpKSAuo1BhHtRjgtmalA5Tj/90VxGzk1HJbVZ7ztUHJCslJIVHTbX45kjNTunomNtf7nMTMiMR7z83y/aw8dFtfutWHC+uOFJ0w87apQbs0J473UJMJpuAraDMspQE/+wXESGeTnOJBDzqjHXikDMBENeQC+WOBybajQMo7Llu+ZBCCEwO7p9PjLOUQ0VS05vCWglmaWhmxZxIiV6x3C7vl3z/zaCjomqHXlAEYwJgCzMfKINOjwVztnqLsPISzgE2kE0NU+AIUT2GVEHjlXfaN/bi/DI/w43UFaw5D3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjSmZS6Ox6sD3kpSayLZR0V4cMJWq50GVSJOlVqcs8M=;
 b=ROBLe9i4Il9ov+mom7e2ab7V6DbV1llYCijdu1sPqYasr+S5mRPOJ0EUa5e+uPZ6rdhW3cCpnZuSzTrpO8ROAjKQ4X+mTAAhTGZ/+9AzyQRP6SOtNz2aky5yY3swFHtOBWBh6OU7hDbrSpRv5KxgFYK1scv2sk37wA57A1WaxIM=
Received: from PH8P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::33)
 by CYYPR10MB7625.namprd10.prod.outlook.com (2603:10b6:930:c0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 17:59:13 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:510:2d7:cafe::82) by PH8P222CA0022.outlook.office365.com
 (2603:10b6:510:2d7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 17:59:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 17:59:11 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 12:58:39 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 12:58:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 12:58:39 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62AHwdog3532962;
	Tue, 10 Mar 2026 12:58:39 -0500
Message-ID: <77b645a9-1de9-47da-b41a-b41f1a342ad9@ti.com>
Date: Tue, 10 Mar 2026 12:58:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH v2 3/3] ti-jailhouse: Fix buildpaths QA
 warning
To: <s-sadik@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20260309170134.2779295-1-s-sadik@ti.com>
 <20260309170134.2779295-4-s-sadik@ti.com>
 <db6c1dd0-b13d-42d0-9d81-73fe1b2d9e9e@ti.com>
 <20260309185808.GQ11121@denix.org>
 <317026.1773133125690466392@lists.yoctoproject.org>
 <20260310135247.GS11121@denix.org>
 <131089.1773162481263461889@lists.yoctoproject.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <131089.1773162481263461889@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|CYYPR10MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 402bb974-f81d-4248-9764-08de7ecebc06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|4022899009|36860700016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Knz3WjyUx6+HzF1VUcf7ebHpdAsHTM2t8Rv9b1bR201HjkrZijD+F2QNeEHrtN4hRfEkH6rc+8vak2BEsjqoLGZTJ7xesxw0ZL7nqNFAYPOfUdVChiHSeo2gy7VDe6klW1Tyxov1pSpdmNM/RcyJx31Pt7EiWeSriZnXh4w15/iDmZaDveB8A4eEElsQh0zackLRpbD8R0w9brVEEltCwDyJmr2zVF8nUg+kPFvunuktMdZ4q7YZj8RfA3rtqQQxHkV3kms3K5gbAQmWv4WOs4XQX2DA0s0u7gvS30RlnInjcAnlPQ7bez/TU747jy/eBRoAM3jiX2t4/0f0Vis/JdrvB0SADsKULfU6IvHAuTEXVoCn+XjS3wdOCpcglQCcXAocM6K1DAAfliUqaBMzeHPHwxW7BXpU9f8c20elImq+ctpFkpNFYA4NriDKilCUAFoxzLXWE7S/VMmCLpCPre//9+GLuesKbwP5SC5BgxYE5x6eRgRnKVn+ySUgaH0njCwCj3zA2QDX5Isi47x67LNDhIvv8F3UGEUGb2Hfl9xmeeMPft3jn28CCS6NtWas8MpwTOgE+8fxo29vS0uBWoTt7wSxcF7oOOVXkeIgyvkYagnv5anF/ngorIVqrVuy8kkeYicRsAoF8fG9Fn5oaNtrXILw/uEz9KLZF+j70/3LWI1Su03OWUKmjjImINXHL3Z6V5Sbi9f91gf1DfnYcPBCDTGLFPykf2hCk3Uh91o=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(4022899009)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	seWuUZK81MdyR5T6FOIL8K3lkf8Nz1yQzLcgSM77Ea33/D1zl7ylgM0cQH2LeFkbV25PTgvRA755vHuajCzQouX76REfixl4olmV508RaXBn0h+FxwMIkFw3v/LHIy7vgTl9C8l8oUMvL53vk5dfwqncTPoyp67SzEzaMYlweEHcmNT73HEnGZUBEDK6NFwhGY6+fciuxlXWQ7R/AhwNGSVIuPJsbBPj96xbfeknL13xs9rRx4fGxJI3UhN/cqmD66dCSI9z7HoV8UHVtZRTmo6xoOgV1a/p7i72UjQlwv+L/DjyIaH6IFuUqAl80z1wApXRdLei+c5QZveunqc75d+bqVKBefimYA2wDpmyEvHw+sEzEEXqWGpkVGhyQoGQdy/R3unvc4sjvZYDNJ4sLDjkJIjiB0u6VhM6w1/2r5nRx/CtCrKa/gnShu73AiEi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 17:59:11.5297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 402bb974-f81d-4248-9764-08de7ecebc06
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7625
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2026 17:59:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19694

On 3/10/26 12:08 PM, Sadik via lists.yoctoproject.org wrote:
> On Tue, Mar 10, 2026 at 07:22 PM, Denys Dmytriyenko wrote:
>=20
>>
>> On Tue, Mar 10, 2026 at 01:58:45AM -0700, Sadik via lists.yoctoproject.o=
rg
>> wrote:
>>> On Tue, Mar 10, 2026 at 12:28 AM, Denys Dmytriyenko wrote:
>>>
>>>>
>>>> On Mon, Mar 09, 2026 at 12:08:36PM -0500, Ryan Eatmon via
>>>> lists.yoctoproject.org wrote:
>>>>>
>>>>>
>>>>> On 3/9/2026 12:01 PM, Mahammed Sadik Shaik wrote:
>>>>>> Add -ffile-prefix-map flags to KCFLAGS to remove build path
>>>>>> references from kernel module compilation, ensuring reproducible
>>>>>> builds and preventing absolute path leakage in binaries.
>>>>>>
>>>>>> This resolves buildpaths QA warnings during packaging.
>>>>>>
>>>>>> Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
>>>>>> ---
>>>>>>   meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 4 ++--
>>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>> b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>>>> index 91076c9e..8308f0e5 100644
>>>>>> --- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>>>> +++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>>>> @@ -80,8 +80,8 @@ USER_SPACE_CFLAGS =3D '${CFLAGS}
>>>> -DLIBEXECDIR=3D\\\"${libexecdir}\\\" \
>>>>>>   TOOLS_SRC_DIR =3D "${S}/tools"
>>>>>> -EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFIX=
}
>> CC=3D"${CC}"
>>>> KDIR=3D${STAGING_KERNEL_BUILDDIR}"
>>>>>> -
>>>>>> +EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFIX=
}
>> CC=3D"${CC}"
>>>> KDIR=3D${STAGING_KERNEL_BUILDDIR} \
>>>>>> +    KCFLAGS=3D'-ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}/=3D
>>>> -ffile-prefix-map=3D${STAGING_KERNEL_DIR}/=3D'"
>>>>>>   do_compile() {
>>>>>>           oe_runmake V=3D1
>>>>>>   }
>>>>
>>>> Can you move V=3D1 into EXTRA_OEMAKE and remove overriding do_compile(=
)
>>>
>>> Thanks for the review Denys, Apologies for multiple replies was facing =
some
>> issues with relply all in mail.
>>>
>>> Moving V=3D1 into EXTRA_OEMAKE is fine, but we can't remove the do_comp=
ile()
>> override. . This is insufficient for jailhouse, which requires building:
>>> 1. Kernel modules (driver/jailhouse.ko)
>>> 2. Hypervisor binary (hypervisor/jailhouse.bin)
>>> 3. Userspace tools (tools/jailhouse, jailhouse-*)
>>> 4. Inmate demos (inmates/demos/*) =E2=80=94 causing the install failure=
 for all
>> the demos during the build.
>>>
>>> The do_compile() override is needed to run a plain oe_runmake which hit=
s
>> jailhouse's top-level Makefile and builds the full project.
>>
>> The default do_compile() does exactly that - calls oe_runmake:
>> https://git.openembedded.org/openembedded-core/tree/meta/classes-global/=
base.bbclass#n399
>=20
> Yeah you are right, that the default base_do_compile() calls oe_runmake, =
which would work fine. But, the jailhouse recipe inherits module bbclass,
> "inherit module python3native bash-completion deploy"
>   which overrides default do_compile() with module_do_compile. resulting =
in compilation errors if do_compile override is removed.
> If I don't use the do-compile override I am still getting build errors. I=
 am unable to remove the module bbclass is required for building jailhouse =
kernel modules.
>=20

Split out the kernel module building into its own recipe.

Andrew

>>
>>
>>> If necessary I can send an V3 by moving V=3D1 into EXTRA_OEMAKE, but th=
at
>> doesn't serve our purpose of completely overriding the do_compile
>>> And also I couldn't find an existing bbclass that does "run the top-lev=
el
>> Makefile and build everything."
>>>
>>>>
>>>>
>>>>> Thank you.  I was going to comment on the v1 to not disable buildpath=
s.
>>>>
>>>> +1
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#19692): https://lists.yoctoproject.org/g/meta-ti/mes=
sage/19692
>> Mute This Topic: https://lists.yoctoproject.org/mt/118225330/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


