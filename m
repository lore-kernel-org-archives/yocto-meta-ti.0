Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9706FE9A030
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 18:03:58 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18590.1771351434478921346
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 10:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=pCjV67Er;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.45, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/HzkA2Y1V3rpdnTF4Me9fHmXbUTibH6NQjyw7BEKA3bbM3JpZJzkjog604oqLVxszkdtEgFM84xi2gsxSngKtZrubHZ+vtKwuuyHsOTspBWUom8jjMoQy2H2qttF6l61D2yuurN5n6+w/MhW228zMbmqmwbLoxxT3AcpebyakIPdoK/PROFXgt9DfdLpVVEqSokpnGi7cURq427mBJznCcvII35SHelzzpqaISU8XxbmV70mSa32o/LuMSm/cmveFaeIoVsG/oYQMiCvwzc7ywtMtoYtYDtuJnrd8/o0RwAOAQl+JtVOMaY15YukIc41FAa44RhiDTR6UNrbRJQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IDRE6wcLdpynnWhd/uQcy0g3sr9zk78jKkUFEeGO9Q=;
 b=jCqTVBTW4/ad8ujIvaNY/2sETg3u43eHhbt+hPJSlTmVbbdu4D9UAHxVNJLn3ux7cD+34dtEgqJYNvlJ8ZRBGmS586d4LEvA/7N4H5I+VMrtoQhnFjr3/tCdzxEmgtoHbIP/GKDgwljEPL2EbIDRKmxIK1iwQnZh3WyoqgzyDATItO0mPv8DoE4YZI8zCi9BzB4LQJkP/Exv293+p/G3NUUdf/MVvuRaMSumcBOmSuaW+6rQOF5p9wZjayVuAvBrOt5mx9XiKtWh1LphvPCFYkdEwLI4Ds7soTRiWuiiXl6HQiJE75PApYlZL7rUwKmxwUDZTRyrhHjsIK0SAI25uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IDRE6wcLdpynnWhd/uQcy0g3sr9zk78jKkUFEeGO9Q=;
 b=pCjV67ErdYifinYTZKbRk+t2+gPKwGN8fHZPRobcVFkd2O5gdV+ndaZPWqMWZk3d9P6YegUZTvQeN1SI1bkbYp1dp+BlymaoXpAOoCQ2qtvLdEyhKVc/cY1ec4NttEKvkjN09iu9z4DtUTgYtHIivg1cbVHiEtdXrxtMN4lJlrI=
Received: from CH2PR11CA0014.namprd11.prod.outlook.com (2603:10b6:610:54::24)
 by IA4PR10MB8658.namprd10.prod.outlook.com (2603:10b6:208:562::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Tue, 17 Feb
 2026 18:03:52 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::de) by CH2PR11CA0014.outlook.office365.com
 (2603:10b6:610:54::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 18:03:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 18:03:50 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 12:03:44 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 12:03:44 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 12:03:43 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HI3hmY3273142;
	Tue, 17 Feb 2026 12:03:43 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 3/3] ti-codec-engine: Remove this recipe
