Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947D6FD4F31
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 19:35:34 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3844.1773171326412121440
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 12:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Pihzy+Ht;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.30, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7yDRvcB1Xs3ZLhL2OI00O7mffRypC3nmrEIUpYEe2VyYEcc5Nk/qud/AXNrw+pCryINnawF1U1YGMmCzHG3EFtgmp5tr0radYkKJpsa9O4cLJZF5ztfZwt6eAzy5k6SpLRKN94LEHYcuVq7MtFXzVuZdYEwh7eGvJff+ocsotsnbofnQRoc8q1mTcMVmsKIRdZiQ+IWLlzMHnnCt0Br54AUoKK/JIFioZRxkrUxCZn+ycomW+S6OSVxv+n+HiVxnQG101EwAS74f2PSX/tNMwcQ50PLUSwz24TIOc2iWz5bL6r/3dXknmfkTnrowerXVSrcyCaaAds6qWaYqUlm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8hSM06vQeODXXLf+cCS+CLodNhAe8MFgJM/cxV919U=;
 b=iOldxxygs+XHvmQvDy2+gbfpwr+nZYsyD/qvIIJwwE6eAh387qYMTGXHzxLoSfe0ShZanTH6dheSuTWqGArmPyA8s9Ph8Qk3ciUwwTb64mMpmcd0nnZWnLDaPkdsNz6JiOgDuT0wVfS/BarXaKPYdZRS3v2kBtb3lfS/VuyxfWXHpdgvin/emsR39T3X1CUtF9tWNbg/qBLanjDPgFEcDVYVgO9Ux+Ps/+YYEkYGvQPXgnderKtb5VMNqRZ4fAPTxqGSJ0CyT261k49OIRl0up/f1ATEjiWTVHlv9hi0CG7De1u9R29FXEifxOOzJJnl/pFq4naGbQiQO1l2LAbrdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8hSM06vQeODXXLf+cCS+CLodNhAe8MFgJM/cxV919U=;
 b=Pihzy+HthJv0ectNyi94gkYseF/XIiTmFWLklshFrKzFu524hNs5H6ggHg/oQJyrJiLbtnek0axEalN89W8MJP7RBnNh9gcq7bBebnDpe1vvwEfLMuzmDbqUIqEq9Iu+HdgYPLprrlEyGvHxJ2DGnXi37WlrxhEKztGwc5Ctd8M=
Received: from MN0P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::15)
 by IA6PR10MB997560.namprd10.prod.outlook.com (2603:10b6:208:5e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 19:35:23 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::6e) by MN0P222CA0007.outlook.office365.com
 (2603:10b6:208:531::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 19:35:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 19:35:22 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 14:35:05 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 14:35:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 14:35:05 -0500
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62AJZ5Cc3668240;
	Tue, 10 Mar 2026 14:35:05 -0500
Message-ID: <a00be4fa-9f6c-49a8-8f65-9d6e4c928bd0@ti.com>
Date: Tue, 10 Mar 2026 14:35:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH v2 3/3] ti-jailhouse: Fix buildpaths QA
 warning
To: <afd@ti.com>, <s-sadik@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20260309170134.2779295-1-s-sadik@ti.com>
 <20260309170134.2779295-4-s-sadik@ti.com>
 <db6c1dd0-b13d-42d0-9d81-73fe1b2d9e9e@ti.com>
 <20260309185808.GQ11121@denix.org>
 <317026.1773133125690466392@lists.yoctoproject.org>
 <20260310135247.GS11121@denix.org>
 <131089.1773162481263461889@lists.yoctoproject.org>
 <77b645a9-1de9-47da-b41a-b41f1a342ad9@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <77b645a9-1de9-47da-b41a-b41f1a342ad9@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|IA6PR10MB997560:EE_
