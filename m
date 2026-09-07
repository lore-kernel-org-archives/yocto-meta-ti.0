Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A9DC79F9F
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:11:31 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30028.1788768681499799754
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=EoENkx8R;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=VDX2uu+I;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68775xBS2615552
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Sep 2026 03:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=l3reuIbwxjDccdj5iFMuxtVEoZI6PP1We5qS/2bW/
	NY=; b=EoENkx8Rbm7nEoyd3RAGrVInpjY8JARzlJ999mgq803jybUKAg5qbvYVD
	/jx59rPVhosc+2p9xSMbOFLmuscaWZ7p9HPilyE3/XV62UqviWoMbehrFNXeVvVg
	zutBZSw68fOjnJSrFJTzPD8fHs4zbxM9XRdvJisjH46rveBlhI1eKPVKuGO/XoFX
	uLUEbr1UOohY4n1fBeMAhF/wM6MqS8/sIMCgYZA6YgsJq9mwFVtavKoKHpNSRTjL
	0pVzkSb2jel5GAIXXTuSwTTyi3dKmY3zBYUsZtLLZJB66/I4M/90lb4/IZ7Z5eVe
	VgxUewnIDG4Xoo4Ig8H1zWI3P6W0Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gh43n4gv5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 03:11:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6XNQuHzjWUeL4vJ6MG7vMGU8loQa2hafTBqMWS1Mq+o5+tSyG36vx1QynyklL+c7zN26Y6QHq5WjctuoMNjFeOKtoAml0LKw/Mibj/kH3xQ5OOKOkzE6mBlOLbh5RHeVG07LPicpWz6kmWvgAIJhvMtYlsb8CSjm56U3qMLVmQN36gkobdS4/x5f+jw0FONvdFZFrOyfIc9wjK5dsLm0pyV8emlG1c80CH/XRcBaYGWsTfHAPb39iVG2bZPdPCGbP6kqaq/y91w5NFrkNg44MTE04v6fHsSAqBnwuUEHj0htvvXep2jk5VJnUkA7hR2y04CHxesMgiuGopDz2mk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3reuIbwxjDccdj5iFMuxtVEoZI6PP1We5qS/2bW/NY=;
 b=iGi1xyg9JArefpes1NQRgmzx7z98EhyxCp4KfWmcRuy79JlxRyAxkpbJ63oJYVkbQSToGWpe3zED/x67CbcaHfL8U25xqtWBorbI2YLmngQHl+xcKs1IxJxP4qGRsvgQOSuSaSt0svnJubfmKnRqFqUjgvtLTTcPGUgugULst8XFsi0PcWsR3/N5z2PROcWBcvff7RmeIqV6Gy4jc6bL5wVDEU0hV8Z6xFC+Lk1EnLyJgZdEcA6qq4oqNCHN0BV3Zn6V/jSarJ2e+jjxP7frqjwxz/innQj7gCJ7+iAsWxMwnxtxAEEafTYRdtcTe0Nb3arWIdt7zNAPo6fhTqIAkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3reuIbwxjDccdj5iFMuxtVEoZI6PP1We5qS/2bW/NY=;
 b=VDX2uu+IbKLNSrunIK7WaYbmNi1sd6SrLjvszrusKebjSw+TX2vU4gBIxEpsVb0O617Q3SbD+IWkpAZOXE+mg7IguQEkFRXOjULjuoAakUMoLPjDaPjK0i42VKoBt/+Xr0Nl+Sthq4E+huYisukBCmhbX8aULikAdHj1d/tTNUc=
