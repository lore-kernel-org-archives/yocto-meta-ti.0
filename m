Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4054.1794605074634983353
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 13:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Z5RV0gI9;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=ONeCjOwh;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: rs@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADL1UFf2271434;
	Fri, 13 Nov 2026 15:24:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=69nEgymBJnI9B
	BwOzZLBTye1q1nspcGfbn4ImbGJeKM=; b=Z5RV0gI98R41yJNK2Flz7ReFWk3FN
	R1xjcje9NeRFd0pbKGSbFdcXR4/mCoveKBUt6subV56ZwBcFA4OGUcRK47dTKuKq
	s/Vlm2M5ck0vULRQwp18B8bASSsQpZtE9Z8xlBtIIxwfNH+FKymx/lMcgjphDHuu
	kkRxDTprSmZ6yKjgnaT99QRW58f8Glddal+W7STgDLVZINsNhIX31wga9DRbUoPf
	DrxKnV7gIoj4IXDCyOABseWEfFK9/nXKRWo3UH8PZnYaY4V0ay8Qy46w/cYG4atF
	MseNcqOM8rA5ljMdSMKVXwAzIvr/DXbkUT4pg5/vrI8B5hsr0gfu8KrwA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011019.outbound.protection.outlook.com [52.101.57.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hwym3c1dd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 15:24:31 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVgcbUcDkcSkJdpYs+ChjS/sEpatUoTtCJK227OMjfFGupgIWcpFrHUlUEMhc4T0tNVYo0mYmRNmEhV5oIwrBoiIV7WTQIvSXZuNa3JeaTXT4rbbSBCBc4jvJaSazhp6wQn99Te4ul4BzXEhPoule4Oh70W+7K0RaDrX1wYhyAuZkCwsVpxwURajae2WYm24lGT7sekN7SX8jI/PtdMrL7M3DuCX22rLXghwI+YRetmNQgKEX2dphmnhTfuOa9xWwu7JMFrPb9kCUnXdDLMsBKXYpnI1Xssahc2NN2vBk2nUXdwhGhwF4zxJnXi4aDw4WC1FKCaW7F0QAQbK5ipnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69nEgymBJnI9BBwOzZLBTye1q1nspcGfbn4ImbGJeKM=;
 b=oOvHgIzw+baAoRA++E7vZiu04OS7CVhgnE7emVc5qDq4wqBfNBLFIm3LyvNv/FdWM0iNdT1dgZx1Qi6GorA0Fe7KPeOHsn/pH2ogKii5t/sFs9XkMKsDu4jOUcWxxoxaEqMVeEjuPrP7dLbj5DRNJeRYVA5x4isd0Dvput7eJEvqZHbCQuXvQw+0//+f7ekP43qXKZ4OwCO1eur53Fp1+m3HMQMN9qqQW27lKW0rYx568VztX01FseXnBNmX/XmLii1Q4NvjAD+azGFGJc34yfzaPlGr8odWMd8V657eSRO+7dSB+tPPTa39BeZB3vx/HXFwd7jtnG15GEST7+261Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69nEgymBJnI9BBwOzZLBTye1q1nspcGfbn4ImbGJeKM=;
 b=ONeCjOwh0YEiSOwM1Fab6cpUSwD+a4UzTXCWzaoBJcL83oD11qC/cfhiWxT/EHG+fdWRwdDzE8QL9tW3/W7aSykrkHO53Vi3KGfxVsZmfE9lgWShVl/s7gyHH5S7ThncNccwsY6E5o+wyM1F2PTqSlwVE7wFFPOh7YwzEzwbU/o=
Received: from BY3PR10CA0014.namprd10.prod.outlook.com (2603:10b6:a03:255::19)
 by DM3PPFA927664FB.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 21:24:18 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::57) by BY3PR10CA0014.outlook.office365.com
 (2603:10b6:a03:255::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 21:24:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 21:24:12 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 15:23:50 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 15:23:50 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 13 Nov 2026 15:23:50 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.75.60])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ADLNo1n764705;
	Fri, 13 Nov 2026 15:23:50 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>, <afd@ti.com>,
        <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCHv2] ti-sgx-ddk-*: version bump to support wrynose
