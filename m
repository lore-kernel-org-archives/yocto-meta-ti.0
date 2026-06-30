Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73924C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 17:43:26 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27249.1782841402478755639
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 10:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=nnmMww+C;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=rxF8fmq5;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65UGkcUX1053667;
	Tue, 30 Jun 2026 12:43:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=S5ogzsYmuUoc8
	6MQH2r+8nkSh14GZBOC4myHM24761o=; b=nnmMww+C5Pg8KIZ1LaKnwMFUWef95
	PK5u+XJ3XDTr2BcWtiVd7FuDlSV9WQcMzYW4fT0xDbltWYGAqMO1KbWZ3Bvi/rxu
	sh6Ko6x4SVfgK5whEMimryVfcz1z54PrYfB8satXVIc0GGO/Gqg5ep4qpGgQxBeL
	HnaejhbyAx1SBVAD3t8hxYNiTJoKEihVsasPd9aU09rJ0gyZsifPU7EfjPYYziaD
	ETt/W23nJsnv6lcR6MJoTK+L6kHVp5pZnbtYXlGEaJPOGGTsg4fa2UcOebDJvSG3
	JyU9yfgR6cRYDLAUyr4InHnfSZ+f2GKjizO2E863uvTOHGAMfGXvd168Q==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f4cqja7yq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 12:43:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ha8bJm0O4kguc+mbJBy+h8nVOLj25RceyeiHDfwzWv8hhxVjzV3IGZ9bmgmxwll4ZE8yxG0ght4sIWobhTPm6tH8ZFuTHRwyT3+IBahivlgSFJx1AIPJLDBWk4oMDIw4JzoLU21+Qu6TlypZXECPdtr4MOAnJ/3vEO2BCjeOf2et4v4lmmavqn+WCtdxLcX6OEos/99LPZ3YI7gAtkJjCUh5Cf8GOk01kABJXz0JkifQKcv/iCTW6maVy7D8c8f2rKsjtLnhT71hh5NE2cjqJZRVkJo67G1tPpRUGp4J305tQAAa2bxrxvpCWRAm4EIJxaVXfGbIS2//4nuv0DVjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5ogzsYmuUoc86MQH2r+8nkSh14GZBOC4myHM24761o=;
 b=WL/5ya+iW7CXvvPy1g19FT0H3FA8y+4v4o8XSSVrxCs1NL8gfL2QEllFd8NHFEzMEP77Zv3hhtHGEskd+xRHon/1afwdhmkKjC61kx8oHWzClCKwecjRsG3cSPYiWaNAMJwdDI37uNB8aP7jk2tCFQBZa7ztbgU4HPNFgaNta7DFKn6hp94JjzLYQea6O0DsVtaoKXxmiDXt2xqwUo8TLrETqvnQen2UEMGzU88ISD+q5dRESFB5kIty3O970XzH6TxVF/GViLq9+g4G4ZP+16IOF6QctjwOz/SgzZ2d3TgrqmLAeMaE2fNxc5LPUTHh6pCUj9ztoj0IG+x6fzvoEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5ogzsYmuUoc86MQH2r+8nkSh14GZBOC4myHM24761o=;
 b=rxF8fmq5eq5t/yj/FWLTw1atkKDEfjgB7klC0TRj1ynWaNz2eZ0vrbUQQ4CcVe1Hl8YojS84FTTqWrWCY95mQt8Y63Ak9EHSFA+WOD2kIiD01boS/TSaL18fTi4As1rGJC4SYuwV6sEVRdKD1lNhNzgE6OrFuUDxSmmqRPPbuwY=
Received: from MW4PR03CA0086.namprd03.prod.outlook.com (2603:10b6:303:b6::31)
 by LVUPR10MB997810.namprd10.prod.outlook.com (2603:10b6:408:39e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 17:43:16 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::42) by MW4PR03CA0086.outlook.office365.com
 (2603:10b6:303:b6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 17:43:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 17:43:15 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 12:43:14 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 12:43:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 12:43:14 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UHhEmY3052799;
	Tue, 30 Jun 2026 12:43:14 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <afd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH] libsdl2: Build tests with dynamically linked library support
