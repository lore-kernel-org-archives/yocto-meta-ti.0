Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2248.1792742188359535878
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 Oct 2026 00:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=JGDnJPAX;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=OxsoJux4;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: r-sharma3@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7Eqo02573730;
	Fri, 23 Oct 2026 02:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=nCaRQEhNlSb8Q
	WPJjAZQMOOSF3qvUu7OdYRsJG/w7WI=; b=JGDnJPAX6aHtuTCaek+rxvcDWD6Ix
	ac3bPPHr6ydbJqcVWddekoA0zGdep/c3AhUNmVkYoXQHL3L5dw1J1K3UQ1W9qDpJ
	FEqn/EmM7bMAVdWM172Dy0yGbCUsrZVGEBuTzC91iP5AIuum/ASsZyiGQaW8B0yZ
	yhldTuC6F9cfGdy3oGRcWJuHFY0HfPUpG3NG0AhkkGmlkjYm1Wq/4pJZ+coL95Rq
	e0whYHZpPxKPyIuGCgMXQNHmgwajIGKZ5o7om55xx32xaw9v9Vj42yYEc6Q6vU6q
	T9xAvqInK4sLZlqdn+++BqFo56RDY1UhdRwLzODAFZC8dkLD064cQo3/Q==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013023.outbound.protection.outlook.com [40.93.196.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hfmg05927-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 02:56:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6vH4HzOsoJmLvQIW4EpXB/Pbd33icN6Oh5Rm9poORIV8Kk5jrHOmVOSoBrYJJxVl5nQ4pgoq6k0wI3gpQyNINjiTQZXk59/cHHi18gCbBzjes7J4s/ahshmm8bYaBva8O3/ACj1scfLaXdbiGAt+MrapQMzrLxbKSLkXB+ajzo2IgIYxXkF5GC4EZTcoqhmHA4qxPDEIIFDfPykr04FdUKO+FCv2RlvDmcxYP5YcdXoncGbeLiDTwVN0gDzKoIzDVwJQ76H+WhlTiLVzUfTK/nWd2I9IW2LuV8pBXysEEruvFDvjasc6vMXxNmoMCgQtadpe8nKfjWShjz11yqfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCaRQEhNlSb8QWPJjAZQMOOSF3qvUu7OdYRsJG/w7WI=;
 b=w+agh5tHLBZEfZXd7E56ek3FmlInUJmafSrGji0Q2kY03jEimD/lw+OuOXpygFlHMYa/+RPCr9AJjFuQh0m8A0SnLhESq8LVheaJBiv8XFhWVlaDZ8afHfBvDJPyTJ9QowmbQgdu1+h365bJCdJQAdsa8ZqT1cN5bIHiPwuzZkPQwncMew3ZDUtpzecXro5wvgHDn7hgiIwj98IQXm0CR9e4gQvdqJKjASvLfFXdC6KcHF39muAflw+qe0tZwzP+XkZyn6T5t02mN2x/4OEQqAECXvgdb6qaympJ40ll9eec6apvrqg21vvxuyQQQnX2Q/qBwOv2y1KepMhsuw3axQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCaRQEhNlSb8QWPJjAZQMOOSF3qvUu7OdYRsJG/w7WI=;
 b=OxsoJux49b/qSuK6aqyeWif/nQSeiEOYClw4RwyCKPVo+7BsrRBzmr83rm09I+oSzoH8+udjmMS/J6kQGhm6PZ5Rq5NzZ7C+cT8wB1PW+ZS22v5FY3CMRNEYE+XDjJzm1vV/97b8+onPAK2s2Tx1asplr3RKZYd4q+RGbH+yr9o=
Received: from BL0PR05CA0028.namprd05.prod.outlook.com (2603:10b6:208:91::38)
 by SA2PR10MB4475.namprd10.prod.outlook.com (2603:10b6:806:118::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 07:56:23 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:91:cafe::6e) by BL0PR05CA0028.outlook.office365.com
 (2603:10b6:208:91::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Fri,
 23 Oct 2026 07:56:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Fri, 23 Oct 2026 07:56:20 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 02:55:45 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 02:55:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 23 Oct 2026 02:55:45 -0500
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69N7thft2033407;
	Fri, 23 Oct 2026 02:55:43 -0500
From: Rahul Sharma <r-sharma3@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
Subject: [wrynose][PATCH v3 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
Date: Fri, 23 Oct 2026 13:25:39 +0530
Message-ID: <20261023075540.2577479-1-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|SA2PR10MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: 104f705b-288a-4590-59c3-08df30db2058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|6133799003|10067099003|18002099003|56012099006|261022075727099003|261009223027099003|261022115727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: b7oBfGgIE87p+mE6048Jj5idnwezID+5xmJ0f1c3qysZYNL2RCxJJe/+w9AJpiQnHaiTeH4vdv1DnpylwU4q7RTXb2XtF4iiePm2YFT+6ZAJVpTGS5EO/PJJngH/AA2n5xS1dmx35G8Ch1zXMmoDCRSLfNRuxLImjXDzwNJBgj8bg0AAEiSyH+FlXqEyjrPiZrpwLQDp/mHFNPUX6hrfnd1JgTv9uTzlBhk22NVE08kgiy3sYkJxUqZOxqdZwlvqwNhnJgF1uvf6IRlxoyRVUiU9D4lzmGXSsBZEoc/b+iD9vsaMzRkdqmnEYvygmMgbQBKoGJrsw+PSOrurKcViaiGgrrqwjFNQRPrGyBEm4lOxibeNZuhBqoG0eyyhOHNvccaD0lbvG+v6Atdl1rVRj0BvSFgjijJm38JZtoB/tESUFLLzp0J3zn6czIZL8DXW4aoWFETWgptIFiT2NSEw15hwJrFG2HUbuLfvtFxhSiT7qVkKThhXm5X6i9zxr+qnCyE+0FqGXIhHivMiRaT41lwCd3hqSXf+aXQpuNP4QpCqU835FL2UHdxiw9N8zkOidRTLuzp0WtSrSZ47EmHR9y59UJOj0dv9CuqJyh71qmJlTmc1+zIGzRjSk7t18jPqPQkUjerO+G2YIjEWpfUjbsEBBdPSlZByQdu3UPw8XZPkMOj99TzQ+BEg3AJFoob320vHgBzkM6adnPFUahpX0g==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(56012099006)(261022075727099003)(261009223027099003)(261022115727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Uq9RP3b1aP45JgDGcr8RxbgmD1eWnkmBfPYWOvbIhiAuhkMBecp7Mu41d9+sFcjrO8Zm5eQZR6EoIDqfbluipeuzyEffae/mqgqpWS2Zs6sJ9ra08fWHxovgJDt8tLJOYdMwx7mxGUEDgmS2R292QCckfxFyOst3KNPTD5c0YxAi5gX8XUJG+OsXhOEL/EhpGnClfZSKaoYGM7qnnODZxzxNgoHkA7Hg7oLxvK5ynrdXJphyzPWg8/S7qoNQEoxzkQbkfdqqHWaDOyC/p0S4v0CkUMdNZeED8LW03vcuxsjdoXiWEUruPOC1CJIlw/KPh8QdeibigwBl5s7TVBYV9fbO78vWbbP5HKDl2AtaEkyMnSfoJHTawrKd5Jds85wRx5PhaoRpkZkFKPpjMqOGWDv5GKyXuCqjbPaThLPTfDnw1b3z1/d8V/6rFmSV3QvT
X-Exchange-RoutingPolicyChecked: gZSRyejx+HYnOr/YICY+6pB+QvYiQjKrsZFFvjLZmb7ZmOxCZ0HtbwIEm0AVR2KH/ILe2XnifZS4z7VIuYK9m+GIX/vUKIKzHo+tHpyefVlXON8572fAA5Ts1yMo5mtI9WC8mpu/hVo+89P2kKr1LKQUIJe3slyB3R03yDFuflGpIJlhBfH/CbQ/LRQocLrcZDJgkg6ud+Qidflyzbjv8VS2RCXutZ6sar0syiiP91mYl9NSS0H0neDPW0zvlvBPMgko992NPt2b7Vj0/hWj3PCdQqoFXhgnz3YyVrwFdvp/VCmrrtkjmhzedo4eB7tggToFE1Yw+EHl7hv/kGQsSA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 07:56:20.7391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 104f705b-288a-4590-59c3-08df30db2058
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4475
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfX7n1rBUxnHeGT
 rmFEDZjpU6FtYA4QCi2boUnRRvmAxTui/S2IorkH9uA3hSmqARUnbMs23tXmK71yJWMrJnhOjra
 40QBG/ssUqwhiyCg+7JSPsVxKiAUqlHTeAWKrbk6TqJioPQQkAi9K601q+1YSnHcnXkvd21+LSO
 oMMQzmYAFTTyATviB15kOfA8Alck38hHx4f4LGyKPtwNnjtgngLLwI/6qGnnjQU6qrki6YlNOXY
 gh9zCFPVXegSNSKXq/+cPem2FYzoqHVYRM4dxrcvu3Adtygel541f0AC/ya+sxatZLOj6W+cRlU
 YKcBciqfuMD7jKUIf/fbvxIcjtljvXzzCCundyCWtOD7DHQBWZGNIXiZkW/+aqx4sEJd/QnM0cd
 DQNRrQRxFJH1A52ewDBdEyS7F3uH6HTOkjWLDZ3VBUmxuA/JhgSYL/7wqCLruVypiUQaPPJuVtQ
 /cJmJ3BjMVD/HDbCN5w==
X-Authority-Analysis: v=2.4 cv=QIL91QLL c=1 sm=1 tr=0 ts=6adb1329 cx=c_pps
 a=iHXbSHwDNs+yH6wS+48/mw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=bP0pJ2iEsDT7gXVmwc4A:9
X-Proofpoint-ORIG-GUID: Mjuf7eTz_yXLgzoCmZZ9C8Y0cmbocFAO
X-Proofpoint-GUID: Mjuf7eTz_yXLgzoCmZZ9C8Y0cmbocFAO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfX/me9IHp4rRGv
 fKuFYpcVY/+yj+4QoKBXVMdk+726C7eprhXesy4Vy0QH2/d45M6cmiUSqwxTobQZ3LyS/Abo+Xr
 3FYl0kGsBViQ3wfIs1YVg6n9PQd3prw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230031
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 23 Oct 2026 07:56:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20492
Content-Type: text/plain; charset="utf-8"

Add U-Boot configuration fragment for OLDI display support with
Microtips MF101HIE panel on AM62P5 EVM.

The fragment am62p5_j722s_evm_oldi-microtips-mf101hie-panel.config
enables OpenLDI/LVDS Display Interface support for the panel.

Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
---
 meta-ti-bsp/conf/machine/am62pxx-evm.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index cbae21c4..806f6a47 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -48,3 +48,6 @@ IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
 # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
 # Hence, disable the A53 based splash screen using the am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
 UBOOT_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
+
+# OLDI config fragment for Microtips MF101HIE panel display support
+UBOOT_FRAGMENTS:append:bsp-ti-6_18 = " am62p5_j722s_evm_oldi-microtips-mf101hie-panel.config"
-- 
2.34.1

