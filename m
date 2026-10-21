Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.582.1792594420782663524
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 07:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=j81Rm+rq;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=IwAPmfsy;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: r-sharma3@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEDFSj1894262;
	Wed, 21 Oct 2026 09:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=OdEyVYWe9D+ms
	5nAlV2YSY0fQaZU5mCxO9rU5Lqynrw=; b=j81Rm+rqG93f1JYwh4o52kDKFQeWX
	N+v4cD3FIhOCNNIbXOq7pOQcz5ixUkHiC4LKts8lO81LcKQ0sp3FUkf2W5x/E5JC
	6pWRu+XIVDC4PH7dvtAgPbxYP9XItpENexDlvupxQgOK2xHUXYXwaKASHpJSOngp
	RjMpArQnoIoqP2ZhWBibYAjh1ccg3spn6O6/0HLk54SKPsftxIQLSJzfoBz8WTqx
	k0CE9D3x8+7lTVUbmprYbjQ3DzGU4JtZU+sHy2g21pqnc7rxpqOwCIAL8JOZ8Kks
	cgaBf+jQ3OqDbjWDHF9VNqkmPDRmIbv2GaYPtJGmnd3jbMHyqZjSNEV+A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4henaak8xd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 09:53:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpnN2RxIYvf5sSuTKG799YB/e9FgsdbeBx9IPj7t9GUaDnqFM1OpDNj5LJafG6dNUQECcS+ZDCYldkpJEG4PN5h1Yf7OiXT3Y6oZlZO/AEemL8bAWUrlxwFPn88K3bMZWAIYcKfGD8JUNnkQA+TmTTdGFR+LvIizIVekDzcTMFpgZq4OfWM7o44D9fvyY6/M26ea+8Mt0NJXm26atnMUO+53EihEriqZGzGtyNrpDzvVFkdTy8cZPuNO8Aj4IHRItvtMh1Z8Nd/ZGWtM3GtqVeQZDlsgBzYZ59aRJM4Qxnkkf827UxavKpf9S75FtmySY9A8AaqTRGxlQgH8uSOLVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdEyVYWe9D+ms5nAlV2YSY0fQaZU5mCxO9rU5Lqynrw=;
 b=tCVeoH5WqYuKC7/V683bZ0Uq3hqz8JmDfZNOrh/EVZ00NvkLQEuI9Wk+8jnn0tzf4z5uKD/02vbOPq/pm0dNsqWaUSp9XkYTqyhuxFVn0Ge1TiU5RiJsKqBg4KOWy138HwNEhCULwBhYYbIUv5rkA7De38Qr8maj/kNf96tmDhwz+DAcsJZRC9/pG8GJEtl12/+lnruhOD2zYYlyfsu+S2tddGLICoAVHTy0eDXi4xOBcZM1lfmyIjC5vVFErG2ma3qc2vZeS/5PfUw9hSGxCEWtCIicfFbv6VYnDx8UatWddg88ggWQDepLumXG/hT2odIJ1nmxZu1uCCa0XRwtDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdEyVYWe9D+ms5nAlV2YSY0fQaZU5mCxO9rU5Lqynrw=;
 b=IwAPmfsyv1MSxZhkLFAGX2OaczQhcyReSozDSh2d0IDmke0eXXAXMxWo4PDL0hRBkC6qIx9B5enap5KJYsKuzNor+rOzv4lwK77QTZ6I/IdBet6W22y9usZ7h+ZFHboWRomrjglxa+cffNZvuPuUYnjik3E9ma48Cnsr+znVRLw=
