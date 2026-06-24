Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11481CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 19:56:03 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16174.1782330957725696516
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 12:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=VwgBerA1;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=qR+95Ihk;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65OJsLp53625031;
	Wed, 24 Jun 2026 14:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oon/mGJvBckb/Bx+ngwsmfz13GFJpgGhIUeGhfcdL
	yY=; b=VwgBerA1M1mTUVGu3KA0LJUYzO1d8l5JP4OXtP5JNJE8DbpYME3Jfibm7
	6nMqLN5JpzVBmNY7vDBVbyPpGmZqciuhcERzBV8u9iVYrHA1j/1TSMz+iWq3f7qF
	nT5aUwuULHLH2GHgF1R201voLOcbWVWABiD47oVTK6JSEr6kLEkSE0yRj1ZeA0Q3
	ZLxsph5LW4/hdwu37919d/zgSyDw10HqtCnCNYT+8u/GojxEEzg2kW4UCNz4TQq7
	N8JHH0COynbHoR52QWnTWM6marLTzAr4O+hDoPcEcuSOCqjwYY5yugrqM4R7iFGT
	2TotALWgeZ8EZ0N9ATgVEtVErmsuw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012071.outbound.protection.outlook.com [52.101.53.71])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f0ecru817-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 14:55:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQifNGWfUjecTivnJVl1FLINbXdQGlgb+ffnWlgKh0TDoEicWIKG5OdvcXYJJ8gAGT1buDjSxv2BeZDonH+9/0xQsoBmsagyySpG/JFf2ClkM9h5VGqas0LyHxUyFawW6xAyGIAOgRF3NePE9900OoyuKskJKEAh9HZkpDE5QTDpvb2aTi1uGfJCHyrDu4iwhZtBo8ccbyZBe3P9FSxrNbyHrriyVZydEJ8YU2b2NkIPtuHYaVTCiblPr3nXseAZtPIgVvLOUWpTCnkl8ZkvpCk2Z6s55mEjuTnJg+GVY63ZuBaFHudDHeImFN8+dT6WS+EFXMOBSnq2Rk8saRSZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oon/mGJvBckb/Bx+ngwsmfz13GFJpgGhIUeGhfcdLyY=;
 b=mzu60NlCEoNc3oTKsiG3iFaqUGBptYPL2e6KUlsoNrsA/789aNpth34GGXOwxQkXD3pI28i8JFxF9YB5wC4dqZ6L1MuGKuCr+gCSCasi9nSxnx6AwL4nHjrisiOrGQdLADdUe4N+DtXmTkE9Mmcu9oriugM/SoGGd9uaSig1nYbhksQ3mhh/PHVUz8MHSD96wddclswXtsv8W6zzOvdx+aXiilytn0tSD6+rp++dpeJsJz2NB5bCGCuteAZZYP+bMcPsgLyrcp9VJ38O/T3H/Bca5DmAhd8g7sqg0D5lsIDH5vGnfoZal9mAy0rpAuZY/XSeLDoZZqWqRPFmfJDg1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oon/mGJvBckb/Bx+ngwsmfz13GFJpgGhIUeGhfcdLyY=;
 b=qR+95Ihkspzb1eBSg+EhLLU8YK0VXwdiUZMtbMD12Etf2b6kaWTEHFQ381Ad8XAUsg9b/fhzdmDng//zXbhETN0AMkgn9Aj1QDbFFdTGXDtVMMmoKBhx0bZC+JGvh1Ut3KaZ+BBr2GeJzEOKz4gNNiI9X9aGvp3j6VaHEnfeRLk=
Received: from BY3PR04CA0026.namprd04.prod.outlook.com (2603:10b6:a03:217::31)
 by BL3PR10MB6017.namprd10.prod.outlook.com (2603:10b6:208:3b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 19:55:42 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::a5) by BY3PR04CA0026.outlook.office365.com
 (2603:10b6:a03:217::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 19:55:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 19:55:40 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 14:55:36 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 14:55:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 14:55:36 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OJtZQk1723418;
	Wed, 24 Jun 2026 14:55:35 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH v2 3/3] ti-codec-engine: Remove this recipe
