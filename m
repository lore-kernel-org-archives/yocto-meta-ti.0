Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB2EEFCE3E
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 19:38:50 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27168.1772653128660596503
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 11:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=KntfHqIL;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.11, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIJqAIIQ0Tukt21IWQAHY90KHY8Y1+Trw229GMDxd/l7RL7EHDiH+uLLk5AK1lFDQAN8QvHjrbGuRonsA/F1kQogUxRW96gaMtZ7Ts4gdUaQPVxhv3SjU/yNoDFKYUMadeIGbk8oeWsJ5AP9Lc393mJLLY1mh9sWjVFIHEVbBHNgmNpUAHRzp+LylgIcWc5bqazKy3PwxYe1lj8BsQwRs6JOqHwQaC96BQVIEWSGhP0VEb2+RIZM9SC41IPj8MFacb2PUDObUmDtgU/XwCEzXw72Ro2zzXeYeoiQI9oO7Vh0qTQXIs3KTzD6EtHn2J6D4LLl1tD/drsfwbWAuJLjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JmfSSFBVjUho35KAYwuCKJnGgxlNaRpsT4Ju7QlM2M=;
 b=TLM6Z6wbnuPk7Ie3MoKIIJKgmUGFF2fU/ylU7Iez9rEdoqT/A5VXCAAT7/52ecCRcB6XSc3ox1pUJgwXIb0okv77I694Kp27S7wbEELa9gtJ/P0tmVDw1Vcbirv540O9S2ueGWXhQ8lxFCdcN021WSNNVg+IYtVAINd33FcwWZ4Y1/U0gF8H+p5tXM47Cmt3JteOymXBc6MTRlucLpy0iIO4GTwg0VfBur/NkuWqzaKMq42IdxEWW+c/xHuKZh+BM1R2RvB3+FS+1jwL2iytr0/CFyx7YM1zA7EfQNO1bPDqNCHaSoUoHTdpukDJsTIm1ILXjwNyu0UdnILOjzK9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JmfSSFBVjUho35KAYwuCKJnGgxlNaRpsT4Ju7QlM2M=;
 b=KntfHqILjB9/8YxPbGHvQJcRFvFC4SZps6cq8j9PSSDWoCaflfOHZ2foGxZcYJeDmCRYzNe+WI/Og4xN9deHfp9OUXd47T6dm0bekEWW/v76H9i0XmfbPC+hfnX/GzGlKi/xK0MyPuQEUvoKk0H1abqSDYjrq0R86ZLWLuLjfcU=
Received: from BL0PR05CA0002.namprd05.prod.outlook.com (2603:10b6:208:91::12)
 by MW4PR10MB5726.namprd10.prod.outlook.com (2603:10b6:303:18c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 19:38:44 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:91:cafe::b) by BL0PR05CA0002.outlook.office365.com
 (2603:10b6:208:91::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.13 via Frontend Transport; Wed,
 4 Mar 2026 19:38:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 19:38:42 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 13:38:39 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 13:38:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 13:38:39 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624JcaZJ956747;
	Wed, 4 Mar 2026 13:38:37 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v3 0/3] Add LUKS encryption with fTPM support
