Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF13CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 09:21:01 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13902.1762248061142890917
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Nov 2025 01:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=iljE+nP3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.60, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9TsA+MUPhLpbUPG/WHe5wBl9yzbkUqj7TNdaVT5XTF7NRh1K1MS1JqJEsq9A6RuDjfPCWNaoInYBZE+9UqcMeB3d/Qnxhcl76VnDEjWKc0TLaTaxuTBxx76w0Q21u8xNsd5QWdKCu499lkod0ahyhf6J4SATeEUDLuNU2ZvHqyzbpjTxsQMv+C/lSZsr/EOg/L/KkLOWcaJj3noGJzMgBJlRDHsBI7yl8BTvvhnfYSB83rM8VG0GVHPpuPoeUjkH3pyf8+V/ap1SZ7mcTJOr+rbBajk1B4Ff7AaOoVf7fL/Odr55+wpE3/uLtgwR7QnJPhPjlJOvVS2hjyueMU67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB4+Ev2nAGONqr5g/G3B2mNiLKthagGgBj7uA9Eud4o=;
 b=MKR7/R0G4WveFDZgvvSH5JkdRLWUxeVpxtldvIq+KhRYnhgx0vSpqKIYrlNf92/C6Jq9OnNthEU4KaRcTb4mjAfz2Eltr2HmhAUYrZhQ9CnosjgIgqBmQvB/S34xjqDBmbuGgwADoxdTVmx4P4c1/CECFYYtvXDBx8iXl/vOETWhBV3CTUJKnrCFKkrFI1/WDvyIcVXdMKNTtxnfunNyl6AO3QSDNwFnau6k4qL0cus9j/jcsriKklp5wLsxMQY7Iw4fkxXW5pR7UPInyJN958G414g7l+0L7TKvjk118oHTVVWaaa8ZBIg0R5pyOKGiub7mP3699tOnsu2oPLzm4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OB4+Ev2nAGONqr5g/G3B2mNiLKthagGgBj7uA9Eud4o=;
 b=iljE+nP3nLwSwvDC2Tm+pJHkiRWGpGmGZbpJivrestnQEQEVXIcDLyvkdes+qvO9HlniGpkd223Bn9S+GMNu7v23ATSvlLhMrRHuiyHbCaB0jsWCSYDQZ4WQGgU3R5X/DJO9CBipOzTY/tE0jhUwS2/zXIujiwUgAyJtLPM5rbc=
