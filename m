Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DE9CD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 19:34:04 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.137760.1781552041409952871
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 12:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=g4dMoZ4j;
 spf=pass (domain: ti.com, ip: 40.107.208.6, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R04tLLFwETalQ1pePq5LZxpUeiNEtr+ExeP7m66In7rEck3VCmfKAbSb5yaBrrYs5sFKtKsPYcMJKL6iRbj94WVTrO5BI0Nw/CzT52vzkrX2GWMlnp2dCrdw7oDee15Q3fogvcH9/SfB5VsHlZDrl2pMARCAa5t7YsJk/M5HvIdSJ1Aczp/NG6fZXx4JvWnxpC4La15QqR2hiJYhyhnsyBo1jLhnQ+YdRPyx6kmb5QFPWUTkQcfJuNFryZZXF0129pblmz2p+oJV1jLRMPZpOGEWOM5iPOMKrXf7VVKA4rb918BxizwC1up4yoRBSKU47MKpF5Goew45n5563+CeYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsaO/2GkzFVOZEIfLgIWFDPxbWne9yidafvmES4UV9Q=;
 b=izNTB52cDLi60bUED6Jq90m7kES0/wmFRDaG1QRzIC8reZWiR3leoTSLkmELiVIvae5J27tZ3lgghBZWyxNYtv1R0I5jSfAGqvlFAtS4qXefH6QqRq7SdnFo4Omp46o/HWy0voBrUad9vCkpNubWpAPizckdbnZU2h9f1U553B6AAojEanfgrEOq8pGiMzjqXMRr/csppMbJpaKfNKALj+QNjjP/IT0dd2MkmG4MVCSd+RGrLEd6pfbmxFeYtme6DwC4nzNXphEr3qAdSp5t2XeUHMS/Fyd7FBqb0b7COToyUQKQL/EQlcPrAU7igRDMVfk2IAkXzrsaYtDjKbbwtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsaO/2GkzFVOZEIfLgIWFDPxbWne9yidafvmES4UV9Q=;
 b=g4dMoZ4jYwI3hYZEtxj/O8aTXo/9ajHFlC1f/qBY9oOUN8eWJXvP5nyIkCtohE4sWNx4uK+cmyhrLXE4VjH+xmMuzZJpSfErZwxiQy0Ems+3m33lEs1tUowcaWdx6wEMNdOz288BHtQvjQYZNxHQzH2ZqOisIlET/1/fYq6Zrj4=
Received: from DS7P220CA0049.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::13) by
 IA3PR10MB8540.namprd10.prod.outlook.com (2603:10b6:208:572::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Mon, 15 Jun 2026 19:33:58 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:8:224:cafe::9d) by DS7P220CA0049.outlook.office365.com
 (2603:10b6:8:224::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 19:33:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 19:33:56 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 14:33:55 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 14:33:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 15 Jun 2026 14:33:55 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65FJXtFi2585247;
	Mon, 15 Jun 2026 14:33:55 -0500
Message-ID: <6bc5bb1e-e2ff-4a2b-98d1-d03419520e55@ti.com>
Date: Mon, 15 Jun 2026 14:33:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from
 v24.0.1 -> v25.2.8
To: <a-christidis@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <18B7DA0BBD971E15.267903@lists.yoctoproject.org>
 <150e8bb6-2aba-4292-8053-51231e3e0928@ti.com>
 <d5d84531-360e-4f57-b4bf-699614b3d749@ti.com>
 <20260611132320.GM23325@denix.org>
 <664e282c-f132-497b-9763-4d0df91bdd52@ti.com>
 <20260611165057.GR23325@denix.org>
 <d8d45aba-0b65-4ebe-ae7f-c9c0a1b7c5e4@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <d8d45aba-0b65-4ebe-ae7f-c9c0a1b7c5e4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|IA3PR10MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: f90350de-e3f9-457d-5a5a-08decb150a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|4022899009|23010399003|36860700016|1800799024|56012099006|5023799004|4143699003|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0WC061uxgVPA8z2auP7hv1FPpudYyMumy+V188Bew4gVtanYSqzMCe4Ua2KKBUq63r25X7GHvQIB9XFpRPyULYYprWY746xEy+eTlzYZidy+pScrLgaU7rhTLlj/HwtsaPwOx1DIwJNs99dW+iJMG50j+Gvyt/Qt1nsnkBfydEXok7qfu8Lm7fJ3qaQliZVC3wY+FjCdmv7vdsbqX6jcPEhXkwOOLdHaRtmY+yUQgVnZn25RBdEHVfbKypkWKpO5+5PluPNospEQgu5GTzJFOe8ragfdAVFl0QoNX7zHMZL/dRBV8DpbtUYwQEuEvnYITFoDblOaA7NXdgXhJ3iux6Y/kEaNsYh6QyZ3+VipklXvU+YPdH+O+PmPfOoYqtVji1yDo3uJqPcftLGhD/BWkOVNUkCVc/e7KXsp1PkfR5KQNa868FyXUx5iRtoLtMwag7DqJKJm0NvxWGjlrmYcThFMysV4jLZo1aLR7Vw4j9IYYCNiSRr0JJO85QfOz+80kshRAedQexR+/PmgxVfQWMYNZMdLAwP6JnWDjSVXXLbJVzIQzM2ZcLyFqicFKMGlZQWsU+BFwhqp3ak4oCa31KMMxunJkEC4upPY05Qelkr+7t+WOgcqgfuPnVC8QBprgArlRTRlCGOF0pe4iwHCClkl7ZL09Jfx8DqS3mmxKcWNAh5rBowkhHG+kCzFv8DngEKTEObZS4iZ1mD9l2LPU3Jl9211KWdfUJYnIMeNzU4=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(4022899009)(23010399003)(36860700016)(1800799024)(56012099006)(5023799004)(4143699003)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	scchkOU6MkJRln29HWtjNoEws9ZysNVTFal58hru6DEgZr7ET4mx6b64Y705+D8U76i8z7IidIHzEECvyLSG1kynjVz/Cl++RmdyB8DaX5YH65hJOfB2sofrVbSsVT6cdMal3CYWQeiK8kfxp6B01bDCdea3sb6LcKr9nBuPtqVbcIBUJlyjb9Y++Ix9QkTsNRj9jB2idtHE1u75Mqpn7pqlD+lLQWFdfnvkM9UmRvkGwocNPzyxA3CGxBSboZ6FAikS9DY+5qQw1hGDPPxGGQaDvHNfwbKverhyF2OCLKDGpPhmeF2wMaF+PMTsAIBLqtEMjyVtMRWyEYmfk/XTHJslP1ifVRTi6F6bROQEkF7ewD1u8IzZWfEi4/zxnNy9fZyoSmvp1y9ykRnJkGdUh4HZ3yS35kIg3K0b3FLkpZdiesMrhRFlKHTmRykjMorK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 19:33:56.2331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f90350de-e3f9-457d-5a5a-08decb150a74
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8540
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 15 Jun 2026 19:34:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20038

On 6/11/26 1:29 PM, Antonios Christidis via lists.yoctoproject.org wrote:
>=20
> On 6/11/26 11:50 AM, Denys Dmytriyenko wrote:
>> On Thu, Jun 11, 2026 at 11:30:42AM -0500, Antonios Christidis via lists.=
yoctoproject.org wrote:
>>> On 6/11/26 8:23 AM, Denys Dmytriyenko wrote:
>>>> On Wed, Jun 10, 2026 at 09:17:37PM -0500, Ryan Eatmon via lists.yoctop=
roject.org wrote:
>>>>> On 6/10/2026 5:58 PM, Antonios Christidis wrote:
>>>>>> Dear Ryan Denys,
>>>>>>
>>>>>>
>>>>>> Let me know your thoughts on the overall patch. I am particularly
>>>>>> interested on your opinions on the following change:
>>>>>>
>>>>>> On 6/10/26 5:51 PM, Antonios Christidis via lists.yoctoproject.org w=
rote:
>>>>>>> BSP_MESA_PVR_VERSION:bsp-ti-6_18: =3D "2%"
>>>>> So... I think what this does is establish the pattern for which
>>>>> version it will match to.=C2=A0 And then from that pattern it will pi=
ck
>>>>> the highest version.
>>>>>
>>>>> So for ALL 6_18 builds it will probably choose 25 and never 24.
>>>>> Which is not what you want.
>>>>>
>>>>> ... I think ...
>>>>>
>>>>> We have never tried to mix versions like this in the past, so I'm
>>>>> not 100% sure what the best course is.
>>>>>
>>>>> Likely a mixture of the override based on machine needs to be in
>>>>> there. And for that I'm thinking you might need an extra variable.
>>>>>
>>>>> BSP_MESA_PVR_VERSION_6_18 ?=3D "25%"
>>>>> BSP_MESA_PVR_VERSION_6_18:am57 =3D "24%"
>>>>> BSP_MESA_PVR_VERSION_6_18:ti33 =3D "24%"
>>>>> etc...
>>>>>
>>>>> BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "${BSP_MESA_PVR_VERSION_6_18}"
>>>>>
>>>>>
>>>>> Something along those lines?=C2=A0 That would be the most clear for
>>>>> people to follow as well.
>>>> It was done differently in this patch:
>>>>
>>>> mesa-pvr 24 was maked compatible only with SGX platforms, while mesa-p=
vr 25
>>>> was marked compatible with the rest of the platforms. Also not ideal t=
hough.
>>>>
>>> I think Ryan's idea is easier to follow, compared to the flow I have
>>> included in this series.
>>>
>>> Another way of going about this (I'm not saying this is easier
>>> and/or a better method) would be to create 2 MACHINEOVERIDES.=C2=A0On a
>>> per platform level (ex: am62pxx.inc) to add ```MACHINEOVERRIDES =3D.
>>> "rogue-core:"```, then within ti-bsp
>>> ```BSP_MESA_PVR_VERSION:bsp-ti-6_18:rogue-core =3D "25%"``` picking
>>> the right version when paired against a sgx-core override.
>>>
>>> An added benefit to this, the new overrides would cut down on the
>>> need for duplicate variables tracking Rogue vs SGX (examples:
>>> BSP_SGX_DRIVER_VERSION, BSP_ROGUE_DRIVER_VERSION).
>>>
>>> A downside to this flow, tracking what is currently included
>>> within=C2=A0MACHINEOVERRIDES , describing what architecture of GPU core
>>> doesn't really fit well with pre-existing overrides.
>>>
>>>
>>> Let me know what you think?
>> FWIW, we used to have separate "sgx" and "rogue" flags in MACHINE_FEATUR=
ES
>> years ago. Not exactly MACHINEOVERRIDES, but still easy to do conditiona=
ls.
>>
>> But complaints were that all this needs to be unified and, first, both o=
f
>> those flags were merged into "gpu" MACHINE_FEATURES and eventually compl=
etely
>> removed.
>>
>> So, I'd argue if you do want to bump mesa-pvr version, it has to be done=
 for
>> all the platforms regardless of the graphics core, SGX or Rogue. We've a=
lready
>> went through a lengthy period in kirkstone (2022 era) where SGX was comp=
letely
>> broken and customers were sent back to use dunfell (2020 era) just to ge=
t SGX
>> working at all...
>>
> I see, if the desired way is to migrate both cores=C2=A0 at the same time=
, then this would cause a big delay. Since migration for SGX cores from v24=
 to v26 is substantially more effort and can take weeks (as IMG provides no=
 support). That being said, I have already planned for such effort, but tha=
t is later down the year when a legacy SDK release could happen.
>=20
> I think its still worth the effort to migrate for mesa only for Rogue, es=
pecially when mesa-pvr v24 is staying around and can be used by SGX devices=
. Also worth a note, SGX devices are legacy and have not received a officia=
l 12.x release - so if any customer wants to use the latest SDKs for such d=
evices they would have to go back to Scarthgap 11.x SDKs. So if this series=
 or some different revision does get merged, the latest official SDK for su=
ch devices will not be changed.
>=20

If SGX isn't supported then what is wrong with updating Mesa to v25 anyway =
for
the SGX platforms and just letting it fallback to SW rendering? As you say =
if
customers want functioning SGX they need to stick to 11.x or wait till 12.1=
,
so nothing is lost here. (In theory HW accel might have still worked with S=
GX
on a Mesa v24 + Wrynose combo but that isn't verified, in fact Wrynose expe=
cts
Mesa v26 so even the current Rogue using Mesa v25 is a bit of an unknown..)

Andrew

> Regarding the point of SGX and Rogue being unified, this might also be a =
good point to start making distinctions and branching the two cores, as the=
 overall drivers and supporting software like Mesa are drastically differen=
t for the two stacks.
>=20
>>>>>> I wish there was a way to use syntax like
>>>>>> "BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%|25%" or even
>>>>>> "24.0.1|25.2.8".=C2=A0Is there a better way of enabling this logic ?
>>>>>>
>>>>>> Also already aware of the extra ":" post-pended to the variable, I
>>>>>> can send a v3 if that's all the feedback.
>>>>>>
>>>>>>
>>>>>> Kind Regards,
>>>>>>
>>>>>> Antonios
>>>>>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20033): https://lists.yoctoproject.org/g/meta-ti/mess=
age/20033
> Mute This Topic: https://lists.yoctoproject.org/mt/119748763/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