Received: from SJ0PR13CA0219.namprd13.prod.outlook.com (2603:10b6:a03:2c1::14)
 by CO1PR10MB4754.namprd10.prod.outlook.com (2603:10b6:303:91::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.13; Wed, 21 Oct
 2026 14:52:33 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::66) by SJ0PR13CA0219.outlook.office365.com
 (2603:10b6:a03:2c1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Wed,
 21 Oct 2026 14:52:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 14:52:32 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 09:52:19 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 09:52:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 09:52:18 -0500
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LEqGjt2804193;
	Wed, 21 Oct 2026 09:52:17 -0500
From: Rahul Sharma <r-sharma3@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <r-sharma3@ti.com>
Subject: [PATCH 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
Date: Wed, 21 Oct 2026 20:22:12 +0530
Message-ID: <20261021145213.853962-1-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|CO1PR10MB4754:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf008d1-a350-4758-1221-08df2f82f020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|56012099006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: PhaH0SEvRvZrIOJNCZ68LjLTH8YScZBVqI1fmYhghJEamK4TP11N2bLDDNsbcvBOy0lsJFJhvoQqmD/J2feux+IhEWHPp7xz4eBMn6Gl4xIQXD25yut1D1ZpDBb/6SuC30PTE+TuuNOcmReA3wz+yKOjuky89iUwbYU7dLBMHGojxnjHxkCDOX2rC40qnHhhwLp8jlbT/BGik/0ZLOiSOCm/DXPvuDIYE6znaXSrzeN15e2/gJyllshly/QG08V4NzJP0AQ3g3Y6IvEgHKQMIxwg7Fzw1Ui/nIvzDv6RTAJucqYT6vfWbkglL7xMTAdcQSGOSPKcb4TaTnsiRxHuvE9phavK94yLK812tkGYhgp10hzCyjeoXQhuVXJoMIfxHXxfCMNrK9KyB04Iq71kh9DwgD4GcjhGmcwQLW/TARu3RwR5M1QoHjyFtd+3hChbFyBN/bX2tGj9jmhye0Z3urS1tpdnoPESpj1vLb9Y+qHaLCq5u8aGDtijC3w3D7uPhKqRAnZCwSuFVVjXAR1q9mT1W2ye4sdQUSxAc0vYNYQUahqntsKI6inJnL3sYmARLX7DGc5ngjSC10DeXyIu26fmMsSYaT08xtxlfewzF4G4gX+lRoLlAVQJbccyp8NQkrFX4iWIV2IPXfY8DX/cgtz5aILBAVPbLNqgFmlEOPpCWdVj6Bi79UvNdnXVVsIjwH5k2id+HMvCznXw2FL7Xw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mnYmzi00eVG5u9pRLF8m1Gm2RGqWXqoZiVtb7RYxr4Lm4WbQCKsg/ennnjroKCZE+r/uToLdfe7VRiljqeRXPW1L52qGd//aCEP/sp4t6HfQdoLZRAIFuod6ARdtWMcSROUHVGNO+cnZBKfuQQkXSrVt9rhMqYUl+SHDJBtt48vnaOQudIJpayk5uSUeR4/A6f90aTOTfPmVTvqXg5Crg+9fkYThsUgq1BaaNM26xf+S727dIU3u3Do43SyF8bmiFkcwwrBRdOi1am80kG9jlt71DKjxx2ddkHphIsvun69F+eokKsgNdXJWAEjlos6XYvRl1TM6mMDvG7pjl52nWAnG+/YVPltkBDpY0H05JVoN1+3AS4T24VgzPjTIalCT5stA14oXXWiul6qq/2lOHpTJSsq4GTsQ2LMI+YVCqYU2Rg1pGs9/EPkUg+jgjcV7
X-Exchange-RoutingPolicyChecked: bxPLunOqPI1TEoC14xRyCBSU9xYXPZ38dGezyp0KCn0lb9ZxkJp2+yjF7O3dKWOrmlBZDwSy/M5LRLTp1VhX31C3svYqF2ZDBwVwOlQ7gyZ+6b15R1lV08tuBNvpaRv3yUnq77Ei1uKoiNJ/HmDh8nHkQD42FrX9nNlHk0T/0oFVJ8cCCmajhpVGKK41xaj+7A9KAqsz3UxdPbaaoY9J5Upv7U+uwCThRbVSdEtMdfeAIcu+cXOkRkPNfrDLTjOiwLUa8DclqcOzWFzviDF17TLS65KkOr423jVdDWS8ksd9V/gMEVWpIu/3RSmAN554C8/jXivxlhZ5E+mjzmDT0g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:52:32.9421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf008d1-a350-4758-1221-08df2f82f020
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4754
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1OSBTYWx0ZWRfX7pGuVXVcJF2H
 s4l6yBNPVI7F99Q/dme/6EeqAbJtb3JULstmW4j3m56Li0okL6W5Od8QHJL+bVLkV8EPuL3vEFj
 umVJOFXKSwSpfp2dlgkCeqGf2xdtcl8=
X-Proofpoint-ORIG-GUID: ev7fJzhsLkBevD55muMg24H6fE1YkJB0
X-Proofpoint-GUID: ev7fJzhsLkBevD55muMg24H6fE1YkJB0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1OSBTYWx0ZWRfXxGIK9iuy5MXz
 0wjGs5aMVRHIrMbd3ClSEjK88GcjEM+UZ0kyPKQ/G6o9KaMmOE0l48gZSdR9/Z/57j68u2uLDUM
 bU/qx78UUVXf4QmQ1XXBWcKdJvlcwz4LeeF8vq7NJFvPuusiMEc2ExdP45O8Ou80D2F8eGI1NIT
 wnH3tXl7S5gM11VWl/sIEqdM40ajC6CYmATeFzh9xXNYDm8WhjmhV8kQ4kAlY3msGOHxodUSsYL
 eBvotqXAhEgxT9ynwT+c4GcfkitVrluVAnK87D2byItu8pdYOo6ITINCV7K/6Cxk8iMK+D2o9N2
 2G3F497pNdW2Wxm6PDe0LnVNeXaZNgdKciPs61PWueM87YYKxdbluOjAj3sdjNYSJLIH8Cu+3QT
 K9BeRBPcjS0AmiCf35kKGDpee3EAIgCBO53ZzAxcpgfPR+fMyLbBpFFdb6i4EyeD1pctsGqp6zI
 IQjfre9NB8uR7t2INbQ==
X-Authority-Analysis: v=2.4 cv=cJB1IVeN c=1 sm=1 tr=0 ts=6ad8d1f2 cx=c_pps
 a=CQGnQshk6KQL3sGkhxSvaQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=bP0pJ2iEsDT7gXVmwc4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210059
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 14:53:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20472
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
index cbae21c4..c37f06d9 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -48,3 +48,6 @@ IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
 # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
 # Hence, disable the A53 based splash screen using the am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
 UBOOT_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
+
+# OLDI config fragment for Microtips MF101HIE panel display support
+UBOOT_FRAGMENTS += "am62p5_j722s_evm_oldi-microtips-mf101hie-panel.config"
-- 
2.34.1

