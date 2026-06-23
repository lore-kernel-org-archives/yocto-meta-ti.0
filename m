Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CF6CDB47C
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 15:04:01 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23165.1782227032941747656
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 08:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=U5HtbuOl;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=a4nRvHz0;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NCkEU01748500;
	Tue, 23 Jun 2026 10:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=v/KeIWvu9tLoUQQvv9s34yG8hXV+AMC/s2jkwbXo9
	NU=; b=U5HtbuOlkFq9M9PTenQp8FP3ucQpqbqVLFCPgxxXFU/bbOsRvUudOK9W+
	Y6CBUuhb7eGAGj9hpN64wWJI6q6BYcEkaaYnxnjoU0XqXr/V4g7wx9PamzRFmySl
	vMzcHc24+Xjy4s4ADdaWZkl2adQHrlqFEvA+GMomV8H87l+xY4anGrb8OFmrtl1o
	O0RTBwVnd8ylZRKgAvCpcLJLqbfei4Nd4bJXCvxEbxeOqBpipv8+W9+m7cPKjEya
	OlNYjdbWBJjTKRwcneWeGew/82SWh0vHA0BUjmRT/9iWXsn2etXsG9HRuOMQF8A6
	eDn83YKX0wnkRskxGwIv4A6JBglQA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4eyten0x19-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 10:03:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpXWufqHTkP0NYejcF/JT4gVS3FfvduRSdedD1aEVDcJsca1ZbTbKMxsWuhTgwQXaQrqzrqNXK9O2xVbtk5iqGuDXfdLnefm8mWSnosptgdDqReW0zGtT/6JikTCv+ULgvDJt+SjCb84/mN2sBN7/PlFPuS4f8XJU93l56KbW5nb7G3T2BsGre3PSGp89qgFGw0mKexjP5lstV4aRRW4V9u0O0Emm81A5Q+FXIFRkTiHc8+XcGvmqjt06JzLQMi9I6uII4ub1TfYtHz2qx1m6/w88QqeaZFSt94/pgkoLXBJjXcFA/jz6K+V2A+0GE/nxmSV+g4aQSD3M1zuin9Cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/KeIWvu9tLoUQQvv9s34yG8hXV+AMC/s2jkwbXo9NU=;
 b=GZ3CKfua+YNDCNBuSmUyKTO4550/IPbprma/eMIf/atyRtiRt/MRNKE6nUIKET0+1CiWZTa3jtbNAzaPz3J58SqQsvBtzz3nI/Nc84E+0E7YkLmVwyPDoEF3fMeiEeuAz+sJT+O137qnKzPIdXe0nsLhkhA7372eWI0akBfIQruPD4RZsagoNCzGIiFsAzaI1NGAoltXnT8SWND6CUVif7ic2n0cefQGhdFqwLCB5O/986F9tvw///azs+fa/mVjas9zbzluGEkyIO7M+kqneSJ9NQDvsfAQtvfloaR2dUx/FPPG+sV1j+S/VLSopCYMKqOGT7jg+p8hrekFTlu2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/KeIWvu9tLoUQQvv9s34yG8hXV+AMC/s2jkwbXo9NU=;
 b=a4nRvHz0q+/MAgY0SeKtls6z2whVY2QlNtUZQckVkqoWL+MBaCsj/JfSvHlV6Eb2zxDONQGVvGmIiNQUEVHon+zWxFLVsD/U2Wtpn5uMaKVTD60Iq3Tm6X0QveQCaed10XIDrUNsrI0+zj2m2N5rMxFYOYdm5PVmFWbpqkphsq0=
Received: from SJ0PR05CA0152.namprd05.prod.outlook.com (2603:10b6:a03:339::7)
 by CH2PR10MB4246.namprd10.prod.outlook.com (2603:10b6:610:a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Tue, 23 Jun
 2026 15:03:47 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::47) by SJ0PR05CA0152.outlook.office365.com
 (2603:10b6:a03:339::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Tue,
 23 Jun 2026 15:03:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 15:03:45 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 10:03:18 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 10:03:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 23 Jun 2026 10:03:18 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65NF3HQH2517274;
	Tue, 23 Jun 2026 10:03:18 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH v3 1/2] mesa-pvr: Add versioned mesa.inc copies from oe-core
