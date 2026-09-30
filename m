Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14550CA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 13:00:19 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12824.1790773208931750753
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 06:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=oy92QhvM;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=harJDjru;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB5w5k3214062;
	Wed, 30 Sep 2026 08:00:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+ubxDtna6gYWTszCfJGhQoKyDa5EFO6ccZJZQ2skN
	9A=; b=oy92QhvMvNea720vITUZVzl5HHpXLq/2M7vS2TmBsk1UL3OxFfRCpkgsi
	4tT8q+6JZGmHvgN0vnOug6Ph16fQAEyQXaxACifNOb8k5D/Ve9cYcdys73kNeeLb
	Dk9yZjKZeJ1jBoZQ4Y7Aq2l10c2x0NQf7qUs+iu5Rs9TUBlPr735tEfWjHrjWKU2
	er86RNGErH9P4mt62XYbFm2PiOGA3mi/yG5XQwBpMP0PKh2CfYD0FV9q8xRNbVgj
	Otzb1jGjzK3pcdOP1406JUwITj4STZIglT3jSE3dv8QuZhoYCBVkSZhli0w17yoS
	SVNq1mUaPIo1/CGFDI6OhzBwTjzyQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydv95sx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 08:00:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVigWkkslGVNMzwPQmr2n6J4ilUzzx0RuEptI7tS15+K/59UlgfJIVOnPlnRZHEVh88KCP5zSqDYrvG6upVvVr0WpvPSeZ8ZdNwxP9ZYoa2grPkyTXhXOlMzOOMEIp38rio+2DhV17zpY8gXOAq7sHtGOebgihJcNqC1uuelsb0qhbJK0XJ81Ihy53MTR3tdwSNFgvb4iMY01AelQmYPmR+YTE1MiLG++/NH/U6mfo9DSLdHZLhOT4mPJeUCdLbfyxiB6Yc82TzbISv9s9H5/mfOJ4zYjHu+aszhG7C/Ei1FyevfuWnVN+5lPpaKtb7VomG8mMSxmgi6IospFWm4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ubxDtna6gYWTszCfJGhQoKyDa5EFO6ccZJZQ2skN9A=;
 b=qX6BsIBeezFrDfwzLBKpGk1pw6ilbbwQ3pBXcIL90ingVU500lf/TJaY4ndt4SbLtdwWqPsGfbulGK92w0Mdq2CA1Bb39GbL/8ohGkPbVtlI6h7Dbab17QRBpgxB/aI+obMraMW+XJ7AW7NTlZlCrUqYopbYbg1AmdjY+sE5E1GSOMk5cLmPv2NYkROCQCy4SUSaktwNvqcr+b21waFPD3E2qQgOdfkIeFbO/ACBmUAIQue5KxdJWdDCjru29NjGlYQKsCR7eoqkr3jgPpxnGCcjKTboN8psKKliDcc+eZlUVeMnlhQ0IOcgm+a5ydSMXTggTVlYE4JrpKjm5ypLLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ubxDtna6gYWTszCfJGhQoKyDa5EFO6ccZJZQ2skN9A=;
 b=harJDjru87Db0OBjY1Z05g6teKFBjF6V6i1gN3XQS39pOaRf8Dt4/iwvnrDG2J7Anu5fE3G8UJwv8Fv5oz2DAsK7voNHKoBp0TYtTIPu0kHiJyYi6vrqR9JMkebChyS9Epmq8ZRM5InUM1Z6bI8rvSh1dDcu58UrsoZvjsW1LPc=
