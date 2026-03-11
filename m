Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163EA104C007
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 11:24:03 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18717.1773228234040903985
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 04:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=acXWM2wz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.29, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtiPsVv0ALe0P57hrse5lHVgxmNKbr7myIVSuqbGgcrI4Wd6XAL4p08c1hG3NCSLwJVi1IBhfAn+N2fsdh5nLown+oF52vLrO+cWXtV1SzMSxdZN9It3cRmjeGEh0Pg8NnxWewK7XDlIimF/IFwMKYb6iAxl2vmh7kEYENLi9SalzYDrTjNfWfm5Eru22fNNu+WMg3CUqfyV5Gcg9nYjKnjHRwKalw/hDdfMiQrReDQbIAnS314rM4g5QWfSiBPHd9aC++KnNVJBkWSDe4mCo8FGAEpAQd84LWXnvII5dP8RVMbWHwFWLKO3fA7avYHdb9iEtxhi1JHWzrVXnKaQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faKHwGSvkelTj/6AXVcF9STp2C+7/lsXQXV04Br0Ygw=;
 b=aEAqr7OvxVYuiSePAOWFWlfyQH16hE+zrFQFZDgCL35Pr7knZE0n4rq9Mx9is16QJCFTd0sk5HUSKeFwlTZ+tSz1VpXq83II8At0lH9ozzcUP+oizNrr7l79HM/R5/ET02tkT5Zt9Le8Ya5Jn3axW5rZ/KOL2ukqqN8xMv1+P/cLAfREmSqVBtP+akcHMXSANcBOB9+I1d5mf+cIYk5VlG9O5W5s7vltknQ0hSqyRSohj2NYIer/JNn6dCV1a82fY+925vtDxaw31TDyQpuxzmXNv1xahxt39KLEt48aXn9LSAzzVbw9Q9/Rq5ZQNytyBYJYHpttoImz39ZNN4kH/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faKHwGSvkelTj/6AXVcF9STp2C+7/lsXQXV04Br0Ygw=;
 b=acXWM2wzY/Pkw8lt2Qwt/Vpe+vxrStoSyqee9hhErlRFZNwEhMWBfTWbKQBERmZHJQleku0cIsdY7uHihtaSifQDIS6gQA9KwtdVP323li8azN8vUuVzVOnchUoLxd4/RLyHui8hDpTVPgS53do5Q9VOYF8TQKhkELUAQUZrh7o=