X-MS-Office365-Filtering-Correlation-Id: b751c78f-44e2-464d-74a1-08de7edc2b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|82310400026|36860700016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	LJLHAmKLTBDXtBzEg4+J4QFbf05N2Xcv0Fd2qBjf2dXp32hsOFpZ2AiwpK5axBXHzjWERLVGnugb53bZGlT1FgqFMyNLQtzaKMdOppHVphbD38oWja7l4u5FGIcYWmtnOCbEcPbswSLFy63zo2B8CLvW6NfxXGRuRrNHg/I5I0d17CAd8GeT8Op3kN2Sf7CMbbUIhWoDiNYbdZosIQ9KGLJxkWlzYppfXsBwejPfSj4GEjrkRxauh1PmQnmzDLIpB+6WqeTbIEWwgzeLG6wZuGZpj7EqnpJAHNAoo9vh2Bdg8En7gljF4HwusnxCo5Fp2Ar1xWU3BbF4a9h8C4HuEAj14K/IcyinSe6uxsfapGGESpUDuoClMHNxGcbSXqfkrSCBD1zV4Hq2OVP7KX4mz3lERbLm1D5NbGuKaWD26fWOGxd8ibi/GTf5yKHZl1gO/DsB6nhQ5Cfi+7RgTNnx+JaNkqLKioK55sF7c2+BYzo8go8WvXYb3LIvnMHvzrl1RvoHZvzbNNcH/DtT6v0uOdYWig4dwAt6Ymb1VXjp5lwHVtbFqrkIQTh+gK/5X/ycpp9Iyr55lS1M2UbMSOErZrhphkk4c8/dI6k/fDL6TyYIRoSHTi7qvPjI4SM2Be7+90MitSzPBOEXkbO9P/eZ3r7yMmDFTvETYeH5gNCRAzoADeVwclpvSRRz6rtPK4TMq/zjtCVwQuun96xMggySE6LURQDwbo8TXOufMZzY6XQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(4022899009)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	M8MG8eNkyAN+EbVWfisyrWcyHkn3i1l/CJC87B6ddkMgRj5TR01RBBOc9gFEtV+H5dfjdmtLBIqf6uIMngZq7dvft0OhiAWbuohqNFqLSbv31zSUuJa/z8aj9010fjXHhvPE+rJxYVFgdhxi3MdGBD0Oczo23dxF30uLu/m1eCYXnuYC2+Ig2yr6COavtJUrc7DOaOZLr1zvnWl9C/5B0/AwvOgSlCxI2BjS3vbjBpx75JQPB+s7yOG0RgSjaqDFrg3vHAeQb1Q2Vq8TOKqzPAdvTpW24l4tB7G+19L1gXDCbNxkRXGY7z/iBAfFYlKAeTMa2n7IKv+S4nAGb5PA1qcNm7H463RAWI1+XOblylk6S3b2NZhCl17W2L/qgdr+MuyNIvA5pI/+mBeDU50Ar+aKMNGBhvj29YUl/47cN+xp5viawpeep94r8wSo6UI+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 19:35:22.0958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b751c78f-44e2-464d-74a1-08de7edc2b93
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997560
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2026 19:35:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19695



