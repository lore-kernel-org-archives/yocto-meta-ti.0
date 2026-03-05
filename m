Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2882F33A87
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:10:54 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46413.1772723448276834341
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 07:10:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=OhFh9wmR;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.8, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NX6M1jAOwVeyiZKoGBXoOKfbEHedGv22T8exNc/N1f4jy8SpmQWnIS8k4rxi/U9C8C9Htgl3nyZ3a4uLEGUnYDrgIoyt5pHWfaJmBAEhdzfy3mdaVgIzhWDGAYPHi/T+iCJIiJQr/lZLZRLg7jiJhE2AiI5xTbgLOKiKglXTw0DwGSGhidE8LCaF9PQM7kAleR7W+BLySU1kg++zVTZbQyP9p246z/pnztnql4GSX3Jm4UZFfflZRx2TtP/1Mxhn8lfupxFXAWwxLzCubYRHMmdNTcT4NLIuoTJyh9ee24zOe+DLAPRk1k8McvrykGWAHLayscFqFdHZSz8w9sJ5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrGdCyldjgSvqBSUEgTYVSPmY4MOeEt/GjxwEHDglug=;
 b=J/VS2PBrLVldbULLKP0HU+sbxV4cRytWU62OCyVZfmmgIE3VXpIRKbimhpEkEEE8Ny25ICd+XJIt0HTRiJqyorabGtApBTs37UwJ9vQeIN3A/WqegYd7Asb2Bt5KSAhXGx60EpNx7B5DbfsLmT1ny7L3k0H1IVRmthQ86RMQHoM6dglDtwvUdL+Ph7Ofc+PK2AFc8YbpqCUETCofmZl7udTY+2xLsPKkMrTdsaIMBJvX5r+xUQ8drzMQb/HNN0EBdcdzRFcNBqku1HSxlDcY04g1y1LqMzBeAtj9M5/PnZ3ft0j/lwpPFDSCB0FHPw4tLjEflofOG8Z3iGCdHG3zdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrGdCyldjgSvqBSUEgTYVSPmY4MOeEt/GjxwEHDglug=;
 b=OhFh9wmROmaTgjvnXOrJ64QcwG1KzpNlRitL9V/vb3lDWN4RgLrFDadwrPCTJZ+V7SxBe52+YJocw7jgafFxHnbuBjczF1JkaLcF+EfbdnTOf/qQaYInzttKZeLA8shVvEf9bsDl3JmN5s6pW7noBggFFjN9GnfAbtiQoEYn26M=
Received: from BN1PR14CA0024.namprd14.prod.outlook.com (2603:10b6:408:e3::29)
 by DS0PR10MB7454.namprd10.prod.outlook.com (2603:10b6:8:163::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 15:10:44 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:e3:cafe::af) by BN1PR14CA0024.outlook.office365.com
 (2603:10b6:408:e3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 15:10:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 15:10:41 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:10:11 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:10:11 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 09:10:11 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625FAAWm2051554;
	Thu, 5 Mar 2026 09:10:11 -0600
Message-ID: <d51f6e29-8892-440b-85d3-dc01ac37c4fa@ti.com>
Date: Thu, 5 Mar 2026 09:10:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v3 0/3] Add LUKS encryption with fTPM
 support
To: Denys Dmytriyenko <denis@denix.org>, <s-tripathi1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <rs@ti.com>,
	<jcormier@criticallink.com>, <praneeth@ti.com>, <kamlesh@ti.com>,
	<vishalm@ti.com>, <k-malarvizhi@ti.com>
