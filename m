Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6892A1090257
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:59:13 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1006.1773939542887060965
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 09:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Bm1vM++j;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.70, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t//Wh+TScY3k0LPGMColIVFjUoGfOczawnePy129T4RxU9EDBcWbV0Hdluw6CII2bqdLkBXgeJAeWH+venW5BfoA4/MHF5JVyBUth8Tdo1QPT7+NCzxAwONbUfL9k3WeujGzW6ti0VdEEH3pUIfiquBmY7wQ3v237anLdJ+CepzGWJkbU56jI8PuQ+ecxoEz5vRvsCZh/oHVdFhYvdCHG4PVnZVy7DeFRqawayRrBlSfAFpiVQiP9AlgEBbpcxbYTYuSPgLAzKqAaZMZQP31gi9fCwcmvz5AjIwNyuEHAQJHZG0K4dVAeCijzkFgDF/Zkinx5HnWHa4FajfOGsWuPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7ehVF5m6mT8VPmGtspUq4wFqMj5dFcdvZTTc1HKb2A=;
 b=p28AQbo2B/GUn4cCPzTrN2DpRYMqGQcM8V2lHCcdTCZOR935AknDLJOuGWHUPY6V5T7wgD1ZxZIn7cyGF7eeJ5Nyz3RM5gdlq/2LE2aitLyZl9AAyc3V7pJM69phDX+8Tx3yFgWs5S8M6bbTgDO8rT0X9zp7NEYJxX6SsDanu+5rspwEZTTYIanyhBCFF0N8/EZxkMgms87iKIHeg/++66fbidzpxCEsyo9bP+6ALogN+hExuPH3degyFQeUDeR+ejtrzIO+AV/91Vq7pCoeUaIPujeHt6l15JThlY3UZN+KHvuwp4CwuyntIY+jOdeel2oXqEchkCEsaoVkbnVhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7ehVF5m6mT8VPmGtspUq4wFqMj5dFcdvZTTc1HKb2A=;
 b=Bm1vM++jYwD/0uOBX0JjpPRzcXQd6AHnllb3LQVhcML4Gq5ZKjPBYf3l96kO92s+E7zPfKmhIecTN37qdywOEzc/umVkKYcQwGIfRit/MKWhqUdBeW5ErL4d6yb7NVY6kCjT+vlxQsju+OSfkzHjC2fpmz8dEv8H1WFuFmAoYXA=
Received: from BN0PR04CA0012.namprd04.prod.outlook.com (2603:10b6:408:ee::17)
 by CY8PR10MB7217.namprd10.prod.outlook.com (2603:10b6:930:71::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 16:58:57 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::7f) by BN0PR04CA0012.outlook.office365.com
 (2603:10b6:408:ee::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 16:58:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 16:58:56 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 11:58:53 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 11:58:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 11:58:52 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JGwm532883032;
	Thu, 19 Mar 2026 11:58:49 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v8 0/3] Add LUKS encryption with fTPM support
Date: Thu, 19 Mar 2026 22:28:30 +0530
Message-ID: <20260319165833.137342-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|CY8PR10MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac1dc7f-e46b-4f55-ff91-08de85d8cec8
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qBm72szeo0lXbDDuzR/eHUrUdFhSVDRYSqqQp77Qu30qHMNJT7jgBHxLxc39pWO7ISEjx9TbAzrttlKEmlq/MecC6pTy4Wx9TNaEjtIXWJaD1D0hzfVKWZ+2IqNQkaqudLi58tM+GtPymtlje0f8sLULnYWTLIeFJt1BzWPBIRuJy3e4yfS/Ypj44TZglLlP9cM+manWa2V1fG89GS78hI+HZ1R/oOcBOdxI0J3NWdtn2s/Vt2b6oR2Oyru5bofWltBrB3WzcNATWcGTVCsdLGzx+hlCIm5MblO1kQh8SmbhGE2GNu+q9/HjG/GrSkGQ1PVgi/03HB59jGMJJtoECSxBIFBgjs/Z3ESHj4HDYkCoIbBLzr+EEAuMpJVzZ+t3r0tgJCMcNmDgcsqdsgl98V5/kUk+BWSlFRFXUJxX5PqD4W3ETrpvfWhHxXAd0VTYwXuQtZz8Iq8j92eUL1Amhr4e7KmlzJU7PIIVO9axgWF0Khs4lHrue4krNUhPFYaHZnTGhrMj2BuGJsNS5C5DTno8wHA2bUQ0FIxOC3bncz+3+v/nt3aMsI/YeUDjSQ0uVUZkOYTlO82HGfhMD/NQwGFGtubRASUO1wwtXIt4lcMtpX8CqhMNQU6kVKu4e0KvuV/imAzcInErvkyVakTlzQJzF+sse7qSQaRDW0KMokwtB2sgAdaX8UHpRyyDZbPOWHOaIC3eyRVzr7hHrjRzznG8Q1IRReEo338lyXN03oxeXRL2YzFGgjPB0PaNzIa5D866imNeBM1rKU5AZwnqZg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PDGdIFvOIQdJ98mm1EVw6bXqHYQVM01b+5xvkP3F4/Vb/CMW49JvEbxAN4WlKocevx8eIn2xuocauCse23i6KQ/IZdrq5SCq3qWl6g8AM9p/qfG1vWdsvmw94zxe0ofWgG/EaaUoBC2LtVI0PnnnyyfexwdrRaAnNcfdhRxXnRRppspVIUbmUF9DE14QZ2JztATEzW7NA1n7OCGBzbz6QcFO5GBLSKYjVWIas/0y2Yj6VbEspTGFuJe4iPZiJGsV+fYRZvIRZE9Zkh2jzXX31qkFev+NmMxri53W2fOrWnHf9EWcAUJAx56a04yvRteDFmv0t+VWh9ws5HqKcE9uj5gnFpN289/k/+4YCuToGg1oxXySPl+QHNCm+Aki4MTcDu1prtSoiax6ak0CUU1mX0gPwHJXAkG0/1L74gowhJ4ITbcKy+QDD2pVfAarbmPM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 16:58:56.0740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac1dc7f-e46b-4f55-ff91-08de85d8cec8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7217
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 16:59:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19782

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
Changes in v8:
- Update 'meta-security' to 'tpm-layer' collection name in LAYERRECOMMENDS
- Only register 'tpm-layer' in BBFILES_DYNAMIC (removed 'security' collecti=
on)
- Rename dynamic-layers/security/ to dynamic-layers/tpm-layer/ to match col=
lection
- Add S =3D "${UNPACKDIR}" to initramfs-module-luks-ftpm recipe to fix buil=
d warning
- Link to v7: https://lore.kernel.org/all/20260319103533.2431033-1-s-tripat=
hi1@ti.com/

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
  conf: Enable dynamic tpm-layer support for LUKS

 meta-ti-bsp/conf/layer.conf                   |   3 +
 .../machine/include/ti-core-initramfs.inc     |   2 +-
 .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
 .../initramfs-module-luks-ftpm_1.0.bb         |  43 +++
 .../packagegroup-ti-core-initramfs.bbappend   |   3 +
 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  22 ++
 .../linux/linux-ti-staging_6.18.bb            |   8 +
 7 files changed, 421 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initram=
fs/initramfs-module-luks-ftpm/luksftpm
 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initram=
fs/initramfs-module-luks-ftpm_1.0.bb
 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initram=
fs/packagegroup-ti-core-initramfs.bbappend
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/=
luks-ftpm.cfg

--=20
2.34.1