On 3/10/2026 12:58 PM, Andrew Davis via lists.yoctoproject.org wrote:
> On 3/10/26 12:08 PM, Sadik via lists.yoctoproject.org wrote:
>> On Tue, Mar 10, 2026 at 07:22 PM, Denys Dmytriyenko wrote:
>>
>>>
>>> On Tue, Mar 10, 2026 at 01:58:45AM -0700, Sadik via=20
>>> lists.yoctoproject.org
>>> wrote:
>>>> On Tue, Mar 10, 2026 at 12:28 AM, Denys Dmytriyenko wrote:
>>>>
>>>>>
>>>>> On Mon, Mar 09, 2026 at 12:08:36PM -0500, Ryan Eatmon via
>>>>> lists.yoctoproject.org wrote:
>>>>>>
>>>>>>
>>>>>> On 3/9/2026 12:01 PM, Mahammed Sadik Shaik wrote:
>>>>>>> Add -ffile-prefix-map flags to KCFLAGS to remove build path
>>>>>>> references from kernel module compilation, ensuring reproducible
>>>>>>> builds and preventing absolute path leakage in binaries.
>>>>>>>
>>>>>>> This resolves buildpaths QA warnings during packaging.
>>>>>>>
>>>>>>> Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
>>>>>>> ---
>>>>>>> =C2=A0 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 4 ++-=
-
>>>>>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>>> b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>>>>> index 91076c9e..8308f0e5 100644
>>>>>>> --- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>>>>> +++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
>>>>>>> @@ -80,8 +80,8 @@ USER_SPACE_CFLAGS =3D '${CFLAGS}
>>>>> -DLIBEXECDIR=3D\\\"${libexecdir}\\\" \
>>>>>>> =C2=A0 TOOLS_SRC_DIR =3D "${S}/tools"
>>>>>>> -EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFI=
X}
>>> CC=3D"${CC}"
>>>>> KDIR=3D${STAGING_KERNEL_BUILDDIR}"
>>>>>>> -
>>>>>>> +EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFI=
X}
>>> CC=3D"${CC}"
>>>>> KDIR=3D${STAGING_KERNEL_BUILDDIR} \
>>>>>>> +=C2=A0=C2=A0=C2=A0 KCFLAGS=3D'-ffile-prefix-map=3D${STAGING_KERNEL=
_BUILDDIR}/=3D
>>>>> -ffile-prefix-map=3D${STAGING_KERNEL_DIR}/=3D'"
>>>>>>> =C2=A0 do_compile() {
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake V=
=3D1
>>>>>>> =C2=A0 }
>>>>>
>>>>> Can you move V=3D1 into EXTRA_OEMAKE and remove overriding do_compile=
()
>>>>
>>>> Thanks for the review Denys, Apologies for multiple replies was=20
>>>> facing some
>>> issues with relply all in mail.
>>>>
>>>> Moving V=3D1 into EXTRA_OEMAKE is fine, but we can't remove the=20
>>>> do_compile()
>>> override. . This is insufficient for jailhouse, which requires building=
:
>>>> 1. Kernel modules (driver/jailhouse.ko)
>>>> 2. Hypervisor binary (hypervisor/jailhouse.bin)
>>>> 3. Userspace tools (tools/jailhouse, jailhouse-*)
>>>> 4. Inmate demos (inmates/demos/*) =E2=80=94 causing the install failur=
e for all
>>> the demos during the build.
>>>>
>>>> The do_compile() override is needed to run a plain oe_runmake which=20
>>>> hits
>>> jailhouse's top-level Makefile and builds the full project.
>>>
>>> The default do_compile() does exactly that - calls oe_runmake:
>>> https://git.openembedded.org/openembedded-core/tree/meta/classes-global=
/base.bbclass#n399
>>
>> Yeah you are right, that the default base_do_compile() calls=20
>> oe_runmake, which would work fine. But, the jailhouse recipe inherits=20
>> module bbclass,
>> "inherit module python3native bash-completion deploy"
>> =C2=A0 which overrides default do_compile() with module_do_compile.=20
>> resulting in compilation errors if do_compile override is removed.
>> If I don't use the do-compile override I am still getting build=20
>> errors. I am unable to remove the module bbclass is required for=20
>> building jailhouse kernel modules.
>>
>=20
> Split out the kernel module building into its own recipe.

Agreed.


> Andrew
>=20
>>>
>>>
>>>> If necessary I can send an V3 by moving V=3D1 into EXTRA_OEMAKE, but t=
hat
>>> doesn't serve our purpose of completely overriding the do_compile
>>>> And also I couldn't find an existing bbclass that does "run the=20
>>>> top-level
>>> Makefile and build everything."
>>>>
>>>>>
>>>>>
>>>>>> Thank you.=C2=A0 I was going to comment on the v1 to not disable=20
>>>>>> buildpaths.
>>>>>
>>>>> +1
>>>
>>>
>>>
>>>
>>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19694): https://lists.yoctoproject.org/g/meta-ti/mess=
age/19694
> Mute This Topic: https://lists.yoctoproject.org/mt/118225330/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.c=
om]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

