Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6C9F483EA
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 19:50:48 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4010.1774295446229522153
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 12:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Cpbe1fYT;
 spf=pass (domain: list.ti.com, ip: 40.93.196.71, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/fUdqBeXg/a2bQdL3R8Ss1YVv5BuFhAlH3v8WtB62ba6u14ZCnYoQKVm8fKxFrCsM5rOaDrC72c+td/7no8vHVDH6iwCNgCEs9lKT3iTtUpsawpds+sgrcZS1tA50NIB+b8NtDPW1MvkjzLfw6hRfKd+P/DiAr0d3AbfSZK6Qw21yIEiObuobhiHdZhjT72gjNAKTysgK2fEMMXOPcAR8iJ+FMNks6d6jdS0OmxF36kY30PWw8lTjmeGKJFU8g1/oayoFvujxLj7VA5y/g8iZYtfZvW/VHt33GO8aINvoXAki+qXsOxbUdB3Uvq1Zye+AL0mLaMS6uhGoYsDjU49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8Y3hvv8SqVXMw4npeGcegYu+mHaBjqA0e8WgqoGv/Y=;
 b=s7pU4q2FX86cpIxcJh4oiXbvEuHFSdpmEZCj4ZRQZC7Plt8uyd/FESs5EejbxeG9eR60T/92oG2F7Iv3AgDcoXuPSetEvCrUFt72K30FoOuDbEff3GyD3Qe2SIyYGD/11xEyPmsnpJyUchrqqRLDYRI8lghdalMEUqdgErZwfsdxLcg8OZzwysRN1yuZb4TfXMfIh05XsYA/3SNg+YQ2gU3QOiGB4JutRyIUCV/11IECtd2EH6hj+QotUMswU80tmP41MoxiZ0OVXxOx5IwdjnFZs1OrfXcTr0EpVX2fabViBXj2OLIOJCAPcZzoFjzVIh9kkrJwhkJ3QIWv1aN5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8Y3hvv8SqVXMw4npeGcegYu+mHaBjqA0e8WgqoGv/Y=;
 b=Cpbe1fYT0pzwI66CUVFFGr7M3nDP4TNGbSAhcmNTOKI8pBIsyWj9CEgv9p6h/AfSk9U+5/puzeDE4cA0r8OzE3nyof6L43oV54f4jpKsbztSlyal2pFEOhxTFaTSLmdF/3evXq7TFl6RcLoCF7xr3YhUQNjQ9cdv3XW7HonAK49SQTabqN42sBj3RjBAhgXDBm0bjxEfGNXTkswORknyDLizHI1hzXU0ApzmWg30ypL6DZUoJZm5lHGY1tIl+2iWa9J9M6E956CNJlXx1JoB3amqslrKCUM14kYBhA8QPZvnGIAOm/Qn/yUx8l5VSMVbfa+eKSNMnxknFiSDq1325g==
Received: from PH7PR13CA0015.namprd13.prod.outlook.com (2603:10b6:510:174::21)
 by DM4PR10MB5944.namprd10.prod.outlook.com (2603:10b6:8:aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 19:50:38 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::54) by PH7PR13CA0015.outlook.office365.com
 (2603:10b6:510:174::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 19:50:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 19:50:37 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 14:50:35 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 14:50:35 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 14:50:35 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62NJoZQT816537;
	Mon, 23 Mar 2026 14:50:35 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 0E7172A67; Mon, 23 Mar 2026 14:50:35 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202603231002
Date: Mon, 23 Mar 2026 14:50:35 -0500
Message-ID: <20260323195035.82648-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|DM4PR10MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 136af6a8-09b8-4195-d1c6-08de89157495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	PTFIc7nv0o6RofvGZuAsUOJ7M12cISo5JRPxXFWR74bMTJ+4pBg4CadcImKCx72ulw1c7zzBbQQLLx1VWeK2DYsWy1QAo0qGbdemsM+fS0SpiIB1GVWdb65/B13thXe4Pbt39kBmAHsb/0bvTGcivGLosR+w/pgvh/UPPeoG/7w7y0awSp/oZiNeiRNKEHBJ2VCCnKFBAroV/IVGfyuXYELJpFpgaEeIctyoVmVhAEEc9yY1jd4L6mPl7HAxIF0HTyl5e7T8bwG/Y/SAjofhiaQDHnRD3lO3etRNkRnz+Aqw7w34JMHcKBqqrg+hkXi6M6lIRFQtKFSkGTLjfpqsuXvpCPGlGDt1dJJpkAuRxLNpYqOxaVN5fll5hPHtiGvDJe8MnR+RSr272pIWAls64B8DfRZ14lA2tddy3+HDG+NBwyaCg8TBEgwj9gmQfDgQwFYJu5a8m9TdNSROpGVa4kanF8/1UrQ/6KTpfOvPjgF4fPH/pZbvs6N4ETGNYnrRrZTPEp3cjHTyIwtkPod7X94IjAZ5rpyvJgC+ZvNmE3leaPkcuDAkXDSMU4nDnGuIqGgb67dVXU5lG9Tl5yrtyHVYpvjB9h0lcV5CXEk0QZayx3QgNjNSzHZq2zjO1MPufQbwwiwUfuoImEg8xCC0gIRkqdrrUDPey4ZeTHTBNKtbTL6IWxzDOwj7XNAal2mMyaHqqRHHBN0k6GktvlIsXfdbQW7U94PmMPBwEsNBoXMQzJfNgN/mgtW+Gn/AK2i4hIk5xog/zgXfLPIo3zs66A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	foKMaQkCICe3CYtp7VP8caHXgfrsdLyEJSC8+oEoBXWfhlxBUfxXzry9d8DOGCabq4UfwQ76jpLExKmC4dicMSAJ6ycyG9RosJqzGR4DWkRVVLARrWErLp3+VCNyOc7DSnStpKlSBkKRtycLwecYgHQx/v25qt92LSXAzDwVqqR+Nfspgn9u29atHhq2d0NylG9/t1py3TRKbhazLfSDWH6O1d1+taqVnBY/76wV2WupAtvPaxz87gtCJ7mxB3RmC4DJ/foxelLx/8jKHtsRG7ohZVNdQDH5ZTFTUobymuCre5fl2500jGnLO4aw/ae34W3160x0SK1ukW9mta+vtdfQG/3gZclOzISaEOtL7Rh3KDeaV7xEZbumKlVOME0ogm87gGaFTmZp9f231YiCONkD1eDN+NChkraMUrDOzd5xas90+jh3hDHBCpz+/daH
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 19:50:37.5625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 136af6a8-09b8-4195-d1c6-08de89157495
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5944
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Mar 2026 19:50:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19802

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  k3conf: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3D8ec0c42b8ccf2c9e8bebfd7c4e03d93fed555442..f323c31fcfa1=
1b5097cc99f8340b909e8ed6b9fb
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Def2eb76b650415637bd93b0eddfb1e31489117f9..7b9dedb046eb6a7=
20997f61582c7b13da1b5b9f0
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=3Drange&q=3D4e3a44c=
4b961831f2de80606942dd0d8eb508eca..c50875c7c4ad112d5e632bea3301e06a0aa8669f

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc             | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 1c3ac858..21b3a155 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -22,7 +22,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "8ec0c42b8ccf2c9e8bebfd7c4e03d93fed555442"
+TI_LINUX_FW_SRCREV ?=3D "f323c31fcfa11b5097cc99f8340b909e8ed6b9fb"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware-6.12.y"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 510940f6..99ae0750 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "b1237f2794c47501d2d5e7d533720ec48c8af20f"
+SRCREV_tfa:am62lxx =3D "946454003b9f7e3c8e6d2284e00e0c07d5f56290"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index b7fec9e2..f5d40a3e 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "ef2eb76b650415637bd93b0eddfb1e31489117f9"
+SRCREV_uboot =3D "7b9dedb046eb6a720997f61582c7b13da1b5b9f0"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bs=
p/recipes-devtools/k3conf/k3conf_git.bb
index 63f428c7..cbb5792d 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,7 +10,7 @@ PV =3D "0.3+git"
 COMPATIBLE_MACHINE =3D "k3"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "4e3a44c4b961831f2de80606942dd0d8eb508eca"
+SRCREV =3D "c50875c7c4ad112d5e632bea3301e06a0aa8669f"
=20
 SRC_URI =3D "git://git.ti.com/git/k3conf/k3conf.git;protocol=3Dhttps;branc=
h=3D${BRANCH}"
=20
--=20
2.43.5