Date: Thu, 5 Mar 2026 01:08:21 +0530
Message-ID: <20260304193824.2495898-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|MW4PR10MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f171f27-9080-499c-2b1a-08de7a25a4a1
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|34020700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	pekDeDYgaE2ehakYPy8EEk8vp8XEpeQ25m9AppE0K74Y/xueNTq3mLLihxo0UP3U36hQxDAQyZZ9t9wL/wUVw5TsqATy+fyEZvRX9AcBMct4Hhfg/E9XzAycnb4ph+z++b7vPIlf7AD3VQzAc1keIpmp7zsIGVAnBDqvSIemlH8qssUQCaEPAts8XxRMfrSYGD5GmJ3oraFFOdOSl2m6ci0nFxPpLLc73DZrbmuaSZRdc/QNfkbtIpKrZ/6CYz8Ues6xpS+rV0Ev5tt1hz2qQwU8x+MuCTNCOu521jiz13GpWZYKv1f848Jwf6/KFLa3mIi2EAzRNPJ1T40aNLxPFqxto+4Z3jwzgAjrHDne/RgH7VPNHYBSkaGZMlmRd/FNtmibpfSAhUlZ7rG4W8TVo1rbdra98koGx45pxewxce4t5kIol61vP6hdfhTlcSg5fKYCzqkbzIiI2dfmpgNi+znzGuPCzVmgE70+YGnSmQjAmkIKcVLZ/f0/98ZZXIIDNgTziu51lrmjylK9JMpbswZb/C82sE3GDpUFHroIVrSv2efsHZUTV/K72mG1DGThR3lZiuX417p35gVMo8c9vCmMIPszpXQqc97SPA9YsaopiimSQIOdybuHCHUQZx6sXc3PIxnw5x1WVooIW+JvSe9FsW0hQ0eUpp7vFwFV8fAM0H5IS1n71PuHzBPUQRXxpi/OWcRWzsp3OBTMB8SXowiCiZyaV7aRuS7jsuqsjgjO0AIHQcu2MI3iJ2/D8wBHWdcitaVJo3b5DNfIImI2xw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(34020700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	b4Oc3wII4ysmvvF0PV6KXKSlO4bw/N3C6e/tB61zKr/APsxR+1TcRJ4UShTvfeHTJaYDwECn858H9QXpE+/wCutDmqwCgsIqO6oyft/Oo6lXLf0zddnFpWLTAuyp2zsp0sE5wReiOMNhrnV/9ARcAeup+AyBkYOoHrMzyTyqjuGQ+zN5niujqoWlYCwEOlut4WwGDswHBFuhKsvE2B62Xz0ZKQIvD1tADUrK/DLTIKdTt7DXfQ4m5bni3M8cK1rqd0ky1jExBn12NJigTu5DnspF6YZLuH1icW30eugFv0tKSu8AszRUIQ8qPjCz/sziKFgYrNx+f5CXl2zwU0hXgN7CAu4IpUkK73nl+ewYBmz5IfhxxuOocV7F/Z65ZTu6BXViHFnq4Sqp07aOV2Xax3K/oBSfyBNuYqskgj2iVTSo6B8uchWoNmHqwOGJjgjy
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:38:42.6417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f171f27-9080-499c-2b1a-08de7a25a4a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5726
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Mar 2026 19:38:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19641

This patch series adds LUKS full disk encryption support using firmware TPM
(fTPM) for TI K3 platforms. The implementation provides hardware-backed
encryption with keys sealed by TPM running in OP-TEE and stored in eMMC RPM=
B.

Background:
TI K3 platforms do not have integrated discrete TPM hardware. To provide
TPM 2.0 functionality, this implementation uses firmware TPM (fTPM) - a
Trusted Application running in OP-TEE secure world. The fTPM provides
standard TPM 2.0 interfaces while leveraging ARM TrustZone for isolation
and eMMC RPMB (Replay Protected Memory Block) for secure persistent storage=
.

Key features:
- Conditional builds: Only enabled via MACHINE_FEATURES +=3D "luks-encrypti=
on"
- No impact on default SDK builds
- In-place encryption on first boot
- TPM persistent handle for key storage (0x81080001)
- Secure key storage in eMMC RPMB via OP-TEE
- Security model similar to CIP Core

Use case:
This is designed for K3 platforms requiring secure boot and encrypted
storage, such as industrial automation, automotive, and IoT gateways where
discrete TPM chips are cost-prohibitive but security requirements demand
hardware-backed encryption.

Testing:
- Tested on AM62x platform with kernel 6.18
- First boot: Successful in-place LUKS encryption
- Subsequent boots: Successful TPM unsealing and boot

The series is structured as follows:
1. Kernel configuration for LUKS and crypto support
2. Encrypted boot initramfs infrastructure
3. Machine configuration support

---
Changes in v3:
 - remove separate sdimage.wks for encrypted boot, default works
 - update encrypted-boot-common.inc to use existing hook for adding TI_CORE=
_INITRAMFS_ENABLED dependency on luks-encryption flag
 - add logic to verify if partition has enough space for LUKS header before=
 starting encryption

Changes in v2:
- changes to use existing ti-core-initramfs instead of adding separate
- cleanup in previous init script as per comments in v1
- /usr/bin/busybox logs updated to echo, mesg, info
- WORKDIR changed to UNPACKDIR
- Link to v1: https://lore.kernel.org/all/20260302144647.1705408-1-s-tripat=
hi1@ti.com/


Shiva Tripathi (3):
  linux-ti-staging: Add LUKS encryption config
  initramfs: Add LUKS encryption module with fTPM
  machine: Add encrypted boot configuration

 .../machine/include/encrypted-boot-common.inc |  16 +
 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  28 ++
 .../linux/linux-ti-staging_6.18.bb            |   9 +
 .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
 .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
 .../packagegroup-ti-core-initramfs.bb         |   1 +
 6 files changed, 436 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/include/encrypted-boot-common.=
inc
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/=
luks-ftpm.cfg
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-=
ftpm/luksftpm
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-=
ftpm_1.0.bb

--=20
2.34.1


