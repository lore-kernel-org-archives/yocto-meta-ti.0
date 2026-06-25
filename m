Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FAECDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 16:07:51 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14891.1782403665786974330
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 09:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=jkl1Uo0w;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=cuQxKeR2;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFd79u3683307;
	Thu, 25 Jun 2026 11:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=C6h3uqkHqnMpTvwou8krpeskqxlGcg78tlUUHevzX
	BI=; b=jkl1Uo0w2uaSmftXIVhV00rOpRB6opZ1jfujtQcGJ0wpa2nL34rmrfBe4
	wnrg0yr7DNi5aNkLEPqI5zOweHJ/VIrvoBJhgEOmSKXy44rVhKDPQL3CCwLBHRFS
	7wdWkgNgYnYJz9zXqnj0hDN70Zb2MDb2WBaUEcitvVbbqcpaWjGN7iAEeO0nAt+d
	iEXxbzwS1WXT1LQCEfyjY5SBG1Ne0vYhxC30nEGXkoQeZZqr9iW9+p2FUjpBY30i
	T64xyVGjEb3hSlUZOZdKABUHq4Dj0u/t/ueMI+opkJQcvWxvKH7U1NTVb50urK9O
	jVP+xekg1hXj28OYZV5PF7oeLMoiA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f13a0src0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 11:07:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2zWiqp+R2JieF+Jhwlz7OqpkyZaLt9+ctepw1yjDTI8OY6wty8BYoSiSuzCNLv9+n+Tk1fwkop4efk3HO+Bm4RlWESqSk9wybk0xAarz3PLseeV+663w+Z+YIIEtNLeLsgTjNfozAUoukkYciuKSoB5xTYYIAAycB7d8kmQ/ru+IbXgqt8tBJr2xrDFL+FNlXs5MhPUWO8Tg8A1NqBSr0rkMOMuXhMeib7OWkSyoSpeeEK9f+INHzHfo7ap1zTtg4D7kn4L05bGTLsvW/EWWk6pVATcQmOURT6zWqvkIS8U3CxvMS6OWw1TWuAWzrMMTyLO3PCraRqAYnpctT+rNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6h3uqkHqnMpTvwou8krpeskqxlGcg78tlUUHevzXBI=;
 b=lWEuhDkGeid105NZptQUhDIG1ENzolw/qhE4IIKnboLJDpGErvfcHVo1ldmvKcdT25yIoteDHV8jCXSaMjtGqFtq5VoRnnTbWA1nIgLb5zWbT+1xVPEJ43ErZL6SayNlDSieezWiByaXQCOEVJsTw0xjtP7/ycTt9BlTK4yXi9K0f9umXtzUx7Ft7fp0p7uMCLy/wlw1kFKXj2TfJsZw6WuBeztJuJ8Nxn4un+0Simp34wvxLB4xUJTprAKVEdZ/8QO2Yi/DTBu+BLRLCxpwQX89lP6oYmw7wBbKnbcwCSGk0nq/FOHHxTV5IHT7KBOK1Ty3jpwphS2EwVphNJXc3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6h3uqkHqnMpTvwou8krpeskqxlGcg78tlUUHevzXBI=;
 b=cuQxKeR2iBIx7tjLeyUZm4YPyYIlvytaZKXEqxDhSaOobWd8brcrbkiH8ljmWfVDlwmW/r8mKlSbniYOZN63xYiZ0FEKXiz7JE5qAAeIT8q9CCCgKO6JWBT5kxGzSthjl6c11pKLu4kJUleV5/wLyIqqCJH8uLnMX4Bzxr9zvwo=
Received: from MN0P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::27)
 by CY5PR10MB5916.namprd10.prod.outlook.com (2603:10b6:930:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 16:07:31 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:208:531:cafe::7c) by MN0P222CA0023.outlook.office365.com
 (2603:10b6:208:531::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Thu,
 25 Jun 2026 16:07:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 16:07:29 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:07:02 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:07:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 11:07:02 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PG71923099926;
	Thu, 25 Jun 2026 11:07:02 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH v3 3/3] ti-codec-engine: Remove this recipe
