Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1218.1793206663983608817
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 09:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=RswQGKZx;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=EV41PwBL;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SGabA94032717;
	Wed, 28 Oct 2026 11:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=b2IzWAtGCtJxI
	I11vo98RgPj4T4j4gGtKWBY1S+Vn20=; b=RswQGKZxJ93gt6+fAPfJJYf0ikgZ5
	kPcivLjqOpsMTUwljvQ/mNxZ/t4Nm47TderWv4aIYjL3HLaT0iXUQnUrLQGfQ+uK
	wT7nWCdXSVY1HdlrPcrgy5iXpTzs7Gg6iOQE76uQzxFF9D+JjOCHk0u/72Y/H6Mt
	vAXlfShXgQPpPjk3i9fe4iFaLWV/RQ+ZUcbrpZFiVyxkCPSu5yF2KLI0vB9dsB4t
	9vNcLtSPLvAVidacuKOTdNKBElzzax15FjXGIl6GbSlaY0WIyuJaNqOkRuq05h7t
	//7whGtm+jrmtvS3kuK5VX+h4bydoSkZzE6T8QzMRS+DP1fLSFTR51omw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hkmqe84e9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 11:57:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3IaKHU9Ji23W/yh0UCGc7nHK22rrNkCW6geGwiZ2rocDbCRHFTxhUb/u//wxPpX/psuH+tcjkhwS5Ai2zIZqKS721q8bqW5EzyuQmyeea3IReKMxfh31Q5yyPXAx8ySSnxvt+2RBcfraP6Idxri84Yu8hhOuFKHFvV6OwPZHwO20JjwtQURKLFDTQi6haNa1cnj3Aa+53al55Iez3BCTVtRHkCsDkfIUKgC2R0TAA8u9iO/kvtUuyWr6csh96oyj+A4u8qum7e6XuXIRt7+/4b/qX5YRtSdV4eRV4FY/dNatDaP3qDDb6y7O3ckSMWBcnnaZY3Iwc8QRNHDCTtG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2IzWAtGCtJxII11vo98RgPj4T4j4gGtKWBY1S+Vn20=;
 b=FT8/BxjJ6b4D+fL4Eb1eXbs4X6IaPiJEov36eGkmiQHKjA52fMmtmZxUnFIsZJP/3v1Xoskptdkjk5qgJLtNkCVY2sO3QSaZwG9GdN1hS15SKw7nrtqDEs8Gidu0HqhUEyXIcBGccJZlXU6Nb4uuUhOKpQb0muqjMtunQbIeKfNz1q4PM8t6QXo6GdyprsG2Y72g5LHIluZNtWNvirHscoChrJ7/Aoas69mSsecfFog3gg7DKG1eFtNa3r38ZJgYRa2/tsLjyQ4m+IhzE8YSS2hsY7uvQamn7xTIEztk6WGoQ3xOaM28+2C6naluZBFKdRx1aWaM8NuXMZj0doSwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2IzWAtGCtJxII11vo98RgPj4T4j4gGtKWBY1S+Vn20=;
 b=EV41PwBL1Bq1LfEO3jGXjrBFIfywaOPDt6ughWQA5axO5vY8qdjxmujD/JRaFGTm+G+XV7HtQsimtW0mdgu+Jj8kZnAUd2zmgqqCXrk+Cuq9iTsuWlyQe1sOUeTsIu5eXzAwQ+5b8MMoimJ21qwIT0BQi2bR8kdWn+S1CoAtvog=
