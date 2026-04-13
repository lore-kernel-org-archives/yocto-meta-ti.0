Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8128FF34C56
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 14:15:51 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.272873.1776089747914381622
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 07:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=LBK3bQQw;
 spf=pass (domain: ti.com, ip: 52.101.48.26, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzqkNK9P2C1+0fnWMFfvX41/wW7qaAiCNJQx5OUHg/39uBACZjmSANIpAzlCqs7+VXYd40NEy7YsYg41mqhxoTnLTKW7omooKbcZWjfgKoFInY3383YJ5FBgFGZU1C9WVWhUKyUUIVCxFAgj8hF6AWrVSl3svSfrHED1wWMHD320yDIjE39NA8XunEfiIjIVlDeIrBFSEdQZ34S7A0HDcvA8NeKP87GX15XeSNRuLyjKTJiEklL/k0sWDOu7vaIFuOU14xdBXmX4lTrz8JjPwTTpYjUwORerb6dLrsnkXnabJLq8Gq1lQc8v3757AvLY9VR1+CBjkGn+QeqU0UnrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZpJjvN03VczuxwfxUcx5f3pg4XCqLy9N5/CCv2Udb8=;
 b=He4CtkqiA+eryq8EAYN5DwJrMO20rYZjYwwdEmd5oXq7vFd6a442Oo8OWMRYKRSJXpi4OPulBBvxQKeuV28cH1A+GpwStq5vzNh6g68IzSAtDy/zWGP1GlWtYByMIiwb3CIBDOZ3aNvMoUaUfqEYr1n1rhNk+Nlkx3pTMoAXRFfReRXkHJsVZqj2PSpAXYadvyWwhaClQrt7CJLREufWq0sUHColqhvH+lBaqH23gBuceEiyNkGGRY0PlMnLxg5nI9wBdjDjP0GIXRd0nExtSnz+Qq9ZUh4ByTA/8gM+W+LYUHkquakhACB4CXmeqrvuogFrnnTVxWSSBcEIeY/zqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZpJjvN03VczuxwfxUcx5f3pg4XCqLy9N5/CCv2Udb8=;
 b=LBK3bQQwyl9HHOuoCIWQNLj7RTOppwE7Y4UPl4ve4XknAtNR3WbY6/g0axqGj0vMeNB/byqTax51JEQAxSPjgJy2dWeG3FBWVOVK6b14xGvF3iLDJuU1lB5h/dUphgA4nmmiiLjGcI7quFN8p4SATuI0wWD4k3vcJx9D2hBW0J4=
Received: from BN9PR03CA0928.namprd03.prod.outlook.com (2603:10b6:408:107::33)
 by CH3PR10MB7702.namprd10.prod.outlook.com (2603:10b6:610:1a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 14:15:44 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::b) by BN9PR03CA0928.outlook.office365.com
 (2603:10b6:408:107::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 14:15:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 14:15:44 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Apr
 2026 09:15:43 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Apr
 2026 09:15:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Apr 2026 09:15:43 -0500
Received: from [10.249.65.135] ([10.249.65.135])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63DEFhIf2223578;
	Mon, 13 Apr 2026 09:15:43 -0500
Message-ID: <a9c86782-7d72-4b09-9b9a-01da1471058e@ti.com>
Date: Mon, 13 Apr 2026 09:15:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] BSP version selection forces initramfs integration
To: Francesco Dolcini <francesco@dolcini.it>, Vitor Soares <ivitro@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>,
	<vitor.soares@toradex.com>
References: <78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com>
 <af751f95-21e8-4965-ab98-4c973287ca67@ti.com>
 <f209ae25048674fe300084b618138e6216d83afb.camel@gmail.com>
 <205a16be-e76e-4658-966a-f585eb84943e@ti.com>
 <4b862070791c1b8fca67bf19a09a34d5c1180684.camel@gmail.com>
 <20260413071235.GA249967@francesco-nb>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260413071235.GA249967@francesco-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|CH3PR10MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 72faa2b2-8522-4bc7-5de3-08de996726a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|22082099003|18002099003|3122999024;
X-Microsoft-Antispam-Message-Info: 
	TgmeO1HUgPNfXrmsVxuhfmWne0sM7FnCmKPOZp4Lr3RejUJDxskoVdirywIoOIye4uLeglf88qDgsqUpu87kk8I4suqAYe9tWFkEsZ+2xt6ew0FJLkFv8qH1VBTBIWtRmAgeWhyA/rciOGfGMuYEIZJvxifSiPGVSpkpKMbZfiR5nhJAXPSXt944IjFXYbC6/zfbSU/RXSNdczkyTxcPDQ5ZBSy9AomVhWPHiZXDnLVUpmUPlJLFiIx4Csd7unj+RToEgr2jyl/+3BWf5lxq/4Av2ijoqIRJlGhGfL3pVZ3TWkkthgOF5HhT/57H8muJDwGvjHYADcBfztWM+p7g7E+nQ5/0eXms155RTeiMlRvs93zKsu2qQtg5OUAdQLOalNh5AuvlTY5zOdIL7mqaIZFFA1RdWvoJ2uYPbDu0a1OQH46MY4Snp+HZrRvydocIdQgrakeKqPSS5Mv++zJaPN8B2nZHIjfq62NgSc8GsHI8V6AT4CI4XWCKz1vykm7PyCZoDQHiX4cexnA3pbr/lFjsCX760LcP0hgOV9TypRbQEEcqYLTZUwv7UVjK/HycIfkF4mx3WOUCftyVIgIckMzy1W7lO2AhX0QEl/QCKpyweWXQIEEPZ/mFPeW5J45GhvLlu5KfDeHaCXQkaohCuKm9yeGDaorYYs/JwbxWDocH6RgO+SCkbeTw5Jv9KEEheKII2/aequ2UY+qcuF2X9AHEfvtdps9hL8BcHGiuzLaI0LLDGfPowGBsyM+eIVfCp8zgDRCvAjQLOalF0MfaPA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003)(3122999024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Dgp5QtqNs8JKk50gvYJe+Tw3kxxZ+laGQU9o+j+ek9SDnEekQYqgAykGoxTXvpizHBXV4UqKPIrSSdihlWQHTpO1BXfDRwDbhR/yhEclkIed0/wGN/723XrIR2up0YsDzI7AWG5+b/VA8pQJNzJtussOIehbUv3m+Awv9HvTCaMivMgZU1BEjbilBBkgHSRU69BAEJMcRvcKN6C4CQLnfLT22k8JK44fyKBFHUyEBEwa5wNmPfXC/7cJpY/DmcXh/kQGsFlMk+utzMcE0UgoDST2CCbOerxnLl6PjK1Z5jP8YM80y/nkUI1Jexn0H9umtopgScnGgQYKmYvLrT1vPeOwT7rA+LCUx/QhVhMCZ6gk03tigpGpDWGwt3IZawfHIYKX9mOvWUyHPIgguz0heHeaC5Up1tHHu1LqRilz1HQHVv+hJhv1H97PuBaiE3Rj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 14:15:44.0954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72faa2b2-8522-4bc7-5de3-08de996726a3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7702
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Apr 2026 14:15:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19841



On 4/13/2026 2:12 AM, Francesco Dolcini wrote:
> Hello Ryan,
>=20
> On Wed, Feb 11, 2026 at 06:48:16PM +0000, Vitor Soares wrote:
>> On Wed, 2026-02-11 at 11:50 -0600, Ryan Eatmon wrote:
>>>
>>>
>>> On 2/9/2026 10:31 AM, Vitor Soares via lists.yoctoproject.org wrote:
>>>> On Mon, 2026-02-09 at 09:11 -0600, Ryan Eatmon wrote:
>>>>>
>>>>>
>>>>> On 2/9/2026 5:21 AM, Vitor Soares via lists.yoctoproject.org wrote:
>>>>>> Hi meta-ti maintainers,
>>>>>>
>>>>>> We've hit an issue where selecting a BSP version (e.g. TI_PREFERRED_=
BSP
>>>>>> =3D
>>>>>> "mainline") also forces initramfs integration via ti-soc.inc (lines =
32-
>>>>>> 49).
>>>>>> The
>>>>>> bsp-mainline, bsp-next, and bsp-ti_6_18 overrides all unconditionall=
y
>>>>>> set
>>>>>> BUILD_CORE_INITRAMFS_IMAGE_STEP, TI_WKS_INITRAMFS, and IMAGE_BOOT_FI=
LES.
>>>>>>
>>>>>> This means we can't use bsp-mainline without also pulling in ti-core=
-
>>>>>> initramfs =E2=80=94
>>>>>> even when our images don't need it.
>>>>>>
>>>>>> Since we can't use bsp-mainline, we also lose the correct override
>>>>>> context
>>>>>> for
>>>>>> other components. For example, we end up having to manually override=
 all
