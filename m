Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DF7FD2D93
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 13:46:58 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40351.1773150413568398898
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 06:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Q1gMsQW4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.52, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcPx/NjC6nyNDG+l+Q27Fpu3cvzzTRbMX8pmU8eTTpFV9foE0fdgBRhUAc+9DeeKCj/NDhYqc34fn32/IrETjv6ttnpG+ZhfzH2qCtvpZM8fSiH3LhPZrghdU4nBkMC0HfzbwAqk0dG+X2J5Q1/W5UQngNtBni/WN6Qwwdd6hpHqQNGYdKzGCt+nB/GUXbAODpYizketCW5sn/pLFv6hIWhYalAP+s46WnT3/VMMg5XEPlJVz2AIse7K70lpBOUu2STMZKGmf5eSKBK8A1EvRugqh19XlB2Pa4B+nrLsjKLu4zD/cIjXAlA7k/Ym7eUai9ia4FSEsHKDiY/BwUhEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QA7XeUs/mOy9rKRQt6TPlP2WXcPiRDzhYpmt/m6ZyTY=;
 b=zCdUQFZ/xCtbL7h4pruOTWx7l/URmY5x9SKgMkc6wCb+qyNenUakLoDBquTZEeVPjFCA5muQ27ElGf8+3QbtSDtGaLS2ieUDGynIY/8hdlfyuOLC+5vxNxauV27rSvIKnDlX+HWx2WKKVvPgG4TSafwbNgy8azoFImfAOy/dUvTOubRjSdWUvCppY0olA/JVeu3r4Z+YI6/pVL5OoHUQP1v/+uXbM3BwwrsmR8wPNHrNaXLYiu+yxTlicv0SbUKr9rT3KhVmip3GSIK674JZgp+cYmnGVn6W7egEygYj1M8gvueZQ1BnkdowSGp0FPAkek9/gc/C10NOFGcMZ1I2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QA7XeUs/mOy9rKRQt6TPlP2WXcPiRDzhYpmt/m6ZyTY=;
 b=Q1gMsQW401sS0WRJI7GJ4sJaptTnR+1RxcvNm+hC+8YQXQ3JL49I24LEV9hLkfTFZ/V6MalgVF8jViOKVvnOwkCKy2QZAc4Z7ri58C9HBt/GnWnJHWNiqorUO3lJ1K28F35foIUZgTlkte+Wuuxyou/8BipD5RBRpseFYc3hCsU=