Date: Tue, 23 Jun 2026 10:03:16 -0500
Message-ID: <20260623150317.1127756-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260623150317.1127756-1-a-christidis@ti.com>
References: <20260623150317.1127756-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|CH2PR10MB4246:EE_
X-MS-Office365-Filtering-Correlation-Id: a19c80c6-dd71-404d-ed54-08ded1389f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|22082099003|18002099003|6133799003|3023799007|12006099003|56012099006|20052099010;
X-Microsoft-Antispam-Message-Info: 
	5VQTOzB9RU/v04nudMd4dljkhH89rSG1kGDt7DCNtZGD77XF26XHd/DLS3r1+tC+I1C1ZEIek+PJIaBB/CpYEK+QyFeaFkvN+/faLM9Zaq13ji+5U5afSj8QafpkGRf+qWlB/j9dCs41y404pI6vjYll3LZ+IuFSL3PlVjxMzys7qn/RtB3pfXaqqWsHaJr+KpDWODm3XVtIjW9TeGOfKobsAZA1F4fBkGBZthQ6HOU81mKNfam8fePSDLR8qY609RZBvQdQso+izmtGy8pfvSvys1FXSvryw154b1FxJqeT42S+LgzdkKL5YX3TPTX98wqgfcV3bblXLh+JVkK/kUbHMhxItzTkY3QuH20mICpbVgkWD2Ts+16ytmm2OTgne6EuwAwoD7cEO+QktfkuOV96XaTAb1QxIRK1HkXr7SDbgpQezxlTApmfuo6BtuhAhf2Lg4aZueWklRE+KmRj8n2nMBZx0JDepibpzh7ykyoyOIjg714fDgEdahTCw0ETT/AGM3hMuWXZoCwOKchKBKShCzLZuxSZTwNbMO8eJIT+r7chbxOrUhGUhmhDi1lisVmgI76z7UHNgSSgcqk0aI/Z6Z3ZwMb+p0HQgi5TbWHBq0YhonbjtDLaRO7SzYmiaWB5yj/5OsxSbd+9XTgegg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(6133799003)(3023799007)(12006099003)(56012099006)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qdJ9k2l1+1ffVRSY8pVndk95sLjJmftDPkAasBYb/e1kA656rCr7ilAh+Wnq/YivTwBwcsnFdfVHZp/SjGuVYLK1fOa6XHEm8YzRJ9/NcNZtWFl0jR0tN60MIbmj9c8oFIw6P0fz1vg1A8N8FEzLySmCK/vwId2NAsZpWZ8UuzVd/RzHA78RVG5OlqhKYH6Fd0TdxJi9ROHUp5TkAg7X5Ip0il6aFNdM6sLEAvORrPOz17meKkOwHe9mxn2tKqoJJlOuFvGJW1d/PbEcCz5hgUvJtL1Oeg7BAkaGw5kVbtJghWYGOtSjuAskNybuLf58FlQff6pzgBpr398WdXBDJMc2SOtYqlYONRpL66OyAMN9sEsiz1xsmHrUZpSw9tEzS+QCvW269RmAA+pGCU4OlxmEQ/i8DMssQW27eZCBS+s0kHz8Ecj5TrcFN22HnQyJ
