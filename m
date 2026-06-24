Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CAB0CDE002
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 20:07:33 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16467.1782331652531594630
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 13:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=qLdZ1XJs;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=URrvPYIn;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65OJsEJi3624970;
	Wed, 24 Jun 2026 15:07:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=2JE1YOvI5Dvrc
	9NKHA2rhR0OEwCsilx81h/ZGtDyeWk=; b=qLdZ1XJs42mo+1SFTjOJCNqhRrz7T
	j6ZmVxJCHJYUykkd6wsSryf2cnMNGlIK1988e9ooJfRcr04hFxw8/zpWiFY2SCP1
	l0K+569ifXCvbd1Dn4Re/IcocnXij7i7HYEn+fNRuziK4/FkbRFRKcsj5eCk0Qpr
	yBaF35j8jdB/1LjVEBv4WGkbNEpWmoTnTeVwqmPD4JKDYHtCVQdRtgfU0ko130x5
	fMBrwINz3sFmoBmEpSXeqNHc9PkKb9Uxt29obj9X9nVzoXM7wka/GjkMZXfaj97A
	oldwOJsEgnYHe6eOqfoxNQtsYD+KnTnYZ28qozvMAGeRgBU1OyEPLIGLQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f0ecruaat-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 15:07:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irOoiVL3IDJKCvnzAVaILNdb4HTJRg21AjQCv4o1ZiQICC3g+59NY7PK9KpHuEi+rZJ8Sw+uQJII8YYqzAwi67Bv69pXCGpgcwFY1U9APNab1EEh3S9cipxwX3VuUSCc7sritrosyK9MqK9KFCVH1T/omjASVJ1tbqpBnwwwMZXvToK17phwipiFgWMAOFWbLRGgIJ1X1FXnNTF9PAd66DaJRhXDM1a2WWvdSlkr6KBaKuFv1njw4m1QFqLjzeMuDfnvwK0PYwa+hp/o5CXn5ZHSmcXaeu93bsrNhSeZh66uk81DdcmzakjDTbb8Vadi2WZU8MX+ww1nmDoGQK0TTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JE1YOvI5Dvrc9NKHA2rhR0OEwCsilx81h/ZGtDyeWk=;
 b=aPq144pJiAxZDzczFkz30MICD00ybc/xghKy2WteKtR77/zwPiBYghL3KzPrkf8mYdeBCY3TkUwjc47Hv3YEO0JYhROywv3vPIcLB4Pn1hO2F3AC5KKBn/mTbgJJpd64ibCevOJiWXboA0UEf5/CZuPtve8dXgE7uL7jFQ8JJkQYkxA43Nu9DJFR8aV1UmXpF6YaKvEIaCn8O1UFk7CQELFWXzNhUPfomRKQkx3mYzwEhEQCpsrDWOIUaFcrNPWLVQb8Xkg9MKpyDkwfF67IiuIwQeV/KTl+iRaphIailqc6FMBYDagN7NaRCjlKmm+XNoeH3/21Av5CWWZ0WhoI7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JE1YOvI5Dvrc9NKHA2rhR0OEwCsilx81h/ZGtDyeWk=;
 b=URrvPYIno4RxZEMvtqiSTSLvZ9hmDdlhlBtlmyOaHCO/WHAvUwENk2ggeYKGoEGefjChpKmboDXUwHufbZ2DGupxP7zqywxlobk8Uzkj4HzzBka7oQR7MgbzGTH+HLh71zRKuzPWPr425Fp8ssvGR+o5iRSIurMsOX17wMRIRJ8=
