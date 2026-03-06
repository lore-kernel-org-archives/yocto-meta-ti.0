Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93545FCB602
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:41:59 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70373.1772808115063764579
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 06:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=R+398fj6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.32, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAyAWAXx3gASK/g6hzVsxnnyb4xsg2vjs/6Vu/8PynVtFo8Lv9qNtBFRXKM4lRI/VKIkyfG9S9DVmK+vgigF8hIp0qT9NMuGy38CXQJBenTF36AGOL4dr18unffYu7F8mvardgplkjea0FzSQ/8/1CjQ1Rrc0qPkgRu6iNnfl7F+jMM12k9ZqqFwvYocbyX8OK1o2Pzn898/2kPP8HJLq+W5QhWfhNJUG9oiVydaPkV8/7tpJz6QRFQIZKdsI48yvLH0XwVcqz+TTcESTdhOs73nTdgZ3CtjOyJf5nhvdv319yG6vDiOf3GlAyKTVAYJdE5UZEDoAw0wMlRX103XBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WolbemWlUjLsxol/pEL/2Q1rvMRkq0fEGKo++u7m7RU=;
 b=sefJJLMDjO6muWrisiXCzGZhEXS11VOp9hoTuymo80CSi7dSlp1mdCC3LpBCmyR6d9INLX/b0BChpziC7Rj+kZUiF1M7Dt8YZXaMYqigni0HnGFturPIvw6+8q+YcDAo5NcUtpgHynaQCHy6SNaIRRY50FyVkE5FcxLtwdLeOHvEWrwbqWtKIiG5HPbvLkUlGfc9GJZkQlqAM9bVOrIfJaEkxwyMLF/Q1B+tVlx0q2Yy79113NcqlFk/Um9rBQ6/exWzDOBHfMhgVUaOf3ptkW4BLZpHSWZRyyW6+jwPqEnKLtvLqEi0ebGOFWFi4dXgdYhJ7goQENLc/1FYrJ/HvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WolbemWlUjLsxol/pEL/2Q1rvMRkq0fEGKo++u7m7RU=;
 b=R+398fj67eagJ+DFn10L26c89tT8oBOQmy9mfzhDlrrHH8Bc1ZeYjrevYzmefGKuMhR6x1oHunhH3o14Trf5I+nr+Z+aKCidpp0FxbvawybR0da5qstNLjf+5QaYa7FSvPpFXBFvm5pLi35U+pBTMAvr+q2u0iNzfWcJSn53Kxo=
