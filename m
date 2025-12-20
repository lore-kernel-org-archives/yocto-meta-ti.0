Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EBAE668A8
	for <webhook@archiver.kernel.org>; Sat, 20 Dec 2025 00:20:43 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29821.1766190041786725634
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 16:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=HPup7Moi;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.56, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FF73S6ILvPSv5zHFyXx0uCVKyH+JVSdwmHi3RRj7bX9qh/c0vxfSPM/gnGEvNuCFxbZ3y4vzLIOqpWmamrzvzSxXckMUJsVogNipkf/t1WAd0VK4lU+K3YNzCHXj/RXk2T3vTbHaA0PPNWjhRfxEGIyZAXvaSLhxesgTLMB6KQLt8XHwl/Pi/qA4+IBpicmvTyHP7fa+lMjpPhkz6PQBwhNvcO+mhiPl5phF0u5LxSOzWMvukCgCgDsygtukBapGQv/0eFyvrP+HUW4OhRuJIlv5YfXzEjF/J/LvsxG+sPwwcbRgFpTg4EdXnKldNmvURUtgiR2JRO/oer/OAG34zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsdkCagsayBoVrl2gm25Y1FkARP+6QDVjtb6xIXj+tg=;
 b=d3lrDUlQRdHCKu07SScWi74THPwz/coHOKWJZ3EpeIn0TiPc/NqqEMUXkyIdt30TG923LFSR4xgGKYGaS8lSbazOiYZgKkOmRcFBY/TGZDPdyd3MHPOJ/rS26udQ1knkiLveE+5nGJx8qeOyklCSCyRU2X4zaVGVJGdv2PeH72TMlFzc2Ug3aR2HKYgnR4Ic1xgdD6tCN39ltFEmMmBiuyqxDKB6D9VQL6PZcnGguKPocj8kafuULp6PY3ihRyY7Il6dMBda8oSFpI7YwBYYGnZshIzuDMPhE3i+v/JfyRS3x0Cn6oqpt6MQ7SxM/yM1BFXBLEUyuoTYA1sMDkhzMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsdkCagsayBoVrl2gm25Y1FkARP+6QDVjtb6xIXj+tg=;
 b=HPup7MoiOlQNYgJL7hVPR4zT50RX6+u/xf/bT5eoWTXsycV5JvWALwsfIqFCERorekd3W16QntSqabIZQwJbg9p8smXR+vKbc8+F/eN0cWTjRL7UAbPXBCYJlhhgvDoOhuikGs18TAUCF+6qnC2fOeTAup7nHH8S7oW4aO2/3i0=
