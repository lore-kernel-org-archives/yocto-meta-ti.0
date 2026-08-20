Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC7EC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 19:09:25 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1411.1787252954711411758
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 12:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=fULAT9Oc;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=vBYSox8Z;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67KIKHdB1218055;
	Thu, 20 Aug 2026 14:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=l3dnB74645IM8
	Hn+F/r77+VapfxF9BdqCv3VoNxReoM=; b=fULAT9Oc3PToexxJrmA53uVJ2LEvV
	Qx5QEDvYjM8OQEvV5+bQm56lsNH110v8ZaFj1Q6itiKjtTDRxtBLhn4sqYXqZKxv
	w6suULoD9gmpsVTacBuYFntE7HloxTtYSiT8neoTZTUR1LYiSA4ezRUxT4HE0aHw
	aySrnV3pLanpnb1Kd96lm5fJSvW5lWLmYBpskC1Uzlj+xETMPT1OX0xccoHTLSa3
	Q9ov1j3BU6d1h3TM4o/AiecKkaqZaUQlc+VSrIQmHcn63h3CUSAFe+t5Hq14t+a5
	e3Bvw9MYEg/oBBL9IpRuvmBoemMadYXE/d+iYm1h3r+xHiTZWrTBvnRFQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g5rtrwc1b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 14:09:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoiXo4Gx3KxLcYfLJDIeng+bsdzNJ03NMiAPJtNnpNvq/+YduJ+smK+bKLDNk1VzwkFKpHq24VjD+t0Wa9dMYm+UsSlPZKdxf5n/R2sDOFZ3A0Ss/xUwGd8wQ3mfb3VG4Hj9ePAIy6+N8TvgqoQghM95FRCGofZ5FrczHbLIRDyond2DB3pt6zx9OcpsSMI126hA5RL4JyLpuQYIYVWv4TEDkKB891RS2WTb1mgTamNH5KMh+/sZDpdYh8h3mtkmLdAsmE/IhmOc8GVQdj+X1x6LO5YMZzMXyrLuhshG0z0b7RWpBGAwxIadsUU+MvIpOyoy/h/TApsBJ5gkEfMgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3dnB74645IM8Hn+F/r77+VapfxF9BdqCv3VoNxReoM=;
 b=Th7wkuUmlf7FV3lvxmTmfeJzDf4Pg+hU7rxk6pfohkjt+f7PlATKK2T8///UK3NFDdVFj7/sOKzUx6m+IdkC1Sq1/ka0B3KspLXzpP3yuvlTzS4YgcDJcewYgyWC0UqYpls5dx0uvTcUi35uIz4WgIQESrFYbfWnJ0zE4a7dSvfTgdz5kETtsUcVms+7j7fgXrgGZF2EID89uXJXC5bBZN+o8snSdBaHcqKfYn+e0UreeDIgCcWMqpc9rAmirKdQgl1mvH/7Hl6w1hwV0d7uUjMxe9PUHAY61YiVAVtibkpjt1wFcgx4D37ScTDd59pzGwxDR841w4A2Bald5XzJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3dnB74645IM8Hn+F/r77+VapfxF9BdqCv3VoNxReoM=;
 b=vBYSox8ZtR/dIiELiWMm1RkjNgPdo3QJqUp2nce330Htsl/Apb196QFQMy9fVRZiDO5sVHbZQvq1pmKBKcS52zoShsNoy7oIIQorxvKiUFBDtFJEOfJnjoRcjAvPaJiSYBan4+Mt8VV9qJvouR6EW6Uy5nA/azKV368w8URRs5w=
Received: from CH2PR20CA0013.namprd20.prod.outlook.com (2603:10b6:610:58::23)
 by DS3PR10MB997700.namprd10.prod.outlook.com (2603:10b6:8:347::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 19:09:09 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::68) by CH2PR20CA0013.outlook.office365.com
 (2603:10b6:610:58::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 19:09:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 19:09:08 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:09:08 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:09:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 14:09:08 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KJ981A715496;
	Thu, 20 Aug 2026 14:09:08 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wx88S-0000000DRQn-0jua;
	Thu, 20 Aug 2026 14:09:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] libclc: Import from removed oe-core recipe