Received: from DS7PR03CA0178.namprd03.prod.outlook.com (2603:10b6:5:3b2::33)
 by PH7PR10MB7729.namprd10.prod.outlook.com (2603:10b6:510:30d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 14:41:51 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::2) by DS7PR03CA0178.outlook.office365.com
 (2603:10b6:5:3b2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 14:41:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 14:41:50 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 08:41:48 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 08:41:47 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 08:41:47 -0600
Received: from [10.24.68.200] (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626Efiqe3973600;
	Fri, 6 Mar 2026 08:41:45 -0600
Message-ID: <ba8bac65-041c-4027-b17d-149f09ab050d@ti.com>
Date: Fri, 6 Mar 2026 20:11:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v4 1/3] linux-ti-staging: Add LUKS
 encryption config
To: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	<reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<vigneshr@ti.com>
References: <20260305172148.3684377-1-s-tripathi1@ti.com>
 <525a7c96-f504-4ddc-81b6-709974825760@ti.com>
 <20260305211225.GM11121@denix.org> <DGV86WQ1U0MU.2YBP9LC8G84XA@ti.com>
Content-Language: en-US
From: Shiva Tripathi <s-tripathi1@ti.com>
In-Reply-To: <DGV86WQ1U0MU.2YBP9LC8G84XA@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|PH7PR10MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: 0663145d-8cca-4d46-1b4d-08de7b8e8098
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|36860700016|376014;
X-Microsoft-Antispam-Message-Info: 
	7K9aWCDMtd7bJBKa5HA57rQSSMqiScL3WVmQFaQ4Qqiz1h6SnYZFgUfaCnQS3gaUo935Cb6pgW544psecQmA8Xy/RLjOp8RbG/mbcerMl/7jIUuiyKm8zlrCyYml7hBzZeutvG8VYlMREDgFkMSx9GbUVJxEMgfyer/q3lVxKfGPyHLFZ4/3FtZf97hEtuiiwNxDECVDmEzoGM/1cfqhg1FH3OR6JG1poosHDQ/g3rHNeFZZYFIqzdxO82OOWE/ppNLTjnwvLnm0kzrizEcQLoczBUpGb15LQEogfOI9y0sGtMAsbXK6VmIirLw2VCMDAsXAQ4IvXxhnM4+I/s1UQB639EH97SqmhCGW4e9dEiDFvfuGDzrDg0d/wXlXRkOZOszc/ciHjwOthPi8YQVfgI9f4R68pJLxTSEHmvGWP2+BdBbm83Fv+0PhxsTzroCwD9+qqOhmhNZ7ntgzAAihAltdbV3WfzxrE6G5BEd5P9U+ImG1SN60FuAIVJp82B9nzcUofz3znBR7sXood36t3eZ/ytxvS/DP0K7TErnJ+spPEvUymDTWP7X5cXLJsyz2xbw6SYpmL+A4Lpk0yGkuiBKe2JF5XeSJB7/yGSkwCbSqIMtXGQG7bg5uh/2Grd4cRHRRVg6EQMAo5LhJIhwcmu28meFfe3LBOyOBPSwN99sEOaQ/wG+QTpWZZQ8w1TUuynX9u7Kqja37TKBvr5UAVrCSPIQeVrFfLDaAoAxD9Sg=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(36860700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qKYErHiwj2Oz9PGP4zhpENswQW7WJLqXzwpzubU90R+vzGJ9dwoeanvglHQpl/XXyjLhnGRdOUE4MF73gHfuHzC76W9XXLOc2duTUNNdWf9BHin3+Bj73VF+CkqVN4SjDRJF/9IpWjwylOTfA/j0wsx3Mbec/ZiKmttfctgzHE39f8CMsdvCbL57bifsSvrGe19f9KwzTDfVsTfzLtq0N3WWiJCDMv3oXigr2Rz3LQ9D74D2f44BIqua2gTn3wz7AJEOjTLyaRTPn/00ziu8x6XZMiKqv2xzgU2yLE9fDYf5yAeEE+RKcM/dRvXAx1Ud7za4AIEJ+tIOKjoBJd0NYafLSgHulNmpZm//CXoku1tfU5NDihHxttZx17qlHCjrfoJy9VUZMyIDJtVVov5nGmh8Q8uhRMhdgJV6AyodkEX9BdEckuszruwmQ80uUxqs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 14:41:50.5172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0663145d-8cca-4d46-1b4d-08de7b8e8098
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7729
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Mar 2026 14:41:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19665



On 3/6/26 04:39, Randolph Sapp wrote:
> On Thu Mar 5, 2026 at 3:12 PM CST, Denys Dmytriyenko wrote:
>> On Thu, Mar 05, 2026 at 02:51:44PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>
>>>
>>> On 3/5/2026 11:21 AM, Shiva Tripathi wrote:
>>>> Add conditional kernel configuration fragment for LUKS encryption with
>>>> fTPM support. This enables dm-crypt and necessary crypto algorithms
>>>> when MACHINE_FEATURES contains 'luks-encryption'.
>>>>
>>>> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
>>>> ---
>>>>  .../linux/linux-ti-staging-6.18/luks-ftpm.cfg | 28 +++++++++++++++++++
>>>>  .../linux/linux-ti-staging_6.18.bb            |  9 ++++++
>>>>  2 files changed, 37 insertions(+)
>>>>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
>>>> new file mode 100644
>>>> index 00000000..234cc087
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
>>>> @@ -0,0 +1,28 @@
>>>> +# Device Mapper support
>>>> +CONFIG_MD=y
>>>> +CONFIG_BLK_DEV_DM=y
>>>> +CONFIG_DM_CRYPT=y
>>>> +
>>>> +# Crypto algorithms for LUKS
>>>> +CONFIG_CRYPTO_XTS=y
>>>> +CONFIG_CRYPTO_AES=y
>>>> +CONFIG_CRYPTO_AES_ARM64=y
>>>> +CONFIG_CRYPTO_AES_ARM64_CE=y
>>>> +CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
>>>> +CONFIG_CRYPTO_SHA256=y
>>>> +CONFIG_CRYPTO_SHA256_ARM64=y
>>>> +CONFIG_CRYPTO_SHA512=y
>>>> +CONFIG_CRYPTO_USER_API_HASH=y
>>>> +CONFIG_CRYPTO_USER_API_SKCIPHER=y
>>>> +
>>>> +# Additional crypto support for LUKS2
>>>> +CONFIG_CRYPTO_CBC=y
>>>> +CONFIG_CRYPTO_ECB=y
>>>> +CONFIG_CRYPTO_ESSIV=y
>>>> +CONFIG_CRYPTO_LRW=y
>>>> +CONFIG_CRYPTO_PCBC=y
>>>> +
>>>> +# TPM kernel modules needed for initramfs
>>>> +CONFIG_TCG_TIS_CORE=m
>>>> +CONFIG_TCG_CRB=m
>>>> +
>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>>>> index 8e4ccd7d..69d6217f 100644
>>>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
>>>> @@ -35,3 +35,12 @@ module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
>>>>  module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
>>>>  module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
>>>>  KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
>>>> +
>>>
>>> After thinking about this a little more... I'm thinking that the
>>> luks-encryption is more of a DISTRO_FEATURE and not a
>>> MACHINE_FEATURE. "tpm" would be a MACHINE_FEATURE.
>>
>> This was the first thought I had - it's a distro feature.
>>
>>
>>> And the best most correct thing to do would be to do some
>>> combination of the two.  I assume that only some of our boards have
>>> tpm support, right?
>>
>> On the other hand, isn't fTPM a software-only implementation of TPM?
>>
> 
> Yeah, though they should behave the same in userspace. It seems like there is a
> bug preventing systemd-cryptenroll from working in our case though. Obviously
> there are some quirks here.
> 

The TPM support we are using here comes from OP-TEE based firmware TPM
(Microsoft's implementation). We are not using an actual HW TPM here.
Also I see, all K3 platforms already have "optee-ftpm" as
MACHINE_FEATURES enabled [1]

Would it be fine to use existing "optee-ftpm" as MACHINE_FEATURES with
"luks" as DISTRO_FEATURES in this patch series ?
Thinking of implementing same checks as suggested by Ryan, just
"optee-ftpm" in place of "tpm", if that's okay ?

[1]:
https://github.com/YoeDistro/meta-ti/blob/master/meta-ti-bsp/conf/machine/include/k3.inc#L41

Thanks,
Shiva

>>> So I would go through the effort to add that to all of the correct
>>> boards, and then change the logic to check both variables.  I'll
>>> reply on the other patches with those changes.
>>>
>>>
>>>> +# LUKS encryption with fTPM kernel configuration
>>>> +SRC_URI:append:k3 = " \
>>>> +    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'file://luks-ftpm.cfg', '', d)} \
>>>
>>> ${@bb.utils.contains('DISTRO_FEATURES', 'luks',
>>> 'file://luks-ftpm.cfg', '', d)}
>>>
>>>
>>>> +"
>>>> +KERNEL_CONFIG_FRAGMENTS:append:k3 = " \
>>>> +    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', '${UNPACKDIR}/luks-ftpm.cfg', '', d)} \
>>>> +"
>>>> +
>>>
>>> ${@bb.utils.contains('DISTRO_FEATURES', 'luks',
>>> '${UNPACKDIR}/luks-ftpm.cfg', '', d)}
> 


