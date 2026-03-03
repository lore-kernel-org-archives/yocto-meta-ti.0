Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6030EDEBEB
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 19:26:53 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [52.102.140.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.917.1772566006855898375
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 11:26:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=bWyHa/4S;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.102.140.21, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rxpo4Hq88SfbTLauHJLLkraZDOexDMo49evpkAiVUYJWq+Oszoa8IP/Hf+erWGmgDFAEYJtah1mDVUGpIESPO2PcHtpj017fFgr07fPuhHPpTpzto6wWh6HxteGpPy7tH6vkgA3fxP35+tCVvD++oX+jDnXJ/iM8yvxkXo8odrhjIGURCsDEnO6zPrvmAnSIeODou9QzbQjrNKs+vJXICs9lbMISdd+27pKnDCa+wkoS68mmuZ2qkNRgbGc5060b/9Fsk/hSBwqJatwroaXjw+MqFStzCenrsPpg4n+BrO9D2C5NjXXcqxH+wRGlMDQanXl2Ccx9//LkZ2ifzc3AfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZDQFErJ6JkPeD1cyBQ5xdvWZfWgZSaorfwC1nuYBTQ=;
 b=Vz7M4k8FoDeNx5Z052edG2vUCZKvubKWxso5eDkY8poxA/r1IGVLvoNPlt2hoc/WEtUYot2E8a/W1HET6QtgpfeVuuvA2e4TyGI4r12AZtsM8ApmaYzEeoxWuT+Q1kOReuV4/BgPprCRnLsKXA0yB3fBSXL4ce9fPtppJZCl+rj+vLItlSjqjFmyBjjP1jpZpfiTn6SgICYt52ojB8r0BRx/PDix0YKnv/fQbNIKe1TxJTBE4QvCxo3Geflmn0Ub8dJ7HDRAldY2qPLpcX2gRjbZ5w51X+2pbkDJHWzqVkBMUB/zQExeCBwlkT8jrhS8irIcW9znuLkPrJ8FHHB9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZDQFErJ6JkPeD1cyBQ5xdvWZfWgZSaorfwC1nuYBTQ=;
 b=bWyHa/4SRF0B04B6CyDPZan1PQKLzpl8omL1HDRDqZO0+IKYMbENUn8DYIfpowvBcqoG3vIenPb3r+5iJ4ISbECUmoRNE8YbQa36F7xWtAJ4gxTi4bPr9p+90ET50QAqDNNDDWMMUIp3dMo70CSJMr0nnF1Jzul6UNuH8u9PX3Y=
Received: from CH5P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::7)
 by BLAPR10MB5203.namprd10.prod.outlook.com (2603:10b6:208:30d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 19:26:43 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:1ef:cafe::a3) by CH5P220CA0001.outlook.office365.com
 (2603:10b6:610:1ef::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 19:26:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Tue, 3 Mar 2026 19:26:41 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 13:26:40 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 13:26:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 13:26:39 -0600
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623JQdu13175959;
	Tue, 3 Mar 2026 13:26:39 -0600
Message-ID: <c928152e-dbaa-4aa3-a5ba-b80fccde02ad@ti.com>
Date: Tue, 3 Mar 2026 13:26:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v2] j784s4: move
 TI_CORE_INITRAMFS_KERNEL_MODULES to j784s4-evm.conf
To: Vitor Soares <ivitro@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: Vitor Soares <vitor.soares@toradex.com>, Denys Dmytriyenko
	<denys@konsulko.com>
References: <20260216230422.635024-2-ivitro@gmail.com>
 <043e6483e7781c51bfa80258b455aacd822cab5d.camel@gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <043e6483e7781c51bfa80258b455aacd822cab5d.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|BLAPR10MB5203:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db2ad77-78c1-4465-2166-08de795acc4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|34020700016|1800799024|376014|12100799066;
