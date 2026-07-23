Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB778C531D0
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 20:22:42 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5651.1784838157158588504
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jul 2026 13:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=MaDHRrlO;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=U0AxNq2+;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NIoKvn3286115;
	Thu, 23 Jul 2026 15:22:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=FOkwtY9njDc4Q
	wSPDxG0TxmapVBPUlI16Ps38qFwQ7E=; b=MaDHRrlOo94cMnXO5mlgSVQTsum0R
	jj8yCUzbhZCqeaz0OpVvwoHi2zYw4nVPIwDmZxsf+CfdMpBrxvDUIDoe5FPF0rKU
	wUH1U0FMEnhW16DCGZ9mt6F+GzVfOdV/EVGIPnVWzJxMnXDV02rTcad8lLduDirm
	r2+f/oyZRbC0quXaozoeJPhvhw/BYoFYlpaw91YYaXQSWNVkIIZb3nVW/KMJFBIm
	iZBcOyNcPqONfDc4xUIBQrVWDMEVTzycPYA/dhOZTrH/QPjtMJKW+hB9YBTWIOSO
	1QYIzXRmbnW3Xe7VnFWKhiAcD+zR2qSDoNHLpvZdwQrnydEbRWGB4y8Mw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010042.outbound.protection.outlook.com [52.101.85.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkhux53nc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 15:22:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyHfimQDqp5wfslAhkqqqBYPGob09mxnb6JELr2wf3AcBwWUq8gR1xoz6vZv7RcJ1FAxp/qF+JUo3qZ6AJRgTo4aFFwNtCTPg37kqT15XmIWbGqKu/8zOf+Toq0bnFdw+Q/ALqeLLc0RrsmlWP6moSbAkJ2nj4jhDDuM/1if4acxfSAeJ76bN60dk2a5pqcWPFIwzlY0C1cDj1mgtyPglIb9sHD9Y0EzbpYbYc1V5ZwHsZ4Og/ws1/1U2U6M4ZQqdefv1MSUJ8uThr37MGBW1fYGiiFi3MwMcU47JjhL03QYOv37bnRs0YuMPlW086diA1iz6Ciuj8vKO5clWL0XJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOkwtY9njDc4QwSPDxG0TxmapVBPUlI16Ps38qFwQ7E=;
 b=KedGZA/BuMdBEZm8J2jY/tw4p60h5MLWbgE4slS+EfaCvaGebeSwaLdAJ7q8qU+LNhdwJfE6XvpwU52wxJI4D6qcFaqATAQINCJMJ55eR2RRVYnb8z1O0ABNab9j4im7j7f6hpJLrpVtufqPcj7D0wFh7pfWU/SycBPgazqXHJt6zUe/HnZYwWXS6m1bnoMQlyYinlyHOkyhcJc5VeuMJBMlOJXXNFgc3MIJAEUTgLRfqBrbLnWo0SycrMQ0fSr0juIKwgDQFI3NPINEeZ4cjwf+2ffjiT+ZADjZa+vOvQqrWvrIYua+CrLtwDfcH3Rm03nesqrsw2T3G6SUxkyk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOkwtY9njDc4QwSPDxG0TxmapVBPUlI16Ps38qFwQ7E=;
 b=U0AxNq2+GEvATt4HPOIGI01eIlyEm9b+b3Rs8JoyQqgvfWHWbS1OoCnukPEZ37w7e27p2yaBtvbthItnio9uWRGs0Is2u1vwZjz+dHsIdqJv6NW7wZFdMiVDlI9m80Rc0qmGKQCLa/HtuRPqICpRzPJevkF2jrqzfsavQrxt/7w=
Received: from BY3PR10CA0004.namprd10.prod.outlook.com (2603:10b6:a03:255::9)
 by DM3PPF5816B0BC4.namprd10.prod.outlook.com (2603:10b6:f:fc00::c28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Thu, 23 Jul
 2026 20:22:31 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::69) by BY3PR10CA0004.outlook.office365.com
 (2603:10b6:a03:255::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 20:22:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 20:22:30 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 15:22:30 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 15:22:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 23 Jul 2026 15:22:30 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66NKMTXi1793371;
	Thu, 23 Jul 2026 15:22:29 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH] mesa-pvr: Update SRCREV
Date: Thu, 23 Jul 2026 15:22:29 -0500
Message-ID: <20260723202229.3192049-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|DM3PPF5816B0BC4:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ffea33-2edb-4cce-6ca1-08dee8f81f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|13003099007|18002099003|10067099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	sNjIXAZ4ycpjwgAfmNsNZmdg1E1DpqCLWa7Xgpta7e6UKejNMj97iMTgB/3Q0y1LucGLPLiGJs/0uPdsJBEj1eOP9NpXUk2AxMZc24h0k1ubQcwOTOkXJCdJu65aAH4tVMlaA1iYQiEt3RsyJvIFjn9sFUnTU3y8OsBK3AnmMdyAop6LuVHMxfyWCd3CwjVLdD6wxqdlzv6kYBH9E20oI0x51ePjiNhF3Bz+mK8FdgVjLGgBtT8viSPMF/LzTDg8lmGLG9yic+W9FeEmsEGDHUGjEABcd0twUq4ROHTtA+6ZdhLy7ydmoSgsuyhWI1Stp5R9nmZu7dKT3H4BJw4WH9r4xp04O9rLUwj+b6wMADdzI+LPB6eNt+kxEOUBvA/w8MCB+B2878tBYcZnsXU5aZ87Fz2pHmJJJYrMMScmPR1GnWEd/Sck+31uIFMVcxTAJ7sBBMT+dXzHpggE/QtqDCYXqz7HRfuh+dSLO9c7L5z7V207FbKrIGZqZUtopuxQ65xAd9hMEuzf0acyTlCV8jtPo5HZQ3sBWKthgaS/Jt1P4Q3PNhYAtiMHPnlw12UGErJOfokfqcA4RqwRduFEAgho1VXhCKWmNJiqNtTSq0jaHq5tRQ+f0uNjW0X15CPTqCZJJBHzXytrUlSVLtjdPKHZ1F24F12qOWJdJaHW6AQw44TB+XBqNboRmhzsVk87TN3bEWBklB0LwwuaUP5kbg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(13003099007)(18002099003)(10067099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NLJ36FM/wqn+JsKpathQmg1kChq6nve8UhGd9SR07vIBVuT/vLUCDjpLE89aujFz27MNXdVRWQloxfdaahgUARYxiuV5RYcqsmudw20TGSGq/s9BP37d2s0VUxAIxhbT6tNh0DYVkfyZ56CHsxGco9l//ChCHalgAqUMYy5mFXsh8DAjXbFHbkouDKLJfEy8ktQ4tA4OUUCfibPF166zPo+mO6muHWoLper/87hn2Rp4OxY3ltI+ypCPczSWVuDpLeG9qY6RdK7KbDO037GTR46V6h0dmwXTl9vZPniH9e4O/TG51vwDsKzoCt0ewHX9CKK1eaeGW5t6fg4/0SxxmkAVdVr8TBixOO6KuUNAIVPVW2PznpGr/lWDcuNpXK5EpHZjlDv21QMAmT4y5TWEslRrfjV5C8SBYe/vNOuePsjetEDSCMstdWbF8ybdjqMQ
X-Exchange-RoutingPolicyChecked: 
	PlYn/mzS8Dv3IePPPlc3UurVyFgKx9TR+AXh8iscxJsxPFaLESLGZyx87Ex2DHBLq0MkJZSUm1X28/TOLnLSk7F2W2LEU7NL7qZzVgFBmkob3xVLg/ERX7xpaxiJ0t5QEaOVuQH8tCV7xC8QgNigo9h8KlOP4n+HCNk7aAZmjCC8nLjjW+ZFq2yrpmdy+HtIkX2Ye3Y3923TZVqUyNWm4BcpQp5UGeheHb9sfbc8dXrFp80TptBrQUSSmzYlmyawGJegtzKFVZ6yHWL6H0iSWjpg7BoOGNfz8DBv4QPSH6euFa0tFNHugqsM9dNU1h40O+VQ6sZv6WlyAHFCzcF2WQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 20:22:30.6713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ffea33-2edb-4cce-6ca1-08dee8f81f4f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5816B0BC4
X-Authority-Analysis: v=2.4 cv=c+abhx9l c=1 sm=1 tr=0 ts=6a62780b cx=c_pps
 a=fkezOHFRVmK1Ww34+/XMiQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8
 a=ZdKYWVH1EG8eFN5opz8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE5NyBTYWx0ZWRfX8XOVLi1HE6mP
 ZRGUsuyJjM6YNZzQCVnyrjGA5TNGmpdE1Lti/yf2XdO355zSu5RyGRRbgeuYw4kRABxEskjIRoo
 YLWPIWCPQs+/CBk4sVdjO/yPAv/Gimg=
X-Proofpoint-ORIG-GUID: nqkV_imkk5lzKgXCs1TLWVwZifnpvWlg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE5NyBTYWx0ZWRfX0VLpo4uj74vw
 07+yJAHnXrZ9eKYZHowIx6dRoKIOgxqFzEmO/dN+BNU9H1cvw4r/Z31hryJkjhI/gZPCK9UI6R7
 eXLUCkucOz93ewIdxmVHoeI12JhXaEYUrkkDzyfmjN93j6NTpoSJVeHvAn7fzgfXV8sY+7cE/od
 ODjYmynEJ/CXCfC34I7MMr11o+q32iV4TXTQQk9doWTa8RQoorHfrT54a5mUDlzGGvC+/KP3FZE
 nu11eiAkBE2p9sI6YJbCh/skvoP3LToWkeMaGo53eZ9yFi8flXbF0AjPZ4iz54lr9nGXyvsac0G
 FY+IyjGp7IWdqR/yGF1kSl/ME1rALKKhjxkrPF3H6ESiEwUGe45cVRpl0cVjVkGagyo/1j8MBUs
 NljTrkC3x9ETr6uGuXlBYh/I8Um4Lp+NMkd9EJxOnJNfyb8rkXiugxj5RArnUmVEuJrrAYb9ttr
 pXk2tD/6Ma6fC0b/8kQ==
X-Proofpoint-GUID: nqkV_imkk5lzKgXCs1TLWVwZifnpvWlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230197
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jul 2026 20:22:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20192

From: Antonios Christidis <a-christidis@ti.com>

Update the SRCREV to include missing dependency fix.

Related to,
https://github.com/TexasInstruments/mesa/commit/7b6e8de7b0acdaff684f1109c6acb575644a93ea.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
index 44becc66..03b0b9bf 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
@@ -13,7 +13,7 @@ BRANCH = "powervr/${PV}"
 SRC_URI = "git://github.com/TexasInstruments/mesa.git;protocol=https;branch=${BRANCH} \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch"
 
-SRCREV = "0cb5bad52580f156b02125f4c7121ca7198e1489"
+SRCREV = "7b6e8de7b0acdaff684f1109c6acb575644a93ea"
 PV = "25.2.8"
 PR = "r1"
 
-- 
2.34.1


