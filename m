Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3504.1795647302601705360
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 14:55:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=TfAU5oFF;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=jIMdBiVy;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: sen@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6APJASXS1582482
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Nov 2026 16:55:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=3yHrCQsciiu6E
	LckPksIcg6uW7itBb1/N/JbFLQ8J0I=; b=TfAU5oFFxvpNBN0v4iIv7Lte9w9a+
	QYKIqO7XPWZuzTXtAAqwlAqIxi9RzOr5VzKkSSasSifWXqZQJkaXOAI9xHrh/YNM
	uEFJv9ujiyprda3h1FTde8GIQQnFKHb31h1eMI21RodcpKyz7OyhA/S2leKuHO3E
	yzR7l2MX6CXaBCAm/IOmwNY6Qfwfiblp+GDNUrV/geuTErNWtKK28u4eIfONuRyj
	Gev1d6z7nILWGzwp978YpKCv2iXsrzSci/GkpbTcz0ltxSPnpHhLFTl2TyxytUTK
	kmYNl6EpBpfDzWZBjZAVF+TW2Y+BKr/z/FMJip8p7k+hdVwePkKXzI9Lg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012025.outbound.protection.outlook.com [52.101.53.25])
	by m0380145.ppops.net (PPS) with ESMTPS id 4j5j1rydjm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Nov 2026 16:55:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OY8sPNhZz9qT4Z4505WuSz9E2641HOCORbF8mIUyxD6lRzgn7/IhrP6raORtHiMDQ9RxBbzSz03fNab2QUNjxZJDFybRcKNKa73+ldw4xcBAmAOG4BDSvSPJfRSlXU3xYqQaSBUwYaDO1dn2mkdD9JkQ3yJ96eGGYkKO0fg/VphlgFzaOi4REnDWdO/5OQaJsqo7FxfkKEslLk5i9MgeS61WJbVcBlQH5Dnu90QeNJCEelkY81/914lGWwbGb8MyTkhcMB2cSmYeqr1oUDQVEViOYuutxeBOESKDR/IT9SaQjCv3tN8JGwJp7QdTzQyaRS8SdUZvLa9PSFfbW1fm/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yHrCQsciiu6ELckPksIcg6uW7itBb1/N/JbFLQ8J0I=;
 b=hDu8RHe5SC4vNIhHAFBRIG+rjL9K+iiBdOKSSDY09Ojmb4YuOfBcJdjypanfnd4s4lq1+b06hN5BceYr8Dnes4uF0nl7cXh/OEiEvkLWAwnyvyYBfA5nElVaeea/Yjv2/o/ARYf+H7rqPZ+Kmd0NojZiFSvBT0VcJwtcwmR4AxKjiF79cP7tw51xybw2+OlRt0zNZ9Hn6FrxB8PcjURrCkzSFXUJWUmBBFtr1zDgRT9KHp1WWmxbeBjXOCtYpOBmJ7fnaTay3b7c4GMtSxaf5SwGb2HRXMvj24v3QlFHMdo+Ij0bJsOka6Z0JRqSDuQ5iHFwY085PNPEsaZFeOXHMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yHrCQsciiu6ELckPksIcg6uW7itBb1/N/JbFLQ8J0I=;
 b=jIMdBiVywDuRPnAUlaK/o8TeV9XQyk90Uu9e0lbCpfwR0EzRqRuXUxNkoxO6qVhN72nwRrzBDSNlJCtOkI4E725JeRT8bP00PGhv6JwRA6ZLCq7ROGBm1fUD7mHQf6MQIgLD8YeN+3vZO4LJCNwpJgSCLn04KTfql4ZHXxDsGII=
Received: from CH5PR05CA0003.namprd05.prod.outlook.com (2603:10b6:610:1f0::16)
 by SA6PR10MB8037.namprd10.prod.outlook.com (2603:10b6:806:442::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 22:54:59 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::3f) by CH5PR05CA0003.outlook.office365.com
 (2603:10b6:610:1f0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.4 via Frontend Transport; Wed, 25
 Nov 2026 22:54:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 22:54:57 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 16:54:29 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 16:54:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 25 Nov 2026 16:54:29 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.75.230])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6APMsTof3639978;
	Wed, 25 Nov 2026 16:54:29 -0600
