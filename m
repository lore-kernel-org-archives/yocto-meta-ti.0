Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E224C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 18:30:20 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52043.1782930615440750335
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jul 2026 11:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=iMMURWGM;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=GXPcxCrq;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GqS0H068108;
	Wed, 1 Jul 2026 13:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=SUiKbzVhFoyrz
	7kDOQPwY0Q8kaHLc4aIYJbwWMhaiiU=; b=iMMURWGMCx8irJKw1ebUh1bvDo6/O
	ll914zrnpgmVthmuMK/NnVArcMolslru/oqn1clSx8pcBhnNj9YffV46/vcPbhad
	inzFvf7L2gmWLdsTja9lqxU3kPKW2CQHyNhbzM/BC0/cbKOE/9LX4I32bC9lojw9
	9xMM1Dx2+2D6SxlPYecU2sd/mnnqChaTlGBAhSe9cmIJbmjJ4N63C/p08GkiOsul
	hkHJvpLPPOqef5aiFNK3h2vZGzjx7nH27U9yRLwDjj0y9xiao+BV1RsTiAgrnPLH
	ySIbhdKLfjVGJpXyq1gZbyrrRE5JFV3AIHEcopNgFfqM8LWCdVL3MW1hg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f51vu2rcf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 13:30:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lU9EFe3RfPA/FLx1TR128CUAcJx8GKZ6wso/Ve8ht2sr/RsEjeI1P3QVYC0PRvDLoZ2huPqKbTgfiL0mYpw2GrsxeBVe+DIX7V1pUK/U7Xl8GKkhDYJ63u5HN0c7Ru77Wa6SalAT3lFX2DpjjDSBCDIkZU6kT65ox+DdGvia8Az2XgDxjR0odcxuCPbh1ttcGyzdDCmcLUFZwTjw0ohMjKF1JIZK8EmZEmDoyny7VdNgqXlW/zDRJDKUYaxNUF8sfaqPWK/YYnPNnhIKz5cUYBcdKd+BH0WqpakWbeFS4KWPi+kJeqSJcgpgCd7diQB2U1pL7fhvu9MJob6pVdcgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUiKbzVhFoyrz7kDOQPwY0Q8kaHLc4aIYJbwWMhaiiU=;
 b=XVZdYgbuHhocsJviDztBzTNe1ms1yGjJ9BZrNJ42DT3pVJe877Mp+kJGNB8FGxlaK/lACEUoYvgQQ9yvIvmsxRdUSLVdYyhajnQw6bH+fagxnc1N/bSkjaL2ubcw2GahUWJ0mcoCufDZrn9n9lCMqVYzJNgr9ixB7wZtmHVVJKR4ndHzBb6ye1Xv0ovpzfRF0+HYglCexNO5N6Rq6aMx4o4Y7TJwjTneiHv9/bDJt4mwfyiVF55Emj75UmUp2KDvxmOafebYCPEEu9EASFybdNNOBEvD8gk0cS7x0x2Vg7gSZT5Jrf3Qw97e57V+1NwcMu0vj3y/tiX5gY0UXf0kVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUiKbzVhFoyrz7kDOQPwY0Q8kaHLc4aIYJbwWMhaiiU=;
 b=GXPcxCrqoA9znRiZ2PIzF1lkq06guEcVcu+is+TtMygTQBgavcmCEs2hKVpNMd/TiivBt8j1XojJ4Ri26MtDyRq1GY9I1M0o0rdludDqDR/63bgjaTe5oC7f0dmhhDV6U3L3E9bBe3rfA57MfKMCUTbjJbgtuz3dODU3/3U7ABY=