Date: Fri, 13 Nov 2026 15:23:42 -0600
Message-ID: <20261113212342.1705645-1-rs@ti.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|DM3PPFA927664FB:EE_
X-MS-Office365-Filtering-Correlation-Id: 074c601e-530b-4eea-13f3-08df41cc76a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|6133799003|261009223027099003|3023799007|56012099006|261021135927099003|261102123227099003|261102130727099003|10067099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261022075727099003|261021121427099003|261022113327099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: vULOvEAUWYV1MI3YvacySucDv5U/Nev4RXbNfOSUYazgVjzeT6qcNMCZwrwSvuAU86aFh7mXoJuDdVBRgEgYpzPSEt7Oueedzp+4iXax61lkhAvThMYoxZmkuoLYQ7FwURx0wueeIa94i1i4VMdOAsbGwX/pJY8OE4OrX8Dhdq1+nPsSB/VZmnpUp2Bu+pOSoNHz6XVXkpv17HGS/WKFNAtn43HWzJ43nMpm2yW2FSVYnoeK5jvrKg0+Qa6NHeAdBJVwdcWdWvArNmJAbAsadpw8jT6vh5bVWpsT0ySwrZi7wYIoretroHxnTQLDEPWLJGAdmd7Gf8d1rjrOwY/OE31g/wXyV8CxSpF8jAlPWbG8Q3bN/iK1sNJrq8Is7GGE8P21rZ15Lf+5w818UW3cXVA3MscSB0dp2pEKTc9uZvOG2fOTq0GjcZa5BOpHFu9+e+vmV+e48oiTyK/56M+EbDN1YnLNBZAT3NhvCS+1MG/yJzjvuWWa3PLQlL+UA0MV3tZYLoZpvEzZegRfVE7Nwo4Fai/9AhcceFDhbK7REdCA1DU/L0pACMhmznnVhoIEYN5pJX2FHhzh6EaSnqJ22ZVUTp1ki0CY6tdPV6a5cXCm96AIYgHp/7fIftuf0G9pTu27R72TGPfEZ1m0Up01/oM0fNvQNCbnOT8WKyj8PAFYrT79BcnzaJMEN9lLFYQXDT5F513O+LnkTaPi50Q82g==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(6133799003)(261009223027099003)(3023799007)(56012099006)(261021135927099003)(261102123227099003)(261102130727099003)(10067099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261022075727099003)(261021121427099003)(261022113327099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1XQ4gaD/WkN+V0iPnlZszk3Fl3k5TFB3np866jjwHO/Lag8iUHT4WbXSnE5582NlIPxAthYJFwmeeena8Snmvt0Crb5RisZpcwKVwWEWPdsy5miOlt+AXxmbgdXqi8y+OWluvSZBO2ZbYwCHLQZ9Kqp7OCUoPdx569YbFp/bOzpu/Cv0Azt+lPEQzHiMQowR3wCynvxnpEKlpRHaptmqAanUPr7yHOh2uG4JWnHoMtRToFrb5woRNBed8LSeG5H7TMvutw0Dc5zAPFRdfLh5JTQaZH64d6jl0zQc/Vo6C2uQfoUlHfhowik2y3Xn4X3N5hizncLlvqsxu+qm4A93uoI17RlIq2RPA8AKEP7zi4AEIbb7GFW/vSU3OqpoU6Ww6LDx1pwkYsaNhg0I2cSTYUvpqvnNPTtyQMuIuWuVKsQ/yyGT7lzxT5DBrXWGcB6Y
X-Exchange-RoutingPolicyChecked: m1fhzeEBz5O1kxdAy+Z+FDkrfMJkYRzWkrz6kRMIE+89fqPkri/GinPYhwpDGIJf15L7bmFRygu70oVKiHSdee0jQ+zUZAHMDvMCREU5F1nkSbj8DHTOJY8UGN9UkcQvnyY18xBOyQQW8672r04bcO0UUHaaTxTUOIfTfKJrkMoBFqorgaynrelOnThu//5qkvaFbABSUdyYweYmini+Uuu+9YCdcuy5v+IKxM8/kCAa0dpbeWZaXnxnbuUbdNgaTGA0B8rMmrZQTMyFjocgZtj54n5yki2z6rvauWHsuiBgFoc8ZHGwdZQgMpzPIbn7GVJZTbmzdvG9ZnP6PBehdg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 21:24:12.8329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 074c601e-530b-4eea-13f3-08df41cc76a6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA927664FB
X-Authority-Analysis: v=2.4 cv=cpgOAF4i c=1 sm=1 tr=0 ts=6af7800f cx=c_pps
 a=C4vld1iEI+sMWzcozXu8ug==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=X8sCOy2RMbTavwpygE8A:9
X-Proofpoint-ORIG-GUID: 8eVMlEvbiQ4EoZu93CH3D7ZSgb6M29b7
X-Proofpoint-GUID: 8eVMlEvbiQ4EoZu93CH3D7ZSgb6M29b7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4NSBTYWx0ZWRfX5422OzmsRAqe
 FLblCkz+ICLD32qL4xU7edakUiJs1Jkal2itf51epNRcBLehme7ERML2eGJWJLly2rweVkotmYj
 ybrWrr+u7QmYSSDhXxMr7YKWoB4ZcsU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4NSBTYWx0ZWRfX98/+/dRQBi82
 CH8baASyLSuTu6Na1MSlBV3Z2J1teAVnNWNlcff4aLPqnZgW9HMP1xslSDVdOuNA/ZsuFPhORU0
 aFDvB+GQJS48FHwF76qyDblUXaMd4uBYfTjwEJ0T7UTHK9mN1ErWqwQtSHbaVwRvzXYUaQyiuQG
 cImTem5hBs6xfJ+fv/Us9AkmSZe7uZcpBKbXFKykbThYNHCsNySwE93HiPFt+bljwSxcdq3ffXN
 aRWPep3HuRrnOCDF2NT1MFaqNWfpi+RwLEsohkgduoi49TqysSoHtyuzfShAiwhGtpQ8QomadPh
 nU7EYt+dMoaq8y8jbjDouE5JSUY7rhib1/ZNYz9wE5SqKcU52zcYV4TQ1Xiir9xvNZOqnoMbSIQ
 6mCgT4pHq/Eewc3Qgt/9K1yOcDAMUXkh+YtAiIJb6uHTN41ZIsM5JfJVnrJfUQeN8G9HZtI5gHb
 mKWw2pG7aaMWBtOHhvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130085
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 21:24:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20543
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

v2:
	- Unconditionally enable pvr gallium and vulkan components. Though SGX
	  doesn't support vulkan it also doesn't break anything on these
	  platforms.

 meta-ti-bsp/conf/machine/include/ti-bsp.inc                 | 2 ++
 .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb           | 2 +-
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb        | 6 ++----
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb        | 6 ++----
 .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb            | 2 +-
 5 files changed, 8 insertions(+), 10 deletions(-)

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
index 2c20a538b2cf..f671f162f39d 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -28,10 +28,8 @@ PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
-
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
+GALLIUMDRIVERS:append = ",pvr"
+VULKAN_DRIVERS:append = ",pvr"
 
 do_install:append () {
     # remove pvr custom pkgconfig
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
index 03b0b9bfc886..6519708e17d6 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
@@ -19,10 +19,8 @@ PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
-
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
+GALLIUMDRIVERS:append = ",pvr"
+VULKAN_DRIVERS:append = ",pvr"
 
 PACKAGECONFIG = " \
         gallium \
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

