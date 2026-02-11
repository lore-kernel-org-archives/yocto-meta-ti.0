Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5F9ECD6D2
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 17:50:48 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25390.1770832239052707456
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 09:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=vOcVWVGj;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.62, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QY3v5Es9BFyeIfNzLlhYht5Xll4D3CP8Brb8TgvaHblxn1UscCbtwA8CajdZfzYCf+48WMthF6ecjeEVsMC2E3AsERJBExapC3yy0vCVnMuuJQdzgKqdSjNajFntaVl7CVXn31OvkzPPmiyu/kjYjj29Q/V9TUPsFhdBPKBFrE056aCRpqBh4M0+W9YwJwEtf68ggl/8SpfOkd1Ux+5CCq1fmZsjlP7JBXEYr7R6dLs8RaFaSIJ5PbyKuGEHUjwNxJxWQB/hSdZwjq2r4/n1rW3DjyrsSDmWDe/lKCON7S977rPyvlJ6a6uD2IejWPIFzYuPI1UORyPCa+6EtxpLOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwZSjLXVhkuT29wmed3HPEjA3xLHEFfi/2mxxPF4x3Q=;
 b=W8psVJtkQilx9a56fAlaoqfz49UVdndz23FgcPpUkboSpYaKKDQLPrAf2sMnadFF/07UOO+m+jOUyXvP3kFG6fD8rx6MEUsp1lA0Rl9zR4FycmN4DzKMNSjwr67ChsLkAcbpJQnl0afgKP/JwCZXibR0yDTqsSf0zoQh3xFBDxwphZ4zj0l47D0mTNQQ2JJorhoFWutOPQ6/220jpvEFJLN7kt6CziXtHRWVYakXcQ7/yEHfOVbGeMgXq7BaByHhfMGPAm//9l55Uek329d4TlXnDx+soeC3J41qBHnyQELgCRZcinBuvpo3cSkGaM94K5AcuLha+4J0GbBLxK8Q1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwZSjLXVhkuT29wmed3HPEjA3xLHEFfi/2mxxPF4x3Q=;
 b=vOcVWVGjZe5OkIVleV/Nq9N3UCrF5WpFgoVRU34vitJ4HrXR2XMfAJ2EmHLOEOxvcxrP1wdsm6Idsk+9b75XlPJ+xHhJTezBFxk7sOJgUyBL/XnE8TweHHT0skB1+3ZquQ5gHa39Uh7FCxFonnTGiab+bgiQfRbcgPdGIXO1Nnw=