From: Sen Wang <sen@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>
CC: <v-singh1@ti.com>, Sen Wang <sen@ti.com>
Subject: [meta-ti][master/wrynose][PATCH] conf: am62dxx-evm: Package TAS67CD-AEC overlay
Date: Wed, 25 Nov 2026 16:54:27 -0600
Message-ID: <20261125225427.1507410-1-sen@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|SA6PR10MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 8023e163-7539-478e-a7ee-08df4b4720ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|10067099003|56012099006|261021121427099003|261102123227099003|261026121527099003|261009221227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: RdBks6v66x2C3R8vocoBj3x1KcEoQi2QkKe7HXPgLQ4rc6juhjOa/etva3cygZM14Zx96YRUFTn9ZbzUe0XFjjNQmilsG80G0RPoM93xQ5I/ESrB1lPMIuaSIZ4dMPIia/zg5idPsm4lAMKeUIwxwPGMPOJzQvUjRTM0cQ7jeagzW2TpgjJxpoFE4lmCgQBW8spoP1Sk39UCvi+HEMPMthEuQJ5CxdmILGAECMgM6SP2h2CNcYawu6+ikrA1xKGj0xmzZL3buFv8Xwga+YSKg7dfMnUbPk34BOR6SLuNyC07GFwebtOSzprPRSAINHuJdDi4J1XGPmXn3cEz+wAJgWpa7BffrDWl4gmkW+aMGtpnUeb05vagS5XgKEPTGWKeTKOiSu9QOSZRnxK2mXNLbY3DL/7dreqhFzOvWv6sd5BsJMb7gQw5QlOvh4w6dxY38uIgFts3sQDB1SU0Qhr2wMN7AJFefEi9noZIFu9hcyElt2rn7xa6njPZMurqvl2v+e5mwC0lUzJW40uDypOFiozxwuEXGJ8+HOqPrsoRhLMEj0lV2BZ+YdmGX0ouzvv1b8Q6X0DV0F/tibcjfAF2x0usOvJUPfjd3UfK1MTYHWNM5XuUsyiHNpx0O/xzSUtf8xLHfs7YEaW6ZetwpKs8HjooCfz3arSCEC/K2UPgeCDWzJz+Xs+ks5MJe+uCp9T2C3ieOZ7HcePpSdb5QZc7gw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(10067099003)(56012099006)(261021121427099003)(261102123227099003)(261026121527099003)(261009221227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: p5d7PSeJJEPBHjz4960u13FrGtwHcM1hYL7omJzliUXDv1a0TFKbVsSxPuZ8KcpDilIXuU5D0jQo1W+LB7QPMrTM7QMItJ6btovbW1+9JxK+zeV6qwC82dhvDBxFkYd0P+45BmA7HxEPpdWjS3jcyKgdnQiO6IeF2ZiHDgCW9sIuvn63iReas/QaH68FrcVM4zxisx6HghjeGLBw7JCwjrdHCnLNyPWZxX8HwjKFGl13kR/kgLTWUjxth3jEY299Po6HDWLHG+dSLbGvY1fCcVPL57Pa6NVsiF//4nmglEuUrtPNREQ1cJtGeNVUVMEuqcyFeSwvrIiDKK+spncRqdvrX5zfPwoausXUOUj5YeMNrCfjTts8MnoitFN+bJx9vPLD/ZGgGJXzlizYOD2ZWfAb3Tg4Wl9/pXkKXmdhzNNguf9aRkkBdHKGtpEzWsyZ
X-Exchange-RoutingPolicyChecked: H7QBUi0xwbbaBWnpsbxvJ/pVKg8SRLLg05jCAxVB8/Z18+mtBCKtNSeI1VYZMDd1sCE9T6rW1uTGuZ5uWMPfY+fAOGo3HfKQ0hweSVjfWuqyL9hrDjr0Shm0dbZK5LBpOK1ZFu2JLoLSQIv7ro1xxPSq1YUn9+U4g/wwE8ddOY82GB89nyf6wL2bvNxv72sZdvaqark/tN7oSu3tew2N0fBl///kujBdSWKXHF4ZIM1CiwbFIINjPKQdJ5Pkcek9Csv36qziFSlQO2JkRkxU2Se3E4wGTvpwdk4uo5Ft4Ukj7PXVOmeAQMcqeHA31ob61Ae7SbjxbLtq5AcF1L1rrw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 22:54:57.2087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8023e163-7539-478e-a7ee-08df4b4720ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8037
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA5MSBTYWx0ZWRfX5WW8rZUOay5A
 iGC+WJYd4Ccy7LIf5Q6ZDCYKd+COVRUjO94lFtPNjMavisUvdbCuz4k9+Zgq1yti4d8TqCLUJ7H
 nXEgpYbh1ApzG/1/oKBBr3HfOx2hjCwJtNCUad6Fa9dGzzSI6mJxC1wPQZHJHGrAdWyL8tVJ8Om
 iY8dHYB2v7Vfj714B7Q5A/FD/Yjq9xdizDTmhjt5DSy3UCB4v1yGmJgNfbhAELEedfK4OJQt6M4
 7M3/JpAeAmH/X4uaDp54eiXTyFuAh61htJs5OwI7rX1mTr+NQATMXoG6jsM8AAkEmwY/fpbmAKy
 z3jhQ2xUnbmkQMUFf7fpSzUKwsc8sFc5oWRkkuQFvCnRrgvYbY2Wl+p0l6cKQdbhExCyDDQ2Y7o
 4+p0ObEsCY8k+O9F8Ks/a7XqQ/6u/woSJD1LlSXCLT2hf/1DCFiuP4w4Tk6aWbNggrwl4VZYuIk
 k8b4aFX/LPVDdaYLkUw==
X-Proofpoint-GUID: 9wBoIKyjiy4PvaTzpJBb33dbZU6owjI0
X-Proofpoint-ORIG-GUID: 9wBoIKyjiy4PvaTzpJBb33dbZU6owjI0
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6b076745 cx=c_pps
 a=DkeX3LL2/Oc4yJO52xFMkw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=KtktL6GSBGA66XojGxsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA5MSBTYWx0ZWRfX+RjNQRSca7+x
 cUzw7OA0IHafPX1qCt7aBp4DypuzpSZT4cu3vdzQWcF160az5OBQCJJjoqcCS0N1J+OAYZNhgby
 k30WYCk/6Mqbz7lymm66s2ryxW+gENk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250091
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 25 Nov 2026 22:55:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20571
Content-Type: text/plain; charset="utf-8"

Add the k3-am62d-evm-tas67cd-aec device tree overlay for am62d-evm.
This overlay's prefix does not match the dtb name (k3-am62d2),
so add it to the packaged overlay list.

Signed-off-by: Sen Wang <sen@ti.com>
---
 meta-ti-bsp/conf/machine/am62dxx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
index 08dffd98..30d25eb6 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -6,6 +6,7 @@ require conf/machine/include/am62dxx.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62d2 \
+    ti/k3-am62d-evm-tas67cd-aec \
     ti/k3-am62a7-sk \
     ti/k3-am62x-sk-csi2 \
     ti/k3-am62x-sk-ecap-capture \