Received: from BN0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:408:e6::24)
 by SA1PR10MB7633.namprd10.prod.outlook.com (2603:10b6:806:375::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 13:46:50 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:e6:cafe::94) by BN0PR03CA0019.outlook.office365.com
 (2603:10b6:408:e6::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 13:46:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 13:46:49 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 08:46:47 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 08:46:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 08:46:47 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62ADkk5T3163078;
	Tue, 10 Mar 2026 08:46:47 -0500
Message-ID: <1e7c192d-f8c5-4dbd-9601-cc8ed07577d6@ti.com>
Date: Tue, 10 Mar 2026 08:46:46 -0500
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
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <317026.1773133125690466392@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|SA1PR10MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: fe890ebc-dd1d-4eab-a001-08de7eab7a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|36860700016|1800799024|376014|82310400026|22082099002;
X-Microsoft-Antispam-Message-Info: 
	hSdtI7C4pr5IGuJesAMwzHiTFgrzJBx82buRKPHscBWuQnv68D3/h0a5275suLCbZO4xSh0/lUuJiHQm77TJNiBV6fjZK58EQiemX5o0E6+z6SeO5JnfEkhgWYy0vlYldQtmP5/SL1buXOFPZ/czKuPxtNCpFmU7PjjobsqCeiXACOfqg4rqPkGLgunIMA6MHePNiOLK3rr9pflfvRgF9R8kItXcuXQ4qUWS8D5bB0VdhZaZSSdXA2+iLVZHtSWS5IqNlM0hGPfN76pre50yfSC17x0t2GXRwIrfqKmjgIyWKd8zswK5Q1hfz3F5Sog1Ot6Wp67AEjD7j2RPGC9Mqb1+Xja7n16+UgwUlcC+xJ5WWd13Xp8xGrXFtc2eNghBHbnkmplLbtH9PKXOqwFE0pTIC5sOviedL4um4GD7hFoXbp6Q0hu+e2Kw3aeiTAqYYGJgPlVnpjomCzNjbsq9EYg8o3QGnSjwXw8uAfCrjiOYqv+88zgwRDrU1YtdfHY2TQ6OjbDVcX7Kzivz5Qbt9FKYXUCw0Sub2GXqzbLmDMc9n56ZQYtQ90OS8vha/LDtkef1DE0Mw7W2zC7l26oX3/A7Y+vwlcwDhR7LcYfzLsYWZ6Q88j0JF9++nI+Hrz9PfjT7bmAOXB1IB74z0AIBtt7ChOC7FENus9V+LtFCDhb1zguGXpC7g+NlVszAVUcqZkRmu8ztB5BTaJbchxUX3DnpD0lSOztlP4FXbiGCJNs=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(36860700016)(1800799024)(376014)(82310400026)(22082099002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bUC8zYFB72AXBptFmdrI3y8bPPxm6r982XcwiYIzZuAiuTntDDS2fynzScU5cxjD4LBQdO6AECzIt+M56DQdY9jR5q1PAjzgicdnOman1aDWFwvup79PHNaN+KWZAYYQluWXBdBvS9WZiEy/IRlbUqVybEIQGfgk+14P/aNJgTgss16rid+vcuFJXbHyDUpv10I40XAJ6E3uKZnRMPelu3MbmxIkaiBf+84nFU4i/STuK/b4zesDAj6iMhJSUsgoR3iTd29l0d5HZkDyPgj0labeeiAa6yttsLbQwhdotbjsNL5HD0OsOWCCNjAiPWrteJt8bs1BMWzJNPsu3Yzqi/n3+Uu3gG+q0iLLzTgAL6tpw5jBaeSa4lfGlQ8QWGYJ3LbQ033pdGw84+xUYIOJhY2kGMhBQdF6GARuaPJzEMrnYgvg9J0b0bZsqhUVgBLO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 13:46:49.3474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe890ebc-dd1d-4eab-a001-08de7eab7a9a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7633
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2026 13:46:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19690

On 3/10/26 3:58 AM, Sadik via lists.yoctoproject.org wrote:
> On Tue, Mar 10, 2026 at 12:28 AM, Denys Dmytriyenko wrote:
>=20
>>
>> On Mon, Mar 09, 2026 at 12:08:36PM -0500, Ryan Eatmon via
>> lists.yoctoproject.org wrote:
>>>
>>>
>>> On 3/9/2026 12:01 PM, Mahammed Sadik Shaik wrote:
>>>> Add -ffile-prefix-map flags to KCFLAGS to remove build path
>>>> references from kernel module compilation, ensuring reproducible
>>>> builds and preventing absolute path leakage in binaries.
>>>>
>>>> This resolves buildpaths QA warnings during packaging.
>>>>
>>>> Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
>>>> ---
>>>>   meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>> b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>> index 91076c9e..8308f0e5 100644
>>>> --- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>> +++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>> @@ -80,8 +80,8 @@ USER_SPACE_CFLAGS =3D '${CFLAGS}
>> -DLIBEXECDIR=3D\\\"${libexecdir}\\\" \
>>>>   TOOLS_SRC_DIR =3D "${S}/tools"
>>>> -EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFIX} =
CC=3D"${CC}"
>> KDIR=3D${STAGING_KERNEL_BUILDDIR}"
>>>> -
>>>> +EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFIX} =
CC=3D"${CC}"
>> KDIR=3D${STAGING_KERNEL_BUILDDIR} \
>>>> +    KCFLAGS=3D'-ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}/=3D
>> -ffile-prefix-map=3D${STAGING_KERNEL_DIR}/=3D'"
>>>>   do_compile() {
>>>>           oe_runmake V=3D1
>>>>   }
>>
>> Can you move V=3D1 into EXTRA_OEMAKE and remove overriding do_compile()
>=20
> Thanks for the review Denys, Apologies for multiple replies was facing so=
me issues with relply all in mail.
>=20
> Moving V=3D1 into EXTRA_OEMAKE is fine, but we can't remove the do_compil=
e() override. . This is insufficient for jailhouse, which requires building=
:
> 1. Kernel modules (driver/jailhouse.ko)
> 2. Hypervisor binary (hypervisor/jailhouse.bin)
> 3. Userspace tools (tools/jailhouse, jailhouse-*)
> 4. Inmate demos (inmates/demos/*) =E2=80=94 causing the install failure f=
or all the demos during the build.
>=20
> The do_compile() override is needed to run a plain oe_runmake which hits =
jailhouse's top-level Makefile and builds the full project.
>=20

Does the default do_compile() not hit the top level Makefile?

Andrew

> If necessary I can send an V3 by moving V=3D1 into EXTRA_OEMAKE, but that=
 doesn't serve our purpose of completely overriding the do_compile
> And also I couldn't find an existing bbclass that does "run the top-level=
 Makefile and build everything."
>=20
>>
>>
>>> Thank you.  I was going to comment on the v1 to not disable buildpaths.
>>
>> +1
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#19687): https://lists.yoctoproject.org/g/meta-ti/mes=
sage/19687
>> Mute This Topic: https://lists.yoctoproject.org/mt/118225330/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