Received: from SJ0PR03CA0078.namprd03.prod.outlook.com (2603:10b6:a03:331::23)
 by MW5PR10MB5828.namprd10.prod.outlook.com (2603:10b6:303:190::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 09:20:57 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::48) by SJ0PR03CA0078.outlook.office365.com
 (2603:10b6:a03:331::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 09:20:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 09:20:56 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 03:18:49 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 03:18:49 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Nov 2025 03:18:49 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A49IlnL1672826;
	Tue, 4 Nov 2025 03:18:48 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>
CC: <afd@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
Subject: [master/scarthgap][PATCH] recipes-bsp: Add TI PCM6240 ADC firmware recipe
Date: Tue, 4 Nov 2025 14:48:46 +0530
Message-ID: <20251104091846.1599044-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|MW5PR10MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: e06b2963-6154-4ffb-fd5b-08de1b8375c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EmHHi2m2v5jMJ5+wflW1ZmM7qPMCTt9mg5I1bE7hoGgpzwGPvoWllQQfZDx9?=
 =?us-ascii?Q?Q/BDis0YiDG2d+jz8RO9eZ1yHwMtdtSyvhuFmIriSt9llec1g6/tAlLbKimI?=
 =?us-ascii?Q?6MW5Z9X4yFpD6w7G5yvIyQUneRXyc43Kiy5xnDX3FvAu3XWarobXfs6jdNR0?=
 =?us-ascii?Q?peGvv1K1DTw3Ob55F+xWa2McYit6luNYxx86d47qjq7lr6Xn7N2WHfmdsOmU?=
 =?us-ascii?Q?V/EahWRiGAor7GHCgxoPWIXSY7mxOaDHxzt33bv/bYoj8hXBTpJL2UFFzITB?=
 =?us-ascii?Q?VJPt26lsierVrHj0QU9xJjzjjG8Hb0t7jO+ZASIQY+WOS50LEW4Rve/i2Ex9?=
 =?us-ascii?Q?LyGsDTXbqDXTgjqxI9voCEllqf2P4jJy7EBRaurKD8p7iNZSY8mqkG3esNBU?=
 =?us-ascii?Q?SjcVp0QZultErmsbRtskE1H9cXNWDIM2lwvQa5ZTaothRscK8UUqTKhwT/lh?=
 =?us-ascii?Q?6YnnyVjg2ERH5QvEa/emShD7MK9g+gfbwHkDd07PaAFX5irh1mAW+XZz0Oiy?=
 =?us-ascii?Q?k75vCBCxFlwTeHoSoxx/cVLEMQOBZtut9xVkzTtu63bbBuh+R9M6OeTaN4qv?=
 =?us-ascii?Q?yDBvRBdxKel123OpjmJzaJT29IeM166ER7aseH7Y1+KmmxJ5TrdXwZ9PvbiZ?=
 =?us-ascii?Q?q+XEhgJAMmnFWYTsoqV+w8N4TC2dB0fNxR6BFFDddz+Sxu3L2hbvTuWJAOn+?=
 =?us-ascii?Q?Wca3GmWvsZSvFZRX6DDEIIZeJiFdTTFUOu0wQGTq6Qzq4UTDG/Q5t6KHucJe?=
 =?us-ascii?Q?077rm/mU97W5EsHCMtEsgDtyAFg+DP/usPZXsCZ+3jz5yTkExcuIdD8ZBOEf?=
 =?us-ascii?Q?0IUF+K6xhK69dQP003DYEHz8O0Y7Ia0wcJxFI9i2+0bJarj3r57zP4x/iXV9?=
 =?us-ascii?Q?WXHqEK2H6dqW33HuJfhM1Fwb3nzpgmRvlOUQ1u97YH3njpL+0ePKTEPrlDBu?=
 =?us-ascii?Q?UYPz0nm/kD88ubyCQEHkiLePwFGHF67GRZ1Vk3PCTp477ygY57MbUXdXTEpj?=
 =?us-ascii?Q?pI7CYUsZvhwCRVGyv0R1BRPFjG1ulX/lfLFAT/nvdZB7OpJw5YqAMK2bP2P7?=
 =?us-ascii?Q?pXK0rlKKR4cI5UTzKeGResikMMWKu8hLT2i0bwwok5RuMUe1QyhDINUWG8iH?=
 =?us-ascii?Q?zRYj4ve5Niy72o2ZijBk+Bg3l3/+1dnnGbEPHXQf46ekiVfDRq7HJ/2Zd/Bi?=
 =?us-ascii?Q?VmCUcwhmwgLV0y2y8T7KJpMpn00c520nLLinVRJRSsOErYy9lo9BiLU4t5YU?=
 =?us-ascii?Q?XndCp3ohScAlBdSEN6jkysn6pTXZzsQZUeExrBnLWDz5AlX/cK7tobGGK/Z3?=
 =?us-ascii?Q?hk1w1jYCarIYuVznFoiT+nDPfrRufgNg7bqHScop9nllzTRhgxf/zIe6b2GL?=
 =?us-ascii?Q?nixFsaEFG/DUkfM8UFkpJ0/Z2MwN052756n/LiN7f9kyTZcn06U62mwtBstq?=
 =?us-ascii?Q?jToHn+tru+KUkOE68PQtwWY30JgGs/JdArxGd8XJsiSBLAXWa/XypXzoPy+e?=
 =?us-ascii?Q?mih/Qn79btm1rUgaD+FF5YLSLSAhFqyndRCIvhRjWQsofZ0cGiMKetJp5slu?=
 =?us-ascii?Q?wUjVXrvTb8oGArBeV0c=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 09:20:56.3058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e06b2963-6154-4ffb-fd5b-08de1b8375c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5828
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Nov 2025 09:21:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19225

From: Vishnu Singh <v-singh1@ti.com>

Add PCM6240 ADC firmware recipe for am62dxx-evm to support 2 PCM6240
ADC's, each supporting 4 channel recording.

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Boot logs
https://gist.github.com/v-singh1/3de6d9061bdafb9ae908de4c532929c8

 meta-ti-bsp/conf/machine/am62dxx-evm.conf         |  2 +-
 meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb    | 15 +++++++++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  1 +
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62dxx-evm.conf
index 663f8ceb..e10bbc62 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -16,4 +16,4 @@ FIT_CONF_DEFAULT_DTB =3D "k3-am62d2-evm.dtb"
=20
 UBOOT_MACHINE =3D "am62dx_evm_a53_defconfig"
=20
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-dac-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-dac-fw ti-adc-fw"
diff --git a/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb b/meta-ti-bsp/r=
ecipes-bsp/ti-adc-fw/ti-adc-fw.bb
new file mode 100644
index 00000000..038a54d5
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb
@@ -0,0 +1,15 @@
+DESCRIPTION =3D "TI ADC PCM6240 config prebuild binary firmware"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV =3D "${PCM6240_FW_VERSION}"
+PR =3D "${INC_PR}.0"
+
+COMPATIBLE_MACHINE =3D "am62dxx"
+
+PCM6240_2DEV =3D "pcm6240-i2c-0-2dev.bin"
+
+do_install() {
+	install -d ${D}${nonarch_base_libdir}/firmware
+	install -m 0644 ${S}/ti/pcm6240/${PCM6240_2DEV} ${D}${nonarch_base_libdir=
}/firmware/
+}
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 3e8f0f10..e17f53e4 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -20,6 +20,7 @@ TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
 TAD5212_FW_VERSION =3D "1.0.0.0"
 TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
+PCM6240_FW_VERSION =3D "1.0.0.0"
=20
 TI_LINUX_FW_SRCREV ?=3D "3c8ad7386e818cb42cce6ed4ce2aa1e76d7c688f"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
--=20
2.34.1