Date: Thu, 25 Jun 2026 11:06:59 -0500
Message-ID: <20260625160659.29619-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260625160659.29619-1-afd@ti.com>
References: <20260625160659.29619-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|CY5PR10MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: ebaf128b-30f2-47c5-636f-08ded2d3dbc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|13003099007|56012099006|12006099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	JgujDnaxpkavKkwGkJrb75QwDEc9x56PHl04B+iPQwSK5P1Tb4Up4dqX0aMtqZnfgkavsRURrOBDcrhX97Rh1QtZPz7CPZO9/O47mjfGCHAq7y+5hr8a8U4gQgCMgLoaH2q4IzfUrYJxP7uNCdYW/L70LW63I8+c2sAFvmpAwJFk+CA3fPnvt+8X37tn4PCkWXTb685Bb8iFKunD7SOludPn7KnGrbDy414qW0IdmdnjW3JIQ+mFG5Uq4PqpghfW5fiRdbLk+rYye2xOrIJbIwH2MVmWGl6+cuu2cuf6a72syULYx3lUkK+BealPzRh4rU4PZ95KngAOgOERS7CgK+6AhT37PM3ApWjcFF/EjoPITaaXq3F/TbYvEGJ+uwAgAOKfDEoaUiAETyR3S2qVSzvL8GTwEneZpQ6beJijJ5fch9xqKsCfWiDhvn5x1DLzFNm5HCv9yc2o5KWhBpPRJJl5ViPX4f071bNJW5DV/ZY2Nj29AbMVJtizRMsjbktj6AVTJNm/ZtzcxfRA29R9SoE12IjZ6oUYLH2ewZG2A9rAC4dbpvNjmgZJQZgEIzCh5Aq6QfM68C6YJdYBhUDXyGGiG1XbZUFJb3CKEESwbqMpHlnTWzu4s+p+ltp6EDqe1u8nocjUIFiPGSuyIvFyrgOvRmorisTRPSn3UN9ujkySkWzpCx912wMT9iaVysaiohH4XiMtoYb6MRoMqEz65A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(13003099007)(56012099006)(12006099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oiDp1k9H+P50Qsf3sAuV/EqoJSmPV9OLRSkmm80y0iA7Jnix6cPbDUcmPpzj2Fi7Rr66/eewbS6JEs5O+Ec3fTDX4El7jUW2YqjrIPiCiPUPPWvRqZzaccNucIAemx2QhVLDKkcMh+DzpTa8nPVW57g07PUF5lekvlx6rf6In5awPWsHFMY/HXGXSzsKlnjTPKlQfS58DRcwMB3K5FgYT44ucuodNjihya9fL0HFXxGrNsgtv6W8AvNm31yaBlQdtdOYKzo/OcqkMF1u899GFr/594LKHcKk/60UajdfKsejn6hLLne2H56sNMYYJ4LwQP3tf6+iX/5a/ttWOX1tIvGc06ENd3llX+aC5zXy1k3zN6Kh7Oy2DKhLW1ULGzBs2WU6n0XJOeEO9mqp/7REPQ1F3cKhOy6regQVOJLG0XL++jU/YAkzCTKOXj+50nyb
X-Exchange-RoutingPolicyChecked: 
	UANsr/t4cCfnifegRnDvFJQz7w9T1TV9JaqReOnd3PiDtf//bdl0HFg71on5j3P2l6EHTyhm3sUirpGDrTNt/+mtGgRtNGb/UMq6WNPQtZkiv1HizeVMuv9S69zW0DfSRjAhvcWqcSymZRpWOSoZmIaCfdoamoC9mJ6hDmrJn3slSfw7D8jeglG+K/h6I5l+PYTSvLpBkpxo/wvhDSzZ3d/dC2rkuigaARFQw8+2mRWgT6wjhfUWrQS26GtpCdA0DXlklOuseAm8ZtD8RVvlDigfPPOcjqwoIzsaK+cZFPlYfCYn1Z6cOi+X8i4q58f8esMxgyRTCDvbbtX0vLqwAw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:07:29.9230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebaf128b-30f2-47c5-636f-08ded2d3dbc6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5916
X-Authority-Analysis: v=2.4 cv=WrAb99fv c=1 sm=1 tr=0 ts=6a3d5247 cx=c_pps
 a=qHW1pi9L+1RZ0SKNcL3CYw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=oFFstam5h-teIRs2jbwA:9
X-Proofpoint-ORIG-GUID: jSDESvhKDBJQxcb66uJ-yLFguHIM8Cd2
X-Proofpoint-GUID: jSDESvhKDBJQxcb66uJ-yLFguHIM8Cd2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzOCBTYWx0ZWRfXyyIvjwGEEH+j
 ahALB0a72AnJZtDpBSVIMZLGceYCUDObqx9q8WiUdtqm/TCaTRjA5BiGnwKUwNy72DoKV2J8Bgi
 kgCDA/fRET0INYGnD7bfhE+IMF9M+IE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzOCBTYWx0ZWRfX71H5T0VBj7Kr
 QJgf2d/bpO22sTFDWwq+Ggeei+csRJAISokbQ21e4+f3TmGkgH94F1rKAiBTYUe8jImCvdpN/P3
 rVhFkkJxj8qREOohdI+2O4g8kvuOZQWJtjR5Ds5a4PGG4Abi25xxZKqhYjbTgbbYisPzflqE+fA
 m5DOuqUdR0z7bQcmlbkoxwElLDrFsYIhNNYpgLvPPq3Dftu4l8yM2Mjv6N2jTHf/FJs/EQRmaqa
 iGCMnKQhSx8oEM/u+6YVSp9feDrTRwry4Sitoi8QiBS6tLIF/YvOk45tK95BVmFh7Wb0mfgMIi9
 7RRIkMRv9Vt4EaX+7gZYw2FMKGwHZ4kYt3f8sr8bM34gNUBLAOtdQ/tjcKNP95ynnLby/rOXVxb
 j0Louet6uelZnn63qq+GCCif6G1mBI242IKv26k7w78nbqWp1ema7AcjGul3w06QWchjc7XWrXi
 NrwDfn/OIOSP6qJB+6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250138
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jun 2026 16:07:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20093

This was a build dependency of IPUMM firmware which is now removed.
That was the only user, remove this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v3:
 - None

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