Date: Tue, 17 Feb 2026 12:03:39 -0600
Message-ID: <20260217180339.128793-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260217180339.128793-1-afd@ti.com>
References: <20260217180339.128793-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|IA4PR10MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: b51a4221-b6be-45be-2b6d-08de6e4ee7b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LfVjdJwvmsqrd7Ra5eypRpphKbvFfWU7LZ5ZlacT5VbdniJf+d86f/nzptN0?=
 =?us-ascii?Q?E7ArZng5csn1fRvyFycYdG3zImJ2077sGK0csc6pMcqQe7CcIDVs6QGTu/hC?=
 =?us-ascii?Q?YACqQXXJ0oQDvGZRYyaTZLIFbK0go9xAqt+LN9vilRCPE/eLDpexg4z6wlA7?=
 =?us-ascii?Q?MAhHNqMU+Nj2oMdFJx2v15VLoyI7FY8eFSlklXWSUAeiBKiEdli9X/cbHEEA?=
 =?us-ascii?Q?mAAG/mz1MICKvd8RYSI1PALYt4+q+i1DHchikZ0DU3lug2Vm78opOI13CVXu?=
 =?us-ascii?Q?zk6SrkgKTcy5SM7nVeMLaF0m76dKfepvyy03C2NY2d1KVpOOCSxYmBsDBWgi?=
 =?us-ascii?Q?p/FExMUXRTT9EbfAhHeSgUtqUyY3LzU/b2t4gkeASwb6pexSeR0DcBfispbj?=
 =?us-ascii?Q?bCQW4YQkWDe+R97vqus498iHhvEv3aM0mUdBoL9zvFG57883d1SuYN4zhTZx?=
 =?us-ascii?Q?F2JXmKypNY4uHWvK19oQVpNtTYcjhObIixLip3C6YRaaarNcVl4AVqzixbFK?=
 =?us-ascii?Q?iIiUvccw/oEzpj6ogmhW0xpgF22Z99t7BJwvI7cnpwRluJZoyCO1sYWGiiRQ?=
 =?us-ascii?Q?k4B5qJtv88Yg8GRkd4HL/aXF2CaMT2e3E+wwAVnfWtnRYlKBpH5/S1KAOQaE?=
 =?us-ascii?Q?vSluGsmZnqJhST1aaa4FPMIvJ3sW965M80QzOYGZL7+RWgY1cPuIzpyp54kW?=
 =?us-ascii?Q?MkT9IaXU7eJ8118pL0nmLN0qYWqhnydbfuk/4VPTDngw6kEeXyxJ71oHXkvo?=
 =?us-ascii?Q?qoJ0YBTeYkpZoi2qBkVioHHFDiL1SvoSdx7e41NgUUAe0gQIdZoEYc31hCnc?=
 =?us-ascii?Q?UUBBjVFfdgMbEQ/3nFolmZAmp4erHb8HNDwTrX/Uobl63QF7R1n6+ZEwULnJ?=
 =?us-ascii?Q?e2SQzCLHKnTsQ56zpfPegaBGffgCourDIgAV69s2dJIiJWpho6VjN/7kPfur?=
 =?us-ascii?Q?cOpl70yKtdeJ2h2SrxFq3fVOlR2H8bh/xActo9YvocxXrmNLGKBT13kdyf6d?=
 =?us-ascii?Q?SYoClWEQic1R2BEKLyTyMxKQucrG3BaE9iitOqKYUfL55N1XLDhUUHSW78X9?=
 =?us-ascii?Q?wIn4LyizdF1o/ysA2OhOuvqtn8CnLZVXN1LhvQ3VobktY1HQCQ2cHoWZAZjY?=
 =?us-ascii?Q?7XTTkb7BD+HHNNWxp6ME2brjm3yyJZyjxa7hLFmjjTYZmUdrI0PJRt0kcQcv?=
 =?us-ascii?Q?TBB81RGycAZuCxf/KXoT4m/pZvpHZWV87xXpsadGy62gD/Vgr/YM66098M9Q?=
 =?us-ascii?Q?YYE5lnodzQFb2DNcoyA1kBsW/KclscNNf9eq0ZK9r8lFWFY35/RFgamBAwMG?=
 =?us-ascii?Q?tgzczYR8sevw+7yVugySvWImK2iwTcBBDf4FTKWGv7oI8RgwT8B7mMzadQrg?=
 =?us-ascii?Q?C4rOXAjdTTeyTWzsjfIqHlRyvyA5NFM8dz7kL61f8XWGb8F06erWW4ZZF8hb?=
 =?us-ascii?Q?4fv6WYfEzf1EtfIs3E5i7/QU/UkM8murzOx+0W/dN9hbJY9cFdYYzr1g6LyT?=
 =?us-ascii?Q?O15e6BUo0M7WXzPrjQ44+1ejeGIgptKwqKzMvSbrDdIgdjZsQWSO3HEM/GId?=
 =?us-ascii?Q?fgPw3okIib6vxR6AAxw2BR2K6ngDgNZYb77SckkQ7XDc6M+93Dd2rTAgo/oA?=
 =?us-ascii?Q?/Yv8IZ9lZxo83UeqWvCCNwMJcIJsWQf7+Wx0kQItv78r//hXPPo5F5JfMV2j?=
 =?us-ascii?Q?X5Yp6w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YplZMm2m2FGIumxo4NrFuTxKv6ce1MkN9L+HqQ8CROjapkuW9Lq0TSDPQKKT2SUDTDWOFu9x0mm6AXQ1M5yL9ekSVXOXSxpVxCU0D6i1G8hL/+ofFheRCi6eagwWVHsOZukJXPK6wsTXScwS12oAvdpeGIryEHo3WEuV+dHYbq+ND3KevfI1+6hU+8bZLEEpxVv36x0rU+4Bxx5kh2W0Asfa/+8PAcNlijuqlhwgBHUQb+rKhx6poSwmCcRFGhmM74ImmjGFIOJSnLxFk3ndfWmHaWrj1AI1mHG2seJ0Lv+nR4vqw72aknIhkoUQaBflNJY5wdcZcL1T7QlIsea3XfYtiMVoopHK7pEe5LnO1qjY66oA+7c3rPHFlmdALoAvWR8h41MENTgEPJ9ib0Kd7VD/kJNukDOvwyE8Y0jZxp4jm/gRZziXITOtxbPMxy64
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 18:03:50.6005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b51a4221-b6be-45be-2b6d-08de6e4ee7b3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8658
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 18:03:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19532