Received: from PH5P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::7)
 by PH0PR10MB7080.namprd10.prod.outlook.com (2603:10b6:510:28c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 20:07:19 +0000
Received: from MW1PEPF0001615A.namprd21.prod.outlook.com
 (2603:10b6:510:34b:cafe::a1) by PH5P222CA0004.outlook.office365.com
 (2603:10b6:510:34b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Wed,
 24 Jun 2026 20:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF0001615A.mail.protection.outlook.com (10.167.249.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Wed, 24 Jun 2026 20:07:18 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:07:11 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:07:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 15:07:11 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OK7BFl1158270;
	Wed, 24 Jun 2026 15:07:11 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/wrynose][RFC PATCH] meta-beagle: Make use of ti-devicetree-prefix
Date: Wed, 24 Jun 2026 15:07:09 -0500
Message-ID: <20260624200709.1153389-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615A:EE_|PH0PR10MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d886b86-bbee-416a-c513-08ded22c31de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	YosxCJzVNTNdclv0x3FvjCV1rSymho5m/0tEfMUkQu2VJ21OqWRfui8DRPYWgkwNBXZ0FO5r/wpYnvKtlkaFkkETOdlJE4HhzoiAQnyIQeKvurZ+b77RhkXnr+ZUwWUp+loI7Nhq21+uEt9dr3rzuKLiYpKkAe5GrVw6YjgiGYQQymY6x9c8n6Weox9E0ruZVfSXaUk7Y4tMBoTfRNAoJb4G0v+N6pgdcOlpvbHNcCeKp8b7utbposJDEEoNl9RIyDClS/QIQ9+ZEsaLVN1SSbdAJxfBpig+DtOtQc8CVUMZ10L8nhK4ZDlAxL6BxIdG3hxhgD1ZxvWBVGVpg1PrxeGiDo6u1g6rmcD8lhDx8uBuiJUlSNory3v2Xca4dldyh7X7MRi9Glavjx6yoOkiECKg8Ate0+eGmBxTWdeVcC4jdV3ajJFChUOke2gnwRCZHxriGHZ6s/uG0bp4r/Ir/mlO9PY98z8mcaIEhYr3B02HyAU4LQ4ZE30cDsqr6mZToX9/kFUxcYcaOCgbeL/mSWCsdRlwDPUAWxz6ZODUuYJtE9CBgYzz0PMYeBxW6ogikMuXVroYmmxqw/ZICH4T9NDkGTCt30jqxg1ZCH3BVj63A7fYD73WsjT2BQMuokcvtPQN63BY+M7t4nKkQclaUxjlLiTU2+jBO34rucjB4Taq76rBcEZLyRIS1QX6XB3oSYXesgW/QOZm/VJ64s2C6w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9gagB0E1Wp9MW9YTQEjV79CfI8SP7sptCp43wLLZzij2Ux7ktXssw4CS+7TpCNpvmxC1kexAK3HeabYMBKst4lFaxtyiiuTpj87uZfXb0jCfn/3RepKXdB1YH7ENberIDClLONzKYU6CHvdbJ31P3NXGbleK1cqHkKOeFY3YctP1vKOMIfeIxuzzqNliyxjCLtOeEWCSQ17Ds0h1Us+jUUrr2QWXDrFEWBgW/mXthV3hI/TFrCDUyhbvq/mJwM8CIMoyH9s6WdKEB9RMMjx72KTLbNra4XXxp5q5zOFemgaIK4ItjY66rNI67ZWVGNsnp6Il3blDvW2pUNix39gv8529kELq6QWpVxW+5TJ8xaMsiqAkTU52nYj71aSZclTi77RUJ0p/yQpvkd46yK4QPfvktSr39Nf5mX+lfAnY+PP76Xg5Ki4YzAiz0uhOlR79
X-Exchange-RoutingPolicyChecked: 
	PoVac2mxRmtKVWOIQxGMspjCGiHwSvbscLDDZW5kVq+uQofv7jmqSWuKNfWnvGCtI2jnMJCiWLKpyIDyWh1eSqJ67wonh91rFHaXrH/mIcR4xbM71lSgfDIkw9NrR+bimP6mGAjzQQlS0/u1RwzMcU4RCNo/3KNtZYT2YJsTUksx/C14CtjSthK0a5suVy2Jgzk1lo+CxfEkvWTzJsr1rZUtfjwTTdQ0iBbMaAj2lRKdPWkOskvtOgJKvpyjMauU3L6MF2IOkd/Tdf8GnQxGSVV5+FNlktkZY6OMkRMqGc8gxJUGq5XvTd2PpQtzAAnQR0t/CYmlTLrJJxOHVnEqFQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:07:18.8900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d886b86-bbee-416a-c513-08ded22c31de
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7080
X-Proofpoint-GUID: DQUla0NcPaCYvxRHJXRSFUbiivRXPJs3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2OCBTYWx0ZWRfX3QHGAPPotHQa
 5CXd/BmgylknK+kX8Fc0yLq3nmaqu3x4x8WqX+Fa1iOCzNeJz5f7X45DmEGKUTAB2X0hMfsw8BV
 FqHkBd365COnwH4HO7zRqlcTLuvE2AQeCGdkTjas9BglC61CgHry94fcCxZ4EWqlpa/goEfWCv3
 zxO55NlgzSIkHhcdhcRjl8OLofMFzACs+vNhiwjpFFNIYskwUmnbKjxV/DDKQvWiT2RUYimZBjG
 lBz4ZGvA1KfDZUz80WLi8kI8OFZhvfQmNymYGjafwwt9zJIR8ReJw+YbnCFT0D5T+xfaBXNsqPC
 7DIKwf2XJ0Dc5eBKT2H/RmA+GU8jpoUAT9Xgsqj/ZHbYkV2uVhoOEqsodirw/89Suf0sS9T/GeU
 t3VLtd2r+qS8du1ci1qVsW3iowJ2qA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2OCBTYWx0ZWRfX5e4y8UL7jizC
 xyarcQQKMWZTBxCyiyE/ZsRjoZcm0TRULmyFjnkSzjz1tIt3yvqSsCqwMN+dVpJLrDn73Iz/uCT
 xGgPV6d4ylrpp209ZBLaIYKIcDNoH6I=
X-Proofpoint-ORIG-GUID: DQUla0NcPaCYvxRHJXRSFUbiivRXPJs3
X-Authority-Analysis: v=2.4 cv=eekNubEH c=1 sm=1 tr=0 ts=6a3c38fe cx=c_pps
 a=LQDsqUhXq6x2TIKBD9Oruw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=cN9th1_XAAAA:8 a=DYtVRx_rAAAA:8
 a=ww5bh9BHTr-emf01fwYA:9 a=5HybKBhn8h5UT_hmDMpx:22 a=K1xa12UCscBrvhdHlanD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240168
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 20:07:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20077

Beagle kernels can also make use of ti-devicetree-prefix, the only reason
they do not is it is explicitly disabled in beagle-bsp.inc. Remove the
lines clearing KERNEL_DEVICETREE_PREFIX so it can work on Beagle devices.

Remove all KERNEL_DEVICETREE lines already covered by a _PREFIX.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-beagle/conf/machine/beagle-x15.conf      | 31 -------
 meta-beagle/conf/machine/beaglebadge-ti.conf  |  2 -
 meta-beagle/conf/machine/beaglebone-ai64.conf | 74 ---------------
 meta-beagle/conf/machine/beaglebone.conf      | 45 ----------
 meta-beagle/conf/machine/beagleplay-ti.conf   | 11 ---
 meta-beagle/conf/machine/beagleplay.conf      | 57 ------------
 meta-beagle/conf/machine/beagley-ai.conf      | 90 -------------------
 .../conf/machine/include/beagle-bsp.inc       |  2 -
 meta-beagle/conf/machine/pocketbeagle2.conf   | 37 +-------
 .../recipes-kernel/linux/linux-bb.org_6.12.bb | 37 ++------
 .../recipes-kernel/linux/linux-bb.org_6.6.bb  | 39 ++------
 11 files changed, 13 insertions(+), 412 deletions(-)

diff --git a/meta-beagle/conf/machine/beagle-x15.conf b/meta-beagle/conf/machine/beagle-x15.conf
index d0368924..ed7ffd3d 100644
--- a/meta-beagle/conf/machine/beagle-x15.conf
+++ b/meta-beagle/conf/machine/beagle-x15.conf
@@ -10,37 +10,6 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/omap/am57xx-idk-lcd \
 "
 
-KERNEL_DEVICETREE:bsp-bb_org-6_6 = " \
-ti/omap/am571x-idk.dtb \
-ti/omap/am571x-idk-touchscreen.dtbo \
-ti/omap/am5729-beagleboneai.dtb \
-ti/omap/am572x-idk.dtb \
-ti/omap/am572x-idk-touchscreen.dtbo \
-ti/omap/am574x-idk.dtb \
-ti/omap/am57xx-beagle-x15.dtb \
-ti/omap/am57xx-beagle-x15-revb1.dtb \
-ti/omap/am57xx-beagle-x15-revc.dtb \
-ti/omap/am57xx-evm.dtbo \
-ti/omap/am57xx-idk-lcd-osd101t2045.dtbo \
-ti/omap/am57xx-idk-lcd-osd101t2587.dtbo \
-"
-
-KERNEL_DEVICETREE:bsp-bb_org-6_12 = " \
-ti/omap/am571x-idk.dtb \
-ti/omap/am571x-idk-touchscreen.dtbo \
-ti/omap/am5729-beagleboneai.dtb \
-ti/omap/am572x-idk.dtb \
-ti/omap/am572x-idk-touchscreen.dtbo \
-ti/omap/am574x-idk.dtb \
-ti/omap/am57xx-beagle-x15.dtb \
-ti/omap/am57xx-beagle-x15-revb1.dtb \
-ti/omap/am57xx-beagle-x15-revc.dtb \
-ti/omap/am57xx-evm.dtbo \
-ti/omap/am57xx-evm-ov10635.dtbo \
-ti/omap/am57xx-idk-lcd-osd101t2045.dtbo \
-ti/omap/am57xx-idk-lcd-osd101t2587.dtbo \
-"
-
 MACHINE_GUI_CLASS = "bigscreen"
 
 SERIAL_CONSOLES = "115200;ttyS2"
diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagle/conf/machine/beaglebadge-ti.conf
index 78525030..0f2c2dd1 100644
--- a/meta-beagle/conf/machine/beaglebadge-ti.conf
+++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
@@ -14,8 +14,6 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62l3-badge \
 "
 
-KERNEL_DEVICETREE = ""
-
 UBOOT_MACHINE = "am62lx_badge_defconfig"
 
 TFA_BOARD = "am62l3-badge"
diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/conf/machine/beaglebone-ai64.conf
index 0504832c..c11a2cc7 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
@@ -13,80 +13,6 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j721e \
 "
 
-KERNEL_DEVICETREE:bsp-bb_org-6_6 = " \
-ti/k3-j721e-beagleboneai64-BBORG_MOTOR.dtbo \
-ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
-ti/k3-j721e-beagleboneai64.dtb \
-ti/k3-j721e-beagleboneai64-microtips-mf070zima-lcd3.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm0-p8_13.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm0-p8_13-p8_19.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm0-p8_19.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm2-p9_14.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm2-p9_14-p9_16.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm2-p9_16.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm4-p9_25.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi1-cs0.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi1-cs0-no-miso.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi2-cs0.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi3-cs0-no-miso.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi6-cs0-cs1.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi6-cs0.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi6-cs1-no-miso.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi7-cs0.dtbo \
-ti/k3-j721e-common-proc-board.dtb \
-ti/k3-j721e-common-proc-board-infotainment.dtbo \
-ti/k3-j721e-evm-csi2-ov5640.dtbo \
-ti/k3-j721e-evm-ethfw.dtbo \
-ti/k3-j721e-evm-fusion.dtbo \
-ti/k3-j721e-evm-gesi-exp-board.dtbo \
-ti/k3-j721e-evm-ina2xx.dtbo \
-ti/k3-j721e-evm-pcie0-ep.dtbo \
-ti/k3-j721e-evm-pcie1-ep.dtbo \
-ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
-ti/k3-j721e-sk-csi2-dual-imx219.dtbo \
-ti/k3-j721e-sk-csi2-ov5640.dtbo \
-ti/k3-j721e-sk.dtb \
-ti/k3-j721e-sk-fpdlink-fusion.dtbo \
-ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
-"
-
-KERNEL_DEVICETREE:bsp-bb_org-6_12 = " \
-ti/k3-j721e-beagleboneai64-BBORG_MOTOR.dtbo \
-ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
-ti/k3-j721e-beagleboneai64.dtb \
-ti/k3-j721e-beagleboneai64-microtips-mf070zima-lcd3.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm0-p8_13.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm0-p8_13-p8_19.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm0-p8_19.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm2-p9_14.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm2-p9_14-p9_16.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm2-p9_16.dtbo \
-ti/k3-j721e-beagleboneai64-pwm-epwm4-p9_25.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi1-cs0.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi1-cs0-no-miso.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi2-cs0.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi3-cs0-no-miso.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi6-cs0-cs1.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi6-cs0.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi6-cs1-no-miso.dtbo \
-ti/k3-j721e-beagleboneai64-spi-mcspi7-cs0.dtbo \
-ti/k3-j721e-common-proc-board.dtb \
-ti/k3-j721e-common-proc-board-infotainment.dtbo \
-ti/k3-j721e-evm-csi2-ov5640.dtbo \
-ti/k3-j721e-evm-ethfw.dtbo \
-ti/k3-j721e-evm-fusion.dtbo \
-ti/k3-j721e-evm-gesi-exp-board.dtbo \
-ti/k3-j721e-evm-pcie0-ep.dtbo \
-ti/k3-j721e-evm-pcie1-ep.dtbo \
-ti/k3-j721e-evm-pcie-ntb.dtbo \
-ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
-ti/k3-j721e-evm-ub954.dtbo \
-ti/k3-j721e-sk-csi2-dual-imx219.dtbo \
-ti/k3-j721e-sk-csi2-ov5640.dtbo \
-ti/k3-j721e-sk.dtb \
-ti/k3-j721e-sk-fpdlink-fusion.dtbo \
-"
-
 MACHINE_GUI_CLASS = "bigscreen"
 
 # TI has moved a driver out of its kernel tree and into an out of tree module.
diff --git a/meta-beagle/conf/machine/beaglebone.conf b/meta-beagle/conf/machine/beaglebone.conf
index 50d09e3e..e019a623 100644
--- a/meta-beagle/conf/machine/beaglebone.conf
+++ b/meta-beagle/conf/machine/beaglebone.conf
@@ -11,51 +11,6 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/omap/am335x-sancloud-bbe \
 "
 
-KERNEL_DEVICETREE:bsp-bb_org-6_6 = " \
-ti/omap/am335x-boneblack.dtb \
-ti/omap/am335x-boneblack-revd.dtb \
-ti/omap/am335x-boneblack-uboot.dtb \
-ti/omap/am335x-boneblack-uboot-univ.dtb \
-ti/omap/am335x-boneblack-wireless.dtb \
-ti/omap/am335x-boneblue.dtb \
-ti/omap/am335x-bone.dtb \
-ti/omap/am335x-bonegreen.dtb \
-ti/omap/am335x-bonegreen-gateway.dtb \
-ti/omap/am335x-bonegreen-wireless.dtb \
-ti/omap/am335x-bonegreen-wireless-uboot-univ.dtb \
-ti/omap/am335x-evm.dtb \
-ti/omap/am335x-evmsk.dtb \
-ti/omap/am335x-icev2.dtb \
-ti/omap/am335x-osd3358-sm-red.dtb \
-ti/omap/am335x-pocketbeagle.dtb \
-ti/omap/am335x-sancloud-bbe.dtb \
-ti/omap/am335x-sancloud-bbe-extended-wifi.dtb \
-ti/omap/am335x-sancloud-bbe-lite.dtb \
-"
-
-KERNEL_DEVICETREE:bsp-bb_org-6_12 = " \
-ti/omap/am335x-boneblack.dtb \
-ti/omap/am335x-boneblack-revd.dtb \
-ti/omap/am335x-boneblack-uboot.dtb \
-ti/omap/am335x-boneblack-uboot-univ.dtb \
-ti/omap/am335x-boneblack-wireless.dtb \
-ti/omap/am335x-boneblue.dtb \
-ti/omap/am335x-bone.dtb \
-ti/omap/am335x-bonegreen.dtb \
-ti/omap/am335x-bonegreen-eco.dtb \
-ti/omap/am335x-bonegreen-gateway.dtb \
-ti/omap/am335x-bonegreen-wireless.dtb \
-ti/omap/am335x-bonegreen-wireless-uboot-univ.dtb \
-ti/omap/am335x-evm.dtb \
-ti/omap/am335x-evmsk.dtb \
-ti/omap/am335x-icev2.dtb \
-ti/omap/am335x-osd3358-sm-red.dtb \
-ti/omap/am335x-pocketbeagle.dtb \
-ti/omap/am335x-sancloud-bbe.dtb \
-ti/omap/am335x-sancloud-bbe-extended-wifi.dtb \
-ti/omap/am335x-sancloud-bbe-lite.dtb \
-"
-
 MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_FEATURES += "screen"
 
diff --git a/meta-beagle/conf/machine/beagleplay-ti.conf b/meta-beagle/conf/machine/beagleplay-ti.conf
index 4e69c819..905938cc 100644
--- a/meta-beagle/conf/machine/beagleplay-ti.conf
+++ b/meta-beagle/conf/machine/beagleplay-ti.conf
@@ -16,15 +16,4 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62x-sk \
 "
 
-KERNEL_DEVICETREE = " \
-    ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
-    ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
-    ti/k3-am625-beagleplay.dtb \
-    ti/k3-am625-sk.dtb \
-    ti/k3-am62x-sk-csi2-imx219.dtbo \
-    ti/k3-am62x-sk-csi2-ov5640.dtbo \
-    ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
-    ti/k3-am62x-sk-hdmi-audio.dtbo \
-"
-
 MACHINE_GUI_CLASS = "bigscreen"
diff --git a/meta-beagle/conf/machine/beagleplay.conf b/meta-beagle/conf/machine/beagleplay.conf
index 218dcc63..84833ffb 100644
--- a/meta-beagle/conf/machine/beagleplay.conf
+++ b/meta-beagle/conf/machine/beagleplay.conf
@@ -5,60 +5,3 @@
 require conf/machine/beagleplay-ti.conf
 
 require conf/machine/include/beagle-bsp.inc
-
-KERNEL_DEVICETREE:bsp-bb_org-6_6 = " \
-ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
-ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
-ti/k3-am625-beagleplay.dtb \
-ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
-ti/k3-am625-minimal.dtb \
-ti/k3-am625-sk.dtb \
-ti/k3-am625-sk-ecap-capture.dtbo \
-ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
-ti/k3-am625-sk-m2-cc3301.dtbo \
-ti/k3-am625-sk-mcspi-loopback.dtbo \
-ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
-ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
-ti/k3-am62x-sk-csi2-imx219.dtbo \
-ti/k3-am62x-sk-csi2-ov5640.dtbo \
-ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
-ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
-ti/k3-am62x-sk-dmtimer-pwm.dtbo \
-ti/k3-am62x-sk-eqep.dtbo \
-ti/k3-am62x-sk-fastboot-disable-hdmi.dtbo \
-ti/k3-am62x-sk-hdmi-audio.dtbo \
-ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
-ti/k3-am62x-sk-mcan.dtbo \
-ti/k3-am62x-sk-microtips-mf103hie-lcd2.dtbo \
-ti/k3-am62x-sk-pwm.dtbo \
-"
-
-KERNEL_DEVICETREE:bsp-bb_org-6_12 = " \
-ti/k3-am625-beagleplay-bcfserial-no-firmware.dtbo \
-ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
-ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
-ti/k3-am625-beagleplay.dtb \
-ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
-ti/k3-am625-minimal.dtb \
-ti/k3-am625-sk.dtb \
-ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
-ti/k3-am625-sk-m2-cc3351.dtbo \
-ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
-ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
-ti/k3-am62x-sk-csi2-imx219.dtbo \
-ti/k3-am62x-sk-csi2-ov5640.dtbo \
-ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
-ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
-ti/k3-am62x-sk-dmtimer-pwm.dtbo \
-ti/k3-am62x-sk-ecap-capture.dtbo \
-ti/k3-am62x-sk-eqep.dtbo \
-ti/k3-am62x-sk-fastboot-disable-hdmi.dtbo \
-ti/k3-am62x-sk-hdmi-audio.dtbo \
-ti/k3-am62x-sk-lpm-io-ddr-wkup-sources.dtbo \
-ti/k3-am62x-sk-lpm-standby.dtbo \
-ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
-ti/k3-am62x-sk-mcan.dtbo \
-ti/k3-am62x-sk-mcspi-loopback.dtbo \
-ti/k3-am62x-sk-microtips-mf103hie-lcd2.dtbo \
-ti/k3-am62x-sk-pwm.dtbo \
-"
diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/machine/beagley-ai.conf
index d2c68201..f6215891 100644
--- a/meta-beagle/conf/machine/beagley-ai.conf
+++ b/meta-beagle/conf/machine/beagley-ai.conf
@@ -8,94 +8,4 @@ require conf/machine/include/beagle-bsp.inc
 
 UBOOT_MACHINE:bsp-bb_org-6_6 = "j722s_evm_a53_config"
 
-KERNEL_DEVICETREE:bsp-bb_org-6_6 = " \
-ti/k3-am67a-beagley-ai.dtb \
-ti/k3-am67a-beagley-ai-i2c1-400000.dtbo \
-ti/k3-am67a-beagley-ai-i2c1-ads1115.dtbo \
-ti/k3-am67a-beagley-ai-i2c1-rtc-rv3028.dtbo \
-ti/k3-am67a-beagley-ai-i2c1-ssd1306.dtbo \
-ti/k3-am67a-beagley-ai-mikroe-eth.dtbo \
-ti/k3-am67a-beagley-ai-mikroe-microsd.dtbo \
-ti/k3-am67a-beagley-ai-pps-gpio18.dtbo \
-ti/k3-am67a-beagley-ai-pwm-ecap0-gpio12.dtbo \
-ti/k3-am67a-beagley-ai-pwm-ecap1-gpio16.dtbo \
-ti/k3-am67a-beagley-ai-pwm-ecap1-gpio21.dtbo \
-ti/k3-am67a-beagley-ai-pwm-ecap2-gpio17.dtbo \
-ti/k3-am67a-beagley-ai-pwm-ecap2-gpio18.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio12.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio14.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio15.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio15-gpio12.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio15-gpio14.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio5.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio5-gpio12.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio5-gpio14.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio13.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio20.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio21.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio21-gpio13.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio21-gpio20.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio6.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio6-gpio13.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio6-gpio20.dtbo \
-ti/k3-am67a-beagley-ai-spi0-1cs.dtbo \
-ti/k3-am67a-beagley-ai-spi0-2cs.dtbo \
-ti/k3-am67a-beagley-ai-spidev0.dtbo \
-ti/k3-am67a-beagley-ai-uart-ttyama0.dtbo \
-ti/k3-j722s-evm-csi2-ov5640.dtbo \
-ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo \
-ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo \
-ti/k3-j722s-evm-dsi-rpi-7inch-panel.dtbo \
-ti/k3-j722s-evm.dtb \
-ti/k3-j722s-evm-fpdlink-fusion.dtbo \
-ti/k3-j722s-evm-microtips-mf101hie-panel.dtbo \
-ti/k3-j722s-evm-pwm.dtbo \
-ti/k3-j722s-evm-v3link-fusion.dtbo \
-"
-
-KERNEL_DEVICETREE:bsp-bb_org-6_12 = " \
-ti/k3-am67a-beagley-ai.dtb \
-ti/k3-am67a-beagley-ai-i2c1-400000.dtbo \
-ti/k3-am67a-beagley-ai-i2c1-ads1115.dtbo \
-ti/k3-am67a-beagley-ai-i2c1-rtc-rv3028.dtbo \
-ti/k3-am67a-beagley-ai-i2c1-ssd1306.dtbo \
-ti/k3-am67a-beagley-ai-mikroe-eth.dtbo \
-ti/k3-am67a-beagley-ai-mikroe-microsd.dtbo \
-ti/k3-am67a-beagley-ai-pps-gpio18.dtbo \
-ti/k3-am67a-beagley-ai-pwm-ecap0-gpio12.dtbo \
-ti/k3-am67a-beagley-ai-pwm-ecap1-gpio16.dtbo \
-ti/k3-am67a-beagley-ai-pwm-ecap1-gpio21.dtbo \
-ti/k3-am67a-beagley-ai-pwm-ecap2-gpio17.dtbo \
-ti/k3-am67a-beagley-ai-pwm-ecap2-gpio18.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio12.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio14.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio15.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio15-gpio12.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio15-gpio14.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio5.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio5-gpio12.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm0-gpio5-gpio14.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio13.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio20.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio21.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio21-gpio13.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio21-gpio20.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio6.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio6-gpio13.dtbo \
-ti/k3-am67a-beagley-ai-pwm-epwm1-gpio6-gpio20.dtbo \
-ti/k3-am67a-beagley-ai-spi0-1cs.dtbo \
-ti/k3-am67a-beagley-ai-spi0-2cs.dtbo \
-ti/k3-am67a-beagley-ai-spidev0.dtbo \
-ti/k3-am67a-beagley-ai-uart-ttyama0.dtbo \
-ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo \
-ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo \
-ti/k3-j722s-evm-dsi-rpi-7inch-panel.dtbo \
-ti/k3-j722s-evm.dtb \
-ti/k3-j722s-evm-fpdlink-fusion.dtbo \
-ti/k3-j722s-evm-fpdlink-iv-fusion.dtbo \
-ti/k3-j722s-evm-microtips-mf101hie-panel.dtbo \
-ti/k3-j722s-evm-pwm.dtbo \
-ti/k3-j722s-evm-v3link-fusion.dtbo \
-"
-
 MACHINE_GUI_CLASS = "bigscreen"
diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
index 09c66668..2efc32aa 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -14,7 +14,6 @@ BSP_KERNEL_PROVIDER:bsp-bb_org-6_12 = "linux-bb.org"
 BSP_KERNEL_VERSION:bsp-bb_org-6_12 = "6.12.%"
 BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_12 = "u-boot-bb.org"
 BSP_BOOTLOADER_VERSION:bsp-bb_org-6_12 = "2025.%"
-KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 = ""
 TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-bb_org-6_12 = ""
 
 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-sgx-ddk-km"
@@ -36,7 +35,6 @@ BSP_KERNEL_PROVIDER:bsp-bb_org-6_6 = "linux-bb.org"
 BSP_KERNEL_VERSION:bsp-bb_org-6_6 = "6.6.%"
 BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_6 = "u-boot-bb.org"
 BSP_BOOTLOADER_VERSION:bsp-bb_org-6_6 = "2024.%"
-KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 = ""
 TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-bb_org-6_6 = ""
 
 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-sgx-ddk-km"
diff --git a/meta-beagle/conf/machine/pocketbeagle2.conf b/meta-beagle/conf/machine/pocketbeagle2.conf
index bf10d565..33df38bb 100644
--- a/meta-beagle/conf/machine/pocketbeagle2.conf
+++ b/meta-beagle/conf/machine/pocketbeagle2.conf
@@ -19,40 +19,7 @@ UBOOT_MACHINE = "am62_pocketbeagle2_a53_defconfig"
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am6232 \
+    ti/k3-am625 \
     ti/k3-am62-pocket \
-"
-
-KERNEL_DEVICETREE = " \
-ti/k3-am6232-pocketbeagle2.dtb \
-ti/k3-am6232-pocketbeagle2-techlab-cape.dtbo \
-ti/k3-am625-minimal.dtb \
-ti/k3-am625-sk.dtb \
-ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
-ti/k3-am625-sk-m2-cc3351.dtbo \
-ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
-ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
-ti/k3-am62-pocketbeagle2-ardupilot-cape.dtbo \
-ti/k3-am62-pocketbeagle2.dtb \
-ti/k3-am62-pocketbeagle2-led-all.dtbo \
-ti/k3-am62-pocketbeagle2-leds-off.dtbo \
-ti/k3-am62-pocketbeagle2-mspm0swd.dtbo \
-ti/k3-am62-pocketbeagle2-pru0-out.dtbo \
-ti/k3-am62-pocketbeagle2-spi2-eth-wiz-click.dtbo \
-ti/k3-am62-pocketbeagle2-techlab-cape.dtbo \
-ti/k3-am62x-sk-csi2-imx219.dtbo \
-ti/k3-am62x-sk-csi2-ov5640.dtbo \
-ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
-ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
-ti/k3-am62x-sk-dmtimer-pwm.dtbo \
-ti/k3-am62x-sk-ecap-capture.dtbo \
-ti/k3-am62x-sk-eqep.dtbo \
-ti/k3-am62x-sk-fastboot-disable-hdmi.dtbo \
-ti/k3-am62x-sk-hdmi-audio.dtbo \
-ti/k3-am62x-sk-lpm-io-ddr-wkup-sources.dtbo \
-ti/k3-am62x-sk-lpm-standby.dtbo \
-ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
-ti/k3-am62x-sk-mcan.dtbo \
-ti/k3-am62x-sk-mcspi-loopback.dtbo \
-ti/k3-am62x-sk-microtips-mf103hie-lcd2.dtbo \
-ti/k3-am62x-sk-pwm.dtbo \
+    ti/k3-am62x-sk \
 "
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index b61eddce..756ddc65 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -18,38 +18,11 @@ DEPENDS += "gmp-native libmpc-native"
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 # Extra DT overlays/capes
-KERNEL_DEVICETREE:append:armv7a = " \
-    ti/omap/BB-ADC-00A0.dtbo \
-    ti/omap/BB-BBBW-WL1835-00A0.dtbo \
-    ti/omap/BB-BBGG-WL1835-00A0.dtbo \
-    ti/omap/BB-BBGW-WL1835-00A0.dtbo \
-    ti/omap/BB-BONE-4D5R-01-00A1.dtbo \
-    ti/omap/BB-BONE-eMMC1-01-00A0.dtbo \
-    ti/omap/BB-BONE-LCD4-01-00A1.dtbo \
-    ti/omap/BB-BONE-NH7C-01-A0.dtbo \
-    ti/omap/BB-CAPE-DISP-CT4-00A0.dtbo \
-    ti/omap/BB-HDMI-TDA998x-00A0.dtbo \
-    ti/omap/BB-I2C1-MCP7940X-00A0.dtbo \
-    ti/omap/BB-I2C1-RTC-DS3231.dtbo \
-    ti/omap/BB-I2C1-RTC-PCF8563.dtbo \
-    ti/omap/BB-I2C2-BME680.dtbo \
-    ti/omap/BB-I2C2-MPU6050.dtbo \
-    ti/omap/BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
-    ti/omap/BB-NHDMI-TDA998x-00A0.dtbo \
-    ti/omap/BBORG_COMMS-00A2.dtbo \
-    ti/omap/BBORG_FAN-A000.dtbo \
-    ti/omap/BBORG_RELAY-00A2.dtbo \
-    ti/omap/BB-SPIDEV0-00A0.dtbo \
-    ti/omap/BB-SPIDEV1-00A0.dtbo \
-    ti/omap/BB-UART1-00A0.dtbo \
-    ti/omap/BB-UART2-00A0.dtbo \
-    ti/omap/BB-UART4-00A0.dtbo \
-    ti/omap/BB-W1-P9.12-00A0.dtbo \
-    ti/omap/BONE-ADC.dtbo \
-    ti/omap/M-BB-BBG-00A0.dtbo \
-    ti/omap/M-BB-BBGG-00A0.dtbo \
-    ti/omap/PB-MIKROBUS-0.dtbo \
-    ti/omap/PB-MIKROBUS-1.dtbo \
+KERNEL_DEVICETREE_PREFIX:append:armv7a = " \
+    ti/omap/BB \
+    ti/omap/BONE \
+    ti/omap/M-BB \
+    ti/omap/PB \
 "
 
 S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
index 37626a1d..74d1abd1 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -18,39 +18,12 @@ DEPENDS += "gmp-native libmpc-native"
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 # Extra DT overlays/capes
-KERNEL_DEVICETREE:append:armv7a = " \
-    ti/omap/AM335X-PRU-UIO-00A0.dtbo \
-    ti/omap/BB-ADC-00A0.dtbo \
-    ti/omap/BB-BBBW-WL1835-00A0.dtbo \
-    ti/omap/BB-BBGG-WL1835-00A0.dtbo \
-    ti/omap/BB-BBGW-WL1835-00A0.dtbo \
-    ti/omap/BB-BONE-4D5R-01-00A1.dtbo \
-    ti/omap/BB-BONE-eMMC1-01-00A0.dtbo \
-    ti/omap/BB-BONE-LCD4-01-00A1.dtbo \
-    ti/omap/BB-BONE-NH7C-01-A0.dtbo \
-    ti/omap/BB-CAPE-DISP-CT4-00A0.dtbo \
-    ti/omap/BB-HDMI-TDA998x-00A0.dtbo \
-    ti/omap/BB-I2C1-MCP7940X-00A0.dtbo \
-    ti/omap/BB-I2C1-RTC-DS3231.dtbo \
-    ti/omap/BB-I2C1-RTC-PCF8563.dtbo \
-    ti/omap/BB-I2C2-BME680.dtbo \
-    ti/omap/BB-I2C2-MPU6050.dtbo \
-    ti/omap/BB-LCD-ADAFRUIT-24-SPI1-00A0.dtbo \
-    ti/omap/BB-NHDMI-TDA998x-00A0.dtbo \
-    ti/omap/BBORG_COMMS-00A2.dtbo \
-    ti/omap/BBORG_FAN-A000.dtbo \
-    ti/omap/BBORG_RELAY-00A2.dtbo \
-    ti/omap/BB-SPIDEV0-00A0.dtbo \
-    ti/omap/BB-SPIDEV1-00A0.dtbo \
-    ti/omap/BB-UART1-00A0.dtbo \
-    ti/omap/BB-UART2-00A0.dtbo \
-    ti/omap/BB-UART4-00A0.dtbo \
-    ti/omap/BB-W1-P9.12-00A0.dtbo \
-    ti/omap/BONE-ADC.dtbo \
-    ti/omap/M-BB-BBG-00A0.dtbo \
-    ti/omap/M-BB-BBGG-00A0.dtbo \
-    ti/omap/PB-MIKROBUS-0.dtbo \
-    ti/omap/PB-MIKROBUS-1.dtbo \
+KERNEL_DEVICETREE_PREFIX:append:armv7a = " \
+    ti/omap/AM335X \
+    ti/omap/BB \
+    ti/omap/BONE \
+    ti/omap/M-BB \
+    ti/omap/PB \
 "
 
 S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
-- 
2.39.2