X-Exchange-RoutingPolicyChecked: 
	jjruDuKzILn0CW6KR7wF+Lq0vzTlFbOxTSiqWFUZpQx9bq1rA8Et9r5U+zRG+SfdZ3DFmeiJMr6PTN6reWWbly8BugiZuL7C0y6Vs1hKZ00kwPhB7evv6a46U1KB3W3XfmNsxiyUThgvXDv6hmvH8H54bGqKst3hwSVoHsiUjHjxR/s8PM9B0cNDttrALDE5IZc/6H5eolCaux8XUtMVi/bbK65o+rF2jb2+PVPEpvHiwjv7tPDtyFeNkxeb8Xqe96qWsD/ROsGLSvmthaiwQZR2LwlAcNcqFXSxqzCIdW8nu0YbmTxjdix9daCAzppwfe0o/2F+GOxh82mLiC59jQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 15:03:45.4756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a19c80c6-dd71-404d-ed54-08ded1389f68
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4246
X-Authority-Analysis: v=2.4 cv=eO4jSnp1 c=1 sm=1 tr=0 ts=6a3aa056 cx=c_pps
 a=E+RN6GuJaivtKjsQX17oSA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=ZpVaWaFtAAAA:8 a=e5mUnYsNAAAA:8 a=sozttTNsAAAA:8 a=FMMBZH85X-gz1HqPv0UA:9
 a=5tn4MO8azEBWFjlAA-rn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 0pZ2HsByzh4nbFZWl9560N-OgxRCH9Fy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyNCBTYWx0ZWRfX09vlLGua7a/7
 1CLfI6XVEnc3z/2BFbRbyzxijcGMy5GsvTdCuV4q/S7PWdQvvuQiZxTb9p31kf2xCxvxgYxP1jt
 oQScT7KNDbdy9Ycd2foYx/MqXAlP2HdSmK55UhZWJPkEWGqnzlfk9gSXL4171Q+aHErs95VT35K
 kkkd10i/VG/pmhBIc257fwl5CoQx4J3jp76XtM401+C9V8JX18SWyeCR/eJI5mLCN6pJA4xsRHW
 eGxU8x5mlEL+LxPe+ZAFCn0zXVnCBy2oxuSW7lL8zljdrQEQAMYObFHZ6+vuhZlD6OKGKv9ijjS
 v03TYIJ1R0gS2oQcoTbcUAJQOZ2D8tEzlGauMkR+FpA3zQ38AWLtRsllnGacvFhRFg800aOaOlT
 DeOhi/4Dis94s3qFYFxVLs9JVDi0ikqQZVajybKWjcwsP/Td0yPx8GUHUQP/0WxIeK8TqZrpreE
 hP9wzmljDj54BFwJabA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyNCBTYWx0ZWRfX8bT0+rC2Vell
 44NpLkEodaqNtasACcAMvIn51Seiv0qE/IYemuHLp6r75C8pjPogz9aXJjvOmQO0rUky2+vSd3C
 +c5YFXLHscp7P1bJ7HoPC49cYd330B0=
X-Proofpoint-ORIG-GUID: 0pZ2HsByzh4nbFZWl9560N-OgxRCH9Fy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230124
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Jun 2026 15:04:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20055

From: Antonios Christidis <a-christidis@ti.com>

Add local copies of mesa.inc from oe-core, renamed with version suffixes
to avoid conflicts:

- mesa-pvr-24.inc: verbatim copy for v24.0.1 (existing content, renamed)
- mesa-pvr-25.inc: verbatim copy for v25.2.8 (new)

The "-pvr" suffix follows the v24 naming convention. Major version numbers
are appended to distinguish between the two.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../mesa/{mesa-pvr.inc => mesa-pvr-24.inc}    |   0
 .../mesa/{mesa-pvr.inc => mesa-pvr-25.inc}    | 353 +++++++++---------
 .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb  |   2 +-
 3 files changed, 168 insertions(+), 187 deletions(-)
 copy meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr.inc => mesa-pvr-24.inc} (100%)
 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr.inc => mesa-pvr-25.inc} (50%)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