Received: from BN9PR03CA0969.namprd03.prod.outlook.com (2603:10b6:408:109::14)
 by MW6PR10MB7660.namprd10.prod.outlook.com (2603:10b6:303:24b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 17:50:36 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::8e) by BN9PR03CA0969.outlook.office365.com
 (2603:10b6:408:109::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 17:50:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 17:50:34 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 11:50:33 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 11:50:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 11:50:33 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61BHoXeX1637616;
	Wed, 11 Feb 2026 11:50:33 -0600
Message-ID: <205a16be-e76e-4658-966a-f585eb84943e@ti.com>
Date: Wed, 11 Feb 2026 11:50:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] BSP version selection forces initramfs integration
To: <ivitro@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: <denys@konsulko.com>, <vitor.soares@toradex.com>
References: <78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com>
 <af751f95-21e8-4965-ab98-4c973287ca67@ti.com>
 <f209ae25048674fe300084b618138e6216d83afb.camel@gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <f209ae25048674fe300084b618138e6216d83afb.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|MW6PR10MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a03ad4-e7a1-4067-feda-08de69960e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6GWMbg5lt6oozvuozrgZFAyiPZGqkCeI/R5nWeSDlgqUPwVG+v7JFJ8OLapm?=
 =?us-ascii?Q?muGQdWCEMUbxFY/WoBUgNxC063RT1f1T0uSBu3ygadNRVzp68GAGR8jca6NA?=
 =?us-ascii?Q?jJtfkFebZVyEOjzRczEelxkSao3grn2c+NoErRXHu4S9UTVVcMsFGkZ0oCyD?=
 =?us-ascii?Q?FWhI5sT3dJMIJCtU0BbmmZ+uU99dK6IQGGGaaheC2ic7524tZq0P2lL3znru?=
 =?us-ascii?Q?zgi9J45oQ33AdopX/kSxn4bn/5jqEdw5CyCzeY5MksHDdgvunNciFaHhYX8N?=
 =?us-ascii?Q?xPVXVS1DqQ2YpzqCmP//b6xQ1cgziWisSzKKrCAqFzQnfEO6wW2XE11E0xTw?=
 =?us-ascii?Q?HQK2HTaoidvjCUKOlwBvGddr+LkMMWytu8Hin3Zi7zDIViFtcy707yu4ThQF?=
 =?us-ascii?Q?VbWDRfaiur6iybTVKOlxqfnY2s5rNGa2mo6uNLCPUWOWs9u2mWrsVEPOpgLP?=
 =?us-ascii?Q?gQZKNhXlJgebc+Gpeyqw3dMCR2wTv3JCOun66yGprEsFX+JnXKkQpkIatl2U?=
 =?us-ascii?Q?/wK699bMqejgPhJlDTSoft3RjmrTifJLS45h7ljKgWbpRZcZtKSqk7nocxj/?=
 =?us-ascii?Q?88cMwDppDJyFOTnMvbimZaFyMMvekSv3z00usIcABQBWX91YCMbanGapvAma?=
 =?us-ascii?Q?AW7D1SKST8Rr7eg7toeXZ6RH3HQ/Fe59wjsqKlKOHDIO5gDCrZr2ALTmwOWN?=
 =?us-ascii?Q?DcbqmoEAkRq3bkAwpM/ShTfguAcgYrZIYqIhbm9s08IxSE0CmsuxNccfyMBk?=
 =?us-ascii?Q?j/5RC5Dss98V4ALPLJxNiUXo4dwxEckzcFxYhtZmy15OpK5ovZo4jalmLxQx?=
 =?us-ascii?Q?AwVU9UX7DUsEMJRWuV2sP0Z1JpE+5VKwLURDef02a2O3a//YinOcWOFgkIy2?=
 =?us-ascii?Q?FJmXbNxpnajS+JHBMBZSIG3doI999hRzvZuM6sZv6Am7Jg2LtIOR0M+kLdSB?=
 =?us-ascii?Q?aZVEswBl5KwdWPr7hg8zVQMSS8cjqQ0QGc3YopqaK6tKKHKwDgo6Vc+TuFxY?=
 =?us-ascii?Q?Y9dNBr0DMY8iU5cOjRLwxa8vl5HpC/H/uV2LU4T06S3E7K0pMm+zrw3xVf2/?=
 =?us-ascii?Q?NLi81RGNUyUm6Bg9Rgivzq6E8XpC/Hpn4osrvy9PCpfUSSOZJwBd1AcBapy7?=
 =?us-ascii?Q?ms7D9SWarW7uIDohQ6LHjXCmeCpnUa9L299lULy4pN22QvhSb9lc4PCtCSRn?=
 =?us-ascii?Q?02bmIt4qLFfEGwU/YI/UfZ8q/gMy7TmsFeUd68+NnadGRBIuROXiU6b0+suW?=
 =?us-ascii?Q?8xZBjv2Oxvxb3ykGyOn0kK2XSkPlQe00H0IsMfQr+KAYPZF/UedDkBrWAV0V?=
 =?us-ascii?Q?suwCh/U3FOOumU2QlVLav255TMdBZaooDck+HCiHSCIiRhdDw1EuGHfi0Kmu?=
 =?us-ascii?Q?j82CO+YmSWpnmAzGkS0UTFN0E4kSobXR4HiYLcannGDWGuGa4kVubmZcoCAd?=
 =?us-ascii?Q?68V0g63F7TnH+Q91aUjagWMuaVVYyEeUPKhy+U7jmRdmzz9FAuLTd3pbTrzk?=
 =?us-ascii?Q?a3UhXFn5Am8Kynd4QN0hkOUq0u+zCyLL9ewpoUw3sGUHnZxcZhGcDR9KpH55?=
 =?us-ascii?Q?0EuhiTEzD7XRohSanRLoedM72+yqQMl47qi3lFMd9WebWt4u7E0dwG/irTxb?=
 =?us-ascii?Q?Gw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(4022899009)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OLKHJnZIztl6mi95HwYLhszTXFXpHqQu6JRY74AayBDN8gXzxDNZysKLEGw/2E8K/ke+x9LCYFKGiEv9c7v/Q97uwU06L2ga9rnlTNoyKcYJt/9+sv57zJJ3fFeKw7YvHS3xK0R61CF3rt4b2QIpfqFDtH1xRmbpYGDfo76RqHwrZT8l6QACA7MUq1l7fkvwnFruA5X9RxIM+VIWhLKl6bsuBfY45S8CclrfAlLoRH7yNEC64c0xH2yIxjPzBtXraq1M10vlgLw82Qep8V5bCImLIBWX89N/W7N83u1rUoOglK2sccSeS7H/PT4CPOVDWcFXh6dAeFb42dIV5guz6bAWyrd88L4J2Qn0f4iH82jOkqFNvv+e0ZQNp1zCIvPrtZU+KSlBo9UAjR7FrbLh4QzS8UQ78qajVa41Kph4e677pBVGTKiLB/vLz44MWTlR
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:50:34.2700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a03ad4-e7a1-4067-feda-08de69960e94
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7660
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 17:50:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19484



