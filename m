Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A13CCDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 15:58:11 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14999.1782403089329996202
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 08:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZlHeVrd6;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=CkCc/M3b;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65PFdCLb3392676;
	Thu, 25 Jun 2026 10:58:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=1MZKYCfz1M3PR
	x6GYDPDHNzdODN9djxyYNi9eUALsdk=; b=ZlHeVrd6Bbuq77W7RXcZngQ3A0VKF
	fQVRuMdv2Xr1csAMN9Km8lxeLPhIKn+48jn3WA6bVhWf4hi3xdzVYtZnRNnW1f3y
	ISL0LRC6VIpUuJVzOJ51ohSzIyWupUvWJKdLbRorArCCu/FP2jVXJ1oE7jFX2xTj
	F0u+jqXO628rfgkPWzVj1dNGNppxbcwU+rNzIgsOb+ZauqZPUomoDQGt3LZN5xVC
	I/cpMm3sBCmxiesFA0QFkAy7PGM6hJcrsFCOFSUPn41rgf74uZxvtH/yQcgHoRoW
	NxCqDGQFnp5Q8HKL5UiLw9d60pwdrPtSbqhaLZHGKtCcbK2PKvJkiXsGA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013033.outbound.protection.outlook.com [40.93.196.33])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f11m4t5gc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 10:58:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1EO/39oHxb6lCw7dHP38ecEq5Tuf853v5Gzm3lfKlXBOuA4osgYvmeZ8urFwvWhotdr2k7NJxMnPoMLktavYfscUK7dYTzRFN7800utZ/bA1E6+MEYxVS6NbQDL7TcSXrhwYDde2SubNs0/CCD5NBkgE0l6lp1/koxaFzGArHnFESD8ofcPJ7OnzVc7QymqWNVSiy/mrc6waVEuhzifG0bNHEwupSWgjRmpmVILsdFjgZXnQUle51z5qwiyt+sYEFgBDIbswS1XZ6l9iZ0hCSqR1ndHvBIELLrhM27+OIO9EGB72VOa05oMulk3kkboVk/I+D2wPiy14FZEpnU8iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MZKYCfz1M3PRx6GYDPDHNzdODN9djxyYNi9eUALsdk=;
 b=FhK65lwqZ6TJmOjy0lGGXo/B1Tj7f3iFPYS7Sk9Oym6XDZxgzr7GZTNNCrRM025BA1BP+5SpLZu2Xb82UJzS24VeCK/521fx08hwmGSY07/yX8JCVgcz5V7xdrOl8QnB63d9yi4W7anaaGfLvxJbZ4Fk8gCAMyTmOXZgaquWBvYovjrv2YfsYAPHP27BTHskEUI/RCeiRFmlTKbkOyzMRy1ycmHa3i2F35/eqPcFudYyBSotFjpODaR5TtHBO5IblWa7dJ8jGfWOCRB+zCHEbvara8TFW++I2UyE47eBLjN/VkqiAE+QW5nTX+tOtTRbRXM8LPSD7ouJEiCt4YvVAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MZKYCfz1M3PRx6GYDPDHNzdODN9djxyYNi9eUALsdk=;
 b=CkCc/M3bA8DprtHzjV+DYiJJqNKjvXmNgyNhkl+kC8Hg/YhzDApPy0lX89r5GrwBDL0qDHWe9Ocg2wkWGWC2jOioBwJONeAZwaqz+MfTqsVgAr2FbeTHLJsFWbpmlx8Gfq+QRscMt/1YdBfdhTpHGuBVmIu9DHwozBXLH2fMPYg=
Received: from CY5PR18CA0049.namprd18.prod.outlook.com (2603:10b6:930:13::17)
 by CO6PR10MB5602.namprd10.prod.outlook.com (2603:10b6:303:149::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 15:58:04 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:930:13:cafe::3b) by CY5PR18CA0049.outlook.office365.com
 (2603:10b6:930:13::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 15:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 15:58:02 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 10:58:02 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 10:58:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 10:58:01 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PFw1HF3083568;
	Thu, 25 Jun 2026 10:58:01 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH] linux-firmware: Move recipe from meta-arago