>>>>>> the
>>>>>> mesa-pvr.inc virtual providers in our machine config to use upstream
>>>>>> mesa =E2=80=94
>>>>>> something that bsp-mainline would handle naturally.
>>>>>>
>>>>>> The root issue is that initramfs integration (an image-level concern=
) is
>>>>>> tied to
>>>>>> BSP version selection (a machine-level concern) in ti-soc.inc.
>>>>>>
>>>>>> A possible fix would be to move the initramfs logic to an image clas=
s
>>>>>> (e.g.
>>>>>> ti-
>>>>>> image.bbclass) that images explicitly opt into. This would be a brea=
king
>>>>>> change
>>>>>> for images relying on the current automatic behavior, but it would
>>>>>> properly
>>>>>> separate these concerns.
>>>>>
>>>>> I recognize what you are saying as an issue.
>>>>>
>>>>> We are in the process of moving to require an initramfs for all of ou=
r
>>>>> platforms as we transition to using modules for kernel features that =
the
>>>>> upstream kernel is unwilling to turn on by default (to keep the kerne=
l
>>>>> small).=C2=A0 We have been turning these features on by default in ou=
r vendor
>>>>> kernel, and we moving away from that.
>>>>>
>>>>> So there is a need to balance our need to make sure that everything i=
s
>>>>> in place at the BSP level, and the need for downstream customers in
>>>>> distro layers to build upon that initramfs and include their own chan=
ges.
>>>>>
>>>>> As I see it, we have two options.
>>>>>
>>>>> 1) Provide a mechanism to extend the ti-core-initramfs recipe to allo=
w
>>>>> you to put more stuff in there.
>>>>>
>>>>> 2) Go the class route and make it so that your initramfs (using the
>>>>> class) would make sure to include ALL of the needed modules into your
>>>>> initramfs and still register your initramfs with the images.
>>>>>
>>>>> Can you point me at the recipe that your initramfs is using so that w=
e
>>>>> can get an example of usage so we can plan for the best solution?
>>>>>
>>>>>
>>>>
>>>> Thanks for the quick response.
>>>>
>>>> For context: we don't plan to use initramfs (at least not currently) -=
 our