Received: from PH7PR17CA0002.namprd17.prod.outlook.com (2603:10b6:510:324::22)
 by SA2PR10MB4682.namprd10.prod.outlook.com (2603:10b6:806:110::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 08:11:19 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:324:cafe::3a) by PH7PR17CA0002.outlook.office365.com
 (2603:10b6:510:324::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 08:11:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 08:11:17 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:33 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 03:10:33 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6878ALMQ132583;
	Mon, 7 Sep 2026 03:10:31 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>
Subject: [meta-ti][master][RFC PATCH 5/9] conf: machine: j7200-evm: Enable ECDSA multiconfig build
Date: Mon, 7 Sep 2026 13:40:17 +0530
Message-ID: <20260907081021.3876876-5-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907081021.3876876-1-a-dubey@ti.com>
References: <20260907081021.3876876-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SA2PR10MB4682:EE_
X-MS-Office365-Filtering-Correlation-Id: ce417228-7d29-4cac-2f9d-08df0cb797fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Z5SiAH98OHXXuebugwjp8/ekdcLJw4uC9HhcpXKRL5xeFJ74vxxHjpG/O3/kM/Adpx3dl1E411tiYYXMWBpd4QR7sbd9achjnQAc0m854U7TnF/cj9jw7v3ILIILWbygEkzDNXkQreyqyX/cn2/b/1HHc1+PyvzIkvR0HwUmroTFs/KqXNT8TMvVYX5JXBptD8YiHbygqnQzkOSZD8d+wLg/MEtpeDXQavN7TlIovP7RP+/EfmvAorjzHEGvaQyS1/IRw3x3kk9/kAIkkgtQQJRXF63vW1WSUwURhFclL0iN+CUomwqqfC72+QwlEJCzqrjZ9N7V/edhnpF1cRdRu/vf2rOYaBbDM8G8XbVNUG0Dvn5aAjRF9cR1yygmvNNo9I+5fBl7rHCPtwAVL5H/0/wbi8xJ3YihMxBKy6IN69QT6RnGhzJLYIKWtEMO9UJJALteUSmfH3rPi7f1NmdFBRoWl70QqCaZijJbBIdTAZRknieFdvBclR0yRXXXR8vZmPA1UhPImYbTwoWzQJWKOXjVpt5YeqZzIyTmyxpmjlRHT5ZGCD9f9PQoS3bURtonXHw6Zle+m+mbqUvlwHjNHObgzEwT5HZOT3mimGDRUl7JNNkrhgx5vQPsTF8pZamnrrF6Go30qqahH7j1CH4ySe8oOeQZpiQsXWEBUs6jQlmxjshZsSmrmgQkSFXFUBeFl2oMeaSwKrC8zZDMHVCibg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	F2BqKLe00QMt2zG5GNzr2Zz/KHHjmnctKxA8tM10B9B31V5dN/me1AgZLu2CBBKr24+7dcH0nVtGsgE1sC4/2iSqYef7G9mhmZegGq2gyngmH7tL3ppYgjNbvAK9qrGBsnGD3MOr4TjWmsX9hsDFetiiSBT8FXFCQ21vbLpSTHB8FTVOI5mgyObpwp26he3AYhnQOuXYSb7BU72SoMAZ7THZmORXu7pQuwSvIOZnhRyLWHtiiZQwzu4F84aqjkuCGP+OVEqPV/t+6Vf2n3qzF1bCu9kRrldZEf7vzc3+cHg9HW1y1FszQvoPY+blV8J7rfps7gv3VhNs8JhptqMQM2jHvgtvjemAx0kBw5SBcidgkrA6Ov23MBEOil3I/TMes3ZjbYNE8EonP1goguJUT8CQV5CYEnRilC+VzbbWLDb4xIZxVYWjNAXstnpifeXJ
X-Exchange-RoutingPolicyChecked: 
	ecD973lSPkt6dMdwY2Zrd/YjHaS2ptADm+c8vWrzyUrE5nbu/1S6k0in9PlzkpsuvddPn3BOWiGXv8OEPHYavg9Bd+0z9OC6y/KWBj7gthz0Qi2cBz97f78uy4psGqKWr2BxOLiF997/QyLqaDD3Nzs//ZywIpPtF1Dj2lTcliy2FPMsvUakW+vmVDFNlBh20EK9bVzLBZ2N9A38fACSMfdy7EfmVE6mCxZlO7DkX3Pn1V3LDOv4wReWrcnzKok67nJTAP4Y4UevrPc1/OmzxlaELEBL41YtPuIBfzrx6U1C5U75hCNaveVC4+d9GbEZxvjzRjNmbUMlALqlOLNo3Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:11:17.7396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce417228-7d29-4cac-2f9d-08df0cb797fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4682
X-Proofpoint-GUID: zBowe8B2nA5cVUt9in5Rb_5fowtk_w40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfXzQ1A1hon9xDR
 bKwOv8v9G++rDUJ4Tn6/NtX+LPy7bt+GCB/u0LHzp6VHeNBumNPvXo7VDLQkpN9zxgssxC2Q/1H
 ZaTbpRc8QeHrB340sMIBE4qPwZtX9In6NHnFrB9K8UxRvj+nqPA3EZe4rPeRBxEzVCjaUqTguco
 h7vwkQWglA82tjexXiOc7b9+TnrFObqtjvEZ3GH9o5x8L8vwyIrG2knGiHM1P1us28Vt10ZGCHf
 Y7tZdNXn6+Psy0JcJ/rB5lc3XIKQt54YWbEgaWaFm6sit4NgrmdTXoxVam7hvXwLqgWsigl2JL8
 4JTj2hRteo1hQl8HdTkBjHHbRAvmau9PmL6MPRSnjVwus1dbEFRd2VS+dH+Td86CrpdEuNVw2Hr
 VdH/oGPTk/zUmJy8xREaO+XZ14TU8ksHKzNAw1aDAiVT5UWYollBZR0KgMyQJmsFtQKRtr05dPB
 22YXkzhja7qN8tGgkNQ==
X-Proofpoint-ORIG-GUID: zBowe8B2nA5cVUt9in5Rb_5fowtk_w40
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX9VjqQb0wF4Z3
 WxRJGC7bfaiiWbrACQJm9d+8IYVB4UKRQ88xFGhnd53b+CIXtNgnk8+DBV+zI7aBy6Xp7hfDuzr
 ycRdQr4Yx5JHl1JXKM47nxa+nQ0L3mk=
X-Authority-Analysis: v=2.4 cv=JdSMa0KV c=1 sm=1 tr=0 ts=6a9e71a9 cx=c_pps
 a=a15oepxCFtbapkdjUscCyA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=3Cfd39HKi8UuDXlHfPoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070088
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:11:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20336

Add an "ecdsa" pass alongside "main" for j7200-evm and j7200-evm-k3r5,
so both RSA and ECDSA signed boot images come out of the same build.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf | 14 +++++++++++++-
 meta-ti-bsp/conf/machine/j7200-evm.conf      | 19 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
index a35607ad..3b66b873 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm-k3r5.conf
@@ -4,4 +4,16 @@
 
 require conf/machine/include/k3r5.inc
 
-UBOOT_MACHINE = "j7200_evm_r5_defconfig"
+UBOOT_MACHINE = ""
+
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
+
+UBOOT_CONFIG[main] = "j7200_evm_r5_defconfig"
+UBOOT_CONFIG[ecdsa] = "j7200_evm_r5_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
index f6d9ee39..7934dc2d 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
@@ -15,4 +15,21 @@ KERNEL_DEVICETREE = " \
     ti/k3-j7200-evm-quad-port-eth-exp.dtbo \
 "
 
-UBOOT_MACHINE = "j7200_evm_a72_config"
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+ECDSA_BOOT_FILES ?= "tiboot3.bin-ecdsa tiboot3-*-evm.bin-ecdsa tispl.bin-ecdsa u-boot.img-ecdsa"
+ECDSA_BOOT_FILES:bsp-ti-6_6 = ""
+ECDSA_BOOT_FILES:bsp-next = ""
+ECDSA_BOOT_FILES:bsp-mainline = ""
+
+UBOOT_MACHINE = ""
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
+UBOOT_CONFIG[main] = "j7200_evm_a72_config"
+UBOOT_CONFIG[ecdsa] = "j7200_evm_a72_config"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
+
+IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
-- 
2.34.1


