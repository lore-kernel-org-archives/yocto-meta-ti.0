Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3926108E1DD
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:28:06 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8051.1773916076813219469
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 03:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ZVWe3OMS;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.64, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfJfGf08LVG3oHbIPUgUmpWL2XM0KXwvHo7rC1oooSZ2YeHQMsbdQWgCcTk5ln1a6KYuYt3Od45j/PNGDUQc8OD2XWULWFCalnPlW2cnpGOgAKDDZ5xuq+6w2RHpTfJkTVIpW/+9F8jN1oQaxb7zdHNIDa9vOyA1LkmkN8USn3MjRB8qyuy9PW2CGkJLxR0mon+fu5qQbJgHQtzuKaRmtf4HgPNTVpzdkrXRYpBrPFGC9obLT+eOxsGipbFmZJ/W0YfaIy/JChToAj5p/QIcrm/k9zYuv+ZGshTqD2qLMaeUflz/dUhGOEYrP/FA/UEACnUuFCcWLVa71QbFpQSIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2ZSOKuqmERr4koKJRILaqFRFrFC2HnvbfRp9NR8qmo=;
 b=bBEZChRcTxLJOpwVZ0dlXyEtlFhupoHhPe5i1GgVs/syUJOt7I4vtrq9c3dPJYSNA0OsyXcAYImgqoFalk69QdskjipyKbCO1t6pf7Vw1/5Ac2x2BbrTnwONdt7tj5TPgOd1x34XzySG9xWU+FiH9BNGWm84nKt8IQ9/tB1+cKScoDG37aHkmTDEOX85+DGpW4F0DAFAPnoD6ygBgx34BPNxvOs4IG2PXoR+C3W1AkipLAbrlgbUrJlvGpftU4HS4K34cFbxdFTdM5EYthUsyu0qEwuDWqNtb5n2RKiBb4OsKjZhK4afhLLvAbzgDl23oJSoYyJv8AEn2jPRosR8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2ZSOKuqmERr4koKJRILaqFRFrFC2HnvbfRp9NR8qmo=;
 b=ZVWe3OMSV609zgGwAd61FgCkupNvkPIdE/+LxjJNdPMQMQ07CHDWrjKBnFqdxGoIlo4p8dFUpX5TLeiF1t4v5h03cipny+/WH2xiVzL0bWrzOKtR1Ktb43+0yJbzFN59C7aO4tljRogFq5G36mJMPNvSePN5fsptHNrk5OcAHSw=