similarity index 100%
copy from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
copy to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
similarity index 50%
rename from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
index 5ce93d27..af674c83 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
@@ -1,5 +1,4 @@
-# Copy of mesa.inc from OE-core before commit f9eb0468e45e ("mesa: upgrade 24.0.7 -> 25.0.2")
-
+# Verbatim copy of mesa.inc file from commit 2c0c7c3e5b71
 SUMMARY = "A free implementation of the OpenGL API"
 DESCRIPTION = "Mesa is an open-source implementation of the OpenGL specification - \
 a system for rendering interactive 3D graphics.  \
@@ -12,24 +11,22 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10"
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=ffe678546d4337b732cfd12262e6af11"
 
 PE = "2"
 
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-           file://0001-drisw-fix-build-without-dri3.patch \
-           file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
-           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
-           file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
-           file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
+           file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
-PV = "24.0.7"
+SRC_URI[sha256sum] = "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
+PV = "25.2.8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
+S = "${UNPACKDIR}/mesa-${PV}"
+
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install:append() {
@@ -38,25 +35,18 @@ do_install:append() {
   if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
       sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
   fi
+  # These are ICDs, apps are not supposed to link against them                                                                                                              
+  if ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'true', 'false', d)} ; then                                                                                             
+      rm -f ${D}${libdir}/libEGL_mesa.so ${D}${libdir}/libGLX_mesa.so                                                                                                       
+  fi
 }
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
-DEPENDS:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-native', '', d)}"
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
 EXTRANATIVEPATH += "chrpath-native"
-PROVIDES = " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'virtual/libglx', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
-    virtual/mesa \
-    "
 
-inherit meson pkgconfig python3native gettext features_check
+inherit meson pkgconfig python3native gettext features_check rust
 
-BBCLASSEXTEND = "native nativesdk"
-
-ANY_OF_DISTRO_FEATURES = "opengl vulkan"
+ANY_OF_DISTRO_FEATURES = "opencl opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
@@ -74,141 +64,141 @@ def check_buildtype(d):
 MESON_BUILDTYPE = "${@check_buildtype(d)}"
 
 EXTRA_OEMESON = " \
-    -Dshared-glapi=enabled \
     -Dglx-read-only-text=true \
     -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
 "
 
-EXTRA_OEMESON:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=system', '', d)}"
-EXTRA_OEMESON:append:class-native = " ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=enabled', '', d)}"
-
 def strip_comma(s):
     return s.strip(',')
 
-PACKAGECONFIG = " \
-	gallium \
-	video-codecs \
-	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'dri3', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
-"
+# skip all Rust dependencies if we are not building OpenCL"
+INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
 
-PACKAGECONFIG:append:class-native = " gallium-llvm r600"
+# "egl" requires "opengl"
+PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
 
-X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
+# "gles" requires "opengl"
+PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
+
+PACKAGECONFIG[glvnd] = "-Dglvnd=enabled, -Dglvnd=disabled, libglvnd"
+
+PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
+
+# "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
+# Be sure to enable them both for the target and for the native build.
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang"
+
+X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr xorgproto libxshmfence"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
-PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
+# Entries for GPU vendors.
+# Some of the drivers might have extra dependencies (libclc, gallium-llvm).
+# Check them in the individual driver settings in VULKAN_DRIVERS and
+# GALLIUMDRIVERS.
+PACKAGECONFIG[amd] = ""
+PACKAGECONFIG[asahi] = ""
+PACKAGECONFIG[broadcom] = ""
+PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
+PACKAGECONFIG[freedreno] = ""
+PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
+PACKAGECONFIG[intel] = ""
+PACKAGECONFIG[lima] = ""
+PACKAGECONFIG[nouveau] = ""
+PACKAGECONFIG[panfrost] = ""
+PACKAGECONFIG[svga] = ""
+PACKAGECONFIG[tegra] = ""
+PACKAGECONFIG[v3d] = ""
+PACKAGECONFIG[vc4] = ""
+PACKAGECONFIG[virgl] = ""
+PACKAGECONFIG[zink] = ""
+
+
+VULKAN_DRIVERS_SWRAST = ",swrast"
+# Crashes on x32
+VULKAN_DRIVERS_SWRAST:x86-x32 = ""
 
