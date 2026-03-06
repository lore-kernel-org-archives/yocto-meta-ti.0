Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93058FCB602
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:44:39 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70676.1772808274015324810
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 06:44:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=qi0RwpaJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.59, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcyEh3si2qZIurzBEwyTN5htMdHoFurtJTxlD/4rOlC7XuoOS2N3KERzIcll8DURLVgUs0ggBkYzwK2YlrC5DmMCtyiKnaq1F1fWYArVZhIU3fJjiViWWNqalVH+HegU6ATkfDD7G7lLITda4Fgc2UHwRe9Wfy59PwSNbxiXlNn3JQLctkhoevrnjDl25ED5buwhDZYySRsi22PZqW1WlXDBS64yQdcP3zmADM7QTplElu9wpUdM8z12QFyUZiMyWL23Fkq10edO4Q4uKMeIjfu70hiX6ayvHUC/dk4m4QGC/HTGvf2dXxidhHkpgblDZnqhPDJWCDtbjG/o8uQ7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpYbMjwBhUOAOm95HQ3pIcoT5XJ64rbhT0jXnAoY624=;
 b=FqD9GZTOdxKDO/KsO5peusrNKV0+LwGnGCcbeAp0T/WhrrFZC5682SUhFyB02hOZ2Gm8TgDozm0c9dP9qReVEjJxPFglMptrvgQHSNRJRIMYQNRjM2hAwFCiLZ9zKHypbok2iATdjyyf7T0/zkcyNqMIhil9radA3dhfl5qZ/HkGX1YdnnBiTOSPsWM5pjB8xtmEEd5L5ddoToyC74Ioa08+HUSSnkpY9ed2wq/IQ9EiHWWxD3pe5FTz+mtSgzuMV4SKZKjEHUpoisJIaQA26KDHMwlI9vMg6rahv1T0gWsrx7h+VmxKLSdGAE1Jo+Xg5Tmj+hS1EIxhFMG1ogwygQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpYbMjwBhUOAOm95HQ3pIcoT5XJ64rbhT0jXnAoY624=;
 b=qi0RwpaJ2lKfqM7TbMpJ3SEoaCGUDVXGB+Pm7M5vlU3bZhPZuqbLhprESJJxWy7Bjum2e5qmo08tb8fDBkUoY+bAaCQzt8FV/EwMQ0UXJMErpbdc3ISfXX90JTgNFMymBN1foeeJO9f91/1NmnCm7aiMItnRYe2fHrlVPYat4ts=
Received: from PH8PR21CA0020.namprd21.prod.outlook.com (2603:10b6:510:2ce::27)
 by SJ5PPF61CA724C7.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Fri, 6 Mar
 2026 14:44:31 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:510:2ce:cafe::e0) by PH8PR21CA0020.outlook.office365.com
 (2603:10b6:510:2ce::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.4 via Frontend Transport; Fri, 6
 Mar 2026 14:44:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 14:44:30 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 08:44:26 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 08:44:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 08:44:25 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626EiPAr3976815;
	Fri, 6 Mar 2026 08:44:25 -0600
Message-ID: <baa3eb16-90ac-4324-afbf-94d6482e9a03@ti.com>
Date: Fri, 6 Mar 2026 08:44:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v4 1/3] linux-ti-staging: Add LUKS
 encryption config
To: Shiva Tripathi <s-tripathi1@ti.com>, Randolph Sapp <rs@ti.com>, "Denys
 Dmytriyenko" <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<vigneshr@ti.com>
