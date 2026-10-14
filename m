Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C217FCC6B2D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 20:45:02 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24733.1792010696642685971
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Oct 2026 13:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=bOP2O3xQ;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=UXeiIfXu;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: t-lannynd@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EIbPNI3794072
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Oct 2026 15:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Zm7nlNeMrKoiJ
	3600WnEaL9qZBZyz4/ElcoAf7prlLg=; b=bOP2O3xQEPmHtpGb3GPDuiy8V/ULO
	HZQNlrcHeH9rRS+alcxj/hvXQT334hdVPK96zFQyDVQqGuZaAIGf3JbdQEI9st+Q
	CFTivcWtY3TY3tfr6OFGDukY0tPlDaEA01kvag+OmihUYL858YX7cW399nkfNDGi
	+ojyJLRNbs2AM1CQfiLEfpj1mgSq+4IA8o3+5JOIBvv2G9rk3D9EYr/BoT/Rkudb
	+qHIUpKnYFIislYBGm2oY3B65R6Qzq8t1ER0cgvvtTyscbszRgFNNgZzOu/TuKou
	bJ6HkPvEv/sxC2W0LKxatFvivcGRbUbvTHbr8iqGn+9n7x8CiveZ28jAg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010063.outbound.protection.outlook.com [52.101.193.63])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4haf688n5q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Oct 2026 15:44:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PanXnE+AJiuxGsVFu79l96lTt7rQpZYfoOVhdR/rCv48f+1B3CmNlubTx2c4yjSIAXgmTwsUHr2Vj15hO/axworY16a8BOxHbPcKsr2gUijN/N1NIzssyqp9sr+2/u29hcPIJjtjlj9COq2VD8snXINPL5Dyn9ew19MiJ/8gf3OhGaXFWflVbWdDQNi47LUxZWlH/vTHRN6uydBAxzv+VVBqS6t4LsxemjzgR5fYUEGw6n6L2woKhnBDybr4N5v/cUKZBJXLRCSJ8ThUUkfjHMZb7LH+ST/Pk27C8k4Ph6xD5QBvDef3kDOkxFSW2HxfgWTQif73LiAolz+rXL/gmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zm7nlNeMrKoiJ3600WnEaL9qZBZyz4/ElcoAf7prlLg=;
 b=yrx9tVdFQmSKXN9g0HalUqc73MxK3BKgQ2jTiFvBqUPyavqAGgCJ08R+LZo1JsTPbVr/oxJW+En0m4tKRK12gLTEivWasKyAlI+QIzUAxH4cRX994S71v4a/gVEbJtScJ/9X9hTtGdLrerP7+1Nt9TWp46YtPliq8ZGtOzdxcqJBzsjeZqM5ABtkXvge2O7swG+46LDmwJBtOJR70SWhV7I3Nn4o9Nu8wjY3m1tJA6qX9arLLgXdV4WfH0S2xBRCle7iTieWafce7Bovw0YKmX0XTW6pA7hr++/3qJXoSuqdBdNgTsey0pIibxII3lvcIUldI6liHl6gUzjpv8Yo0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zm7nlNeMrKoiJ3600WnEaL9qZBZyz4/ElcoAf7prlLg=;
 b=UXeiIfXuWKN+siWh967mSCXigMy2ll2FUYOAuaese3+eM8H3r9KC5zBQ8KkZtB4F32XsqfXep8cb7cniHJG/ODGnakiRzZRGKXkisrEVfy+b3y8heSsA/KtgIBZPgnENx+k53K7U2UTAqFX9KAyEBNmREGzB6n7TJ3Xim1/ehlU=