-# Vulkan drivers need dri3 enabled
-# amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
+# keep sorted by the driver name (rather than PKGCONFIG)
 VULKAN_DRIVERS = ""
-VULKAN_DRIVERS:append:x86 = ",intel,amd"
-VULKAN_DRIVERS:append:x86-64 = ",intel,amd"
-# i686 is a 32 bit override for mesa-native
-VULKAN_DRIVERS:append:i686 = ",intel,amd"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',amd', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
+
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
+PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
 
 # mesa development and testing tools support, per driver
+
+# keep sorted by the driver name (rather than PKGCONFIG)
 TOOLS = ""
-TOOLS_DEPS = ""
-TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
-TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
-TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
-TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
+TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi', ',asahi', '', d)}"
+TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
+TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
+TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
+TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
 
 # dependencies for tools.
-TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
+TOOLS_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
 
 # the fdperf tool requires libconfig (a part of meta-oe) so it needs special
 # treatment in addition to the usual 'freedreno tools'.
 PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
 
 PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
-
-PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
-PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false, libglvnd"
-
-# "gles" requires "opengl"
-PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
-
-# "egl" requires "opengl"
-PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
-
-# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
-OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
-PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
-
-PACKAGECONFIG[broadcom] = ""
-PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
-PACKAGECONFIG[freedreno] = ""
-PACKAGECONFIG[kmsro] = ""
-PACKAGECONFIG[vc4] = ""
-PACKAGECONFIG[v3d] = ""
-PACKAGECONFIG[zink] = ""
-
-GALLIUMDRIVERS = "swrast"
-# gallium swrast was found to crash Xorg on startup in x32 qemu
-GALLIUMDRIVERS:x86-x32 = ""
-GALLIUMDRIVERS:append:x86 = ",i915,iris,crocus"
-GALLIUMDRIVERS:append:x86-64 = ",i915,iris,crocus"
-# i686 is a 32 bit override for mesa-native
-GALLIUMDRIVERS:append:i686 = ",i915,iris,crocus"
-
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
-
-# radeonsi requires LLVM
-GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
-GALLIUMDRIVERS_LLVM = ",r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
-GALLIUMDRIVERS_LLVM:append:x86 = ",svga"
-GALLIUMDRIVERS_LLVM:append:x86-64 = ",svga"
-# i686 is a 32 bit override for mesa-native
-GALLIUMDRIVERS_LLVM:append:i686 = ",svga"
-
-PACKAGECONFIG[r600] = ""
-PACKAGECONFIG[virgl] = ""
-
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
+PACKAGECONFIG[xmlconfig] = "-Dxmlconfig=enabled, -Dxmlconfig=disabled, expat"
+
+GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
+GALLIUMDRIVERS_SOFTPIPE = ",softpipe"
+# gallium softpipe and llvmpipe was found to crash Xorg on startup in x32 qemu
+GALLIUMDRIVERS_LLVMPIPE:x86-x32 = ""
+GALLIUMDRIVERS_SOFTPIPE:x86-x32 = ""
+
+# keep sorted by the driver name (rather than PKGCONFIG)
+GALLIUMDRIVERS = ""
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',crocus', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',iris', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVMPIPE}', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'nouveau gallium-llvm', ',nouveau', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r300', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',radeonsi', '', d)}"
+GALLIUMDRIVERS .= "${GALLIUMDRIVERS_SOFTPIPE}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',svga', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
-PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
-PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
-PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
-
-PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
-
-PACKAGECONFIG[lima] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 
-PACKAGECONFIG[panfrost] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
+MESA_CLC = "system"
+MESA_CLC:class-native = "enabled"
+INSTALL_MESA_CLC = "false"
+INSTALL_MESA_CLC:class-native = "true"
+MESA_NATIVE = "mesa-native"
+MESA_NATIVE:class-native = ""
 
-PACKAGECONFIG[tegra] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,nouveau', '', d)}"
-
-PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
-
-PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
+PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
+PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
+PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
 
 PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
 