References: <20260305172148.3684377-1-s-tripathi1@ti.com>
 <525a7c96-f504-4ddc-81b6-709974825760@ti.com>
 <20260305211225.GM11121@denix.org> <DGV86WQ1U0MU.2YBP9LC8G84XA@ti.com>
 <ba8bac65-041c-4027-b17d-149f09ab050d@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <ba8bac65-041c-4027-b17d-149f09ab050d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|SJ5PPF61CA724C7:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ca82f5-5ad8-4ce7-2074-08de7b8edfbd
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|34020700016|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: 
	komZGR0DdAEztuqduFrOvgwyzKA5rGnrdd02vdipE4cgq9oESn90pHkaxT2zsDGAxRX0S6rjQxpJXtiK67Mq8hhjyZdS3Yuu/aTY44fieAuU2/cGpmXzV1smW+/yz3/WZ23SmXCZpxBkZfIdXpspYIpowItDZS58zm99LUicaY+fsr/Rp/Rb8NQkYM81pZODpWtl5o2az1rw2/CKAXsRIwan8/uGdlqF78ILsJDdtDgxcXnDqXIVOl41zVvTO3hlL8hxPJPmFuLYxsPFiwtajE3pVNlzfBjd3OWQQ58nqOFwZkowio7vgKAoV7TFhUPsbm/mp1aJgDxYDAHcg3kvh5xzvZJtowrr2NwQaklpB7eX3q2hJQpNTLsFvejELkR/8LUomKb/6GHGX0LLPkoZoPA32XZufoUzzqhrXkT6CcAbYn+Re48GeEcByHu+SRWArGxcLfGcxljJVmNChHPPZtqGKOj6dB5DGwAn6mh/hgjl2gl1Qs+yDLHt3zWiHb3+zaktPAYFvuboLRTgolvHtOHgPhDOn92lQxwrTgLR9MJwArqjtHg2eAV9tWgItEMcd7aFB/AjXGUntNNKr8Yhizes3IO6QGqkzTiGHyN2ixrQvNN5UCG8T3yFQ68Y0sZvpZQQVimKP2XTHW9f2rLzjd47KZtvynIjYJzxaR92+m8g2Teq0DYiE+tklroQ/CgR8c2lTMgdUOvvh22Xdhyp3EpksYDIuzt9kw9iAfjTxho=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(34020700016)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ClXUPCvSv7mAWiGmFSUUt5jn+hFTvjT7EY5O8NQ0xfty2Sjzmo0JhCUsiSIqQYaS997jHKdkMbMzg4lrgjy6zPcV3uwI07kxtVGtLjPRESXQwWDvqIvjLK1x2A7+40Sa/+lpJpcTeQo7QfIJ07D4GNGUixA17VV603rOQp8wm13umybVTTUujrgK2DyIhSJyJjtqq10jVe66aVqXtzE9pkNJenBnxDrG3ia3UtVYbAjdxIJ9oMXkRKrmwux4DjH6vKSB07ubhQN79DGC4YVn/Plx0hPMJjSaRba94d329ClpT6Lnha0AH225Neg3LzprDk4LUUvIwL1pnNoeYljHa7e3ojzBq2OzvV6v/Gm5DLQCJuJs5BuUXQk9Cg17CkQUbapwQP/3qNyMML9CbWG6FDfen/zi2NULStUyZo2yaic/t1qQWkQXLyCRw0qurrV6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 14:44:30.1633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ca82f5-5ad8-4ce7-2074-08de7b8edfbd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF61CA724C7
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Mar 2026 14:44:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19666



