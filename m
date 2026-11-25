Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3434.1795647289860920044
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 14:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=KmNJjyhK;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=DBdLmjNA;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: rs@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6APJAIOI1664149;
	Wed, 25 Nov 2026 16:54:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=xOcyQsEfZqjmB
	U9OFyzghogkZG4TapL414YzCH4pTnw=; b=KmNJjyhKGW3YWFBpZ2ECcONum67s+
	djaBczvTympYvCsDkjR5EgAyVv0/ZzfD5qNc1o8KO9Aje2ocUE2KntEXvCAx7YTc
	mSvbkEplj3DvjN11IhuOCoWGfIdxGVName6XSIspgfW2jfa7EYL6FxhMmQMEAzyj
	uVdh6GNu4DZjkdNVz0eGyV4QIOZadm32goW9wBOtsgSPLAq18M3UeU/WWOq95SgW
	DwoVzQVutG8iRmyCo9Yudpf6lumO98c3FGVI3Ml2LDoyco48/Z6fxgUIZ5YMCqiW
	DQdp27frfUx076yk0zfDa4trL/XApScSBgh8l0vz5sKzZlsQ6rODg9ggA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013021.outbound.protection.outlook.com [40.93.201.21])
	by m0384305.ppops.net (PPS) with ESMTPS id 4j606fb520-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 16:54:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ztty4wiW+PMNNcS9y+dSRmqCa2qEcFHExrNiU+Z+M6ePEbrNRRQDZMA2+/rMN+XeE/Rx6jfKnTjIkSKr5i+Uhda+bwzlcpP33CwUxoBZr63gAdG/y68Iv35Db3a9fmtKQghpUuXq1+LF0/XzzKXLnZpNw88edrKHorGzKFH3a1l3H1h3HN8w1GUJ/qHoONBvKTOWQ5bAVvrH10LmmH6pGdH4W60YiIp9Bj2OysFRedQWymTSkpZfwHouAqvp1++k86SjCHd7l8lNOW/r5iEgjBJLMSpRr02Fxk24F6WQNRZIXYoORgALXEeMMsRJ1Gob5wcv6LSAUSv3UuIhxG3a0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOcyQsEfZqjmBU9OFyzghogkZG4TapL414YzCH4pTnw=;
 b=jp1aySP+FvQZQPLBxezobtv3d2jQv5hMvjZjYEuCNmqhDs3aIborxw4fW8lBkLlhbwUiL9XQlSPQxWVsy+3Xko9l+i9IA3S956tQQSCENksqG7e+MmmsHWylgbwKi18Y3iJXX8SYHN1w34FM6RHUdcDkVGCFkMpQ6gt/1MD6clj8z63CSgzFfYJEIW6eB9WWJ7CgYQ+btIilUBSnyS/BtWgJwfgmIIEkWQIDRDnds/zGvdEasQnWb+eMj40oDKUppr10qt+mu75oNVyiDpip48yS7vcn1dv3I4RmxI2AgMOqU0dyRrSF8I6Wey45muaAfc/mS6B1c366zwvuf1wa8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOcyQsEfZqjmBU9OFyzghogkZG4TapL414YzCH4pTnw=;
 b=DBdLmjNA8Ta+bgMEyT6+Iux42yHOVOgL0bjOalrQB6sTER6uKSzrA+pwrYUpMcxLrxXtUs2gBy9Cj/l0/mYWX2yDbY7B/s4O7BeTDiphQyDNXs5uaag/VPNGiH0hy+YsdSxRA2/jQk8wK1WnU0I2Wfpb0CzNa4Si5OOdh9KNw4E=