@@ -219,6 +209,8 @@ PACKAGECONFIG[lmsensors] = "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
 VIDEO_CODECS ?= "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'all', 'all_free', d)}"
 PACKAGECONFIG[video-codecs] = "-Dvideo-codecs=${VIDEO_CODECS}, -Dvideo-codecs=''"
 
+PACKAGECONFIG[teflon] = "-Dteflon=true, -Dteflon=false"
+
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION:append = " -fno-omit-frame-pointer"
 
@@ -237,75 +229,63 @@ RPROVIDES:libopencl-mesa += "virtual-opencl-icd"
 RPROVIDES:libgles2-mesa += "libgles3-mesa"
 RPROVIDES:libgles2-mesa-dev += "libgles3-mesa-dev"
 
-RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
-             libosmesa libosmesa-dev \
+             libgallium \
              libgl-mesa libgl-mesa-dev \
              libglx-mesa libglx-mesa-dev \
              libglapi libglapi-dev \
              libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
-             libopencl-mesa libopencl-mesa-dev \
-             libxatracker libxatracker-dev \
+             libopencl-mesa \
+             libteflon \
              mesa-megadriver mesa-vulkan-drivers \
              mesa-vdpau-drivers mesa-tools \
             "
 
-do_install:append () {
-    # Drivers never need libtool .la files
-    rm -f ${D}${libdir}/dri/*.la
-    rm -f ${D}${libdir}/egl/*.la
-    rm -f ${D}${libdir}/gallium-pipe/*.la
-    rm -f ${D}${libdir}/gbm/*.la
-
-    # libwayland-egl has been moved to wayland 1.15+
-    rm -f ${D}${libdir}/libwayland-egl*
-    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
-}
-
-do_install:append:class-native () {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'true', 'false', d)}; then
-        install -d ${D}${bindir}
-        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
-    fi
-}
-
 # For the packages that make up the OpenGL interfaces, inject variables so that
 # they don't get Debian-renamed (which would remove the -mesa suffix), and
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
 python __anonymous() {
     pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
+    mlprefix = d.getVar("MLPREFIX")
     suffix = ""
     if "-native" in d.getVar("PN"):
         suffix = "-native"
-    for p in (("egl", "libegl", "libegl1"),
-              ("opengl", "libgl", "libgl1"),
-              ("glvnd", "libglx",),
-              ("gles", "libgles1", "libglesv1-cm1"),
-              ("gles", "libgles2", "libglesv2-2", "libgles3"),
-              ("opencl", "libopencl",)):
-        if not p[0] in pkgconfig:
-            continue
-        mlprefix = d.getVar("MLPREFIX")
-        fullp = mlprefix + p[1] + "-mesa" + suffix
-        mlprefix = d.getVar("MLPREFIX")
-        pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
-        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
-        d.appendVar("RREPLACES:" + fullp, pkgs)
-        d.appendVar("RPROVIDES:" + fullp, pkgs)
-        d.appendVar("RCONFLICTS:" + fullp, pkgs)
 
+    for p in ("libegl", "libgl", "libglx", "libgles1", "libgles2", "libgles3", "libopencl"):
+        fullp = mlprefix + p + "-mesa" + suffix
         d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadriver" + suffix)
 
-        # For -dev, the first element is both the Debian and original name
-        fullp = mlprefix + p[1] + "-mesa-dev" + suffix
-        pkgs = " " + mlprefix + p[1] + "-dev" + suffix
-        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
-        d.appendVar("RREPLACES:" + fullp, pkgs)
-        d.appendVar("RPROVIDES:" + fullp, pkgs)
-        d.appendVar("RCONFLICTS:" + fullp, pkgs)
+    d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" % (mlprefix, suffix), "1")
+
+    if 'glvnd' in pkgconfig:
+        for p in ("libegl", "libglx"):
+            fullp = mlprefix + p + "-mesa" + suffix
+            d.appendVar("RPROVIDES:" + fullp, ' virtual-%s-icd' % p)
+    else:
+        for p in (("egl", "libegl", "libegl1"),
+                  ("opengl", "libgl", "libgl1"),
+                  ("gles", "libgles1", "libglesv1-cm1"),
+                  ("gles", "libgles2", "libglesv2-2", "libgles3")):
+            if not p[0] in pkgconfig:
+                continue
+            fullp = mlprefix + p[1] + "-mesa" + suffix
+            pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
+            d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+            d.appendVar("RREPLACES:" + fullp, pkgs)
+            d.appendVar("RPROVIDES:" + fullp, pkgs)
+            d.appendVar("RCONFLICTS:" + fullp, pkgs)
+
+            # For -dev, the first element is both the Debian and original name
+            fullp = mlprefix + p[1] + "-mesa-dev" + suffix
+            pkgs = " " + mlprefix + p[1] + "-dev" + suffix
+            d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+            d.appendVar("RREPLACES:" + fullp, pkgs)
+            d.appendVar("RPROVIDES:" + fullp, pkgs)
+            d.appendVar("RCONFLICTS:" + fullp, pkgs)
 }
 
 python mesa_populate_packages() {
@@ -327,9 +307,6 @@ python mesa_populate_packages() {
                 d.appendVar("RPROVIDES:%s" % lib_name, pkg_name)
                 d.appendVar("RCONFLICTS:%s" % lib_name, pkg_name)
                 d.appendVar("RREPLACES:%s" % lib_name, pkg_name)
-
-    pipe_drivers_root = os.path.join(d.getVar('libdir'), "gallium-pipe")
-    do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
 }
 
 PACKAGESPLITFUNCS =+ "mesa_populate_packages"
@@ -341,34 +318,38 @@ FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
 FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
 FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
 FILES:libegl-mesa = "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor.d"
-FILES:libgbm = "${libdir}/libgbm.so.*"
+FILES:libgbm = "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
+FILES:libgallium = "${libdir}/libgallium-*.so"
 FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
-FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
+FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
-FILES:libosmesa = "${libdir}/libOSMesa.so.*"
-FILES:libxatracker = "${libdir}/libxatracker.so.*"
 
-FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
+FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan ${libdir}/vdpau/*.so"
 FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
-FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
-FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
-FILES:libglx-mesa-dev = "${libdir}/libGLX*.*"
+FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h ${includedir}/gbm_backend_abi.h"
+FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL/*.h ${libdir}/pkgconfig/gl.pc ${libdir}/pkgconfig/glx.pc"
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
-FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so"
-FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
-FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
-                          ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
-                          ${libdir}/pkgconfig/xatracker.pc"
+FILES:libteflon = "${libdir}/libteflon.so"
 # catch all to get all the tools and data
 FILES:${PN}-tools = "${bindir} ${datadir}"
 ALLOW_EMPTY:${PN}-tools = "1"
 
+# All DRI drivers are symlinks to libdril_dri.so
+INSANE_SKIP:${PN}-megadriver += "dev-so"
+
+# OpenCL ICDs package also ship correspondig .so files, there is no -dev package
+INSANE_SKIP:libopencl-mesa += "dev-so"
+
 # Fix upgrade path from mesa to mesa-megadriver
 RREPLACES:mesa-megadriver = "mesa"
 RCONFLICTS:mesa-megadriver = "mesa"
 RPROVIDES:mesa-megadriver = "mesa"
+
+# As of May 2025 it is known that LTO breaks Mesa, for example:
+# https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34318
+LTO = ""
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index 8ec06800..2c20a538 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -2,7 +2,7 @@
 # upstream yet. This allows us to build the shims we need without completely
 # clobbering mesa.
 
-require recipes-graphics/mesa/mesa-pvr.inc
+require recipes-graphics/mesa/mesa-pvr-24.inc
 
 SUMMARY += " (with PowerVR for TI parts)"
 
-- 
2.34.1