On 3/6/2026 8:41 AM, Shiva Tripathi wrote:
> 
> 
> On 3/6/26 04:39, Randolph Sapp wrote:
>> On Thu Mar 5, 2026 at 3:12 PM CST, Denys Dmytriyenko wrote:
>>> On Thu, Mar 05, 2026 at 02:51:44PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>>
>>>>
>>>> On 3/5/2026 11:21 AM, Shiva Tripathi wrote:
>>>>> Add conditional kernel configuration fragment for LUKS encryption with
>>>>> fTPM support. This enables dm-crypt and necessary crypto algorithms
>>>>> when MACHINE_FEATURES contains 'luks-encryption'.
>>>>>
>>>>> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
>>>>> ---
>>>>>   .../linux/linux-ti-staging-6.18/luks-ftpm.cfg | 28 +++++++++++++++++++
>>>>>   .../linux/linux-ti-staging_6.18.bb            |  9 ++++++
>>>>>   2 files changed, 37 insertions(+)
>>>>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
>>>>>
>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
>>>>> new file mode 100644
>>>>> index 00000000..234cc087
>>>>> --- /dev/null
>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
>>>>> @@ -0,0 +1,28 @@
>>>>> +# Device Mapper support
>>>>> +CONFIG_MD=y
>>>>> +CONFIG_BLK_DEV_DM=y
>>>>> +CONFIG_DM_CRYPT=y
>>>>> +
>>>>> +# Crypto algorithms for LUKS
>>>>> +CONFIG_CRYPTO_XTS=y
>>>>> +CONFIG_CRYPTO_AES=y
>>>>> +CONFIG_CRYPTO_AES_ARM64=y
>>>>> +CONFIG_CRYPTO_AES_ARM64_CE=y
>>>>> +CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
>>>>> +CONFIG_CRYPTO_SHA256=y
>>>>> +CONFIG_CRYPTO_SHA256_ARM64=y
>>>>> +CONFIG_CRYPTO_SHA512=y
>>>>> +CONFIG_CRYPTO_USER_API_HASH=y
>>>>> +CONFIG_CRYPTO_USER_API_SKCIPHER=y
>>>>> +
>>>>> +# Additional crypto support for LUKS2
>>>>> +CONFIG_CRYPTO_CBC=y
>>>>> +CONFIG_CRYPTO_ECB=y
>>>>> +CONFIG_CRYPTO_ESSIV=y
>>>>> +CONFIG_CRYPTO_LRW=y
>>>>> +CONFIG_CRYPTO_PCBC=y
>>>>> +
>>>>> +# TPM kernel modules needed for initramfs
>>>>> +CONFIG_TCG_TIS_CORE=m
>>>>> +CONFIG_TCG_CRB=m
>>>>> +
>>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>>>>> index 8e4ccd7d..69d6217f 100644
>>>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>>>>> @@ -35,3 +35,12 @@ module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
>>>>>   module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
>>>>>   module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
>>>>>   KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
>>>>> +
>>>>
>>>> After thinking about this a little more... I'm thinking that the
>>>> luks-encryption is more of a DISTRO_FEATURE and not a
>>>> MACHINE_FEATURE. "tpm" would be a MACHINE_FEATURE.
>>>
>>> This was the first thought I had - it's a distro feature.
>>>
>>>
>>>> And the best most correct thing to do would be to do some
>>>> combination of the two.  I assume that only some of our boards have
>>>> tpm support, right?
>>>
>>> On the other hand, isn't fTPM a software-only implementation of TPM?
>>>
>>
>> Yeah, though they should behave the same in userspace. It seems like there is a
>> bug preventing systemd-cryptenroll from working in our case though. Obviously
>> there are some quirks here.
>>
> 
> The TPM support we are using here comes from OP-TEE based firmware TPM
> (Microsoft's implementation). We are not using an actual HW TPM here.
> Also I see, all K3 platforms already have "optee-ftpm" as
> MACHINE_FEATURES enabled [1]
> 
> Would it be fine to use existing "optee-ftpm" as MACHINE_FEATURES with
> "luks" as DISTRO_FEATURES in this patch series ?
> Thinking of implementing same checks as suggested by Ryan, just
> "optee-ftpm" in place of "tpm", if that's okay ?

I'm fine with it.


> [1]:
> https://github.com/YoeDistro/meta-ti/blob/master/meta-ti-bsp/conf/machine/include/k3.inc#L41
> 
> Thanks,
> Shiva
> 
>>>> So I would go through the effort to add that to all of the correct
>>>> boards, and then change the logic to check both variables.  I'll
>>>> reply on the other patches with those changes.
>>>>
>>>>
>>>>> +# LUKS encryption with fTPM kernel configuration
>>>>> +SRC_URI:append:k3 = " \
>>>>> +    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'file://luks-ftpm.cfg', '', d)} \
>>>>
>>>> ${@bb.utils.contains('DISTRO_FEATURES', 'luks',
>>>> 'file://luks-ftpm.cfg', '', d)}
>>>>
>>>>
>>>>> +"
>>>>> +KERNEL_CONFIG_FRAGMENTS:append:k3 = " \
>>>>> +    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', '${UNPACKDIR}/luks-ftpm.cfg', '', d)} \
>>>>> +"
>>>>> +
>>>>
>>>> ${@bb.utils.contains('DISTRO_FEATURES', 'luks',
>>>> '${UNPACKDIR}/luks-ftpm.cfg', '', d)}
>>
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

