Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9607.1794572037957268221
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 04:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=HMTrjg+9;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=OC9kZJHd;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: rs@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADBxms51949425;
	Fri, 13 Nov 2026 06:13:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=TR1kUIi8wpj/0
	Dt4fOJ89ZHWXJnQNdKExla5hGf7NPI=; b=HMTrjg+9fAjVKzulCdYawzMmBtX1f
	yD9+eaTnWNyKDK8Lt6uyLamVd6/r8htmjwEX4+oSX4O7LCAAd8xUtf5fExG7UYFf
	NxK2GV3ovgIsKCGQ9cG6HDgUax5Lec08Q4LB3F7Pb2kZvepf98NgSo9LVqTUv6Oq
	TdYHg/CMBfnr6CxGmONGw6PN93nsqWVvE+nh3ZUW3WoHe027k3xvuc99RpAgKxjR
	u9THats07CC2Z8nycnCIofk+dMCvSwp4vZpuTaxPphUXJtwk38LXRhWFPhPRA2ke
	wc/W7oEu16uMS3w3+PYZg+gSb+VFDhdHws/xjIGuRSJpfcuSZVVb5shyQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011070.outbound.protection.outlook.com [52.101.62.70])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hwg9rw00p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 06:13:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWmYkYEB2NKz+MID8S0FMOhJvye91Dl8biZ7q3cmRiIMItX2rs23RLe05CeOKZ7qNNFv1diBig8QQyOdyXrmrUqNotgdQ3AxlirNAJ7HmZLMChpklPfhAcFBrCAXmcdPQErDGTokx6yVeXbvOHFbptVtvF8fig395/lNz0zME56CKddsKlLbV+78fzcUH8fKFUD+n6brYOhzprKdLqcaEUkpwr7vBPjj4YtZRulfjYYuKHJitUwWphkKugyIYvgoDJ7hxgydYHFppJ/1B5+y8ukuSoMeE77Ga3Mpt82p1lYOhtXjwVEHZGtXZW14q8SLFkqmKa5VtQZG2RnCND7/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TR1kUIi8wpj/0Dt4fOJ89ZHWXJnQNdKExla5hGf7NPI=;
 b=yp47RUOS8ap9NjN5Eca4zfFdXo/i6do0ZFqF5jTpPfLTgJg8JxnZZ5wIf14APTvVs1hvhMOz1U9wHN7zV4M7lVAbMGiyIKjnGtLp+9Ow+AUOpTpKE0mGe8nUJfckdQv8pGOJgbfhUJ9YDZGZwrAiEXzuBasyndkHA1PejsiMBqcyQP2KiW1sDqpWUl5RnqZaDAd/IRbscPYfZLjrN5uK8d/9hS+3DwmLZftUBbWkRRXwbAP9r9stvQUkNcEPSdHWvgw+byIpZmzTPlPoGFzGe+LEe15OHheSOLgezpRvv1t9vh3iyLhJD285abmkHR4t70bW9/yW6XOfq0DxhrOm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR1kUIi8wpj/0Dt4fOJ89ZHWXJnQNdKExla5hGf7NPI=;
 b=OC9kZJHdgm9jnrv00FPAoAuMn8ZTJafnjixPzIXD3/NGi+Hl04Lde8khYhA5Nnu+Cj2/ysgUpoqZ4RvOMylSY3pdSYKaQPc3SOVeWAVvyDkiRQ7Fr3rOln+tUMlGj10yX+33BJGxftqc1JDX6ZNEMbpOMpK7JHz80UAssaoF/5Y=
Received: from CH2PR15CA0010.namprd15.prod.outlook.com (2603:10b6:610:51::20)
 by CY5PR10MB6071.namprd10.prod.outlook.com (2603:10b6:930:39::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 12:13:34 +0000
Received: from BN5PEPF00046988.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::17) by CH2PR15CA0010.outlook.office365.com
 (2603:10b6:610:51::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 12:13:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN5PEPF00046988.mail.protection.outlook.com (10.167.245.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 12:13:33 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 16:37:55 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 16:37:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 16:37:55 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.75.60])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ACMbtCd2707415;
	Thu, 12 Nov 2026 16:37:55 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>, <afd@ti.com>,
        <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-*: version bump to support wrynose