Received: from BL1P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::15)
 by SN7PR10MB6450.namprd10.prod.outlook.com (2603:10b6:806:2a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 13:00:03 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:2c7:cafe::75) by BL1P222CA0010.outlook.office365.com
 (2603:10b6:208:2c7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 13:00:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Wed, 30 Sep 2026 13:00:03 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 07:59:46 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 07:59:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 07:59:46 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UCxdxK4098429;
	Wed, 30 Sep 2026 07:59:44 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@konsulko.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>,
        <m-chawdhry@ti.com>
Subject: [meta-ti][master][PATCH v4 3/3] ti-core-initramfs: Extend with dm-verity support
Date: Wed, 30 Sep 2026 18:29:38 +0530
Message-ID: <20260930125938.95629-3-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930125938.95629-1-a-dubey@ti.com>
References: <20260930125938.95629-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|SN7PR10MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 77639b5e-9939-4f62-bb8a-08df1ef2be3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6TOLBtIAm3CFlYqrg7LRIMTrbSt24OihgbbyuvXXp9OTSOOn7dF68OrbjKMuruYZDh7FU1gE6ZZiDq+MCjXwFLUuIG1zjByz/3ILDSJHfRuzJU10f57gjyaacXGiuPH+BdsOLXhxtekHgmHZRfYXfvcWgxL/bOY0dKSWeJxHsRfrBHdoq0UmRhQfo1ZCKv20H3KPXQWXRYIFiw6/jC4I904OkLuZrcpEu6zbrfTCkqjQPWU2ErrblAfDAVtYMdmR4go5thiYJh5TgJR71c3ojFMDiERQsuoqDS4QuOpK8IYiqfoeWAwh35mnBOkdTnkqtEcBZCdTDYJxdfb48bSlMp3AWF9co7A2hX8k+PraAzwunX0EZqnPnYuRS5CEKQElPlUqx6mjHKWnQpQyOpfwynhJMYi2Hv+zguyE13GsfiIrLL2RQhDPh0LbmdDVBdOCu5Q2x6q1ZtqqueDeIxgvP6mqduwze/g/NdtotCMKw/tZAOCW/qDBKC9NyG6oGCH/THNu6sGkBjje2s11JuM58hU+tyt+Y8VwfyGM4hUy7EHhFnX691WL0OE4HGhFuBgYn6TV5zUdq6BTNOrUKIyr7EFSweaAoYj0slmRr7+Ps76jwm5yIznRmKCOl7VsS8z21YtCMzvn0nDSaUBT0uhG7tvQmyumRT3Bp2L6vqXh6z2QSup7vAhDGOZ3tf2oKEvCOnS0mFT6gFnqa5K4xwVOPQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Zvh/A3IzisArIAkqol07ZP4bzFd5qA32wGoO4bVFa35zxXs9Fnu38iP/V3wCglQuqc2OQxRItoS54BXFXfyK7EHhdx3W0k9z6nfbpWGkTL1e84C1y9GQnNKTDIRnPCqe3n8WL8/ZcpylBQRmH77vkAk6XZ0tHtNn5kNYT1KsBCzBFrTw5Kulc37+xZ4tR8XHXRxaZzhUeapmJzmxa6iAV3FJ0s9sZ6c+061PX1w/ZI23dEiX6Ln3aNUhaZspm/Fe5JkIvHdOC3RdHwxjqPO6nek0GTx0+PJ9a5YFeUl5SX6nX7A4gLUcbAA4iSMhsvpFiH8d+eQqvcAw+WxGwg/r6Il2jsQvZ4Cjg9lWgfmL7WVMIDe1BF8tJvdyL+rm1SppfDzTMGaFiQ5q35hsjqErUESezw1LJWMuRZBZ6Hlfki/jjlX8FiCKNHe5htoQtLnp
X-Exchange-RoutingPolicyChecked: 
	LVMR6SD2c2zuSlPeC6bf2LOnrf4P9aVaRCbH0wQXmF20/aie2QbeMz+TaYb63fZPFbcM31xZ8XttDaaxCbbV67uNz8/BYd2/vOgLWCuioJ6VxpgPtxunkMLzdFBNIxM5zTA1m3H+QQlkvjtY1F/JUOBgeRD8IGzKFAaz1793of2EjjoEsFpxMvcC48C+gX5IamxzBAZY2/+E3qiSlJsd0Dx+J0JbUA3o+sVjFv37F761aC4sNFYri7CnlyW+GGa9M3cjKZooPBei9BE0b7fyj2hDJb477yc7w9uonpa/6KlFHnRx5Mgyxm24hz+sDhVLSn5i88iDSI2prO8YJ4TTVg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 13:00:03.1087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77639b5e-9939-4f62-bb8a-08df1ef2be3a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6450
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfXyVqFyJk2/YPh
 m0STkeE5Zw6f+rOQrJpFI9mPq2WxOmING617jAyNwIB8oUtfBLn46NzryLpea/PRS1hleewunFf
 LFT5R8Z333hzr5RF+w+t+H8J3MU2qeM=
X-Proofpoint-GUID: tSuISkVhPOXM_YtwRBicp3JjrZGPMteN
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd07d6 cx=c_pps
 a=1t1hxDBgkqdAqWWjFE2LMw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=NeSs6gxnhKp23kAhfuoA:9
X-Proofpoint-ORIG-GUID: tSuISkVhPOXM_YtwRBicp3JjrZGPMteN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX1IYJ9Zl9TQ9J
 7jCPgTbXMojy8RgB299nhOQc6W5fWag1Hxx6wu8SoJaOwUnbtRT1j6bNSSJJC8TLky7AfniYO7g
 gMoh0eF2o1+uxl/60GLAMbJ8osjoSzHZK9rjK4CcWTMsujZGt3WqIs2XXk7K12yGHNWpmwC7j1V
 3sXscbW/hci5WatKSDGjvFfPHnQxiCPmzumj8JXGaoQjfI/9HpxIBzKLuP2I8nxSRs5SKZRgW9H
 BkEkA2Mep0QUZ+ngpVQO/HF7m09U1CLKNR/E0Grlu1wBm/LEaSW/roXIz6+TSbXvFqJtlVAobSi
 hyZioZl4fh9wJkBCV1jI/1wdYCVvV1zuYUAN1SW89KWpaqm0rEg/+E9FL07OFtdUWP24cnJfM9l
 AICkI6dNRSP2ErZvnJZFa0VPlKZQ+iB06vdZ5jL2/IWs5rk64E1E0o0Lgp7tEakY7eKcYrJU0nK
 Zf9XO+HO1EriUPbScBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300051
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Sep 2026 13:00:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20423

Add dm-verity support to ti-core-initramfs by:
- Enabling dm-verity modules and tools (cryptsetup, util-linux-mount) when DM_VERITY_IMAGE is set
- Adding do_rootfs[nostamp] and do_image[nostamp] to rebuild initramfs after rootfs verity task completes
- Making deploy_verity_hash gracefully handle missing .verity.env file on first pass with bbwarn

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 .../machine/include/ti-core-initramfs.inc     |  4 +--
 .../initramfs/ti-core-initramfs.bbappend      | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend

diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
index c816f1dc..08da8e80 100644
--- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -5,7 +5,7 @@
 #   TI_CORE_INITRAMFS_ENABLED = "0"
 #
 #------------------------------------------------------------------------------
-TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
+TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) or d.getVar('DM_VERITY_IMAGE') else '0'}"
 
 TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
 TI_CORE_INITRAMFS_EXTRA_INSTALL ?= ""
