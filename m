Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699E8F51416
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:29:29 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70355.1772807366583101576
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 06:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DxiYVJo+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.50, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upPWX83h4DuFr7THe6wtnbsOhccDMW3eMUdeyUognOJ+wDZKX2UDt5qMyG3qK+kbODIvMZWrah4JRjTHgA66/idvYJOhLuvtQZ9KcEuvcK1z7VTWwfH1Nh78pmFcU8V4WqjMHXRkJ18xRR85OrDG7QvhG5ggFtReSIamyRiDeE8Y1WFOljHVIHrlP2MOxKUOgrkcacZFRWT3KG2Cd97DZlgVEVaQlIG88PVw719FodI4iqeaC4HScw/cCTKY0no6356BcTQAJ//k8alTIhuVBO5nEHyi5IqBB1R3xNNFjTgVGoGaiyrvyxOXipPQZEyhUdMEG1GAzJI1jJwaD7Q8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vrn1AoNj6Wbhr8PixO3tDN8FNuCmmpAYwiFHOK698c=;
 b=qhqFoGPRdUCi6ArY7cd8IBUqToIqBSoNcr/zVS3xztyuiLcO5gClKU2M1rf8nRl2K9ZKltIMJppNFnR5EFvrOoH1MwpElnn7+6dQXF5DsrM37/97AoG8mK1y+3WgOvlcllYIQwksr03Rx7m9UxbnFL1NuFZcR+30oGmBPHeAxqysEBve93PU7UvqgcKWRUPSfFwKdoZIZJE6+tpdfR0I3yW3p7CBEzgwAPrbp1XXAHNpSMHRAKC4cU8ewDU0NPCfFt0R54dt1kJP+IW0EtWbTwOKJ8YzJ/r76TqqxDDOmsvUZyVgj+yxEQ8ba3l+8pkj610EVTOzn5pvRD2HMZG4gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vrn1AoNj6Wbhr8PixO3tDN8FNuCmmpAYwiFHOK698c=;
 b=DxiYVJo+M3jiPudGXuof6x3EWRfKiPhISeYt3wkDJWUAsl680C6gh9/L+zNnDypvz2iPFHDSw5Y/yIcZoaIHz5WJdV/rRRlIWhnMmCHsmIdx2Kzo5UYi4xOJMQr3DXuhZJxz55HVCJ9w6gwQGH7USgTBnUpTpu4P4RtrZZhmv0I=