Received: from BL1PR13CA0423.namprd13.prod.outlook.com (2603:10b6:208:2c3::8)
 by DS7PR10MB5101.namprd10.prod.outlook.com (2603:10b6:5:3b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.14; Wed, 11 Mar
 2026 11:23:50 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::d3) by BL1PR13CA0423.outlook.office365.com
 (2603:10b6:208:2c3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 11:23:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 11:23:48 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 06:23:47 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 06:23:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 06:23:47 -0500
Received: from [10.24.68.200] (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BBNiOe751589;
	Wed, 11 Mar 2026 06:23:44 -0500
Message-ID: <6b1249fa-e299-4b38-86b0-bbfd7dd679ce@ti.com>
Date: Wed, 11 Mar 2026 16:53:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v3 0/3] Add LUKS encryption with fTPM
 support
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>,
	<jcormier@criticallink.com>, <praneeth@ti.com>, <kamlesh@ti.com>,
	<vishalm@ti.com>, <k-malarvizhi@ti.com>
References: <20260304193824.2495898-1-s-tripathi1@ti.com>
 <20260304230018.GJ11121@denix.org>
Content-Language: en-US
From: Shiva Tripathi <s-tripathi1@ti.com>
In-Reply-To: <20260304230018.GJ11121@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|DS7PR10MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: 685bda22-fc06-49e2-b0b2-08de7f60aa6d
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	hHEtfgNe+KRWLZM5NuyjU+AfdSGQkBUSYIF14y1QT8xpO8tRVSZTxhHRNnRMUUEDDLw5ZhSp8GJ1ACsEyQeFsAIFIlcSdXROv0q6VYSyjED7sNRQsavfNaQRtXlyuUYDPigKYKDCyAErW03+aFAe0KEwGia+xbp7TeFrJosvKPw9lo/1hZn8QDYvAkJoUPUYzLaauQ/o5wNRkucNnrtqK0QD4Rp8DXctbqhLY7OfeWcj7YUO58FP1MtpSy43jfvPD9zatMdCz5MJxBsLkUcBlqlgZNoKJcciMXK6ArDjoWd2WL6vYUQ6Zn15SVweqyLPjfAUzdDYmvQ2JjdLcNcR+xmv/aoBmgjFjw4mSvykPCLyazpltMc+aBkrRZrs1t+/up6OLNsS0LQzNb5QH4+pbuLWOJRvZ6pxpaCqSXbx8zbdbXiyTjdDFTvczgqOOjFSz5nyGcupyC/aATFVrcCyGiAjufJLXdOpQ5rJ06Jc5NvudaloiZh4S1/WbcioC8FF3h5WmO2R1sLYM4/UXxVB7estFyaWqPVbjL5oSTfumDlxjGrVR7AUlTJZKA/9RYoQo1vNA7mAUVYRt1SbuSdGhp3Wf11KNNk8r/p9dl+2hU/Lpfz/FJoNBeefLirTvO+PzkV/IF1lMKbOPd0OBGEjEe7GF5jg37FjB2bF8itmxBah0lI6xRmFVbURmxlmCry/Ref3EW6rDpJ2NgrAz8qHE+VZdWgLZug2CgbSqcYN8fD1F0Hi/RbCn07H6pGajJdWDNmycZb2L5Oso1gOLp0yNcvngKsZJmdTUoOJorcCWVM=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/Yk6F8toKVa9Lp0uYkhEhqprXabwvyuE94yeYysjtIhfk9zEjBTgH0XArcC836UPpY2G0veCMgINrTUdo5PgxdRXPRKfQsOU4s7j81ZxmaG18LRwJ5m3SKbCiA9d2QuhYJY67KwNY6v7rDWLNEKTXAgtIVeeCYl451y+cGkKT3EaOPfOLjph1eKiizJkPgkpCD2+YJfLpyGn09zBwrtO3s27Wsxve2CqCx+YTgmm3cElhJA7mMm4CabsG7Xzg1axAqUuwN/fsmAxwgUN/SN5jPqHrCj4FrhgPff46zUeVTxzpHds0547865IpA5/0HwB0H5Vc1HEAtyQ+r0vvOn+Daz9Na4rhD2uEn8nS72pOgkLNkK63xeXSo7q4JF+PzXFH8zVC8MxPYaQm4oJuz8XzExECy+MiCfxh7xhKPrnyXIVb6Vaj/TBaHPO82ciff3J
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 11:23:48.4970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 685bda22-fc06-49e2-b0b2-08de7f60aa6d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5101
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Mar 2026 11:24:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19697



On 3/5/26 04:30, Denys Dmytriyenko wrote:
> I'd like to request extra time to review this, as I'm a bit sicvk this week 
> and this seems like a very major change I'm not very sure about... Please 
> don't merge.
> 

Hi Denys,

Hope you are feeling better. Need your help on the v5 of this patch
series, if it can go ahead ? (all past comments were addressed):
https://lore.kernel.org/all/20260306163735.1316257-1-s-tripathi1@ti.com/

Thanks,
Shiva

> 
> On Thu, Mar 05, 2026 at 01:08:21AM +0530, Shiva Tripathi via lists.yoctoproject.org wrote:
>> This patch series adds LUKS full disk encryption support using firmware TPM
>> (fTPM) for TI K3 platforms. The implementation provides hardware-backed
>> encryption with keys sealed by TPM running in OP-TEE and stored in eMMC RPMB.
>>
>> Background:
>> TI K3 platforms do not have integrated discrete TPM hardware. To provide
>> TPM 2.0 functionality, this implementation uses firmware TPM (fTPM) - a
>> Trusted Application running in OP-TEE secure world. The fTPM provides
>> standard TPM 2.0 interfaces while leveraging ARM TrustZone for isolation
>> and eMMC RPMB (Replay Protected Memory Block) for secure persistent storage.
>>
>> Key features:
>> - Conditional builds: Only enabled via MACHINE_FEATURES += "luks-encryption"
>> - No impact on default SDK builds
>> - In-place encryption on first boot
>> - TPM persistent handle for key storage (0x81080001)
>> - Secure key storage in eMMC RPMB via OP-TEE
>> - Security model similar to CIP Core
>>
>> Use case:
>> This is designed for K3 platforms requiring secure boot and encrypted
>> storage, such as industrial automation, automotive, and IoT gateways where
>> discrete TPM chips are cost-prohibitive but security requirements demand
>> hardware-backed encryption.
>>
>> Testing:
>> - Tested on AM62x platform with kernel 6.18
>> - First boot: Successful in-place LUKS encryption
>> - Subsequent boots: Successful TPM unsealing and boot
>>
>> The series is structured as follows:
>> 1. Kernel configuration for LUKS and crypto support
>> 2. Encrypted boot initramfs infrastructure
>> 3. Machine configuration support
>>
>> ---
>> Changes in v3:
>>  - remove separate sdimage.wks for encrypted boot, default works
>>  - update encrypted-boot-common.inc to use existing hook for adding TI_CORE_INITRAMFS_ENABLED dependency on luks-encryption flag
>>  - add logic to verify if partition has enough space for LUKS header before starting encryption
>>
>> Changes in v2:
>> - changes to use existing ti-core-initramfs instead of adding separate
>> - cleanup in previous init script as per comments in v1
>> - /usr/bin/busybox logs updated to echo, mesg, info
>> - WORKDIR changed to UNPACKDIR
>> - Link to v1: https://lore.kernel.org/all/20260302144647.1705408-1-s-tripathi1@ti.com/
>>
>>
>> Shiva Tripathi (3):
>>   linux-ti-staging: Add LUKS encryption config
>>   initramfs: Add LUKS encryption module with fTPM
>>   machine: Add encrypted boot configuration
>>
>>  .../machine/include/encrypted-boot-common.inc |  16 +
>>  .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  28 ++
>>  .../linux/linux-ti-staging_6.18.bb            |   9 +
>>  .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
>>  .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
>>  .../packagegroup-ti-core-initramfs.bb         |   1 +
>>  6 files changed, 436 insertions(+)
>>  create mode 100644 meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc
>>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
>>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
>>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
>>
>> -- 
>> 2.34.1