Received: from SA1PR03CA0013.namprd03.prod.outlook.com (2603:10b6:806:2d3::9)
 by CO6PR10MB5601.namprd10.prod.outlook.com (2603:10b6:303:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 00:20:38 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:806:2d3:cafe::f6) by SA1PR03CA0013.outlook.office365.com
 (2603:10b6:806:2d3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Sat,
 20 Dec 2025 00:20:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Sat, 20 Dec 2025 00:20:36 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 18:20:34 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 18:20:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 18:20:34 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BK0KY2Q1653135;
	Fri, 19 Dec 2025 18:20:34 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vWki2-00000009STl-0b9T;
	Fri, 19 Dec 2025 18:20:34 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti: Clean up config looping code
Date: Fri, 19 Dec 2025 18:20:34 -0600
Message-ID: <20251220002034.2254417-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|CO6PR10MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: e86bf7cd-d948-4353-9c45-08de3f5d98e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7pp3vPK0snRY0cEcf2gRWa9ktFU8EUAoQ3HN8Bw9BdJBwptmgLg5CnJVv/Kl?=
 =?us-ascii?Q?7GKjatszih7c4j2lELleGIl7hXwj6vN1UDCDriB9NDidOt5AromMPKVUz1xG?=
 =?us-ascii?Q?on+1b1d5NDPxvBT4vAdnQ64RCigHp6u39xl2pL3MagTKLtwIumMUEW7944BM?=
 =?us-ascii?Q?gvmdq23R0/+DfUK0AsFmlhiT2rAQ7qo74qJDTzQAuQrSnDtrB3FXXK3TPyHn?=
 =?us-ascii?Q?unqYAMMMpnuU3v3gxln4j/yRzDqVtb+NpO0rPX0ivD8yYABN/CFkcKRO8TaO?=
 =?us-ascii?Q?XFYNbRX+AJU6R3bZcYow/DSbDITuNUxpFLHCG5vin8VY69nQXW6bmExNMch/?=
 =?us-ascii?Q?OPOfLbfpl0im+SSPllCnQ3cuOFo2fDL2KNOndoE48kDfwAEW2LCjtdz8B0u+?=
 =?us-ascii?Q?0E8zV0VDpszA3thfV3VSi1OaNkfLmMlOGoka8YJNOnU9AJgg1Qm45S3J+M4O?=
 =?us-ascii?Q?R/LltlNmOUOKk+uISzPG1PbM1JvFzExoRaJK0GnTEGPMBQBWiUFHhpNMQQg3?=
 =?us-ascii?Q?c+3bYA0+gutqlh40WF69Gl/UzEfVwvhHXuB4o9KWwlsUJE3jp47zUQRyjJjh?=
 =?us-ascii?Q?ui7IchcZ6A0acXY8zLcPObCHF6kKiAWf0mRk1bYsr4i6mIJrjOF7MpRyiXZk?=
 =?us-ascii?Q?SmxnPrv4VCnih6KCU1NjX6OL29u2OVKUHeeuaSQpCYK7TcXNiiHR509p7HYP?=
 =?us-ascii?Q?HcvRey61z4R0kQNbb83Kh0nqrGSY4KikwCOn+t2RHBWLj3jHrHA5XXJcLl2Q?=
 =?us-ascii?Q?I2UGgwIrRs6E8UtI4jzN8aDQd6wnppY3zTonj8hubOTj9FYjjt6AKPv2MJkQ?=
 =?us-ascii?Q?kHYkViYQ7Bj6JcDE8ruzYbGYk/O8IiIZExuASR+4mCYcZxHq9NTEEKIX5A8d?=
 =?us-ascii?Q?u7MmgVlo/e/mhOD4+fJEPa6vKp9fJXHdB/sUQbY7sQR59d3kQIAeUeN07/lF?=
 =?us-ascii?Q?tq3Y/PMzdKiMXlSEKO9a2d8TysHwh9ZWS/ShHhkX7nYBxA+FXysUKPYBwfH6?=
 =?us-ascii?Q?3C5wuNDVz/3YpVl55AQ4z4N3HLgjQIzG+ix5DgvMV95NCBRfymsFCYQpIg39?=
 =?us-ascii?Q?a0F+F8dfLdRf1YRVQMMi08xwWYOUaEfanWQgBrsvHOzVSPE4lWELzzwrg+sx?=
 =?us-ascii?Q?ZyhAS17QFHbA/W/qy0FSqK2FWGNxmE3X27hamqL5P9kmm1f1FAZS5a4p/609?=
 =?us-ascii?Q?SdX6/Q71HfEIziTI4/ThJjbIJz+kN7/7Z0pQO8j/AOTJQVvStTGCrsO1Hxub?=
 =?us-ascii?Q?n1nZr60/6iXz8cwTv1lNg6/QP3IrZhvqG+Wak9GNmr4or5bpAfmbCinv1PGg?=
 =?us-ascii?Q?yoWsQX7QFfiAjdaw/qd/EPTLwYM9fGuBV8+/IKYuItOzzwXYi6ozXcNO4Zzb?=
 =?us-ascii?Q?spmrvSDtNHOhmt1vLshguISXjOQID1pDv99qtsZ9Ntvdl9aRJhZ4loPxUipk?=
 =?us-ascii?Q?jvjwakfCMg4OzCV2pYTZoA5ng7qQeBKM8puoJBpefDtn1svqc29bZXabo4In?=
 =?us-ascii?Q?S1t7GNcdoU8CUPf5X4kG5z3Y5DtQeY7jiJeMVTW4J1slo3MRPOHK2gaJ93U5?=
 =?us-ascii?Q?dUfza9bollUHjfswL3w=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 00:20:36.2904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e86bf7cd-d948-4353-9c45-08de3f5d98e8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5601
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 20 Dec 2025 00:20:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19382

Cleanup a few incorrect issues with the current file naming under the
config looping code.

1) Since binman is creating the tiboot3 files and signing them, when we
   are trying to create the named version of the files, we do not want
   to link against the spl/uboot-spl.bin file.  We need to figure out
   what the tiboot3.bin is pointing at and make this named version point
   at the same thing.

