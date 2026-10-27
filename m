Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14023.1793088096137175361
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Oct 2026 01:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mXzSE5Du;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=iOzEpa/c;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: s-sadik@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69R5YNVP2721702
	for <meta-ti@lists.yoctoproject.org>; Tue, 27 Oct 2026 03:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=2jiXToWV5Qh11
	BJ/NeXsZRPheKU/GtARGutPpd0POdE=; b=mXzSE5DuW1/1Aac5+LDWNro+x/sj9
	qb22qi167ZTly0/m9m8qFGt7c9TU6kmYn77jeGwDTX5/qlGTaAuTB3KyDQ4gGdV+
	mWcoW37zD8K7d9CT2+JxRL1lFCMDRGBS8CmNK7Ot0qiU13xW8X62soaC4hueeKoc
	ry1qqb7VOroL4slUw91MkQJPyY1lAjqhUlCNJOXyZbtGcumoUGh/6Nnl7s5t3LfQ
	PAfCdupQSovfeeKEm2RuXyL5tPMZzIfL1Tg4Is0RIYiJty522mvsJYtQlUFx3QAP
	opszISjazVErH5D31/WhO5CgZuAd6qRhcDIhmEe+XRZvHrfxiDljIBEWA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hj9rqvy6r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 27 Oct 2026 03:01:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbohRFODxIcbyd8EtHGpn8VjF5ZPZUcQz2z5YeQfwu8/vuY+7pOrJq+pDnc41qXZGfHkDjj/SD3sDUpcri9067CSq2O0A/kxrL8fuSRkW+NUtQ/ae6ZyX2D46Wz4FNczL4BSg1KknHp8d7c8eRoKOBfM8r4tJofy389X3jI9N4k0Xunuqy7awX39ymf728nFRculgpA9m4qZwiHAzjoTifenf6WP0K1yCpYgnMWV73qRb5uggdy53jIaHgcQ7NiQ6bCekY9Sc82bkWNWO6H30J61I9WxW8FH1Z0HgfamZrf/hiYavDKMNKpiqbrRUTldbxbdh/Os6Gj15neZtAcH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jiXToWV5Qh11BJ/NeXsZRPheKU/GtARGutPpd0POdE=;
 b=SJfs+Li4AceEnIG+anYqgF6OdMBLzr04uIJegI/07AjtRZqAwjfFmS/ZYe2jg1ZWXf3FG20b1+Sq3x62AGKUSkenEhsarYpw2Lo9+gWuLjqWhoqTfjgQdcic4TG43pLnMQTAdexgl2zzUkCC1sBSMOhgs7n8vreNUjdBxBSkGYT+X3f+FjkA9ZLhQeeh4Xu/ALTIHdPm177qPuXnHmn+eZjiixNhdNeDaoHEyd09HZTgEAS94wSpbriw3RmiwMqrKNmIHNktrWJMwreVSZu03i0EaPSlITx3JSUjEbhWM9HsUZot5qAWXIkesFx5syh+Y+a7Q1xINMPYDFrzC5FCzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jiXToWV5Qh11BJ/NeXsZRPheKU/GtARGutPpd0POdE=;
 b=iOzEpa/cHXAr+RpwMO/NBxtRkge4fbJV+R6qPkrtxz1FtKqFZDLYaugZySVvpZIWeOOIHFqvBLpXNe6re1/Z9mNzr92BjUL/g7LSwMg2mP0Zyhd2SLuY7Uj7O8fj/NRmN6zCZM0H4Aq0eT24SB/WanLCJbiI2STESET6XmP0FHI=
