Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FAFC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 05:29:40 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5194.1786858173951421211
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 15 Aug 2026 22:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ngaRZr4a;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=gEEWfjSS;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67G3U2E31687048;
	Sun, 16 Aug 2026 00:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=hg3OrmxO3Fb+I
	x21Au7mbmodtty0AHxGyqdySracobA=; b=ngaRZr4aADdw3Moxno88BtvcQlK8P
	TLDTTfWGcC2sKsSBk+XHT8vyITYYN1bAnbjaaHrU7oj0u1ihtTARpjRrvWGICi0X
	0R8Nt9h+3P/k4z4xgk2lUv7aPcQVRmGGikjTtQ9e6Bi0YMU0PiPqeTyznWzfOFzx
	k1S2R8GGcleOyG0hDcf41D2tRGVVKaJLmiw11aThgM8+U/a4Pt/jCpzCvRky1O/x
	hgotImOoAoAZN+kGTG1LcSgigkOoPxMtPwJZnzZjkKqShX8ecAS6GLbaw6XcpjC7
	OP1UzYtaUMfWbGP7wGCHX02SIvJW2iIQVukKMhi8F2msMP75s+iySvPQw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g2gg141k6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 00:29:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIeV6NN7WjqVTESjK9zUC+BH7uD/yWbF0WFe5sRTbLD8k6Jkdnzk8BkG45JMo9mb4uw6eKtX5wB9d11EbKYO5OCSdjRjG8x1dVGfvxqJBkRfuqHis3rEBT6Gy0ERRHj6i1mlTMbLiJ4yZM8fmdY/1QqpyhxAiamylCVTO0/Q7QFF3tvdEbnrNqOEuJoWeCA4Z1jOvypsmPrenaVL0/aCTxwEqAxZ5DJbRtibEALhfH7odb7dzQzcohGraXtR0ToLQveHaHMNlFqHEefzBvG1VCR8/WvxJlUvkRyHtOvfnrZUtphHigbDPrGRkMS+M6bH/e9tWJByDarcquaM/8OP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hg3OrmxO3Fb+Ix21Au7mbmodtty0AHxGyqdySracobA=;
 b=FdYt6fHczn1xmD6JxnvkqlbghaepXz0DybqZIgkM97vNl4izxUefyRq+/ifsiN2pRYvikGlnXIlbHty9Fp9hXCACowOZ0JRtHyBY9k/Esl3DuNSdVyZQ4rUOR4zsAnXO1znF0CveXEGOQ/WF0wBAnnSxgcJ5dJQe6IWw+RtlznjmEWoiLaWhSSUB5xGGrMeymLGBmp/r7Xy/EtboU4BbFFp/bKcNaWLb6rrjiyMSelWg3oFicYsWMmxnHPk8F81p8aLHDPFe2DNb6AMjrhCVuNuSbci8oX9QejSkZ/gnR7NhGabLZhjAORIU1Xs40NrpKHu+YsIGKYr1gfv7Z3kNkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hg3OrmxO3Fb+Ix21Au7mbmodtty0AHxGyqdySracobA=;
 b=gEEWfjSSwp084LzXn2DPgOQnVrB1RKLafRW6JGTW9XBTttWzwBey5Ys5dVtHNHMl9wBq6mvDDyvCLWAfB+jFYhuxm8AEiT/q4G7c4V4gZtLIygae+ei8uQiwJsfqo7qvRo51wn38DwUcH5RGdVA/1flXrgx+vR06PmJ3k+VISUU=
Received: from SJ0PR03CA0286.namprd03.prod.outlook.com (2603:10b6:a03:39e::21)
 by CH3PR10MB7905.namprd10.prod.outlook.com (2603:10b6:610:1be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 05:29:23 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::a2) by SJ0PR03CA0286.outlook.office365.com
 (2603:10b6:a03:39e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Sun,
 16 Aug 2026 05:29:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Sun, 16 Aug 2026 05:29:22 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 16 Aug
 2026 00:29:21 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 16 Aug
 2026 00:29:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 16 Aug 2026 00:29:21 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67G5TKnP1392590;
	Sun, 16 Aug 2026 00:29:21 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <afd@ti.com>,
        <v-singh1@ti.com>, <p-deshmukh@ti.com>, <j-sahu@ti.com>,
        <c-shilwant@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH] meta-ti-bsp: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
