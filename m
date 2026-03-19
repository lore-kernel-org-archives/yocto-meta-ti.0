Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0735108E1DC
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:36:36 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8071.1773916591004605021
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 03:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=q98V4mOF;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.21, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhZ9sa4zlwtOSbTuCLhcSc7dLQgOkPgNzyOagfk3q/PFpIhYMw7HGO1UdPIe39LFUjUsNaF7eXKkhUmLGxb4eCRXYcznP37lDSpSEN5dk/cRVAJY5NG7YjyF03M8vhqvFjMpBelAH6R8SIIdM3j7SimcCWmblI43R7Dx+6JmsXIFwywHY7TZhsInQbhKSVlEB8WaUH2zz3BRAMP4KSrPp1Cs/QoXcECYRexqeSphYf9SvZL0t57RueN0YB0Bpoda6aVN9Zq6C6kiRPxcMqc/lDtZ1rOo9qaf+QfVhfZSdTMpmJIfd460fRMLLqqD2B28yuLaHUa6Jpdc93ToUFbKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wI6gjzmbkCmSCPMNrZ1INVDSQHTf024RfJZRjOGyDF0=;
 b=Bpc1lI9J1EUB+8+rWqxzlwMMFS6xXwwC+pxLUBGAhVG+EIU/+3uqJfk8tZoY9CWYHFkh25Uf5M/5zOk5S2613Dc0QMPyNIoXh7kwZwLhi4arVkRuhZN4Oqa1mAw9eQzH+cwK7b0XMwMMS9ox9AhyCD54QH6dRNtaJxJftxzvj0QEls6wwzTX+LlAKszuLj7sS9ZWmIWA5W9eWWtpjaZkbU+5W3y5UGBY39lVsEdoVwObr5OueXtmVxfsrH2tgCyEVynp14yA91ojINRTKLo9WRBPxvi/L0Rfw9u3hiEPdpzIA89Bu8zd+cGLMDCqoFvOZHTxqVoqscXyUwjLtreYtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wI6gjzmbkCmSCPMNrZ1INVDSQHTf024RfJZRjOGyDF0=;
 b=q98V4mOF5N6qyRpRaRXcRbuBqjGuLTwdPNYkH26B13XPa9BLZOdDuDDzLVnHhINdXbV2/B5BEH2s2PTAquif7Jrdm3sF1Bkq8VPlt+7deqaA35UcdZuAdBWd1KoUyPy6wgtGUyGrQm1jnlNhIm9yS5+XjZ36zCbtNdpyKsjgWRg=
Received: from CY8PR11CA0029.namprd11.prod.outlook.com (2603:10b6:930:4a::11)
 by SJ0PR10MB4528.namprd10.prod.outlook.com (2603:10b6:a03:2d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 10:36:28 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:4a:cafe::3f) by CY8PR11CA0029.outlook.office365.com
 (2603:10b6:930:4a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 10:36:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 10:36:25 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:36:24 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:36:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 05:36:24 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JAaKoq1950755;
	Thu, 19 Mar 2026 05:36:21 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v7 0/3] Add LUKS encryption with fTPM support