Received: from DM6PR08CA0037.namprd08.prod.outlook.com (2603:10b6:5:1e0::11)
 by DM3PPFB0C5EC304.namprd10.prod.outlook.com (2603:10b6:f:fc00::c43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 14:29:22 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:1e0:cafe::2c) by DM6PR08CA0037.outlook.office365.com
 (2603:10b6:5:1e0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 14:29:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 14:29:21 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 08:29:20 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 08:29:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 08:29:20 -0600
Received: from [10.24.68.200] (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626ETHQq256593;
	Fri, 6 Mar 2026 08:29:17 -0600
Message-ID: <441719cd-4806-412a-8f10-739fd8f095da@ti.com>
Date: Fri, 6 Mar 2026 19:59:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v4 1/3] linux-ti-staging: Add LUKS
 encryption config
To: Andrew Davis <afd@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>
References: <20260305172148.3684377-1-s-tripathi1@ti.com>
 <aa64d1de-e70e-4ebe-a379-79aba4b9f2c5@ti.com>
Content-Language: en-US
From: Shiva Tripathi <s-tripathi1@ti.com>
In-Reply-To: <aa64d1de-e70e-4ebe-a379-79aba4b9f2c5@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|DM3PPFB0C5EC304:EE_
X-MS-Office365-Filtering-Correlation-Id: f8fae011-4d3c-4c03-2fa4-08de7b8cc1ee
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|1800799024|36860700016|376014|82310400026|4022899009;
X-Microsoft-Antispam-Message-Info: 
	8ReLV0lmz3SFWb+n5yt62dW9wFBH6lGn12YNeWZYNRnWdykZH6wNmPRwI+ByEE2q+NHzLEu+MRAZsvEijLKSr33tS1kXCCeSRWZ+7J2nLhzCjsqvDbbWXeNZLhTbtCiA3SJODq59yh0vD7gHGsCeQeD1GIY6c3+l2aF6KCm/nrDxHBX+FWlMHMJdBGPAFSLxkoU/eSVfyXD4xMV/ML/iuUci1Iu7Jtrk8v+hHulaGiXwXxQzDblVyW+A4TK27e1UwQE+y60YoxByVp/D51svr9blD7rEWgJKLPRpUAbfh16zfE1xsoNWSqVfugtinR/ARvPeIIhzhH5t/ilnit+5mTW98x2OzpceVZhsgJi8GCnZ22UC5Hr8fgDOcXxBoJP+gykKCvKC9LP6QXKErfpArHpxihlUOCCvLYLh9ssGpDQinBpwfPJGwOqlv9wleGOrCpoZfgUXF/k2oKpVtVrXqQvWmRitDFXcJWf7tBOck2s06kKXVt3ATbFtK4fY83TeclflgiOXIquYTV3P5XTqFyl3OW8TZrHJieSsKHvUB7hqOlqD2sWAHxdhX/6qIYpBIPCsYMSktddpT9tJV6DiqVRW85lSSpX24ogIOhWjEhXr9cvxdWVKBMVyyCSvbsJbbE/Sazz1FfNf54+ALE2aubTNAZQ9xfe9jDTqPEftHS0sk95gc4FNV8nR/yecUGDrBmVnLC+hoP2CQD+0s70fjrgJ+tTp9LwNENFs4G4f9ZvDkwBkK8Ss7Z5NvuhyoF8o9oTNObdqf4vJHVCydu+ddA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(1800799024)(36860700016)(376014)(82310400026)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tcJfjJ00U3+mXb72nyEs+R7tkeFEYu/i6ALzUmfXvar92uLkF7Nt/NartcWOOfVGtL46OIL3teVScCLy3vrw4uwSTem1X7xvo3oqdA4Ur6C7YhJCFaeLcfjIerEGxRRLPUFIg3QxYXuemAK8iQdpQzvqFzrZilmGDHiCMISzkTYtUT9hJbrFC9tCCQsrAWcWdRDHCKRJjHkyzr+nzmaDHi6HAOuKWd04WYe4orkCBUTIEuiY/XoBxs5LckogwnnMwZqLlZbC8kdxkjZRfc2uVXXXl396xTy2cHW2NoYV1H3pbfpwGkY317CkX+Ob0aQ+ZkvBA4p4/zFGysMts2sqV27dfNNSnzKWLiddEzXFDn6rb+8tAApwxWAtpLdcoWiM0Z19r745w557c/egeUTgqRGMqmI5/IWXZwNBl64giqAsKnV7K5z+0KYQUQp/R0tG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 14:29:21.1386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8fae011-4d3c-4c03-2fa4-08de7b8cc1ee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFB0C5EC304
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Mar 2026 14:29:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19664



On 3/6/26 01:43, Andrew Davis wrote:
> On 3/5/26 11:21 AM, Shiva Tripathi via lists.yoctoproject.org wrote:
>> Add conditional kernel configuration fragment for LUKS encryption with
>> fTPM support. This enables dm-crypt and necessary crypto algorithms
>> when MACHINE_FEATURES contains 'luks-encryption'.
>>
>> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
>> ---
>> =C2=A0 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg | 28 ++++++++++++++=
+++++
>> =C2=A0 .../linux/linux-ti-staging_6.18.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ++++++
>> =C2=A0 2 files changed, 37 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-
>> staging-6.18/luks-ftpm.cfg
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/
>> luks-ftpm.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-
>> staging-6.18/luks-ftpm.cfg
>> new file mode 100644
>> index 00000000..234cc087
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-
>> ftpm.cfg
>> @@ -0,0 +1,28 @@
>> +# Device Mapper support
>> +CONFIG_MD=3Dy
>> +CONFIG_BLK_DEV_DM=3Dy
>> +CONFIG_DM_CRYPT=3Dy
>> +
>> +# Crypto algorithms for LUKS
>> +CONFIG_CRYPTO_XTS=3Dy
>> +CONFIG_CRYPTO_AES=3Dy
>> +CONFIG_CRYPTO_AES_ARM64=3Dy
>> +CONFIG_CRYPTO_AES_ARM64_CE=3Dy
>> +CONFIG_CRYPTO_AES_ARM64_CE_BLK=3Dy
>> +CONFIG_CRYPTO_SHA256=3Dy
>> +CONFIG_CRYPTO_SHA256_ARM64=3Dy
>=20
> Tell me more about this symbol, why did you pick it and what does it do.
>=20
> Andrew

My understanding was adding this helps optimize SHA-256 on ARM64. But on
digging deeper, realized it's a Kconfig dependency chain which gets
selected automatically when SHA2_ARM64_CE/CONFIG_CRYPTO_SHA2_ARM64_CE is
enabled, so shouldn't be explicitly enabled here.

Also re-evaluated all other symbols in patch, not all were needed. The
required ones are:
"
# Device Mapper support
CONFIG_MD=3Dy
CONFIG_BLK_DEV_DM=3Dy
CONFIG_DM_CRYPT=3Dy

# Core crypto algorithms for LUKS encryption
CONFIG_CRYPTO_AES=3Dy
CONFIG_CRYPTO_XTS=3Dy
CONFIG_CRYPTO_SHA256=3Dy
CONFIG_CRYPTO_SHA512=3Dy

# ARM64 optimized crypto for better performance
CONFIG_CRYPTO_AES_ARM64=3Dy
CONFIG_CRYPTO_AES_ARM64_CE=3Dy
CONFIG_CRYPTO_AES_ARM64_CE_BLK=3Dy

# Userspace crypto API for cryptsetup
CONFIG_CRYPTO_USER_API_HASH=3Dy
CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
"
Few above are already present in ti-linux-kernel, but think it's good to
keep an inclusive set required for LUKS in case a user deviates from
ti-linux-kernel config and start observing failures here. Will send the
updated patch.

Thanks,
Shiva

>=20
>> +CONFIG_CRYPTO_SHA512=3Dy
>> +CONFIG_CRYPTO_USER_API_HASH=3Dy
>> +CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
>> +
>> +# Additional crypto support for LUKS2
>> +CONFIG_CRYPTO_CBC=3Dy
>> +CONFIG_CRYPTO_ECB=3Dy
>> +CONFIG_CRYPTO_ESSIV=3Dy
>> +CONFIG_CRYPTO_LRW=3Dy
>> +CONFIG_CRYPTO_PCBC=3Dy
>> +
>> +# TPM kernel modules needed for initramfs
>> +CONFIG_TCG_TIS_CORE=3Dm
>> +CONFIG_TCG_CRB=3Dm
>> +
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>> index 8e4ccd7d..69d6217f 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>> @@ -35,3 +35,12 @@ module_conf_rpmsg_client_sample =3D "blacklist
>> rpmsg_client_sample"
>> =C2=A0 module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_remoteproc =
pre:
>> virtio_rpmsg_bus"
>> =C2=A0 module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remotepro=
c
>> pre: virtio_rpmsg_bus"
>> =C2=A0 KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remote=
proc
>> ti_k3_dsp_remoteproc"
>> +
>> +# LUKS encryption with fTPM kernel configuration
>> +SRC_URI:append:k3 =3D " \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encry=
ption',
>> 'file://luks-ftpm.cfg', '', d)} \
>> +"
>> +KERNEL_CONFIG_FRAGMENTS:append:k3 =3D " \
>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encry=
ption',
>> '${UNPACKDIR}/luks-ftpm.cfg', '', d)} \
>> +"
>> +
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#19655): https://lists.yoctoproject.org/g/meta-ti/
>> message/19655
>> Mute This Topic: https://lists.yoctoproject.org/mt/118155818/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20