Date: Sun, 16 Aug 2026 10:58:24 +0530
Message-ID: <20260816052824.62080-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|CH3PR10MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: b632bece-4cf3-46f3-928a-08defb57541a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	W8qZXiKnpIX60R5NaToV/V0YgFsOVffQsXJBtqPgNG7YD/4QHn/6fm1K201cv51yHMdxwFfK2UXbq9Ig5XMWPm7LkthH8UH9nhC1F8oDDMS4IF7Jg+dajady1BJOjBj5ZNLAAfu986/v2tcpni8sfbZ5bze3CAs4LuwgLRPaoUeQR4dAf6pJDpC7A0SK5/k6+jIbDP2Fy14+6dvoQl10tsCLUIcL4pX76H6kftV0pDd5SA2cwvfDk6UdcgEcut5KzLbjaTKhxmgUiwI0DapBHv/MeV9q3hD3dkVF+FnleaS9AMMWTP4OQrUHh8tsl3xBYpJgaolyu9gJVIY+dRYtiw3+39+I8N+zg9plDsxEOm8+Y4mNy4PUqVrCbcR1lUwBLgupYyM9GDX5WgAxyFPqQ30FbL4svM+QVskK9E3SUiTDSfcUiep8pCOAj4OX+T73hCpjBtxjMrV9Z+LNSX51k/Ia/BBzzcM2gtXtjgJY+aEFFy/jp2zBkG0ysb8YHK5Jq371P6WU6nBc7/uv/FTNOfrX+oVCmSLyxVU3SDppAfFPwDN3ypvmfRWhkCQfk0N9xGYiZkYsZdLRq4np/f0ciH4mYLi7kOESPs19xg3aUbPXlGxtOfsTciEHaOkZRrng7gW72vC7WZsu0NEMhIF/l6LCTu/frBGWbKv9TW+LW7hju4Hj6Edwk4RFPmD54KLNlStukk7PSXj+yUEpecmQMw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WX9xVL3f90/iQa0Dg9PfRPGy4H/rmPPkeCKMhHL13jswVUChlN/QT+63O3pI5tgE7VJuHBfK9Z58W4Ov1lHGKM6s230aLfWxqcuTgnZerGZvgdoww2LN+noOS6JaFOSsWTxoP5pNLzOnL3VMoDigjJtKxIgJ19MsuQKdvZ7dm9idy2wlUZQ8h1WgmXP4iMkr49saMe4ANubptouBjn3CwMz5C9m2lyXJqSZQeeDBqqmlXyxIg0J3qEXGmEgJ7MNhtDRN+LBP/MIPA3ILcpFNsbUOV3QpDUCQeHX6b8+JD5bIUz1jdQKbRs3Dpcvh+RZb8lXzqLSRV/0dvzLLH5lLLhYJDgSIBtENjGsEaPl17pGej5TTl6YPz5TPVmcEoM/gSpzHoe1CXr4CUItcFiAGkJ1h49BlPxxFL1xqEflY13cd72uxYDlyPUIAnkhzvTGH
X-Exchange-RoutingPolicyChecked: 
	bhvvsHgss/Cb3bEytcugJGE00JveOA3SYavGl75jRtCGzXo9H6mi0136DjN6v1saQmjnDH6pKAcdWNd2ppDj6YtCPgrjjmQe70uA8KQWXhxgPdq+x+0+6qU/Zd1n3xc4tGva+v7vmhldNOHT7FEhA+o/201l4rob/IDy8GO0z6hcBmtFpp7uOlnkWWUoDOecV0ey5aEM14UKf+gJxxaT/EiBL9HrPfvszSVhgAwe2kxRgpaXO/0sDH6/k8uUq4/+AVJXYVx5xAjPnAwVNCuStppf4kU8hvivwHkd58KLmxCWeMJ+ZlHoILkd+Mhmz8G6NOXsNJ2+ClfipLjm2sa56Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 05:29:22.3617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b632bece-4cf3-46f3-928a-08defb57541a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7905
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDAzOCBTYWx0ZWRfX59mQ8PmGfSzx
 SffKqjptLATzs83FQKA65kGMAniRkDzOjzGaKGN9wzeMSm3qHv6ltMn49sQ4QkljQRKXF9Lqw2h
 XBfKDDw/y5tcow9RYVc7hxobomK3LfGhkZr4pDtt5ELW747XAvKTiOvBTGDlkleQjbKs40g/13O
 DYd+acLBGUR5O1X9Bsd1HE2QmB6/QzO4/cDcseZWLQ/9jOYdfY0S56Qvy+4ZFZWolLaw3ddgUPK
 L69CSi4foOwRJmQ/Ew6yBBJMq4AHC6wwqQaT+SobdTXVOBOf/qvr+C1w4uui2OaUjzBi/GHWPsZ
 aZI1F+l3YGzGtuKF0zeGndYtFUd3PvBPgC/RpsAVNbbBPpqzlcB5cz/JgzF5Hn1Qhr0KcrhRQ7O
 xSKOCm34CIrPSECMe6G8zWiWHYPDEwXObILv3ZEi0IJFI3cdtuAHwSwSEgAk5cPJAILKmaCgElk
 yxGqvBaG3rTlxfViacg==