@@ -22,4 +22,4 @@ TI_WKS_INITRAMFS ?= "${@ ',initrd=${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('
 
 IMAGE_BOOT_FILES += "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
 
-INITRAMFS_IMAGE ?= "${@ '${TI_CORE_INITRAMFS_IMAGE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
+INITRAMFS_IMAGE ?= "${@ '${TI_CORE_INITRAMFS_IMAGE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
\ No newline at end of file
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend
new file mode 100644
index 00000000..25fe775f
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend
@@ -0,0 +1,25 @@
+# Install the essential utils for dm-verity in ti-core-initramfs
+TI_CORE_INITRAMFS_EXTRA_INSTALL:append = "${@' initramfs-module-dmverity cryptsetup util-linux-mount' if d.getVar('DM_VERITY_IMAGE') else ''}"
+
+# Ensure dm-verity.env is updated also when rebuilding DM_VERITY_IMAGE
+do_image[nostamp] = "1"
+do_rootfs[nostamp] = "1"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+
+deploy_verity_hash() {
+    # The .verity.env file is created by the DM_VERITY_IMAGE build (e.g., arago-base-image).
+    # On the first pass, it won't exist yet because the initramfs is built before the rootfs
+    # (due to INITRAMFS_IMAGE dependency). The do_rootfs[nostamp] = "1" causes this task
+    # to re-run after the rootfs is built, at which point the file will exist.
+    if [ -f ${STAGING_VERITY_DIR}/${DM_VERITY_IMAGE}.${DM_VERITY_IMAGE_TYPE}.verity.env ]; then
+        install -D -m 0644 \
+            ${STAGING_VERITY_DIR}/${DM_VERITY_IMAGE}.${DM_VERITY_IMAGE_TYPE}.verity.env \
+            ${IMAGE_ROOTFS}${datadir}/misc/dm-verity.env
+    else
+        bbwarn "dm-verity.env not found at ${STAGING_VERITY_DIR}/${DM_VERITY_IMAGE}.${DM_VERITY_IMAGE_TYPE}.verity.env - will retry on rebuild (nostamp)"
+    fi
+}
+
+
+IMAGE_PREPROCESS_COMMAND += "deploy_verity_hash;"
-- 
2.34.1