Received: from CH5PR03CA0019.namprd03.prod.outlook.com (2603:10b6:610:1f1::27)
 by SA6PR10MB8016.namprd10.prod.outlook.com (2603:10b6:806:442::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:01:32 +0000
Received: from BN5PEPF0004698A.namprd02.prod.outlook.com
 (2603:10b6:610:1f1:cafe::2d) by CH5PR03CA0019.outlook.office365.com
 (2603:10b6:610:1f1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 27 Oct 2026 08:01:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN5PEPF0004698A.mail.protection.outlook.com (10.167.245.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 08:01:31 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:01:12 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:01:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 27 Oct 2026 03:01:12 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [10.24.52.210])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69R81Awa1502061;
	Tue, 27 Oct 2026 03:01:11 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan eatmon <reatmon@ti.com>
Subject: [meta-ti][wrynose][PATCH] conf: am335x-evm : Bump up max_leb_cnt
Date: Tue, 27 Oct 2026 13:30:58 +0530
Message-ID: <20261027080058.3446900-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698A:EE_|SA6PR10MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: aef10768-26d6-4439-f2cf-08df34008367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|261026121527099003|56012099006|261009223027099003|261021123027099003|261021121427099003|261022105027099003|10067099003|18002099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: FcRGmLaYX5rIdL+I+BenMboGnk0noTt5UI9fMTnzpbnHSGuSMk5XJiguinMDPZpxVuu5lnZA4/M+7vEWxiJRMilsoUoCDLTZuOjj9fWLeoRynvoK4E2k4h2wt8XfQl1531vpsSYquMtV2gfgkMGUjhuawpSWqYcxx3bJRqvpnB3bkGLRHwJSoJ1B0/XuhzGuzawkkCW56TGNCuw4GryXQTrirJVWv3rOqYntgSx6FUBfE67rDMc+3da8sLKh480ctTQz2aq14hsy/Mzf26Qraoed0nFr717s8KpptAjeGKBudh81BXCzPZQlbYMMXagAm3UY/K3LyO7DbjkAHtdr5v2jK5oLbxrBVbZtJPJM+BMcTFDKw5x+JjELFjGP6bo30N/NIWIfmoHY+HebOm+qAcVrmWz5LFvwVtPWHRIRGI0hhlRdHukdw/iTsCHQKg5FcqvWXU4VT4htaa2CZ13KpfsAMrSVuo/mYdv312dJIQt9GKCV5tWc5Gol5BPr5Izhhj3+W3z0MmvjVMNi3a6ImPIUM5zLy+Gx9AoEfdCwHw4atk8c4JORLW3Mk3KYvvUhTMriDYqWU3wva51H71tBabgLX57jMigwU+emVXEBVL3wJgsMtVLoWvRAzGUpF2f+gORXO6oerBioa7h5dArMPwIlw/Gg5ih9SO/LdX7T1PzkAHPRudxwsPYho0uGOV6MACP1gXDSspuLTYdrUKPPhQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(261026121527099003)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003)(18002099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5vHibya3MXMe0C+2HH19nM4D/231NnPI6vceJeuUC7Z+0l9xcwbvKST/nnz5yWQnhRYo2CI7MVAv9IccobXIUu1OHiofixJJzcSuD6d0GrEdHkUbUTAvPNJIah34fnl2TCFeoSKdfbabqCMdbDTpvffau8E810g6ZFWf3CTdbcCkarwsh+wiuse1eBpZp/eGRpQ3OXK8ygC/cDqfDXexGL2+6TSDQjT1jagT9mM6PU7tqTOqwzc7ITtVHBxUHUrs0WJwRkZAdxIy+kEvofRn+XqaYw2zfJaC24CydZcqYpVkDCDvDrfF+75CghJVDTgpG2GbUTlnks/FP37zdbgWfhBOtRjjgDqa1RZCGiICBZZclmJW5imBhnmMJr4i0hNWq7224ZgQ7ViV4W+1gcWCErsFrlWXCjcdOWjUJkc4fL/ARnUJZXhIhY2TTaymEZUq
X-Exchange-RoutingPolicyChecked: Gcc711Pbk9u7XLag3z8gEwHwzIla1iCmpQqMMsPkujBYWlEEoSyRqVD4B+MfdMaUr1sJM7VrIoqIVBQVRSMmt6PNga75OHg5eFOw795OEm7u6FTPkBR9aL+k4ckcdIllpCHNuM3+jvRlgyHzVCrXrhbEoqa8IszueoMJa+VX1ma/p2dDG27CchIFrlVuAhJa2mkYjHmj+GkVR8aQ5L6sR3To8UikUWxzuR05EjIaGWh2jhjF6HHb+R6tt4G8/zYwHGtjHjl02jWVyLvDf9x/Dsp3QD1H0O6QuwiZvz29qYQaK7FK773nb2SQDajYxc/OEPZDh1LJ5f7AgYShlCLhQQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:01:31.8038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aef10768-26d6-4439-f2cf-08df34008367
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN5PEPF0004698A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8016
X-Authority-Analysis: v=2.4 cv=bIWDs/+Z c=1 sm=1 tr=0 ts=6ae05a5f cx=c_pps
 a=4sSI7CCHlwd7s46xCM5yTQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=HVVA513sZsSdY2Cxur0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMSBTYWx0ZWRfX5Q37cYT6Mb6a
 9yOGR4cLuY5XnW+m8LWm5TICclvgE6/j/hYQ8QEaRd7Z9xOqqSsOZ4v9ymtvahL0IkddWb3wXxE
 fZhj9EnAB+UT3HcGcsV7ETioHfh2gYo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMSBTYWx0ZWRfX2QvFwRYaHOyG
 a+vWK4AYw8SnQAASbNvcOi2v1r+bRSdc5qmJwGl6SBkER/lSSG+b43o3Y478i7O/tPFdJrZtYdU
 MWkDGa0O/yp1u+wYmXEeBzbbXVO/WqIA2gKqRDXk9IksuemIHK4mjeDRNm9Ev4/QbLwDUNZVMj9
 ScYh1UIkLDsij99tWE/y0xSx7kN8/JQocLDA8UQey07rLDNu0CiVynZnuyZuWn13FVLXa+r8GN5
 ViDGNOMF/LBNSE7Yfg4s4YtZgWoW9u49p1Mw+RIxmoP6IcCxilfntekfeOn30K1KHy/rHr6h6Ck
 ATHjYDIdwZnMvmVMGddOOyt6cEPZXurHgXpif0heCGBz3aqAPh+BJiNQmf2qUbneZ9oHTt4h53+
 4aZG8SKqbnNfK6zXXbZ2pAH7HAdkrTe6AWpfxABk+vVhDo8L995q1nEt44QmiAfabxJc0PNL9mU
 6EBg81dPCGa/G9BvwAA==
X-Proofpoint-GUID: r_3Qt3-qFzA02jLdrD82rAzfd48YLj6z
X-Proofpoint-ORIG-GUID: r_3Qt3-qFzA02jLdrD82rAzfd48YLj6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270031
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Tue, 27 Oct 2026 08:01:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20494
Content-Type: text/plain; charset="utf-8"

New features added require another increase to max_leb_cnt

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
index 0dd4e7ce..9cfef275 100644
--- a/meta-ti-bsp/conf/machine/am335x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
@@ -22,7 +22,7 @@ SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 24000"
+MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 30000"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
-- 
2.34.1