Date: Tue, 30 Jun 2026 12:43:14 -0500
Message-ID: <20260630174314.1561862-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|LVUPR10MB997810:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc612f6-0a3c-45c8-3d62-08ded6cf1056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	7wLEEPO7I4FiC9inoFtNEQ4e4MT4/G5eDGNaa8Y94tW+E2M9GfzQzCKP1kiXxI+oPEo/3aT7qREJc2CwX4wvFuy5hM0jR+EGeb4RgPPnMaO71Wz5n/LUSTSYQtUwcC56F4CugN7YfqdBPL+1pVv32TWJuyNOJxvWOWKEgRaa6N9gJU+POOOjM4G+GgUyo79xt27wULPgTMzQdAlJ8tQnBFwI1wRwYCZVyPuhtH0ImeWR5NKfm5rBTNfk7jNxYdpOxWDClHNJM7ogftf1q9/jyk23Qh3N9wN0Z8f3AwMMp56yFczZZj2dZdo5bCJQQXFifjU3KLTUNlXF16ecVUSw4SUzDBaRos+tw6s9F2YKsqRd93Tj8VXTBwqpkJ2AcbDdtfAvy5zr/1IOwwnHQob9qu2K/We4guD5Bm8cLB4rH4rahG7J749zsPe0FGGXrsm+WzW3bV8TsbD+0b/LTkyMbIVsY8CAqJj1Am08SbGIfcxtPRRBrX4rjScSGNDop+8AKNEPNojTXVUHypfMs0kRte+imbVo7tjH1cyhlPbawLJXtvynioM9kxFKUR8NSZBBejREZJc5TIyV6zsnXoYuw9QN7NyzpEGcaRD3AAaUY7lIjz+fX3Ug/f5rGmPeB7Iz4TiqqH//fDrp9L41XSJLdiqButcfHJuN1E4NPxDqoYZLC7p1bJzbnfxVpHGz7449qiG96FryYulXCnsam2oQeA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ezWHlvieSZzAlpaozyC1NjC0y7Ujjl4VRoEAsLF8vqSkCCskISTtNTxLSGyRLgSSArcchdfWx0lnHly+er8JKJGVbHpFJP72Wks3+QaqMDrVVHE2vh5cwJGZZ+lKVY/VCgvtj/Gh4F/3g7l+hp/zdjrnRl/mHuqFkco+e7xBI+qV0WWl1//oeOOT6pHiyffX+o9uAQ+mn959Cmv+lpKUZiBGLJl+OUAvJHclY5ZPhb1+P0JvIPJ6IOPhhgGRd6brypG7xWPqeOMRS0qr7SK2nUAnfKiZ3MeJ3HlaERMrD7DHGlRz+YOTt0x+qq5CGkelsiwBpkXjonYuVnFgv9y8HBxNZTJA7y9OAj44bB/I4a1VboEyMegABWkKaCRp/SfSy9/io/uxjV7tDFec8nYVQKL26u0BLUnpHJE1w6XQypzD3RaEULse8JQmo3vwC05Q
X-Exchange-RoutingPolicyChecked: 
	ItGEpugEluMlNvlrJkfU/9FzCqYmaGD31T+pfRve9jo5Rl4qvpvfbSQsWK0AVpApO0QmmbNkTzwvLAythDBwvDUh1dCu0vwQZdFfHTjMmF59NUaM7OGLBwNrRbkcOMgCYwwtC3LfdAV80/ubnt5XEwwsjJmviRErJWCgglRXUSCssnp0yWXfDv/vNZVNo5Joj+OIsO/YIfS5ObPsqov/sT8pBPEc5cze4C+h8CeL+T1vg211G8zCQwPv6kpuaTNtcqV6TiwhIavzxWJVd5VlTHAcjtJNGSqJGpsDP4la47Sekp5nzMxvIIFUVwisOc6HvQMB2wnuHS+e0u430+5B5w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 17:43:15.2569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc612f6-0a3c-45c8-3d62-08ded6cf1056
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR10MB997810
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE2OSBTYWx0ZWRfX9GcSFiYAkkZ3
 dT6xy3lQSdnK43lWIy1+CAmkagFr2Bk5fV0EZMvE3gu/3e2hnhW2S6dG/GcUKgav0jcrgv+R5pG
 yplJR0ecfMabuou8nvqEIpXeReubyz3bdSDSKmeeUYZHJZRnoApREEObR8jBUcIxZfgmATKz1jB
 EvETFcVGDzrjzbNxIeYXYCGCVzoRQLgBZYVh7Mobyycy6zrTbRzWAIW4V0YpB8KXLO18rCzkolW
 OmHDWMwGPPSCUp3B0M2engnbj4MJT72E6JIHJThrVcYZtrYEBCqt9pL7CHsfZqZSmP+UmMIZ/yK
 DFHCbFmOQm2X/jRcOkQsGW/aYQPW2/dqBztkoSk8Fu1nY1cFqLK8jTgKrODw78Enl9zh7p9A3eU
 nyIxHJ1nUJip07Q7kAQQd/FR/jps8zxqxkK7dROWNGyUoFYvpjorat3VSib44n1aHRH75nObmID
 cwVXAWGV5P61yZBBTPg==
X-Proofpoint-GUID: mW_vUDJQgSe3tY7EGTAUCocOvhVVAlYc
X-Proofpoint-ORIG-GUID: mW_vUDJQgSe3tY7EGTAUCocOvhVVAlYc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE2OSBTYWx0ZWRfX/yjc1NrbMAYQ
 hKwyVjdm0H/nko+resbQo817l0h+U95WlK0kMnGsJXAMLNCF8H+aim7ROqGkXepWwETTWJfXAee
 n0BfXk5MNf78K4IXL5X5ay2aKzLaPbI=
X-Authority-Analysis: v=2.4 cv=M5N97Sws c=1 sm=1 tr=0 ts=6a440038 cx=c_pps
 a=alg3xCnYRXnG81SgvFS1VQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8 a=xog17GJtbzfqihLh5lUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300169
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Jun 2026 17:43:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20109

From: Antonios Christidis <a-christidis@ti.com>

Carry upstream-submitted patch that adds SDL_TESTS_SHARED_LIB option,
enabling test executables to be built with dynamic linking against
libsdl2.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../recipes-graphics/libsdl2/libsdl2-ti.inc   |  9 +++
 ...TS_SHARED_LIB-option-for-dynamically.patch | 56 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch

diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
index 33ff0632..959818a1 100644
--- a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
+++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
@@ -1,5 +1,14 @@
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
+RDEPENDS:${PN}-tests += "${PN}"
diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch b/meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch
new file mode 100644
index 00000000..cc435b3a
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