Date: Thu, 12 Nov 2026 16:37:46 -0600
Message-ID: <20261112223746.1226911-1-rs@ti.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF00046988:EE_|CY5PR10MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: dfebfc07-a1d6-41f8-75a1-08df417f8975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|18002099003|6133799003|261009223027099003|3023799007|56012099006|10067099003|261102123227099003|261102130727099003|261022113327099003|261022105027099003|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261026121527099003|261021135927099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: 1gS9/t+5FwsIM++jrolHBgG1w4YEHfbpXWQLeVygmVa1WlJqQSIJR8v+GwzfAt1w827LMQOy11wMALyLvm43hlxNzY7sgJz5CsPRvlJ4Z4977iIT/Ki9BVO8gLgjtjyvBOT0cu93o4D5tqVHC7BMTjgupe0nGRW6i2qpx7Tz2IuynzwTaEqW95OMPJD7On72W+G/E4KyXPSF7+OlB0sK53+FyLy5OXEeV/tLgmDYoELmT+/ZyEquC+y2a0LsocVfFVM9K88o6EiU9OpR4Xiizp9IpERyc/y2pWLc0VtsCu6QUkTUmr0M9C49g+VXHAeOz1gP7N/yMpVRQyZAkw02Z9mbVotljbTHHbDW6ncnAdt21SWpMIFdwOI4HdAuOzO7l7SwSFYLWeA1KAQ4U0E1yhppJ0gWzTCIsTh/MDhk5lEGOxeLlACzYAdmYYTOXertqoRoRdox6DdW+fcE0WYMNUKauGYyaF8TfakV5KH96sHsr/ALYwLh+FVxIcotNNm304xcv9UuZiRx43c1VpHqM8squXyjfwVvQUUM82D9aGTnCBb6ezfYkREzVL1TIx8aLbK+P3t+qhKil+c0Sq3XZWR4QqXhut1LW+FsIcdB83/+ka/3E38wPKt9qzM5H1EaRkTE6/E6DGdFiinNjSaox2eIkPtYXjWfpJOI+JuNgsDBD6nKbRsWlYNoo77uxQpXTZ3xkbtDU115lCB+2iUraA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(6133799003)(261009223027099003)(3023799007)(56012099006)(10067099003)(261102123227099003)(261102130727099003)(261022113327099003)(261022105027099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261026121527099003)(261021135927099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Wbmtxe3RKWzU5FeTQExgQ2sdvxTIzZqg9wg7omeON2sz6qym0OZg8cS7vDnvJ5ORhQD6xRJrVywNAMwpzgdl8lOUH1x0R3hS1g4oFsXcreztQJJGjvJNXT0bzTnyiXu8bTGR+emjcmy64wOLfcelfjSUWezUGv+zb+5ApGyBe6ZA1tZweJI6QEhHr+2PMhYWdB95qAbNVH5I1cvDnlK/xLcvpaPrFQ6UuUzRMR+HvtFbLGQe5rOaubdcAVxHfNOaHVW4ISNSJKyHZkmPLvYYVxusGezaYStgTs7AM+XMtqslQyY7MxhED+MhLJnl8+fsY7Ss7nAM+Ac0w33DcraJ9AivHD4yR+GJeCBl843zqZcMx1f706+dVMkFipiV8uYT/o2wtkYflrr9KcWGGVxQ3wFEnaqBKogAJ9K6T7TF/FyF/NGbzFDZq9A0pSbj5LFT
X-Exchange-RoutingPolicyChecked: tGwo7mR3WKQ7RvqP+JiZ1Rw7c+u/cbuVVZDwIve+5Touq7sh07LYrzbFqf9iWmPg4L5Q2fUGiY8rrmtK5zH+P1ucQS8fHB69q+ZHAG2eWYx60vmngulOngNBFFIedzi3hGvPNR6mvQM8kaO3KLCrb1VFU9fiy8g5JtJGKT5OB38DDWPkEycAhB9HxFVujcRyMXTMKbH7ZgCeynqC2vvLyKQbqDOuqA9lSrJY7qCa4plGUmiadwT8fM2zyPvBQ6uTI0Fzlmx3e/FaQMBAk2PvDaQbXY6KNFoeYL2CV+eXQ1EZu/5UhRwFSVsEaZSXIITkXhelODOFTSuTExr2ANlqmQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 12:13:33.1507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfebfc07-a1d6-41f8-75a1-08df417f8975
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN5PEPF00046988.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6071
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX+JHsQqg7L5Xc
 YgmiFf3SixyLJKBxm994bK+cIB6yxrmu8A7oUhdghWoTfemnzW6U0DbmnXv9teTq32qrL7I99tb
 bhmG7o5XVWhcIRl0FyYSXCHQDUZZTRmJ0gX0OHkX0skJJqALXrCuxMAFazT7eDbnyQGRPy/ZnU2
 OzGACGsUVP1bxtCcOhRoDIcWDV2M+85ky7fTTaDVRFf2CFpV7raZOrsFIQf7ovy2avGXdmAlbpb
 hGJ9IIw1pjn3haIxxg7M7qYp3l+KBbUCcCcEhcl2aI14gK2FnhJuaeET054s0GcBsDrTw9YiKhY
 UwMCnVFwWvMhjrmeK4qbfWceLYdoTyYeA5zvOfyKmqQ0YIklBons2Im4F9NyzaGaaGZ26NUB8Qt
 bMx1hZrtKV2GB0AW5zZ946WdUXfuBgA4viw+3HSzhLHeVL6zvAVSVPaIlBKm1fm+UnRaRhEIl/Q
 Cvlh/uF/mYItKYXiMzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXwhQhGvVh2h8E
 wmOEECvtshN0bOZBFl8OmBWKL9CL4k8eiak+dALeURBEYs8Fbgl13fqi+RHLcGplINLhSi+TfoG
 BdWLSGylT762j9FXxdLA+iWl2RnQQbI=
X-Proofpoint-ORIG-GUID: gjilvjFTMivgMVgDdHPTfPoRyZrVqMBz
X-Authority-Analysis: v=2.4 cv=b7oncdGx c=1 sm=1 tr=0 ts=6af6ff02 cx=c_pps
 a=CrKnoqqb99nOpAJSR4mnrQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=X8sCOy2RMbTavwpygE8A:9
X-Proofpoint-GUID: gjilvjFTMivgMVgDdHPTfPoRyZrVqMBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1011 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130048
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 12:14:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20535
Content-Type: text/plain; charset="utf-8"

From: Randolph Sapp <rs@ti.com>

Bump the SGX graphics packages to include support for kernel 6.18 and
mesa 25.2.8.

This include initial experimental support for a unified dri interface.
This deprecates the old mesa interface added for the "sgx" gallium shim.

This allows SGX devices to use the "pvr" gallium shim currently being
used by the rogue proprietary driver. It also adds some experimental EGL
features to accommodate the increased requirements for that interface.

EGL blit operations are present, but testing is currently limited.

Prime buffer import and export functionality is partially advertised, as
required for the mesa pipe loader interface and EGL wayland. The
functionality provided for these features is currently the bare minimum
for context initialization. Expect some incompatibility.

This is the initial version, so you may see some issues depending on the
application. Please report those issues if they are not covered below.

Known issues:
 - Multisampling support is currently disabled as it does not currently
   work (debug in progress)
 - A hardware recovery may be seen when initially interacting with the
   device (debug pending)
 - DRM EGL format negotiations may fail in some applications with tilcdc
   (low priority / technical limitation)

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc                     | 2 ++
 .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb   | 2 +-
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb            | 2 +-
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb            | 2 +-
 .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb                | 2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index bf90d1da8a12..d9f59159037a 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -42,6 +42,8 @@ BSP_KERNEL_VERSION:bsp-ti-6_18 = "6.18%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 = "u-boot-ti-staging"
 BSP_BOOTLOADER_VERSION:bsp-ti-6_18 = "2026.01%"
 
+BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_18 = "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-ti-6_18 = "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 = "26%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_18 = "25%"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 343f09de3d86..934e663849bd 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -17,7 +17,7 @@ BRANCH = "${PV}/mesa/k6.1"
 
 SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;branch=${BRANCH}"
 
-SRCREV = "9ae0fa4998b1c624408945e062bf8fb0ea7efb9d"
+SRCREV = "cfcc733d3d59f3287574fd4909e2cd4cd9346f3f"
 
 TARGET_PRODUCT:ti33x = "ti335x_linux"
 TARGET_PRODUCT:ti43x = "ti437x_linux"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index 2c20a538b2cf..f5dc5301e757 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -29,7 +29,7 @@ PR = "r1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',pvr', '', d)}"
 
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
 
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
index 03b0b9bfc886..1b53ac39d55e 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
@@ -20,7 +20,7 @@ PR = "r1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',pvr', '', d)}"
 
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
 
diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
index c4cc5f10ef3b..bd0656a3cb7e 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
@@ -13,7 +13,7 @@ BRANCH = "${PV}/mesa/glibc-2.35"
 SRC_URI = " \
     git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH} \
 "
-SRCREV = "84a396a4fb379f10931421e489ac8a199d6a9f2c"
+SRCREV = "f52f27edce0e961be46eb4426dd030a6ab17ad16"
 
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
-- 
2.56.0