Received: from DSSP221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::11) by
 LVUPR10MB997811.namprd10.prod.outlook.com (2603:10b6:408:39e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 22:54:43 +0000
Received: from DS2PEPF00006E20.namprd05.prod.outlook.com
 (2603:10b6:8:3d5:cafe::34) by DSSP221CA0014.outlook.office365.com
 (2603:10b6:8:3d5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 22:54:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00006E20.mail.protection.outlook.com (10.167.23.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 22:54:41 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 16:54:11 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 16:54:11 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 25 Nov 2026 16:54:11 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.75.60])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6APMsB5P3639705;
	Wed, 25 Nov 2026 16:54:11 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-um: upgrade display fd from render to card
Date: Wed, 25 Nov 2026 16:54:07 -0600
Message-ID: <20261125225407.916981-1-rs@ti.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00006E20:EE_|LVUPR10MB997811:EE_
X-MS-Office365-Filtering-Correlation-Id: 13104859-d05e-4c38-1508-08df4b47178f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|6133799003|261009223027099003|18002099003|3023799007|10067099003|56012099006|261102123227099003|261021121427099003|261026121527099003|261022105027099003|261026140227099003|261028144727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: DoQCocZd/M0VbyT5X788W+jhldDQMtoFrA2o22qX02QIAy3qFhxUJb6+KmfRJybc3VZQkx541zmY8Xo4tAKEt5DBr8X3SQe6PNTw7ryRYutgXk2eJG8atgguUmM9wdwpHA1xF+r6xGHfOz0kbH6P0Ffoem0GDAU6alFNNiphjD6M6lQ4+L+rrq/Q2uvG7mEwEKVAyecSSa46HbwPGEt0BVwzW6L1VuND0akhw8D9+AxIrqOXHUhdxhWA4zoWSzUkhkQPSFHGbMvIOQgFn59Wxrjt/tp7ntFPdPCDDPSTxj+exn2O1m3wNP7P3DPJYwDuga36H/JLURSzY9Prd6ojga+Zh5Vt03ZUP8uoAwVE/tnFQnZdGrjqs+fJdVx66s32/5t5fHwyAeupzaqMW7SoHXnlxmGISKd0sW5X0CwbzODfKf9AilhkNC6PuhH0NYhFZ+WoVRv+G/CIoI0y3mZFzmDi2K5nzgTsM0S/5f//rfV3jGkU0D+bW0WrcM0V1lUzbrpriQTGPSjvkt5zoZfKpjyBnuqGnpeVGzu5wVgqALopRWvimv3WjBm++Ar5bEWCvKnIWEUNn3Na5JNK96MHg5US4ovZ91jbjnwUYdxdLc7nTciyHn4FXMad0t/mWlusfLnREUOlbXHFuAyNhCU0wsMh4kagNl8MDcMPtdJN0bC9PBsFP0rMzAXEsfH8FzCl0pzlEueq7nVrHalE8FKiFw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(6133799003)(261009223027099003)(18002099003)(3023799007)(10067099003)(56012099006)(261102123227099003)(261021121427099003)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qd1rN8slc2hP+Ju5K4iBdWJoKRXqOSSUiidxkTEXKC+lZ86pWxo7TU1WiKcUSOWTjxILYNEDh23lMM1qc26SqJQiEndh9bRwEEahLL6rnkWzxGiXXv9V8olsjzOJHqtvg2VPKhZC7IZekv09Jn63OhDi/t1lsHCgbtq+Gjaa6RCLCqP50Y/v7vqkF4B5LJSi+zMWA2XXZuberLif9hPD4lDjyTY6omCsi5P3hVcS+Zbxim8Gjw+5Pg8bdnlAgDKiWx+wrzdhlERbjVOEZk6Ca+f5dWh201SPWEr9of1BWxHwkvH3L0rCVChn6juRF+vFJrY563TBNJg3m8thCTnmIax4y7ijYnBmWm2vUgpb+Ic21gq3F8vg3UL5MA5dl/EkeYMPrI/stWC19cxAYWCnQEcQ4RledXFX4KRFr6F4qA/P/HgOplaQjBKzx1MlY9pp
X-Exchange-RoutingPolicyChecked: TYUqAazHnMkA8tmuZvMr8K/GioLxxCmwayR52sPaod3iFB5Ec/Pn60xArHVzkNXfOx1PGLn/oLLtyqb6gaRak4X78bF5hAXrtu2wqjMsFUy6kJ2oqfU9zYLIMq6sjB4Al06cezYXmgcBeY0jdKWVv0GvnXhozRVbw5fK5oSvVg/F5kO1N/I9nBYJuQViMXN9KUXaIKnO2tiG1LA/WEn7szyDMyjdVruz608mG7YU4sOWq8o1sViIT5PiE/PqPbkYQJUeiTbSWBP2WvrhAOCW+mLlSWBn6nniXqJonLwU6jCmJ8G6JwfcMwAZ93QM33QhogSMxwyS6lqnPOxoqtkD4w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 22:54:41.8940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13104859-d05e-4c38-1508-08df4b47178f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00006E20.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR10MB997811
X-Proofpoint-GUID: JVQOv0kr9__sCWB1EAZTBF55jjWAl6oC
X-Proofpoint-ORIG-GUID: JVQOv0kr9__sCWB1EAZTBF55jjWAl6oC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA5MSBTYWx0ZWRfX6CeoVlITEVRw
 NzA5RRFcY7hSTAujONgrTwOBnbKM8xHIQaYWjC2ZPnqU3wqWxyBWmq25GA7VwAYDKWpfGX1MraH
 dpMrngVC0for/LhLVgArKRjM8hDPwa4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA5MSBTYWx0ZWRfX01OZCVGKrnJx
 a/eab5eBNQpqVELISwt84Km5q9waeEL+1zknqwpQVbHnbZWIlnQysTvl0eRFDg9iyKXHx3YO5l0
 p6MdKy989DKkIFeKxFQzJOlZF5hiHnSHBVMsHusOQIJ+04xugf0xQfo0UEsCatUafI1+L0SRm5P
 SGdMFCilQ7PEvlSlITzrYGnjxNnoleykNkd2aJGeNIDQFOAibaFmSWH4DTcMCyFq1DDVrJHifQ5
 V18e2hmgbBercLrABnCHtq7zdnFnfvluR6SdrrP6fC6uCnHfWgImGVa28pQyAzi54AP2sfIPMwA
 0xwUY62TJFeI4R6FZa6uRSLTi7Dlmfp6CBJcgiQ83GaLAyEZ7RCOlZVL3QckFGzJcyW26VEZXPT
 oioahFckEmn1CZzCqWewXm6NNGud+cpQl5NyilFkmkt0kPS85Ol88nWW4GTDgMFgxqYPg+wOxha
 8sPepZ4Le1oxPGFjbXQ==
X-Authority-Analysis: v=2.4 cv=Ss4Fe/O0 c=1 sm=1 tr=0 ts=6b076735 cx=c_pps
 a=j8DUK8/cuCuEDQ3LLq2Aww==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=-ogQzcqkOxAmh3dAbHwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250091
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 25 Nov 2026 22:54:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20570
Content-Type: text/plain; charset="utf-8"

From: Randolph Sapp <rs@ti.com>

Devices that have a display controller that advertise both a render and
a card node need to prioritize using the card node when interacting with
the PVR driver. We can try to upgrade this FD ourselves and report when
that fails.

This specifically fixes issues with EGL Wayland initialization with
omapdrm equipped devices.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
index fd1f64ea853b..98ffc2cb61af 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
@@ -13,7 +13,7 @@ BRANCH = "${PV}/mesa/glibc-2.35"
 SRC_URI = " \
     git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH} \
 "
-SRCREV = "8f24e3402a15658c0a39b53dedb91677a60eca94"
+SRCREV = "28394219309a381612c49d94d9cb1bd85fd23b10"
 
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
-- 
2.56.1