X-Microsoft-Antispam-Message-Info: 
	KXnLPCfphHpWD1VMVMSxtK3pcYZZAg2DAnCjWKfk2fVHqZKwq22ZcjMRujXIXwzBUEkfRHB+yT9JKb5rInBkhZ/roYP6Q3Xe2vcBDPcDgNv7L1jJG/m+bUTfBv/1UmMclNlKIcUNYFV+lVQidbKMiBtGovrpEwI9X9H9wHhpwcc6TIkhqXixAGwo4c/MNCDu4dVQQJoF+bG+cBykY4G2+QiHCV3/lkMuvvCN/TWFdw42KvpqXkKQNbwxS8efqmMnKdvLjPb+B2qcodcz4j97W3j18MeRsBGB5h5qxjm9uZnXQluYX882oYUNmbfYq0ubSSR/69ZBVqc5tZKfkhQmbl7K0+JC78/ogRoTO01MzoUI3bGYZdzSI7K3/idcOryY3f9/DUPVnNKTwJn1yJmHZA3Et6z4vnr51+U0wZ1zojSkSIl4ZY30tnwSAePd56upC8cLqWT8X940oqWv3Bfh6Gt6Rb/lCKuuqpY5kNN7roX2E5DdH4JMSDSc4pJRpadxaM8LL42LcMMoOGc6W3VdzoyPmINadeX5ELdXlruCwXCfe0haFyAHAIEhe9uTgGgwoPoOI7G1Jm1ceGbSa8au+S77HRrXQ/6T6o/n500KtU6IOoLJOYp9/JYfe4w/6iEljCUnWggpn+rzoYyjcV8uIuIPFbRPRL7F3Tb6/IUrwPCbHw0sZ5DQuQEke4ORawFEu6k8eqqWZQjl+maMu9/QUfBrnJ2luo4H5EET50xRMohMCyUnSYGLqbUhIoAQOzZsiUhj12tWebi/XViKPGddAWrLpoi5Kqz9i+ZMS+ploXF+BEGTX/nmn7DX3iO+SLIc1FzuA7P1P07osRKYiusT7A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(1800799024)(376014)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	M/fgzPk8Frc2h1n+f6VJ2Yv8v0lYSg35YCNn/pUIVtW/qoqYuDpDjXEnz5trYJBLlOsajlDMz6ZUXkj2i6yIoPteSD8frwoTQuP9Lo9CjeL3yrLQc/8LXMUc5vcUo99yHM3rrnge+QfwpAzit4P5amI4Yk3j4KGUI2L0dgfVwdIry4NfEQb00pHXE3M10FEMsAQvuJauKdLO3AsLJrUEfqNoYaRWbFovYU2obsnOdqWeEAKhJxKbi56ZHRBgfPII/TPmWa46xGu0UgvJ+rnLvd7+K9nkVInizbVlvlfdVs27RIk2CTN7nTX/XtQidEI1mi3fWPcblY/Xev8gA8ZCiYGFg2Xxc7DIGvpPovqVJUf+mvtiam810d4tm+9u49eTlv2Kl7gTNJaPgqSxf9mwKLy2NpMXin9gHL9O+pOuqWwXg1unxXEe/VAl2tdQzVr2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 19:26:41.3772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db2ad77-78c1-4465-2166-08de795acc4b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5203
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Mar 2026 19:26:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19640



On 3/3/2026 1:20 PM, Vitor Soares wrote:
> On Mon, 2026-02-16 at 23:04 +0000, Vitor Soares wrote:
>> From: Vitor Soares <vitor.soares@toradex.com>
>>
>> TI_CORE_INITRAMFS_KERNEL_MODULES is set in j784s4.inc, causing all
>> machines based on the J784S4 SoC to unconditionally build and deploy
>> an initramfs. The cdns-pltfrm and ti-j721e-ufs modules are required
>> by the EVM to access UFS storage and are not a SoC-level requirement.
>>
>> Moving it to j784s4-evm.conf scopes initramfs creation to the board
>> that needs it, allowing other integrators to rely on the empty default
>> without explicit overrides.
>>
>> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
>> ---
>> Changes in v2:
>> - Added project + branch specifier to subject line
>>
>> Tested on Toradex Aquila AM69 with bsp-mainline. EVM not tested.
>>
>>  =C2=A0meta-ti-bsp/conf/machine/include/j784s4.inc | 3 ---
>>  =C2=A0meta-ti-bsp/conf/machine/j784s4-evm.conf=C2=A0=C2=A0=C2=A0 | 4 ++=
++
>>  =C2=A02 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-
>> bsp/conf/machine/include/j784s4.inc
>> index 4dc3a71b4444..f29cd69bf9f5 100644
>> --- a/meta-ti-bsp/conf/machine/include/j784s4.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
>> @@ -14,6 +14,3 @@ OPTEEMACHINE =3D "k3-j784s4"
>>  =20
>>  =C2=A0MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw cnm-wav=
e-fw ti-eth-
>> fw-j784s4"
>>  =20
>> -TI_CORE_INITRAMFS_KERNEL_MODULES =3D "kernel-module-cdns-pltfrm kernel-=
module-
>> ti-j721e-ufs"
>> -TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 =3D ""
>> -TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_12 =3D ""
>> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-
>> bsp/conf/machine/j784s4-evm.conf
>> index bf53b07c33f4..333bd24d938a 100644
>> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
>> @@ -27,3 +27,7 @@ KERNEL_DEVICETREE =3D " \
>>  =C2=A0"
>>  =20
>>  =C2=A0UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
>> +
>> +TI_CORE_INITRAMFS_KERNEL_MODULES =3D "kernel-module-cdns-pltfrm kernel-=
module-
>> ti-j721e-ufs"
>> +TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 =3D ""
>> +TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_12 =3D ""
>=20
> Hello,
>=20
> The recent commit 135dfe3f2620 ("ti-bsp: Make ti-6_18 the default BSP") m=
aking
> the ti-6_18 the default BSP appears to have broken our builds, which is w=
hat
> this patch was trying to prevent.
>=20
> With ti-6_18 now default, all J784s4 based machines are forced into initr=
amfs
> build through TI_CORE_INITRAMFS_KERNEL_MODULES in j784s4.inc, regardless =
of
> whether they actually need these EVM specific modules.
>=20
> Our Toradex Aquila AM69/TDA4 SoM doesn't use UFS storage and doens't need
> initrafs. Our build now fail because the SoC include forces image levl
> integration decisions.
>=20
> Can this patch be considered, or am I missing something about how to hand=
le this
> scenario?

We are still looking into your patch (lots of moving parts over here).  In =
the meantime, you can always just clear out the value of
TI_CORE_INITRAMFS_KERNEL_MODULES in your machine file:

TI_CORE_INITRAMFS_KERNEL_MODULES =3D ""

That will turn off the initramfs code.


> Thanks,
> Vitor Soares

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