Received: from DS1PR06CA0007.namprd06.prod.outlook.com (2603:10b6:8:458::13)
 by SA1PR10MB7829.namprd10.prod.outlook.com (2603:10b6:806:3ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 18:30:10 +0000
Received: from DM2PEPF00003FC3.namprd04.prod.outlook.com (2603:10b6:8:458::4)
 by DS1PR06CA0007.outlook.office365.com (2603:10b6:8:458::13) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9
 via Frontend Transport; Wed, 1 Jul 2026 18:30:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DM2PEPF00003FC3.mail.protection.outlook.com (10.167.23.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 18:30:08 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 13:29:49 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 13:29:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 1 Jul 2026 13:29:48 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 661ITmMA1433276;
	Wed, 1 Jul 2026 13:29:48 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <afd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH v2] libsdl2: Build tests with dynamically linked library support
Date: Wed, 1 Jul 2026 13:29:48 -0500
Message-ID: <20260701182948.1604031-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC3:EE_|SA1PR10MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a8ed7ca-e5f2-497e-5a4d-08ded79ec7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	DdDY458Qcm0RiOnslMbBsgt0JJskIoDEua4zIGP+OL1LkiDLqWz1r1p9zMjO/dETaQHvBlNyiPvzuGLzO0MeQAO1KdEQRMWpTnjGNqs36VKDxcOCoHg/6vPpfQZPuwpFyVfa3qlwlg8sGTYWUscpVUISNXnZQH6WkbjAYX3btblRNphyD1vzS0HPgNAzrZ4JLhqgHUsHxPhrAzY55HMHYFekU6T8ABog9sKtTQjTY6wPReh+aD/4hcAbNm4XtUzPzjp4DuJz0qSzs0NoFwxzFizCkak6t12Czd5ajzxrQpMZ5lVAOcp1xMoWeKuA+R7qU+kdVnSkRjtgy8UrkgYCg7DmLQDEfRmT1y+ly+/OctKrcFleBhyztgL6KByT1o7HGjkzROwOAvY4+MFzeHDSmEiY2OWUQ/5IAuISEWs4zlHrvIiVmFMAUVOzTyQ7/CTisa1+Zkemf7Ei0meDrUL7R+P4EW9qpUNNiOqUHY0E3Lf7tDXVe6BVZ7eK960n3WQxOngF4b2ZTcviO1Mz3bpXTHz9JcVcRfJPIAt2gv4QGBjc6aVF4B1VnmF5hQlLqSFUU6/C7L7H0iLUZqoaRmSFGQXaPfVBOVDNZOb6YFSYFlXyqQ4/j+s/L+HVgOe1af6q5dNgGLHOYVratMiGXo4Q3TpI5Edr+4LvlZOCYPxtv6UWwEu0IsatpDHU+v1RGulU5QZn1ocOPqAKB1AVSn1a5g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fO0/dNsPEhsLZLJ2pC1/XjpXIFuKBT4CHJMS/SbjguK+z6Ydm0AplOgt+jMp/9J4zfopIfPGuhaGK/kJnNO5jo25MYxuVEAgNV9U5Rvq3/fDo3EVL6EkAtgkmtaXJ3lyE3EJ/2xBCKZ/8V5BmE/fi987PT8pKjEye5NYYf4zrNdGbbRtHo/SYYRqCE6R1X9wK9DlBCebh/sH8eEoBxzJsw6q/rFxxqKeOD1E1Y+x4BLrCGzFQHNAodUU1gJ1kkPjzvAKodJUWlgqz1ZJMte16XUz5ijRb82c88Z8fnQEVunyzx80k+GFnFabuTWA8/Q0FqUdTzlhnJHbC6f+rF4zqk/sE+ET8qwaaLx3dAs4GOe4s52aNs++yDEEuSQ0vRJKSXf11w4QwqytWuS2vgrdq2o8bBEdunr/CNGRCqe8DIIOXa8eQgkL2rpYxuX26LR0
X-Exchange-RoutingPolicyChecked: 
	rs6ZlnAH3g7msXU1dkN/pq24NFp0TD7SOAFsC67PI+6r2B1cPALyPuPNThIANH7uY1jlqha56mD7fd9Nowar2npd3U0HJ09OgGBudUBK8xTIkL3v1+9dCvhC7ek85UfL7uHYg5d0KiMDiDX1xIsZMRoBwBDzDCBPptr1R4eAfiLTPoX1b8oVcI1hb/ugBFUtT8sGlETuAkPajwkibVA6891QFykizC7Uac9ukx9u4FDx+H5V51bAwYCylT0F35dgLFn0dfu+foaWvySk0w7q5fAliJJ665csIZLqQZ1Q6o8ZDbV1rOvErPwiD5EbpEFTjpFo8j8EW5y0XW1SUCuMmw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 18:30:08.6930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8ed7ca-e5f2-497e-5a4d-08ded79ec7ab
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7829
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE5OCBTYWx0ZWRfX7BDlhSdcQm+p
 k37bDdzWXR056F/tO+7e+WisNMcggh/65ruFAar9OI7RRW+cQ637l/jPodENV7yhyrPOLXI3y3g
 pT1QgxygyDscxj6dIS7PSN3GiCdzVsx5oj4zS58+tpGqlPeQ9GlcRclCKudZNvTwd7QZgnuWOo7
 +LCt5hroM1TurW5zbKG/RPVh4eDkcGAj+2QqWRS7zwIaQTCh244h/BPFaTNmi59J1R2HpeK68OK
 jIdKQEeU2X1pbr2riSD7VbV0OXZDxC1KrpLykWu8seA3QyWy84gmYuXnbRrluWhhwoCBkXmG5fu
 SIKWBAkZLMvHA2EK+t/CfVdFZfMBm/W4+F7MUrd15+DAk3W/QWHrMAJQgsPlWIQuZ7fYQyWZpGL
 RRJVYQHqrs/0F/EgMlDaNMApCat3XSbEoY6TjFiQkNbIXwmXZJmkGUFXo2ciNwOpw9KOjDYBDWg
 QJ3rTZbbaG9RSIYLTwQ==
X-Proofpoint-GUID: cGxwMPYfNYbHKyJeHDc9KZNOX24QPIlh
X-Authority-Analysis: v=2.4 cv=FYEHAp+6 c=1 sm=1 tr=0 ts=6a455cb5 cx=c_pps
 a=MRNWLIXgA5QtCoQasNiLPg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8 a=xog17GJtbzfqihLh5lUA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE5OCBTYWx0ZWRfX7Tp2IqoR56kd
 3lAPjGW67OPeHI8O+hGaBvmy0C6Np/dlajz3DrBV+8TGsxzXUSyx0Icyqnw7epQBh7jP5VYLaEZ
 dRW8zJhmWeGughfRdl+IhmzmAzirgzk=
X-Proofpoint-ORIG-GUID: cGxwMPYfNYbHKyJeHDc9KZNOX24QPIlh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010198
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Jul 2026 18:30:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20115

From: Antonios Christidis <a-christidis@ti.com>

Carry upstream-submitted patch that adds SDL_TESTS_SHARED_LIB option,
enabling test executables to be built with dynamic linking against
libsdl2.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v2: 
- Remove unnecessary RDEPENDS for tests package, bitbake dependency
  resolution automatically handles this.
 .../recipes-graphics/libsdl2/libsdl2-ti.inc   |  8 +++
 ...TS_SHARED_LIB-option-for-dynamically.patch | 56 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch

diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
index 33ff0632..3aa566c6 100644
--- a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
+++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
@@ -1,5 +1,13 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/libsdl2:"
+
+SRC_URI:append = " \
+    file://0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch \
+"
+
 EXTRA_OECMAKE += "-DSDL_TESTS=ON \
                   -DSDL_INSTALL_TESTS=ON \
+                  -DSDL_TESTS_SHARED_LIB=ON \
                  "
+
 PACKAGE_BEFORE_PN = "${PN}-tests"
 FILES:${PN}-tests += "${libexecdir} ${datadir}/installed-tests/SDL2"
diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch b/meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch
new file mode 100644
index 00000000..234092a2
--- /dev/null
+++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch
@@ -0,0 +1,56 @@
+From 96512412805f34ac6328290221c7ad83cde342b3 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Fri, 26 Jun 2026 13:28:24 -0500
+Subject: [PATCH] test: New SDL_TESTS_SHARED_LIB option for dynamically linked
+ tests
+
+Introduce SDL_TESTS_SHARED_LIB to allow tests that expect dynamic linking
+to be built.
+
+Upstream-Status: Submitted [https://github.com/libsdl-org/SDL/pull/15907]
+
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+---
+ test/CMakeLists.txt | 19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
+index 288645d73..8e5bd68d3 100644
+--- a/test/CMakeLists.txt
++++ b/test/CMakeLists.txt
+@@ -87,8 +87,17 @@ macro(add_sdl_test_executable TARGET)
+     endif()
+ endmacro()
+
+-if(NOT TARGET SDL2::SDL2-static)
+-    find_package(SDL2 2.0.23 REQUIRED COMPONENTS SDL2-static SDL2test)
++option(SDL_TESTS_SHARED_LIB "Link test executables against the shared SDL2 library" OFF)
++
++if(SDL_TESTS_SHARED_LIB)
++    set(SDL_SHARED ON)
++    if(NOT TARGET SDL2::SDL2)
++        find_package(SDL2 ${SDL_VERSION} REQUIRED COMPONENTS SDL2 SDL2test)
++    endif()
++else()
++    if(NOT TARGET SDL2::SDL2-static)
++        find_package(SDL2 ${SDL_VERSION} REQUIRED COMPONENTS SDL2-static SDL2test)
++    endif()
+ endif()
+
+ enable_testing()
+@@ -247,7 +256,11 @@ elseif(PS2)
+ elseif(IOS OR TVOS)
+     sdltest_link_librararies(SDL2::SDL2main SDL2::SDL2test SDL2::SDL2-static)
+ else()
+-    sdltest_link_librararies(SDL2::SDL2test SDL2::SDL2-static)
++    if(SDL_TESTS_SHARED_LIB)
++        sdltest_link_librararies(SDL2::SDL2test SDL2::SDL2)
++    else()
++        sdltest_link_librararies(SDL2::SDL2test SDL2::SDL2-static)
++    endif()
+ endif()
+
+ if(WINDOWS)
+--
+2.34.1
+
-- 
2.34.1