Date: Thu, 25 Jun 2026 10:58:00 -0500
Message-ID: <20260625155800.28627-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|CO6PR10MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aaf6e0b-2c3a-4706-2f07-08ded2d28986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	o2IRTrajTxqW/jqUnteIHCBKExqfHm61dAq8sz7oKQmTVNxf3DKkvLf205yN1Luore3iP6KhQvKNY5PiekMMWOhYxavXJu3RgG6jDztXxkSz/lYgikW/t3FtvGei095d9Y3dBJ7/48o5whPPzVhfBzJ+G3hgcxuvAHzF/a12U/EIHHW6k+w1PAI/JywbvyHVhW6DDi46XXJWx8lh/mp/bfCQl4nElmhrKwXCUPE2z41OP+Ls5KvGlfSWXzM2pGY80vhp9PhFjANRmyXAHsBlWaJNQ+Y+EpxyfMUJP7H0MXu7J+GOL6MxwxSINK2pGJPa/xYWh0p8Lkn4hOYUYyitXUNPwDk9C+2ZuhuvsqQ05ju8Or0NgPdk13xUF+QiK8ivhmk6OvSnhCwa6KBfEZkqoJrvQVGSVZSYQ3nYD2I5F4DpBeTKa3G3rROxaZK/DgD/eeqBsi6M9rSLTIz7sYQNkDpHNXUlU29J7+8cxLfMum68x3IAYYflUYiDg3r4lUZVXnMUAVxyIvW90NSGTfRH6pZ2TpDQOroN4iTgIu/8+1nORFSqCnCxkmNjtPm/+rfL4YGJDLEb0AVE5ThHL6uaHxct4zk+YuKdBtX9dGn+WyUr5OipBsRLOlmR9vrA/NNAdX51S1NvbtiUYUSpIkPNN1ep4WH68tSQpqppsnnxbp9q2aBiWe/0TrpvDsmo1B/s6fQAk7NRVxvyYiZ+Tz2hyA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lqUFv9ZGXHeDbRhjenbTWlbkrZ2El4sYtvfTOHPvUAZWEnxop0WLQI0asydDROQdeQLM7vrsMM8JNjWr+coPjPFeOr2bdjiRxmuntGnQokutkrCWs/h/W3JWVwEWVz/mpQOesoAERITwiIMmLYWv0vT1+cKdW1L5G4aJI1GUQbXl/CanA7YqxaA7oq+DG//91LcE6sacP9mblzq3fF03GCnNJZ3o+4IhgiHwol7R6YnvDpdDGXNijhFFqwMQkYC+rxoMI96MJ5Mj0Fdc/YuwN+Av3H2i+X7CY3Yk82mnQq9RTdmvTPP5OtBl1Gmp+/g38Ox2RHFAF7cu7urRc1PhsH72k6Rj/01u4w5Ha5UMjYBafqHgM9EqcvF/LC4530Gv1u/7hBbXETTFLtJzIp5P7PNnL/BGmZWJ8GZobjq5lwehZHkFP8Wg22q4Kp+Heuia
X-Exchange-RoutingPolicyChecked: 
	i/qT/aCGplhNn9vFVN820lfSjtbf9HiIAZhyVPK+EQ9Zz3vqmmu7y9IIk+Y1ySL0/+qfN+PVACPPZ6+aLmknGlv1pamCBnj2s8nQMcVD7UIh0lspCHhY9bzSwcdzbWaf37ZAXFX6yyA9u40I0PIv44kgjVhkvCq/044Q579BQTOXp7BdjBQfF5fH9oEkqzt5/yevNMVnC1u7raV/cIuLV6UXdqR9Tc12GRB9EtQ+gjfnj13CbdC9lFPNd0iK+SdWTkE7eIYrumghW9PJSv5K+Zmtct7SU10Frl1dFsD+n6x4yjMSFi3NeF9HGtHMa20zbxGiuUTqw+Wt1jqrFRi0WQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 15:58:02.4628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aaf6e0b-2c3a-4706-2f07-08ded2d28986
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5602
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzNiBTYWx0ZWRfX3pmnEpzaJ4JD
 cyuqlvcMweiGUQeX06jjK5oQgrMOf7IIBd6lniAjBms9OkYvEgOSAlDq7F0yDacd7tE3BbwASMI
 XunfSuNcPcPaIegML9CAAShhvxaBo/4=
X-Authority-Analysis: v=2.4 cv=TbumcxQh c=1 sm=1 tr=0 ts=6a3d5010 cx=c_pps
 a=uZgmHucj+isDzLb5E5/Wlw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=veB3jaLWfSSjDCajbykA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzNiBTYWx0ZWRfX8hXIip5Gi5+s
 uJy9egOW586R2d1LX/cluyNiBwBtakoLiLjsKENzpoN/VuTxeyG5o4ODgVV5LdFdIizLn5ihP22
 bNQJpp91gc7DQLcUUVYYHjFxQuA6UwGDvo4vmglTX3MrR8TLeshAIqgGIMDEC+hmxGU/tQcOEfd
 mnC9qpeHSuiTEwjEwI/D9ssTdvBw6Rvz4x51C1Ll6WMu5XqkLB2WvSxnQS+O4oktu4uL4wk4SDe
 ZVmzOH60dGdY3npSVuyPQIIoiJ46ly0Qf4hb/tTvV6I2jiZnXuXQX1y2Es0jPEVsjdUo9gQH03C
 B5YB71Z9M+AaDfpyYSFJ1fuSFK3nkr0JalL7GvZLzR8cAq4eWY2OgbysBlQuk99NTVrMrpEoEtE
 BWpDSQ3rtHpSlvzxACB1goEFO35YMvBj4QDwstkeCcmM2nkwqoClhRuTDaXT0e0OixQg/12E1Ww
 qP5HkmriLWngP2sSr9Q==
X-Proofpoint-GUID: Vo8zUJzbk4e5Nmh5-BXYIGyaxyfauguo
X-Proofpoint-ORIG-GUID: Vo8zUJzbk4e5Nmh5-BXYIGyaxyfauguo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250136
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jun 2026 15:58:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20089

The conflicting firmware packages that necessitate this bbappend are
all here in meta-ti-bsp, so this will be needed by any distro using
this layer. Move this bbappend out of meta-arago to this layer.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../linux-firmware/linux-firmware_%.bbappend               | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend

diff --git a/meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
new file mode 100644
index 00000000..b37bec7a
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
@@ -0,0 +1,7 @@
+PR:append:ti-soc = ".tisoc1"
+
+# meta-ti-bsp packages newer versions on these
+do_install:append:ti-soc() {
+	rm -rf ${D}${nonarch_base_libdir}/firmware/ti-connectivity/
+	rm -rf ${D}${nonarch_base_libdir}/firmware/cadence/
+}
-- 
2.39.2