>>>> images boot directly to rootfs. The issue is that selecting bsp-mainli=
ne
>>>> forces
>>>> initramfs integration we don't need, and prevents us from benefiting f=
rom
>>>> bsp-
>>>> mainline's other configurations.
>>>>
>>>> Proposed solution:
>>>> Move initramfs logic from ti-soc.inc to classes/ti-image.bbclass, and =
images
>>>> that need initramfs explicitly inherit ti-image. This separates machin=
e-
>>>> level
>>>> BSP selection from image-level features (standard Yocto pattern). Brea=
king
>>>> change: your reference images need inherit ti-image added.
>>>>
>>>> Thoughts?
>>>
>>> I'm not sure you are 100% understanding what I'm saying.
>>>
>>> Starting with 6.18 and forward (including mainline and next since they
>>> are always "forward"), we are requiring the initramfs for some of the
>>> platforms (am62a, j721e, j784s4).=C2=A0 Without the initramfs providing=
 the
>>> needed kernel modules you will not boot to the rootfs.=C2=A0 The board =
will
>>> just not work.
>>>
>>> So even if right now you are not using an initramfs, then for those
>>> platforms you will need to start unless you take extra steps to force
>>> the required modules to be compiled into the kernel via config fragment=
s.
>>>
>>> Those modules were previously turned on in our vendor kernel (and never
>>> for mainline/next), and we are no longer going to do that.
>>>
>>> That all being said, I will send a patch soon (need to test things
>>> first) that will do the following:
>>>
>>> 1) Limit creation/requirement for the ti-core-initramfs to just
>>> platforms that require it.
>>>
>>> 2) Allow you to disable the ti-core-initramfs completely by setting a
>>> variable.=C2=A0 BUT... you will be required to provide the needed modul=
es in
>>> some way to get your image to boot either by adding a config fragment i=
n
>>> the kernel, or doing your own initramfs and including the needed module=
s
>>> (which you can use the variable from the machine conf files to get that
>>> list).
>>>
>> Thanks for the detailed explanation and apologies for not providing enou=
gh
>> context upfront.
>>
>> We're Toradex, maintaining meta-toradex-ti BSP layer for our TI-based So=
Ms,
>> including Aquila AM69. We use our own kernel and bootloader recipes base=
d on
>> vanilla mainline with our own defconfigs.
>>
>> Since we control our own kernel config, we can build needed drivers as b=
uilt-in
>> if necessary. Currently we don't plan to use initramfs.
>>
>> The issue we're trying to solve: we want to use `TI_PREFERRED_BSP =3D "m=
ainline"`
>> to get the BSP override context without being forced into the initramfs
>> workflow.
>>
>> Your proposed opt-out variable would work for our immediate need. We'd d=
isable
>> ti-core-initramfs and manage our own kernel configuration as needed.
>>
>> That said, I still think the class-based approach is cleaner long-term
>> architecture - it properly separates BSP selection (machine-level) from
>> initramfs integration (image-level). If you're open to exploring that di=
rection,
>> I'm happy to help.
>=20
>=20
> Any update on this? Just a reminder that meta-ti is used both for your
> EVK/SK, and just for the SoC support. Specifically you should not
> enforce anything like an initramfs to users of your SoC.
>=20
> Can you please prioritize this? This is creating issues to us since
> weeks and I do not see any progress.

There are a number of cases where we do things in the SOC common include=20
files to centralize things for the evm/sk boards.  And there are a=20
number of cases where that interferes with someone trying to use that=20
central file to support their own board.

Our position is that you can override the offending variable setting in=20
your board specific file and turn off the initramfs feature if that is=20
what you desire.  We added a lot of extra logic and control to enable=20
you to turn it off.


> Thanks
> Francesco
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