Date: Thu, 20 Aug 2026 14:09:08 -0500
Message-ID: <20260820190908.3203620-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|DS3PR10MB997700:EE_
X-MS-Office365-Filtering-Correlation-Id: 231d1f89-3e2c-4aa2-20e4-08defeee831b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|13003099007|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FkXCNn+bh9wMT4dX6UnJxVd1vwmvxDVclctjld3QR84idWu1f21PBABp3QleY9E65u8aJkn/wFJpTZOlzl8si9kwEfgoH34QM2QIus4+sQz6cjwPnnZNpK9P8ixAFBMvEE2v0ZMPss/L8LpA+jtI6awXqlkQ2pHg1JtH9SSU3s/ODkEWdOGd2uCBdtKm3IVWC558M6EcEFV7tUS4tBgpOM2WoAGBJemaMK7CEPEa/AY6JMbGz9raAv5iMiW9MgTeOAPc07IYR9njYVnzKS4sp9VnktuagaumaqFnULX+lCcWCAn3Ysi5uwrFJk+jsWyhW8fefoDVtAKGTyKJWHPtmAlBkxysfUHji+SvkARHUsDO4iLGNxqAxqA+M5t5pFQMISfuGx+sEYDmvaVcGPMTw8mluDzD/g3l3gcf17cY/+h9nFSc0IFrpDf5jSpsfy7RNO1YOOOdy+4IqXSgor8dh7KHgpeFkehyAeNkDcLLFBHEZXP8M0P2g7oJkEMQLoNNC7jYYVCunRAeLshkd+nlHq1G+P0LN56M2ZEQW+dYDSMrPQhd3DVCZKerpwjhvjffFIjsm0GlGLcjaVI8Pc7BZailHW13PN7BZQNSml6u9e9xxyHZ1CZepLPTaMd5uneus6zwXGJMcX6CPhX3ylMbKg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tBLwMWZSOavt4aoUVvaIX51dUy1mxx9f2l9oGeBdz2ABIZnPltbsAqq8DYez7Bmbz7pbyNatM7h/L0UTeQXDAWKVBFRyq3w3VuXrvOLUaRpYW3TZ5CTvOff3Yut8hoL0XWD/CrM/8Vq1m6sUaVloupHvancOnijnEaiU2dz8AYvrK6uHEMf9YJE4px7KCqAC8Sqs560cCKRQ3umLgf16+GDGPpfpEzfG0cLV7urqDWCiWneoFG27tjFdUrcKV4vtdqwCqQQB5HjYWf5LxRVd560AfMTBcILigHUryQaMc4DQhaFKfsNHVwm5wDzay/ZT76dpHPxjukDBwG/8kXlxL54ZrNfsdCG9Do2inhk5fMNcpuaDGqk26cNkifewJoFH97yxEHjfYXExCXaVeF9WPPaL/85ifeUghWVzjKn0t6fnWqkjfcif5pjDVu7vbZQm
X-Exchange-RoutingPolicyChecked: 
	IV1jDnWFDu0jtYcCmSb73EeqVQJK4RBifnkvpZRbv423J+6z39YAND7QII0qCFdPD++QNv3UzLcnCbEen0l0Ed8EqE1c7Oy7vjQ20y14ccQK4YWsvc+Pn4RJer8FpE2VdB/+I0EJbjv+QssYM/akUeTKAhH4m6I3LxRQtJTPg1CnK6fgYfaH8Fur79qx8YMh7M3tUBKgLM+YoN7Umpl7H8AjHU9uC6de3OGC+H+D6diE0cDTdjjah8Va+aAwYQtxrIRQh5cIbjVyaqjhjWRMEmVblBTKp2LJ1Cq733a0MNffIYtdsQwY1EZHZN1Z9TO42NEzV14tjdxT5VAhDmR7gQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 19:09:08.7548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 231d1f89-3e2c-4aa2-20e4-08defeee831b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997700
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0NCBTYWx0ZWRfX15th1pKYd/jr
 gcRP7AxLBWp+VmoXWuFq67XI6zQ4UHQcxfsay6CAxGEuoEUc1WY869x/Phkp/pP9Vy3cr6VV0vv
 pg9/tRgRoo3nxnTW5dlSnlpU45GKhP0=