References: <20260304193824.2495898-1-s-tripathi1@ti.com>
 <20260304230018.GJ11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260304230018.GJ11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|DS0PR10MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 977dde55-fb3e-47a3-a341-08de7ac95da5
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|82310400026|36860700016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	7za9FSGlxuaHHX5bKQjp2f3FV0NWHGN1ve9RRfiERPb+WDO/5+HaRUC4IYiWHH7OuoDJW/6bg9y6eJUJhEbKr/hUfXltK3bFlj8qqD4Vi48ePwHO1uUd70eMvLdeuVnO5F3BawdGJqmTPM41Dt4xxCW7q5AbFNRNDFfku+WpF7U0yZ3EoBsvsAAMQp2nIZQ1FUwTz5Dgvme6PrY+KRiDh8aXtucExtQHBqOTp4sxiZD8E0Gyid5wRJrKMwU6Ldt0ibJgyIU8trwQntJNRczEACndkY6iIqhBV06rHqF3HMNu94DNco7nBD6zrNMNJiDKJnDh/iO356kcHRBmfBYIsCI5JRZ2CgGvevNc1RmeB5x8et5/K+f3PTRkskPV74JRG0EFvJ+OxDUHON3gQDMFPLZOdR7YlSBtDzIOJy46xYKPBEU2j/PVkJMLLsLcYJ64UeIXtjkXr0Q15zq15b/WBWbewLncKQblA/yR2amiPL4W7hdXkGnE7vbSWwxHCp0ykXvga/WM/IAtu7fescUQm9fKjdWf14fcyqS/28EXw2JOvSeB3dLWcOBhmIK2KsNcn4WrixwOJVjJ3Sp3dzwIn5nuCnYy7vLwWBJv4PEv/nqGbXjL9G0PimHKA8RdAMKc8Ec0Uu1Fay8zTBhUBDf4WTlcpwO/MS5gFGn3GGPxBjmDd3jxH1XSBz+gBgXJrJ3s84qcLsN96Ps1BTqYguFF2nqYWsQWMLdKFmeeQ5IRUUBLVjmrXd7oK9hCmmuOVTeB/6M9pbZOxxqVa/aAff7brA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/y7e5YYNl4KSY1/3tkmIETcaL04NwZIJOJkhwBMfrH80tl3tUr3MtbxyOw1EOfEp1aomEhdHBzBHekEBlza5Kgrpx4u0Rdzbt19Kj1eMeSil0t1Aej5leckQiUD0eip/Am3ESEdAtPeamsmFPN3m86kCu1LVvPZhDk1DP+eCQ30JAMuh6YZJQygyd3hHOyRopjjFW1/sR9n7+zzR4o/cqZp+eLdOrhHtYU8GS8N0oyvuxJAzPg3UH69qAz4pc+OXuaW0eK/wVxx0Dfx/E1r8k8y4a+VIq8rQmKf+8voeQCgxlijteeZIzKUqgorph/EJhoaKLmAWlwPAx8m2CxGXq2sqezRGBtJLALaZTO+gAxPxbOlBY4CWF9h2NNEdHWovl0sqo6ycc+yfvA6xgxPgvOoQEBFxz+mtDpLUGUK5Ybs94yyQZVmnlQyhz+VKuA6Q
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:10:41.0238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 977dde55-fb3e-47a3-a341-08de7ac95da5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7454
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 15:10:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19653



On 3/4/2026 5:00 PM, Denys Dmytriyenko wrote:
> I'd like to request extra time to review this, as I'm a bit sicvk this week
> and this seems like a very major change I'm not very sure about... Please
> don't merge.

Don't worry.  I wasn't going to until you had a chance to review it 
since you have experience with this.


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
>>   - remove separate sdimage.wks for encrypted boot, default works
>>   - update encrypted-boot-common.inc to use existing hook for adding TI_CORE_INITRAMFS_ENABLED dependency on luks-encryption flag
>>   - add logic to verify if partition has enough space for LUKS header before starting encryption
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
>>    linux-ti-staging: Add LUKS encryption config
>>    initramfs: Add LUKS encryption module with fTPM
>>    machine: Add encrypted boot configuration
>>
>>   .../machine/include/encrypted-boot-common.inc |  16 +
>>   .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  28 ++
>>   .../linux/linux-ti-staging_6.18.bb            |   9 +
>>   .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
>>   .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
>>   .../packagegroup-ti-core-initramfs.bb         |   1 +
>>   6 files changed, 436 insertions(+)
>>   create mode 100644 meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
>>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
>>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
>>
>> -- 
>> 2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