Date: Wed, 24 Jun 2026 14:55:33 -0500
Message-ID: <20260624195533.1152173-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260624195533.1152173-1-afd@ti.com>
References: <20260624195533.1152173-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|BL3PR10MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e345036-9af8-444b-3faf-08ded22a91aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|56012099006|6133799003|12006099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	khcPR+VyjjGTZ+0En47PNyJfPK1qKQMCmV+m+J8WyRjRbZasK0JmziJ4tXfwkUCYqdYJRiuAwR3yApR8vHdK3ZiznmPLmreI31hCuWYnpQvJPnoHfY549XZRVopnHiT/u+ABZPvXUmjCKqW0GPRPSKvLZfhRNovaCYgdySsChABQYBjcfY88UrxFUFuH/RwfcFKrawyLXW2h3SOVCYFATtidMqdrnBZVfCJhvHh9DcF3fizjljB7tO839IJcxPMulmRjD+NWyFhoY629BGgco67uAka9Gz7o6ZyN26qlgrVn7nPTuxYLCXO1yDK9ePXP9MYuLtB60GORdkNssi9M++MMbDfBKIP0pGc1nDxKO0BVt9J8ZrDXHARw7CUbNHEtDQw9gQDT3seU6B8llDUnaGakDwnLgo/Ruakq+f46vsiEqE7b/jD2YRDocWF805HD6IpyXrqRQwzlIslNuUc5pmUv8iCTrEBtrZdVHQtzCoNg4MYDX5IW6EJzH1PFC8kydPrk67H9mX0mZwp6EHHr1Coe6mz1gFa/RAOeei5OC6NejhMINZjzW/+tCQJvfkzqPKmFrMLip7tYfkVQtzWckzwNS8BjuCUTtrVGIlUrxLce4eC2zpxqe9gqX3a4BqDkqYJG8xFe+k9SEpbNUO75bNoE1hMe9eki/haHNjq2I/oYQPnKKczSvVDl6Gytk7E+yq11acfNmNU7iRW1nQOr5w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(56012099006)(6133799003)(12006099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6jjFEIS7a0ZIYvFcPHPCWKaFR5WBdn9W/53Afqpck/UP0gg/DERyBhRpkfPVR17pjmYRp6vkIjem3gGMnWvJNpdqbWV1uviuh/A5ctTy60fh/NO2Qs/eqogDmOcfTtYGA9d7B+wDfdfDA/a73TfwfHA596bSRoWCLKLTWEoi7NV9aPK1VOWlAgLFYsBdN2YSvp7CmWsWPlb0rbY8OoMn1RGlZsZ9L03VDCYKvTQjsp/8sT6UNCfw5uhCAg5MxrDvOOAWe9lAKUqstH5zA8ZXVa0VREmJJp6VwQwVGmC0cZQqq/TnB+NSRDPvurMo/2PVrRo8+RApwtsAYUEWmNTFQOPdUK1qm8ohFqG17NnAewVEnWapSI6g1G1+XPuLNQSCucRVGarEu7N4RGpWHVYIQAICYGz9Tr2tIDB/5Ns3K/WklGCm3rpdMN/FTTXFQGg8
X-Exchange-RoutingPolicyChecked: 
	JAOaAiTTgd8CITW9bScUrTjvVTqkurFJwF29NiNuVK5m9Z3PnEOWZDPy0icanol+91xZmqvlDSrfGMyd0NxFtfjzGUsFsbKgIuc4ezKJDEYY7TZCEg1ELxQ8xAmJITLI5S5NhLyhOdFV9eXkzKwzxRpS6Uheniwn9HtkOJASj2wJ59w2yHB+EYaED3u94ygWWPF6aD/+J3rx390p5Pjt1w8uGnbw0+mLXOItreYnGeY5+WsGgPdJ670NsYE8tsbwctPBQrL9mbVzKKV+XHZ8rJUTCStz0SEG6Z/CW3VWOesFdbLwMnPaZCHpAQfdXh7tsqnMvDace11P5ToB9ZtPEA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 19:55:40.6110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e345036-9af8-444b-3faf-08ded22a91aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6017
X-Proofpoint-GUID: lKA86p0GUgs6Oj8mfUfjzVS6dH_1dVvV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2NCBTYWx0ZWRfX79rSDm6hrA0o
 GoszPZU/1diZiQZFQOXptTh1IeNFp0xVFJg130+4MhDv8VWxMzsd2BqUj2BNIp86PAFSo/HxzVI
 Kc2YbuA25TDvhqhTHF87x8VarpYZk9KsL9w+sp7QZqISDxcCpCJiJsy1cijB/wNE7JgKauz0+re
 fxA1+5H2TXc+1vXMEH70wIXoc2Xck87iGA6WrhLefDbYvmV/hyzkeUZKoH1gFkqyitLNYFya9i+
 a4FJmuSoAYFTmGDGs9W7roD1sXwvZWHbxvGfrbQHhAq6cFjApXS8qsMmnJTBn4ejUsIIxvfNTww
 Y6Ic90zKvG1WALBYweEI2HIiNrqdmGWzT9JU7u1MbkM801jxBs7pBSnSDnWjUJn1Y35LAAjEykT
 6iP+9yaUye1n62BcDKKHl/9zxnb5MQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2NCBTYWx0ZWRfX602rSsSDipru
 ccgUb29+C6+yvTBZOng8jhq5WDsUb+H5zo7xqj5Y0pWTeGSmM/vGQ88fZ8kdOOiNQLbCsJJ2edh
 ggWoKFTbj+npoqiXmlO8yt67wL/aTwM=
X-Proofpoint-ORIG-GUID: lKA86p0GUgs6Oj8mfUfjzVS6dH_1dVvV
X-Authority-Analysis: v=2.4 cv=eekNubEH c=1 sm=1 tr=0 ts=6a3c3648 cx=c_pps
 a=DSCxmJijwPVh9NBC5YRuGw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=oFFstam5h-teIRs2jbwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 19:56:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20074

This was a build dependency of IPUMM firmware which is now removed.
That was the only user, remove this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - None

 .../ti-codec-engine_3.24.00.08.bb             | 29 -------------------
 .../recipes-ti/includes/ti-paths.inc          |  2 --
 2 files changed, 31 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb

diff --git a/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb b/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
deleted file mode 100644
index b248683b..00000000
--- a/meta-ti-extras/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Codec Engine for TI ARM/DSP processors"
-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce"
-SECTION = "devel"
-LICENSE = "BSD-3-Clause"
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-staging.inc
-
-PV = "3_24_00_08"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://codec_engine_${PV}_Manifest.html;md5=de7d9c2594a6f3868e42a33b6a748ce7"
-
-SRC_URI[cetarball.md5sum] = "d66a8ccbd6cdfe9f735af9f4a07e2b9b"
-SRC_URI[cetarball.sha256sum] = "ed7b7399903bbf76af06ee6457836f344ad75b903618339bae82b3967f27ffa1"
-
-S = "${UNPACKDIR}/codec_engine_${PV}"
-
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce/${PV}/exports/codec_engine_${PV},lite.tar.gz;name=cetarball "
-
-do_install() {
-        CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-        # Install/Stage the Source Tree
-        install -d ${D}${CE_INSTALL_DIR_RECIPE}
-        cp ${CP_ARGS} ${S}/* ${D}${CE_INSTALL_DIR_RECIPE}
-}
-
-ALLOW_EMPTY:${PN} = "1"
-FILES:${PN}-dev += "${CE_INSTALL_DIR_RECIPE}"
diff --git a/meta-ti-extras/recipes-ti/includes/ti-paths.inc b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
index 9f8b5897..ed199dec 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-paths.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
@@ -3,7 +3,6 @@ installdir = "${datadir}/ti"
 export TOOLCHAIN_PATH ?= "${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}"
 
 # This is where do_install will put it
-export CE_INSTALL_DIR_RECIPE           = "${installdir}/ti-codec-engine-tree"
 export CODEC_INSTALL_DIR_RECIPE        = "${installdir}/ti-codecs-tree"
 export CODEGEN_ARM_INSTALL_DIR_RECIPE  = "${installdir}/ti-cgt470-tree"
 export CG_XML_INSTALL_DIR_RECIPE       = "${installdir}/ti-cg-xml-tree"
@@ -31,7 +30,6 @@ export XDAIS_INSTALL_DIR_RECIPE        = "${installdir}/ti-xdais-tree"
 export XDC_INSTALL_DIR_RECIPE          = "${installdir}/ti-xdctools-tree"
 
 # This is where the tools will end up in sysroot
-export CE_INSTALL_DIR           = "${STAGING_DIR_TARGET}${CE_INSTALL_DIR_RECIPE}"
 export CODEGEN_ARM_INSTALL_DIR  = "${STAGING_DIR_TARGET}${CODEGEN_ARM_INSTALL_DIR_RECIPE}"
 export CG_XML_INSTALL_DIR       = "${STAGING_DIR_NATIVE}${CG_XML_INSTALL_DIR_RECIPE}"
 export DSPLIB_C66_INSTALL_DIR   = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
-- 
2.39.2