On 2/9/2026 10:31 AM, Vitor Soares via lists.yoctoproject.org wrote:
> On Mon, 2026-02-09 at 09:11 -0600, Ryan Eatmon wrote:
>>
>>
>> On 2/9/2026 5:21 AM, Vitor Soares via lists.yoctoproject.org wrote:
>>> Hi meta-ti maintainers,
>>>
>>> We've hit an issue where selecting a BSP version (e.g. TI_PREFERRED_BSP=
 =3D
>>> "mainline") also forces initramfs integration via ti-soc.inc (lines 32-=
49).
>>> The
>>> bsp-mainline, bsp-next, and bsp-ti_6_18 overrides all unconditionally s=
et
>>> BUILD_CORE_INITRAMFS_IMAGE_STEP, TI_WKS_INITRAMFS, and IMAGE_BOOT_FILES=
.
>>>
>>> This means we can't use bsp-mainline without also pulling in ti-core-
>>> initramfs =E2=80=94
>>> even when our images don't need it.
>>>
>>> Since we can't use bsp-mainline, we also lose the correct override cont=
ext
>>> for
>>> other components. For example, we end up having to manually override al=
l the
>>> mesa-pvr.inc virtual providers in our machine config to use upstream me=
sa =E2=80=94
>>> something that bsp-mainline would handle naturally.
>>>
>>> The root issue is that initramfs integration (an image-level concern) i=
s
>>> tied to
>>> BSP version selection (a machine-level concern) in ti-soc.inc.
>>>
>>> A possible fix would be to move the initramfs logic to an image class (=
e.g.
>>> ti-
>>> image.bbclass) that images explicitly opt into. This would be a breakin=
g
>>> change
>>> for images relying on the current automatic behavior, but it would prop=
erly
>>> separate these concerns.
>>
>> I recognize what you are saying as an issue.
>>
>> We are in the process of moving to require an initramfs for all of our
>> platforms as we transition to using modules for kernel features that the
>> upstream kernel is unwilling to turn on by default (to keep the kernel
>> small).=C2=A0 We have been turning these features on by default in our v=
endor
>> kernel, and we moving away from that.
>>
>> So there is a need to balance our need to make sure that everything is
>> in place at the BSP level, and the need for downstream customers in
>> distro layers to build upon that initramfs and include their own changes=
.
>>
>> As I see it, we have two options.
>>
>> 1) Provide a mechanism to extend the ti-core-initramfs recipe to allow
>> you to put more stuff in there.
>>
>> 2) Go the class route and make it so that your initramfs (using the
>> class) would make sure to include ALL of the needed modules into your
>> initramfs and still register your initramfs with the images.
>>
>> Can you point me at the recipe that your initramfs is using so that we
>> can get an example of usage so we can plan for the best solution?
>>
>>
>=20
> Thanks for the quick response.
>=20
> For context: we don't plan to use initramfs (at least not currently) - ou=
r
> images boot directly to rootfs. The issue is that selecting bsp-mainline =
forces
> initramfs integration we don't need, and prevents us from benefiting from=
 bsp-
> mainline's other configurations.
>=20
> Proposed solution:
> Move initramfs logic from ti-soc.inc to classes/ti-image.bbclass, and ima=
ges
> that need initramfs explicitly inherit ti-image. This separates machine-l=
evel
> BSP selection from image-level features (standard Yocto pattern). Breakin=
g
> change: your reference images need inherit ti-image added.
>=20
> Thoughts?

I'm not sure you are 100% understanding what I'm saying.

Starting with 6.18 and forward (including mainline and next since they=20
are always "forward"), we are requiring the initramfs for some of the=20
platforms (am62a, j721e, j784s4).  Without the initramfs providing the=20
needed kernel modules you will not boot to the rootfs.  The board will=20
just not work.

So even if right now you are not using an initramfs, then for those=20
platforms you will need to start unless you take extra steps to force=20
the required modules to be compiled into the kernel via config fragments.

Those modules were previously turned on in our vendor kernel (and never=20
for mainline/next), and we are no longer going to do that.

That all being said, I will send a patch soon (need to test things=20
first) that will do the following:

1) Limit creation/requirement for the ti-core-initramfs to just=20
platforms that require it.

2) Allow you to disable the ti-core-initramfs completely by setting a=20
variable.  BUT... you will be required to provide the needed modules in=20
some way to get your image to boot either by adding a config fragment in=20
the kernel, or doing your own initramfs and including the needed modules=20
(which you can use the variable from the machine conf files to get that=20
list).


>=20
>>> Would this approach be welcome? We're happy to contribute patches.
>>>
>>> Best regards,
>>> Vitor Soares
>>> Toradex
>>>
>>>
>>>
>>>
>>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19475): https://lists.yoctoproject.org/g/meta-ti/mess=
age/19475
> Mute This Topic: https://lists.yoctoproject.org/mt/117717310/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.c=
om]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

