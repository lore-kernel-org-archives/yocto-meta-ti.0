Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94D0C54F4D
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 16:02:33 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15063.1785254543697183292
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 09:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=D8vhIzrN;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=GkN0zhjT;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEeC11078533;
	Tue, 28 Jul 2026 11:02:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XXgPDIPoVd3u8FKWgjJwaixX/k1CiPHmZsULv/lE/
	yo=; b=D8vhIzrN/RsemDcPnKkidAa4xMUOa/yRw1db3uooSI9TFkbxRPyn01zxk
	sOFfbNsD6A1bGV8KJ6zZzWukbe1bRFXmLWRtB36pyxZdWZecUKWCohva8rTr62Cn
	1DkOKYWLl56rwcPPAOVGApcNYMpl/mZXVrx+MbNzgELGvKp3X2VzU5uFgzrMI7dO
	3Ixj/tSwNJexhI/CVm4J6AFoYdQP3ZItGPxvh1dFEACe6SOixQpx3LK999uA2HMT
	AEXX1qrEvb4AuwlWV6tlW/62hUD6pyKRpSYVySAx8WVYYxDQCd/IAO1dmS8Y74OX
	D4i2RlmrEsBxZIkkQ+x+0wUExuukQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012048.outbound.protection.outlook.com [52.101.53.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpseb2qcj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 11:02:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gw5I2WTI/lbZBR9ic75jqLPpBKFMNInRCUdyOFY/FaxM4nevX39JRRpJyb8HPV6t7ra7uRn2hFVx/1o9/yhBHUFzPuPAYzrhxWOzgKcPHsg9TsnPFRGtdoDWYeefVXvkTanHBSpy+YL/nNNY38QlQcibjn70J4Vm7KNaKd+tOXK6lNLEpthW0UTjGhiLHnyr/C8T2ETB5VEHERNbmYJd0om3fobXoc1dypyIaoIU88Q25QyH1tkKww4P71hm2Ll5yBzxKl8ebpdxuobwNL36V+qRSqc2/7p81X/qEPDwasy0y+4SLJmr0BjlpinOgawYZhkKCBnffyewZVbSPoCTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXgPDIPoVd3u8FKWgjJwaixX/k1CiPHmZsULv/lE/yo=;
 b=yM4VoY/lHmC0nt3yhSA7cOaCEifZAq2u5dQxTklUxrcLjTPp3VLASGhj1mxyj/XAgY0njNC42a6sm30mh5gZHEUdDqBwIvOmTAM+Cv9lWncMIFAnlxqrsWmPTtebkMcO6tMs4HVBENAlA/jHrBZqNs3OJf83mqGC+Vkpuz+5C5PWXWGG2tjwQ8HzsWfjWuWOKfKzKwjoC/3TAIV3DRSOvUfTq5Jm8FwGTnTbCK9xFWJdzBP+yPaKiOX/KqSyJ1Co1hxSt+yiQEMOxo2CiQAjMdUD/aL8WyP6XyXc+55RdyMzKko5RPuhokai76diBpphsMHYarLS3E4Y1ZYikkVeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXgPDIPoVd3u8FKWgjJwaixX/k1CiPHmZsULv/lE/yo=;
 b=GkN0zhjTHKlekmcBXFpaDCndbb1rL4+ma1z/IpXsVjzbx74lu917/J+mzv0AtLSajYGnDnh6H3eIUcMYFl63n64iI4nmEWiUcarQy1UVyZeSuf9oMHY0cnmQYzrzAYJItZQPLAK5hXAKBy/GwSC02jhfAx6WlyPAckKhHE3LfBA=
Received: from CH0PR03CA0119.namprd03.prod.outlook.com (2603:10b6:610:cd::34)
 by IA3PR10MB8638.namprd10.prod.outlook.com (2603:10b6:208:581::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 16:02:16 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::11) by CH0PR03CA0119.outlook.office365.com
 (2603:10b6:610:cd::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 16:02:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 16:02:13 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 11:02:06 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 11:02:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 11:02:06 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SG25993639304;
	Tue, 28 Jul 2026 11:02:05 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wokFp-0000000BzFJ-3YAX;
	Tue, 28 Jul 2026 11:02:05 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 2/2] ti-core-initramfs: Decrease IMAGE_OVERHEAD_FACTOR
Date: Tue, 28 Jul 2026 11:02:05 -0500
Message-ID: <20260728160205.2857025-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728160205.2857025-1-reatmon@ti.com>
References: <20260728160205.2857025-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|IA3PR10MB8638:EE_
X-MS-Office365-Filtering-Correlation-Id: 433e4db5-dbd2-47bf-d5c3-08deecc196d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	J914wIrJceTwc5T/bM25VTTXdkJipEB7nggXKrc733nLZGaKUF5tS2ze4A6BZ4WOXLreH2pRw2NbokkeHyE95QsxnYhj68dO5lgScU+Q6GjqOR0OZ5gzYvsiv7w5+J2Li+p7HeYU3tQ8uszrv4/fNPQvwvc3R8xf4qdSVOzaI1VBXJXXbNhS72LnVAtl2VUYpsb/vyOc/6a+ruZWr6LNzyajw7WbCwamR8+zEUgBbBhBodRXMgIHIIvZ6YPOY7TnX/k8JCnDXIzDfKTfyqU1jfzyQx09fn7MfZ5UtvbcB2pDRduvL2WDijE1cij2YiBrKNbjEHWUaXp8gl3gbGlcgiQqTUXB4YhhTgZgzI5a+a1mADUGnPZ2iCfWb0eL3WzCuirzD8MejpOAT1dlW5qXyeoSbnl6ONwlRzujoawl1qqkzikoAqiagntp1zeZl0tf5urT9xI/AlSEgbKw0bPGj3AaULJyC7TeMtviZxxUGLorkQoO9vDB/L27OuYiQYNCfIpT1PqE8vj3ISbjHsrooQZFVfIrkYsWtKez1SQGA9qJ+WwlsINAamnfXHQaLlB4HCAGTSwWp25ssgUGFJ6rjAMyNVCJsvMXKleB5GKs2StwSrH5xkkrE0Yp8TgX+yb9VWmQTA95CFz2rW6wIusyN5G/bRU0vymgHFfxkc9UP9Ugfcd2Bcn3tc0R1GjrULy7cV+fKNpo9yu57QC3MYBYFA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	L2mw2/EoG0/IrKGjaypmFeB/KwiU80c9VMRzAsYpRyJ9mjA7m57OUdzPcWjBK5MJRP7jIa0z5GceXx1OFt5MTWwZpZ5WLF/n7fT1Lcg8hSlL+2oMwVsPHywgzujVK8uK2foY+1m0b9rCU6HQrGAcB/BN6kbOoX/EHCUClUCupniaNh2HMldTv6R1ymuhd9fPZUMNFNVzO96xJMofUPqOYu5mN7la77b0ydFCykoL2I7Ui4ON0I08ComxdRqY8Bde26Z2wdVWjJiK29kR6e3kNJ3gv8M2a9HSb7/GD6D+5s2HoiAQ785WyFFU76KAvk0rtZRbVC894e0s5Dnv6Ve2q0ClWx4U4EH5+7PRGlDIJF0y+TjNXJScuizSg8oh9AQzM688YSLzXuEppBAQXJIwcJoY0h0h89ST8t0g7/jioYu77IN53rEbBS4gPmYIKPo2
X-Exchange-RoutingPolicyChecked: 
	sy/x4aZJGKUjltznyCxpuseKmWUXoTSd+kXPhNE0dF6F/O/tX7ymE7V1cyHRti5Imzj6kUMhU8kbnjXp199EghT7WrSZzh8Ah25o752EMfCgumEc3c75dnajDXvHhPqzYEbLZ3Q1t8lN91Ij4fYS1EpbS6qCs6UnSHxm0NC5oYOxgXb+smaK0L7TWQ2GZCvKEWtVrKifW+1tFhxZ7nNNTOfz5vDC/TLh0IGBJkedTFATiaoLAx2ZMicCF8TrO8mpTWpAs//qmXs4srTCFPUKE8DDXNXrqMf3CIm8hROC6eg2VY2DJSWaXccgG22c6OzYgYMm3O6opDU1cGxE1J59OA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 16:02:13.5620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 433e4db5-dbd2-47bf-d5c3-08deecc196d6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8638
X-Authority-Analysis: v=2.4 cv=c46bhx9l c=1 sm=1 tr=0 ts=6a68d28d cx=c_pps
 a=JX9C1NjKfd8eGP+3z/QwmQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=NQSH5FigIGbJV3VoHFAA:9
X-Proofpoint-ORIG-GUID: 15GwRM-kA71UOVDXk_E_BXtvzOaF6tVu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE0MiBTYWx0ZWRfX+mn6kRNGmsrf
 Ex3LCMZC0UYLI6mVCFTjK6GRXQFn1uaAV5QI1hJCwJAKtvjl/EVV4O+VygmqZOM+/MNVx4s5N+8
 jBd89oLdlrcepT5e8whDbLdc87lvWlk=
X-Proofpoint-GUID: 15GwRM-kA71UOVDXk_E_BXtvzOaF6tVu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE0MiBTYWx0ZWRfX4MXYDCiOMsmY
 6qIM/hyz+BAx+CnFJgVAKAQp2ap+ul2txodxPUS3Z70IfQH8hreNW7ipbF1hRyws0Did34Fdp6Y
 +4hGhz1DmQmdspG1+XYm6H+qdNHYfmKv4MM62R6g2lHIK6PCV3ezpsarwD9XaGpK/XmUDeuzeiz
 uwCg90BHv9loKXwEqKLYqxJMzP1cPDMOpIdvN3YaPGHJ6v7nDnvCGmkAx+hTSshSxRXsLY6IFaC
 mXood+6QV8viEH8TUT7+TzqwLfdxZkpkES4RzVOXO0R9WGoy/l71U1yhEzTWZoajfehGHfRVO2w
 dq4x1mhJtph0xlAg06OzqG6+Ah/oQy633jw2mQXfytstbd+O51d4GAstwaTLef2T/u07ZfipYUC
 TDO76Anx4YqQ2NUsT7TUAEYcYlRhj8fCycPTSiyaFDwovTn/wLVnpdlyi6CB1IvHaPSjWbXCr53
 9N2dx6/cL7Qszmc+Pyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280142
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jul 2026 16:02:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20202

Adding in the initramfs-module-netsetup has grown the initramfs by a
small amount.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
index e5834656..d6981131 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
@@ -11,7 +11,7 @@ INITRAMFS_FSTYPES = "cpio cpio.xz"
 
 INITRAMFS_MAXSIZE = "131072"
 
-IMAGE_OVERHEAD_FACTOR = "1.25"
+IMAGE_OVERHEAD_FACTOR = "1.20"
 
 IMAGE_NAME = "ti-core-initramfs"
 
-- 
2.43.0