Received: from CH5P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::25)
 by SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 10:27:53 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::67) by CH5P221CA0023.outlook.office365.com
 (2603:10b6:610:1f2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 10:27:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 10:27:51 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:27:51 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:27:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 05:27:49 -0500
Received: from [10.24.68.200] (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JARj7l1938742;
	Thu, 19 Mar 2026 05:27:46 -0500
Message-ID: <a7cff448-c15e-4631-a5ce-c28cba518c9d@ti.com>
Date: Thu, 19 Mar 2026 15:57:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v6 3/3] conf: Enable dynamic security
 layer for LUKS
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <rs@ti.com>, <jcormier@criticallink.com>, <praneeth@ti.com>,
	<kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>, <denis@denix.org>,
	<vigneshr@ti.com>, <afd@ti.com>
References: <20260318145732.2115521-1-s-tripathi1@ti.com>
 <20260318145732.2115521-4-s-tripathi1@ti.com>
 <e8f8acc4-1165-446b-af83-f455a70fdf5e@ti.com>
Content-Language: en-US
From: Shiva Tripathi <s-tripathi1@ti.com>
In-Reply-To: <e8f8acc4-1165-446b-af83-f455a70fdf5e@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|SJ0PR10MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0be7d5-b435-4df5-6518-08de85a22d06
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	8GorFORPvgptMOhJukCswOJjUTId5ivsJAzgIsvXd1lLaN8iyqmjRzSEOhK13ZuR6JdaJHfDtge7nOlXIZqJqxYHU7lQmf94cmfyC0aEgMfhwZi0TH7TjXDSVfaJLxOi2SwGpQAs+QSkMDjvxT1pAAceMhBmjg0M6m2Se+7tyF34s+On+pHkrFrAbhJT0E3fFBu1Oc+DoWzc31qbwPYK6nlw17Iz1CtgXOzR1+wFAcx0FXZz4O6DLRGOqZTOyjA7zp8GMjVZu4mMhPk1OqsvpN1Z20RWuLhMdQmtYv56L4AvoagJWF/sHY+zJo8mvhkobsbV+V3Y/y3rkhwFP5Q7htc3OTY2OF+ILIOY7P5+3P6OD0vuoCFlcQb7ISa1mpvD8b4DJ41NwAhOqKGH46d1EUP9QNUY8P3kOD+UfoaDmO0nQJOSfjus/d7Zi4drqmEngiDd4r7d8XkWy+EhttEdwtnWl+S+68xTmnO5aBbLZXmEV73VOqDppQCYucDAbiwhzp/S6tcEGvmp8FTFCTcyhRZlCzSVmT7OuGN76i2eX0gsq4GLKYw2kHQh1XsOG8kn1iuR0wRPani8QAe/bmMWWBAhON91suqurwaJhnhlzfCp5tfuQ2EV9n1wFfVXLkJ1n/sGFyDtFcttLi2Qf+wDjSM9N6Zsp43vdD5jD6LkIhlvZ4k7peBxwImUMN936o8WRTlotdMJojI5QwuFnmzifrbOuDFiNrMsRZ5EVzaoM0ew1ggyzdbIipCcoSirytKTy+sV4zFz+LeEFJHCg/wpYQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rhg+4EDoNY9lahJECkxAYyyOIGO9pogCU8u/Z+3TA4roKCHpr4101eRW8DT4OOpFqpI8XkC0xCqPST4XflWlCHCfM9rJdLnLMS0ZfM102UIC7PYIjBf6AdRk3QLsuncCVbIgu6PgN850MHUH89AsB6F/qovdTXPDZ6Bes2fLGHtJB/7OawmguV9wOYNvNEw1epngnBhcKyuUAw6UR1UAhgYZ9NUrnEzzdM9cjUQW5GaYHLQXO6Z4XnhvrlBa12tkY6witIJYCE2l4EMtxhwK1LDwevfRmgEzIqzSXQiZBhuqSKAyFlAIvRrybHkwM+7hMgH9pKXFcg+L+7gWdxQCkfTys9SQFtCWahBn5b4RfKz/Y4T0vkOO7wQVRSNozw5ICd7BV3VweGpyR6P6vM2Z56sbIUtPO2cQmib/k5E16ba9EkCXU3rFwok8DfpDtWAR
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:27:51.8852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0be7d5-b435-4df5-6518-08de85a22d06
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5672
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 10:28:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19772



On 3/18/26 21:36, Ryan Eatmon wrote:
>=20
>=20
> On 3/18/2026 9:57 AM, Shiva Tripathi wrote:
>> Register dynamic-layers/security in layer.conf to conditionally
>> build LUKS encryption support when meta-security layer is present.
>>
>> Update ti-core-initramfs.inc to auto-enable initramfs generation
>> when DISTRO_FEATURES contains 'luks'.
>>
>> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/layer.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>> =C2=A0 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
>> =C2=A0 2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
>> index f78da573..ce2883ac 100644
>> --- a/meta-ti-bsp/conf/layer.conf
>> +++ b/meta-ti-bsp/conf/layer.conf
>> @@ -24,6 +24,8 @@ LAYERRECOMMENDS_meta-ti-bsp =3D " \
>> =C2=A0 =C2=A0 BBFILES_DYNAMIC +=3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 openembedded-layer:${LAYERDIR}/dynamic-la=
yers/openembedded-
>> layer/recipes*/*/*.bbappend \
>> +=C2=A0=C2=A0=C2=A0 security:${LAYERDIR}/dynamic-layers/security/recipes=
*/*/*.bb \
>> +=C2=A0=C2=A0=C2=A0 security:${LAYERDIR}/dynamic-layers/security/recipes=
*/*/*.bbappend \
>> =C2=A0 "
>> =C2=A0
>=20
> You should also update the LAYERRECOMMENDS to include meta-security.

Okay, will address this in v7.

>=20
> And you should also submit an oe-layersetup change to include meta-
> security in the arago-master builds, commented out of course and add a
> new arago-master-security-config.xml that adds in the new layer.
>=20

Sure, will send this patch separately.

Thanks,
Shiva

>=20
>> =C2=A0 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/
>> meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>> index 9d3cc612..15c05e04 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>> @@ -5,7 +5,7 @@
>> =C2=A0 #=C2=A0=C2=A0 TI_CORE_INITRAMFS_ENABLED =3D "0"
>> =C2=A0 #
>> =C2=A0
>> #-----------------------------------------------------------------------=
-------
>> -TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if
>> d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or
>> d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
>> +TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if
>> d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or
>> d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or
>> bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
>> =C2=A0 =C2=A0 TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
>> =C2=A0 TI_CORE_INITRAMFS_EXTRA_INSTALL ?=3D ""
>=20