X-Proofpoint-GUID: 4YyxamYeFb6y4zwbqYy0xcZ3V0ZmPxoH
X-Authority-Analysis: v=2.4 cv=KO5qylFo c=1 sm=1 tr=0 ts=6a8750d8 cx=c_pps
 a=F8U3mngwmb3oM6JELIq/Eg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=Q4-j1AaZAAAA:8 a=Twlkf-z8AAAA:8 a=sozttTNsAAAA:8
 a=kX5Nho_g224ZTjIYE4QA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=-74SuR6ZdpOK_LpdRCUo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0NCBTYWx0ZWRfX0UmpeSeePhtp
 HiNGsK0lyKMzk7H9KRJz70JAeCe0Hyn00SDZXFrk3ihitnC8JtRmMzXXv53gniJrdjibd2bcze8
 QFRmKYreoNFRimCFWFXHov5oz6Vb6iGp7XPvHqZ+HFZBzQqQxRArtIntuQ+0ysylm6XZ9ILbgO/
 BfECjaeFXhNYsUS7VQ65YTnfN9IK1w05/39MqL11HwEoZiKORWmD07GVFpQdkmae2P6IAxSUZQT
 vPFlwVIsFKNg1FjMOfB1VEancg9tttogTf01hd86UsCN3BeJdcnOgPDCWkr+uON6Ek+BvlqEHJo
 ITmGjEtbijtRB15xgcamWsVgjFpk7+iCsZtR+0RDcNFLzD1AHs10EtPxYEaTGVZqIgQwWzzhZB1
 FMUKX9XuFmsTVI/G6nsxnmWLxNiwx1iYNQo389SaIifoIdbnyqQyUUAS6K1cyaaK8gwC0t6hYLY
 XWgtcGHwy3en/y+ZoUg==
X-Proofpoint-ORIG-GUID: 4YyxamYeFb6y4zwbqYy0xcZ3V0ZmPxoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200144
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Aug 2026 19:09:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20281

A recent change in oe-core [1] has removed the libclc recipe, but our
mesa-pvr recipes all depend on this recipe.  Import the final version of
the libclc recipe until we no longer need it.

[1] https://git.openembedded.org/openembedded-core/commit/?id=5457c35142cc9b6d3fa537cc5ef56e90cce85c88

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-graphics/mesa/libclc_git.bb       | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb

diff --git a/meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb b/meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb
new file mode 100644
index 00000000..e8645d4b
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Implementation of the library requirements of the OpenCL C programming language."
+HOMEPAGE = "https://libclc.llvm.org"
+SECTION = "devel"
+
+require recipes-devtools/clang/common-clang.inc
+require recipes-devtools/clang/common-source.inc
+
+LIC_FILES_CHKSUM = "file://libclc/LICENSE.TXT;md5=7cc795f6cbb2d801d84336b83c8017db"
+
+inherit cmake pkgconfig
+
+# Depend explicitly on clang-native instead of using TOOLCHAIN as the build
+# objects from this recipe are build explicitly using clang for GPU targets.
+# We could INHIBIT_DEFAULT_DEPS to avoid any other toolchain but then we need
+# to wrestle CMake to configure without a toolchain.
+DEPENDS += "clang-native spirv-llvm-translator-native"
+
+OECMAKE_SOURCEPATH = "${S}/libclc"
+
+# Semicolon-separated list of targets to build
+LIBCLC_TARGETS ?= "all"
+
+EXTRA_OECMAKE += "-DLIBCLC_TARGETS_TO_BUILD='${LIBCLC_TARGETS}'"
+
+FILES:${PN} += "${datadir}/clc"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