Received: from CH5P222CA0019.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::20)
 by BLAPR10MB5188.namprd10.prod.outlook.com (2603:10b6:208:30d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 20:44:51 +0000
Received: from DS8PEPF000000E4.namprd05.prod.outlook.com
 (2603:10b6:610:1ee:cafe::3a) by CH5P222CA0019.outlook.office365.com
 (2603:10b6:610:1ee::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 14 Oct 2026 20:44:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS8PEPF000000E4.mail.protection.outlook.com (10.167.23.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 20:44:50 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 15:44:33 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 15:44:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 14 Oct 2026 15:44:33 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.75.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69EKiXbb3008634;
	Wed, 14 Oct 2026 15:44:33 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <rs@ti.com>, <detheridge@ti.com>, <b-brnich@ti.com>
Subject: [meta-ti][scarthgap][PATCH] meta-ti-bsp: flutter: fix nativesdk-flutter-engine-sdk build failures
Date: Wed, 14 Oct 2026 15:43:30 -0500
Message-ID: <20261014204330.2837679-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000E4:EE_|BLAPR10MB5188:EE_
X-MS-Office365-Filtering-Correlation-Id: e2aaac57-3c49-474b-c387-08df2a33fe4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|56012099006|18002099003|6133799003|261009223027099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	+92ghdwHYZoVQmj9mX23wUchUkgmJh6sCEapkUBq0HSvvaA7QrNghoM+udlV7Th3QNP7s6Ipml+JrkS5xNdNf669c4Zoi5ucxfSPzQntIKe3VWCXCxrIjYPCoMKhIki61tio7rJf9xZWHH/SlrKxyNssikTMZg2Ac8vAvyGqgSB10h0NLKaGurUs+1AnpLqTI9X0Nw0MFjsxftS20jroRtlpGoYF2rynye3J2f8/l4TQX0ZiWbAAQ0aOyABRKqZQTci4mAhrSSxliAPL5xiG2xdNhszze+ip3nM0m5tXMa5BHwz9cIJKsV+Q3ScZYTxW1EaHjD1Z6vljOYfAjmvtFrjNe8Aa35UG+EEAJL3UerlqFffS+oa0BBv5KHQ/Y+EQCpZgLn71w2e11WmSuOXQicOHFqt1HbV87uX+kTAqHP/ENUxIZ0gMMxiqxMPekIQDYEeb6GWzZKAxrTdf6u5PiCC+6BHovs8Oy9DKkNS2DbYyB/onh/aM03K0idYImFLHWwEdED+xmHILELwEKKclwPEdx4v0Lm3V2zGNj8Qhiphe6ddgZu0ynKsZeuIdHN3D5jB+QNFHgiCZmPCwR1l80ap2o79cYUV1ZRszFd9SM+KdKE0HRpEbXYpJtwrzk7xOIJofD35WNdo0FGhNTKQoPc3YsiNMvROkYmRlF00Z1jRZJ2cZTM9TqjseccghqVDE/w0jBm/zfst4c5PxOWREQQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(56012099006)(18002099003)(6133799003)(261009223027099003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bXmoz/LStbsqX4GZz1Lksvk0iYrL5UIvWnSwDlsHdYECtS8E6NvswZOmENT1eI9VHNEw82UVdhGAp+hIlSq4pFVv9TcyVN9cuA+zHKegR1sAIqe1QEMtwjY8bTtQSFhLwxXmcZZewkDvT8K/rehU/KOq0WmAygAP4K5aHd8vQK0ZoNoLK6YSrcahAAeqo/VbQPd47N2fFNspSbtcCdU7fVQoDMPO82mA3hYiViXdMvXYpm+axWE5Ya9HKKtBEApztZ6P9DQN3199ym2nQCC0S15StOxBBG2KW2xn2XLB03DTpqEbIFXmkLeNq3ml3hXGb67aXHtmjXUm7Y8h1wnRPHZwXN1afCZG/ZVwV7ltbuXNMDqRAhCo9rj9kddWGp8Tpv48vWpw0hxQwOGNQFw7cgWq5c5CIqiMW++x44WHvVarzIUp2t2a8cZKrczWFztP
X-Exchange-RoutingPolicyChecked: 
	HtyPyMZmBfSfXsXgYLKBV/cpvXpghLmZEjz5HbqNNw80AJZ4UYtAJcEWMNwCPkPV2Yj2uWYr7lIfyi1KVtK+e0i/OP8HNCmFGImQ3mP2ieP66VCqtKyaz+e+U8vLu5x32Dz5jAi7in07m03DDOp6p1pLBMemBW8ZacfgA0P1sga+DjujAky7wtSpi4goJJ5BXgY3QzXCa5ZQAxohmW9mm0Xoox5UrOnrrQlgz4u5VXOo2TDAS8Tpv66Ysz+ajnVz5ma5fPLm93VnDhbzY04eus/HuEQfB0bTM5UaOuP3fmbjwUAcj7rXW2LB44MQ24MPQBSFz06S7HR9uvQNgni7Gw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 20:44:50.7133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2aaac57-3c49-474b-c387-08df2a33fe4e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS8PEPF000000E4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5188
X-Authority-Analysis: v=2.4 cv=ZIlCCn7b c=1 sm=1 tr=0 ts=6acfe9c7 cx=c_pps
 a=FmVrivm6CVS+kYk2MGmjxQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=ZDi91BICPbpPD5pgKVYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA4MiBTYWx0ZWRfX3YX8WUONgd4Y
 YEWBSHrzaPad2MHV4Ot0h6I2/VhDV4RrVQbun0Mtd0F31TuEKaANl/8IRdtencx6NBItKlyyEb5
 /eWZmc2F9zNztPSwqmds0HoARNu3CBmfU8qOEb0QgSF2IVm4qTWLjn5GJAH6BiTb+Kxj+/bkHwF
 rJDZ5Re1m3PfNr+u9dKYDK5N4h0snWb7HMmGpGmh+lCt7RF20vCGn5i5LMoixr1Njd/VjQM/jtC
 unNCA3n5ZTLY3GQ/V0Y4TTXmtAIDn5JToI3a2nzNJNx/h+s5KjJ74/ZqucO6xhC65z02HDeOBHX
 MKbtdT8UOKDdjiqadPTg3Jem0qZj1/BACzqCdQHwHK9XcQmGJrwMI+fZ2/NmgvMY4wjKdvNMEgZ
 vTWU8f41mbPUlAEPzspTpsvBakEwP8PBoO5TKBPvCW9ZWl4JF1p+Mrasmy2M+TssuPcJEZ4MxK7
 ZBfry4jK4gCuSXmPVUg==
X-Proofpoint-ORIG-GUID: 0eQ5SSce4Erz8wv1O-nSV2UNzSWe2gbY
X-Proofpoint-GUID: 0eQ5SSce4Erz8wv1O-nSV2UNzSWe2gbY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA4MiBTYWx0ZWRfX1SsEH8fP2F5M
 urUE5qJD/smCNJRr0Xu9NDrcZdOEvYJU5xL0YpD93dm8C2ivcZurzC6cMdenvlVWE8whzJWQxxv
 +lmzrk0Fh3rM4e5feuXTg+Z1H6oo/KM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140082
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Oct 2026 20:45:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20457

Without BB_DEFER_BBCLASSES, :ti-soc is missing from OVERRIDES from a
nativesdk context so DEPLOY_DIR_IMAGE results in an incorrect path.

Add :class-nativesdk to layer.conf and a flutter dynamic layer bbappend to
skip file-rdeps on the bundled host binaries.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 meta-ti-bsp/conf/layer.conf                                    | 2 ++
 .../flutter-engine/flutter-engine-sdk_git.bbappend             | 3 +++
 2 files changed, 5 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-engine/flutter-engine-sdk_git.bbappend

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index d87d040b..ef4d233f 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -24,6 +24,7 @@ LAYERRECOMMENDS_meta-ti-bsp = " \
 
 BBFILES_DYNAMIC += " \
     openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
+    flutter-layer:${LAYERDIR}/dynamic-layers/flutter-layer/recipes*/*/*.bbappend \
 "
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
@@ -34,6 +35,7 @@ HOSTTOOLS_NONFATAL += "truncate xxd comm"
 
 TI_COMMON_DEPLOY ?= "${TOPDIR}/deploy-ti"
 DEPLOY_DIR_IMAGE:ti-soc = "${TI_COMMON_DEPLOY}/images/${MACHINE}"
+DEPLOY_DIR_IMAGE:class-nativesdk = "${TI_COMMON_DEPLOY}/images/${MACHINE}"
 SDK_DEPLOY:ti-soc = "${TI_COMMON_DEPLOY}/sdk"
 PSEUDO_IGNORE_PATHS:append:ti-soc = ",${TI_COMMON_DEPLOY}"
 
diff --git a/meta-ti-bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-engine/flutter-engine-sdk_git.bbappend b/meta-ti-bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-engine/flutter-engine-sdk_git.bbappend
new file mode 100644
index 00000000..92e38f1e
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-engine/flutter-engine-sdk_git.bbappend
@@ -0,0 +1,3 @@
+# Pre-built x86-64 host binaries that link against libc/libm from the build
+# host, not a packaged nativesdk dep.
+INSANE_SKIP:class-nativesdk:append = " file-rdeps"
-- 
2.34.1