Received: from CYXPR03CA0096.namprd03.prod.outlook.com (2603:10b6:930:d3::17)
 by PH0PR10MB4728.namprd10.prod.outlook.com (2603:10b6:510:3b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 16:57:39 +0000
Received: from CY4PEPF000392D7.namprd03.prod.outlook.com
 (2603:10b6:930:d3:cafe::73) by CYXPR03CA0096.outlook.office365.com
 (2603:10b6:930:d3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Wed,
 28 Oct 2026 16:57:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF000392D7.mail.protection.outlook.com (10.167.247.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 16:57:39 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 11:57:24 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 11:57:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 28 Oct 2026 11:57:24 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69SGvOXI1154871;
	Wed, 28 Oct 2026 11:57:24 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xM6xo-0000000BePm-2aES;
	Wed, 28 Oct 2026 11:57:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH 1/2] linux-firmware: Breakout iwlwifi-ty package
Date: Wed, 28 Oct 2026 11:57:23 -0500
Message-ID: <20261028165724.2776953-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392D7:EE_|PH0PR10MB4728:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f39ec5-f5fb-414e-4a67-08df35149314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|18002099003|261026121527099003|56012099006|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: ADCFgOffyLJFD4O5/vYH+W14UAh76CXc+/mpJ2mhoheAyqEEJmXMFNGHbNlyJstP67PPhztesLhAfQb8xQxZ+uAiC7HVe8swFN0Wrb5n/I4iEzJrY3AwxGBonFhTv7f6kYmB6dWrvvh3t5ROGPUQrFraeRCDeWdE7EEoy6Q7hjPYNKharrlBwfWQI2p4ietuBKggIepO7DaJXwHPjaYaEXc8P64EEfn+4zfySQWziWeQTsa9i3VnlnriA1xG1BpXCI9ciRaOam63xYmZ1VFdGqSmK8Om2V7LISuh0OIEpJUMc+J+EuOREeORCf9tl+TtCZtGkrME006wQ5+iH3ojt+Ha3GRCxewMtQXdDSEfrQ+vp3w8IjQdSQcGfCwgqxjvqkg1Nb1kfpOyNiBjDn2iuf2l4P86iqH54e11nZFzs/DTx6p+msuMVVI2elz0l0OaGe8z4J7Qg2al+7ejPZO+lpTfTNn7ALj0ifOWXAozBRJcpN9KZoqlFTB78qkZOo+Hx21VNbHiX99UP6YVCyZCRDTXPAGbt5JLGgUOEIjLNyDHLjl46HWIvsP0bXrU6jxGB41JBc0DNAHfVKFvmt365j36hxfzX/etTYSPwJ3u0ZcsBRyqV9yDjLxiE/yG+4/wK9pUAVYNJDoEx2JQieYXoRufLyZERFF5RsfE6oV5PNM=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(261026121527099003)(56012099006)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pI0mqp4Ch6cFF5mR2I5NrTiqtuasS/UU2VAC43k5/piyjm3bqcHsCcJBTGXLn652U9RdKuYOIm9ac/59q8PuersBLyNfvuien69bFJqYOLyOKE31EIIX+Sq9J1UqlO5l5Ja6sI75ZhErPnTMb0r3EhagZ2s3dYtZI43r5DmZFjqXCb/4Ov/lIWcRBBp4+fQtG4HTHlJFMgFSNcxQaQmKCZhTBzNJhc5duHGqlFm0l21ajdQYo7s4K+mLrHtvIPYHLypflx7qv88pz3V47TfNI7y49wNPvrq3y+zC/cDmkSOXHdw/xYe3aVC7ODjpf+Y2I2f0M52kvlHbZLzs2O1G2Q7SoTPC8c16A3W2eOJI9apkr7Hy+/JEptxiUnnHOgZXhEsPihEuyDrd2hVW/yIPdY7OPEXeic++zlBOOkm3TrwrQ6kf75wJ/0TxxKyr2966
X-Exchange-RoutingPolicyChecked: hPe3i6MkXpBRfRbsyWFH5D8+adTv7Jw2YIWqBg1XELeNiJs81ZV3XIRKkTFGJyFRsjwL4Ly5yCY5wpZkUddJ9MqRzr9dj+A8w3iGA9GHQTxXJFl3f3XsRFH6hkLTZNO2RY5VcbcV4ZFSvbgoyMbFBxDKwLrXj7gPDeC/2peYuvvV0dQdH9YDGt+aX/DMZ5AwmcSzdfUJj1zvVPuNM5p+oegwbyaQj2wsY2+Ip49Kz+RJ2LczqdzB605s+YplHSTRkxcSyuuihIRezPA69Hy6yGkFcbcf13V4xrZw2rfWsFLFfjk/jTqTol96AhX2hOusmPfLf+ZpqjuZPupbChF4zg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 16:57:39.2217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f39ec5-f5fb-414e-4a67-08df35149314
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF000392D7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4728
X-Proofpoint-ORIG-GUID: R2s0XujsGjPAz5jjP5rojpEynKKYlFdc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX7UOHAsLq5AQ1
 C/P+rx/Vlk2yzzr830/KsO9MN70UUmVBaVsMZjBj7TDoU9AOkj4dlaHvR65S+lckyhadlcnN00q
 fJsUgudUKFwubyOHoobIcDsVHq9HEwsIq1w3TdrNq7Bn2b8HbJR6PIk95ki8iO/PX3MMWNycS9P
 6UgPdXrIlzFgVmUrmXIbWQm+rzFQHDekRIVZ89lpHAW5mDwlkIZO99OQUsBEg7xSF/nSMBnGNis
 o9CQyLDBSlACbTiZx21q4tAN1rFfqkmV8XinPoi+Me/BrUxs1b5KDxZmPKgRa+/mUO1GZB+EAnU
 Bdv0f+neiMVEG44sh+tWU1Qb/oBu+Deud6D9JiNf+ueY7DyQGkiA0/5TKVtUNuUuFIfZfvcfFrU
 UrgIjNh/jxCzGEcTL1cDfsaKpbSx1Dy0jw/kGbEn2zOPxSYs/Qag8ZOH3ZGqPuxeB1xGwL43Ttk
 uYqP3CzQ1f6c+5uOuRQ==
X-Authority-Analysis: v=2.4 cv=G8uJgNk5 c=1 sm=1 tr=0 ts=6ae22985 cx=c_pps
 a=SqiBG769zjf53VTvhFyIdA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=Hv5OlELyDp88zGNM2C8A:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: R2s0XujsGjPAz5jjP5rojpEynKKYlFdc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX0OJEYtHjr7y7
 E/+P1jHDat7vZZBYpjUJa8iPGDkvQ6MjL1/QC78oVMddRJxKpF6+F/rDTgHa3PqqtYDpSvIb5OF
 RjCPOZ0zOl5dPsuouIo4vvLHU9IIqfE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280067
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 28 Oct 2026 16:57:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20499
Content-Type: text/plain; charset="utf-8"

The breakout of iwlwifi-ty [1] was not accepted as a backport for wrynose.
Rather than making a mixin layer [2] a dependency for meta-ti-test to build, we
will simply carry the needed change to break out the required firmware
into its own package.

There is a little goofiness with needing to define an
iwlwifi-misc-minus-ty package and clearing the iwlwifi-misc package
since the FILES variable is processed in order of definition in the
file.  The iwlwifi-misc package was still sucking in the ty firmware, so
it needed a little brute force to make it do what was needed.

[1] https://git.openembedded.org/openembedded-core/commit/meta/recipes-kernel/linux-firmware?id=f03f023e6ce8078e0d5c505195a9af18faebdc28
[2] https://git.yoctoproject.org/meta-lts-mixins/log/?h=wrynose/linux-firmware

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../linux-firmware/linux-firmware-ti.inc      | 20 +++++++++++++++++++
 .../linux-firmware/linux-firmware_%.bbappend  |  4 ++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta-ti-test/recipes-kernel/linux-firmware/linux-firmware-ti.inc
 create mode 100644 meta-ti-test/recipes-kernel/linux-firmware/linux-firmware_%.bbappend

diff --git a/meta-ti-test/recipes-kernel/linux-firmware/linux-firmware-ti.inc b/meta-ti-test/recipes-kernel/linux-firmware/linux-firmware-ti.inc
new file mode 100644
index 00000000..3ebba812
--- /dev/null
+++ b/meta-ti-test/recipes-kernel/linux-firmware/linux-firmware-ti.inc
@@ -0,0 +1,20 @@
+PACKAGES += " \
+    ${PN}-iwlwifi-ty \
+    ${PN}-iwlwifi-misc-minus-ty \
+"
+
+LICENSE:${PN}-iwlwifi-ty    = "Firmware-iwlwifi_firmware"
+LICENSE:${PN}-iwlwifi-misc-minus-ty = "Firmware-iwlwifi_firmware"
+
+FILES:${PN}-iwlwifi-ty    = " \
+    ${nonarch_base_libdir}/firmware/iwlwifi-ty-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-ty-*.ucode* \
+    ${nonarch_base_libdir}/firmware/iwlwifi-ty-*.pnvm* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-ty-*.pnvm* \
+"
+FILES:${PN}-iwlwifi-misc  = ""
+FILES:${PN}-iwlwifi-misc-minus-ty = " \
+    ${nonarch_base_libdir}/firmware/iwlwifi-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-*.ucode* \
+    ${nonarch_base_libdir}/firmware/iwlwifi-*.pnvm* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-*.pnvm* \
+"
+
+RDEPENDS:${PN}-iwlwifi-ty    = "${PN}-iwlwifi-license"
+RDEPENDS:${PN}-iwlwifi-misc += "${PN}-iwlwifi-misc-minus-ty"
diff --git a/meta-ti-test/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-ti-test/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
new file mode 100644
index 00000000..ca8e229d
--- /dev/null
+++ b/meta-ti-test/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
@@ -0,0 +1,4 @@
+LINUX_FIRMWARE_TI = ""
+LINUX_FIRMWARE_TI:ti-soc = "linux-firmware-ti.inc"
+
+require ${LINUX_FIRMWARE_TI}
-- 
2.43.0