2) When deploying the tiboot3 files, if we are deploying something that
   is a link, then we should point the deployed link to the same named
   target.  This should help with figuring out what all of the links
   actually point to from the build dir instead of running into .bin
   file that has lost the audit trail.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 44 ++++++++++++++------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/rec=
ipes-bsp/u-boot/u-boot-ti.inc
index 92ec5ca8..04a784d5 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -150,13 +150,17 @@ uboot_compile_config_copy_binary:k3r5 () {
=20
     builddir=3D"${builddir}"
=20
-    if ! [ -L ${B}/${builddir}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}=
 ] && ! [ -f ${B}/${builddir}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ]=
; then
-        ln -s ${B}/${builddir}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${build=
dir}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
-    fi
-
     if ! [ -L ${B}/${builddir}/${binary} ] && ! [ -f ${B}/${builddir}/${bi=
nary} ]; then
         ln -s ${B}/${builddir}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${build=
dir}/${binary}
     fi
+
+    if ! [ -L ${B}/${builddir}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}=
 ] && ! [ -f ${B}/${builddir}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ]=
; then
+        tgt=3D"${B}/${builddir}/${binary}"
+        if [ -L ${B}/${builddir}/${binary} ]; then
+            tgt=3D$(realpath ${B}/${builddir}/${binary})
+        fi
+        ln -s ${tgt} ${B}/${builddir}/${UBOOT_BINARYNAME}-${type}.${UBOOT_=
SUFFIX}
+    fi
 }
=20
 uboot_install_config:append () {
@@ -230,18 +234,32 @@ do_deploy:append:k3r5 () {
=20
 uboot_deploy_config:append:k3r5 () {
 	for f in ${B}/${builddir}/tiboot3-*.bin; do
-		if [ -f "$f" ]; then
+		if [ -L "$f" ]; then
 			f_base=3D$(basename $f)
-			install -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
-			ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
+			tgt=3D$(realpath $f)
+			tgt_base=3D$(basename $tgt)
+			ln -sf ${tgt_base}-${type} ${DEPLOYDIR}/${f_base}-${type}
+		else
+			if [ -f "$f" ]; then
+				f_base=3D$(basename $f)
+				install -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
+				ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
+			fi
 		fi
 	done
=20
 	for f in ${B}/${builddir}/sysfw*.itb; do
-		if [ -f "$f" ]; then
+		if [ -L "$f" ]; then
 			f_base=3D$(basename $f)
-			install -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
-			ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
+			tgt=3D$(realpath $f)
+			tgt_base=3D$(basename $tgt)
+			ln -sf ${tgt_base}-${type} ${DEPLOYDIR}/${f_base}-${type}
+		else
+			if [ -f "$f" ]; then
+				f_base=3D$(basename $f)
+				install -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
+				ln -sf ${f_base}-${type} ${DEPLOYDIR}/${f_base}
+			fi
 		fi
 	done
 }
@@ -259,13 +277,15 @@ uboot_deploy_config:append:am62lxx () {
 uboot_deploy:append:k3r5 () {
     for f in ${B}/tiboot3-*.bin; do
 		if [ -f "$f" ]; then
-			install -m 644 $f ${DEPLOYDIR}/
+			f_base=3D$(basename $f)
+			install -m 644 $f ${DEPLOYDIR}/${f_base}
 		fi
 	done
=20
 	for f in ${B}/sysfw*.itb; do
 		if [ -f "$f" ]; then
-			install -m 644 $f ${DEPLOYDIR}/
+			f_base=3D$(basename $f)
+			install -m 644 $f ${DEPLOYDIR}/${f_base}
 		fi
 	done
 }
--=20
2.43.0