X-Authority-Analysis: v=2.4 cv=eLEjSnp1 c=1 sm=1 tr=0 ts=6a814aba cx=c_pps
 a=TofqhMGnQVwdh0HkHXulOg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=GjcEPfTXUfHWH2LR4BAA:9
X-Proofpoint-GUID: FeCSfC9YcOFiFrl5mjHsHVYNh4hpMPZ-
X-Proofpoint-ORIG-GUID: FeCSfC9YcOFiFrl5mjHsHVYNh4hpMPZ-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDAzOCBTYWx0ZWRfXwf77oyS+MWUK
 /UeFI2mIuanFHCaIXHskYuAXHgudKUJ8k7tahrQennK7WAKlGSYslc6gvcloxenZPL/FrgY6gxj
 RE9YJbHjYb3bqCkEj3s26fxo1SbuHRA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160038
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 16 Aug 2026 05:29:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20268

Set dsp_edgeai.c75ss0-0.release.strip.out as the default C7x firmware
for AM62d to support DSP-based audio pipeline (STFT pre-processing,
EdgeAI inference and ISTFT post-processing).

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
This patch requires the corresponding firmware patch in
ti-linux-firmware to be merged first.

 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
index 20c6b531..cac461d9 100644
--- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
@@ -47,6 +47,7 @@ C66_1_FW =         "ipc_echo_test_c66xdsp_1_release_strip.xe66"
 C66_2_FW =         "ipc_echo_test_c66xdsp_2_release_strip.xe66"
 C7X_1_FW =         "ipc_echo_test_c7x_1_release_strip.xe71"
 C7X_1_FW:am62axx = "dsp_edgeai_c7x_1_release_strip.out"
+C7X_1_FW:am62dxx = "dsp_edgeai.c75ss0-0.release.strip.out"
 C7X_2_FW =         "ipc_echo_test_c7x_2_release_strip.xe71"
 C7X_3_FW =         "ipc_echo_test_c7x_3_release_strip.xe71"
 C7X_4_FW =         "ipc_echo_test_c7x_4_release_strip.xe71"
@@ -101,7 +102,6 @@ do_install:prepend:am62axx() {
 do_install:prepend:am62dxx() {
         ( cd ${S}/${IPC_FW_DIR}; \
                 ln -sf ipc_rpmsg_echo.mcu-r5f0_0.release.strip.out ${MCU_2_0_FW}; \
-                ln -sf ipc_rpmsg_echo.c75ss0-0.release.strip.out ${C7X_1_FW}; \
         )
 }
 
-- 
2.34.1