Date: Thu, 19 Mar 2026 16:05:30 +0530
Message-ID: <20260319103533.2431033-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|SJ0PR10MB4528:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ebafce4-65be-4f73-a168-08de85a35f54
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	rOrPQHUJ/QJad6m63cS76SjeV+Ks7jpml0yBc2hTlWbzB4waxUgQN8k16G69No0I4MxQ5Kww2DZokFEifJ+zxef7bPIPJf+6tPXJfHC4DqsS5WQgveVsOFUU4CpXG8vEPUuaEud1Hcu5bmdR+CnaxzVEoKZ1n2czqyQT8P5to5hNzfdHZUioJPmkSPLvV5YK6dSj/bATYCTPpSH/M6es+SoQbjVKrywT0WzHsnrMBN7ubHj+ntQ9n5hfo4mK+4sgvQwXDi9VTzu17/INluhLdF0ik3lZW7mvLGDie970oCATiGeQYkciSKnPXR85s7/kliDZZBMy0iUgJwSCVmy++UuzJoMvFqc6UNT41x780onKgq6Ke509Kc57eW3pwPl7C+CcdF+TW68PgpGqptUVdPPE4T5d50TiKFXX7dSl6giaCPx/kZrwxr224qWiqELkpaGcCKYTcLUELjCTi41G74HJx+CeWWoYSGJh7+iMrB3IetoovBe+txn1/GxCX6nIHfTF374VmMb7zvIRGYUr5YKM1CXC0o14zkDJ/KLMRdAtELoFa38PREAlxSMP1wPhcBghrSXWRT4M8COmQ/MWyPOMZ4QAFkkqD76q0AmKLlj0+qVBZxt47SUvkz/88+VijUfkDuPESISV82VL774lyoF/qHcsFjiOcDNHvmjLudh9sEKkPhx5EYUVjhCIEswENUPIvMgwOGxTsT9q99m062RmHWUC7jv8cTMogukyBuC5P7SN/RKgiHTvTV2XAE9/u4jm62o496Td6W3IU/MMMJDpxGYgvcCMVJX18uc4A1M=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0ZO2GWKOX0AfAZRdLPM3UhhTgsCzpGBDRJz/KumdyUTN/JF8ha9NueszFuww3kicRtjYTELiL+94A+/CJcQNVjtKEsPBd4CB1o+XPysoBqw00pot2Fjv5gx55WrIVwKNmtU5KB0ByGclD4ynINvnhDFpuu6BEjuDj22tjNBYHEffHH8diGWeJ5tEO4QCXeB+rR+Z9Ut3Jya5e0sKZVk8rtjMq/Dwe9ckFtiLykjC3pLlN8aTJSnthEUABbF4wlXOnNS3EEEFjABrPLQI0MDkLvIvLsbExFV7WdNo2G3jAG4Qn9ZHFKfVfFR87O39dxr/lbFgFt+NPXFDTEe1s5uzYaFMHJ1LbwSGQvnEIKk1LlBBANdCXyrxzgpPSX67dbROLrob5KicVWWjS+IkJIPODByevl5h7BDe+1GhFDxLsTG8wzuOfgKr8ncGdHBpqr46
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:36:25.7922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebafce4-65be-4f73-a168-08de85a35f54
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4528
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 10:36:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19773

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
- Conditional builds: Enabled via DISTRO_FEATURES +=3D "luks" with MACHINE_=
FEATURES as 'optee-ftpm'
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
2. LUKS encryption initramfs module with fTPM key management
3. Dynamic layer registration and initramfs configuration

---
Changes in v7:
- Added 'tpm-layer' collection registration to BBFILES_DYNAMIC for TPM pack=
ages
- Added meta-security to LAYERRECOMMENDS
- Link to v6: https://lore.kernel.org/all/20260318145732.2115521-1-s-tripat=
hi1@ti.com/

Changes in v6:
- Moved initramfs-module-luks-ftpm to dynamic-layers/security/
- Added BBFILES_DYNAMIC registration for 'security' layer in layer.conf
- Eliminates hard dependency on meta-security layer
- Packagegroup LUKS logic moved from base .bb to dynamic-layers bbappend
- Link to v5: https://lore.kernel.org/all/20260306163735.1316257-1-s-tripat=
hi1@ti.com/

Changes in v5:
- change from MACHINE_FEATURES 'luks-encryption' to DISTRO_FEATURES 'luks'
- implement dual gating using existing MACHINE_FEATURES 'optee-ftpm'
- optimize kernel config - remove unnecessary CBC, ECB, ESSIV, LRW, PCBC, S=
HA256_ARM64
- packagegroup-ti-core-initramfs.bb changes moved to patch 3 from patch2
- Link to v4: https://lore.kernel.org/all/20260305172115.3684326-1-s-tripat=
hi1@ti.com/

Changes in v4:
- remove encrypted-boot-common.inc and use existing ti-core-initramfs.inc
- Link to v3: https://lore.kernel.org/all/20260304193824.2495898-1-s-tripat=
hi1@ti.com/

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
  initramfs-module-luks-ftpm: Add fTPM support
  conf: Enable dynamic security layer for LUKS

 meta-ti-bsp/conf/layer.conf                   |   5 +
 .../machine/include/ti-core-initramfs.inc     |   2 +-
 .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
 .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
 .../packagegroup-ti-core-initramfs.bbappend   |   3 +
 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  22 ++
 .../linux/linux-ti-staging_6.18.bb            |   8 +
 7 files changed, 421 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/dynamic-layers/security/recipes-ti/initramf=
s/initramfs-module-luks-ftpm/luksftpm
 create mode 100644 meta-ti-bsp/dynamic-layers/security/recipes-ti/initramf=
s/initramfs-module-luks-ftpm_1.0.bb
 create mode 100644 meta-ti-bsp/dynamic-layers/security/recipes-ti/initramf=
s/packagegroup-ti-core-initramfs.bbappend
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/=
luks-ftpm.cfg

--=20
2.34.1