This was a build dependency of IPUMM firmware which is now removed.
That was the only user, remove this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../ti-codec-engine_3.24.00.08.bb             | 29 -------------------
 .../recipes-ti/includes/ti-paths.inc          |  2 --
 2 files changed, 31 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_=
3.24.00.08.bb

diff --git a/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00=
.08.bb b/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.=
bb
deleted file mode 100644
index b248683b..00000000
--- a/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY =3D "Codec Engine for TI ARM/DSP processors"
-HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetc=
ontent/ce"
-SECTION =3D "devel"
-LICENSE =3D "BSD-3-Clause"
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-PV =3D "3_24_00_08"
-PR =3D "r0"
-
-LIC_FILES_CHKSUM =3D "file://codec_engine_${PV}_Manifest.html;md5=3Dde7d9c=
2594a6f3868e42a33b6a748ce7"
-
-SRC_URI[cetarball.md5sum] =3D "d66a8ccbd6cdfe9f735af9f4a07e2b9b"
-SRC_URI[cetarball.sha256sum] =3D "ed7b7399903bbf76af06ee6457836f344ad75b90=
3618339bae82b3967f27ffa1"
-
-S =3D "${UNPACKDIR}/codec_engine_${PV}"
-
-SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetco=
ntent/ce/${PV}/exports/codec_engine_${PV},lite.tar.gz;name=3Dcetarball "
-
-do_install() {
-        CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downer=
ship"
-        # Install/Stage the Source Tree
-        install -d ${D}${CE_INSTALL_DIR_RECIPE}
-        cp ${CP_ARGS} ${S}/* ${D}${CE_INSTALL_DIR_RECIPE}
-}
-
-ALLOW_EMPTY:${PN} =3D "1"
-FILES:${PN}-dev +=3D "${CE_INSTALL_DIR_RECIPE}"
diff --git a/meta-ti-extras/recipes-ti/includes/ti-paths.inc b/meta-ti-extr=
as/recipes-ti/includes/ti-paths.inc
index 9f8b5897..ed199dec 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-paths.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
@@ -3,7 +3,6 @@ installdir =3D "${datadir}/ti"
 export TOOLCHAIN_PATH ?=3D "${STAGING_DIR_NATIVE}${prefix_native}/bin/${TA=
RGET_SYS}"
=20
 # This is where do_install will put it
-export CE_INSTALL_DIR_RECIPE           =3D "${installdir}/ti-codec-engine-=
tree"
 export CODEC_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-codecs-tree"
 export CODEGEN_ARM_INSTALL_DIR_RECIPE  =3D "${installdir}/ti-cgt470-tree"
 export CG_XML_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-cg-xml-tree"
@@ -31,7 +30,6 @@ export XDAIS_INSTALL_DIR_RECIPE        =3D "${installdir}=
/ti-xdais-tree"
 export XDC_INSTALL_DIR_RECIPE          =3D "${installdir}/ti-xdctools-tree=
"
=20
 # This is where the tools will end up in sysroot
-export CE_INSTALL_DIR           =3D "${STAGING_DIR_TARGET}${CE_INSTALL_DIR=
_RECIPE}"
 export CODEGEN_ARM_INSTALL_DIR  =3D "${STAGING_DIR_TARGET}${CODEGEN_ARM_IN=
STALL_DIR_RECIPE}"
 export CG_XML_INSTALL_DIR       =3D "${STAGING_DIR_NATIVE}${CG_XML_INSTALL=
_DIR_RECIPE}"
 export DSPLIB_C66_INSTALL_DIR   =3D "${STAGING_DIR_TARGET}${DSPLIB_C66_INS=
TALL_DIR_RECIPE}"
--=20
2.39.2


