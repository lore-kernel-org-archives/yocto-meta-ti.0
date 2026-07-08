Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C28C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 18:52:13 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15941.1783536726827230648
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 11:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=jRPSwjKY;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=N5wekwC0;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GHJUM2773402;
	Wed, 8 Jul 2026 13:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=J0CMbk7aMh+ES
	ptO9KAAacQuTBwWxNAS/LzWhoucD34=; b=jRPSwjKY22bYtWgRYMnBX4RcSUKQk
	Ut9H40rstcji2xwuD1Jff7sJl/pDfqVj/8M6i2ZwXeZQXniXGmX7LbAmGbOsTcXg
	GW9+CTD3RVC3wMfLMtb10sm+KvmuT0kbBgqCJOgAocgijtBR3H5bTwW3vyUpirVs
	SrFG7ovfMqQBIt84ksmgih8dpCwXKHwIgTrGS8p4IbiBKZG2SHSPqhrtRgWgoGBW
	72kThCBHU5LTlwiWfNaHu9MH/aUogJa3TLHPASbgXooS5k3rtII+YmnlBDq7l/fv
	FBjGp7DZSlSU0IuqBd8rU3ArYdead4lIFpeUvwNLHeG+csPc1d1pEHHAA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012061.outbound.protection.outlook.com [52.101.43.61])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f9kuaup82-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 13:52:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxICJ8xGF1P16irBBjId3cfhaiwXnn4dnUrtYws/bZxALRytkQjGKv5sueRkop2hvUz6H4BZNuDmwqyH3KdeMJxmHqKk+z48pOhrKW3tLNYKGophH5jk1rzSw6qZXZG9CmJn7z/OvaC3VQBUp+pNZ4XngKEnQJiEyu5G5XpamhfQ5eWiMR72PVJstSuSqwQyZi6+xTEJp8rY67nR4cl1Due0+mzT8yMikcJ6BmODJuI8/4nrzNdD2uFn0HTlnan1MRX996ztLScLosBsgBva8k0XNh6jgcSj0GkUmkFbPKMV6htM7e1xkhW/7Nv+bdwZGwrvFKZU0OWd3l4WpesOiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0CMbk7aMh+ESptO9KAAacQuTBwWxNAS/LzWhoucD34=;
 b=LNmi6ECx6HS32ieF9V7j5tVmBbnFPHyPcQukqot+YztlGxUlQRoGDwG/W+33rjPv7nLbHtd4Ks4KKuqp4llZzLRrVftxixFe4ckFJPaCLQBdaU8XAjPbc5miIyxocGVrhd7Z1C4V89w8a4ysMvxr9h8rLsOEIz2gQib/qkCRYCj9LYJsye1w3Z5yfyBVedNxVFNGXBJrEthHctpd4Y9GdRlLVurIPP3FG7DpAjSW0ClQ6gKsYlVX8JrE5EC89/wpFHcTdonQtf6Y1GsMTSOCgeFPArgX9zS6KsiZUv7f0eJ1XoG+aMjOVHsjBb2f6/CLBSpwP3NgG7iUYlgQdYmB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0CMbk7aMh+ESptO9KAAacQuTBwWxNAS/LzWhoucD34=;
 b=N5wekwC0Mvl3XRALn3nJpb0nekGu23QSA6d6kKnlM9QqLYQCzZ0U8tfKdfrurTjhwVJ1uhvWPo/1rEJ+1YbMcOZs1K1iyF8VMF4QerBS9YRvtboKAATKKBBWb3gK7skVA5VVnL+b1FvxvDf4htOMbF66ooD7RtHbsEFHvi+EiEU=
Received: from MW4PR04CA0328.namprd04.prod.outlook.com (2603:10b6:303:82::33)
 by SA1PR10MB7738.namprd10.prod.outlook.com (2603:10b6:806:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 18:52:01 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:303:82:cafe::a3) by MW4PR04CA0328.outlook.office365.com
 (2603:10b6:303:82::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 18:52:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 18:52:00 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 13:52:00 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 13:52:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 13:52:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668Iq0eG3522603;
	Wed, 8 Jul 2026 13:52:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1whXNI-00000005qnJ-11ej;
	Wed, 08 Jul 2026 13:52:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] check_yocto_rules: Add new linux-firmware bbappend to skip list
Date: Wed, 8 Jul 2026 13:52:00 -0500
Message-ID: <20260708185200.1394574-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|SA1PR10MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: f82d3cfb-2d6d-421c-48fe-08dedd21fe98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	35dhp+xfMkGPx5wtyZpMtuLvAKvh+WS86GgeqKOjs9FVQLuj3o7uUZ1GDqyvpIFhv9U/6ZnztUK/Br9f5TQjps09GX3gPQ61bpdkrrRvXr9jTr1YkZYFm61Z6pejjixowTc1sOIcOcfH5A1ZnHATUh6p0wdE5mgfH7s41MbljCfxgRCMDlaW6u6t9iwbJ2L6ILuhwzcasa88JoM1ITl5MhqauD3DuNc4OAh5gCBUMVh7VJhC9HDMLrESKvL7gnnXIa9TnQpjiHWTalAaw28FqBZDaa+eGEtwBBDgVT4shAk7HMa+GdiyqOkI1nJgGGnwnUTaQ1/PoR2vYrXOx7jaFSJ2ZypqkmcXBD8/RqSzRgOKh2x2+xx3SNfdKrsmOY4zuF97K7ZGBwmuZYSGmLtVRgHmwBECrOEpFYRafDgZT334varHHr/0YUGUXzDpxYMKsx4YaeLM/eQaJOMl8R8fMtcR3T2gqmhjLzuJI/QTDJReu2KIrn9VTqx8NaaLm0b3175p36hep17KrC4P83aU/pP1U7aA0n51CSP2YwOBBrdqXTRRgI9t/RnMKY68BUML+stM05z0RFXP3SyOQIdTTHJvEvS5llM7z83IbtW5bJ8LGPv1VWZ1YGTRqnEKhTXKezrKgtFrlvwf3S8sHAzSAadi9aALbcrziOzoK1Z/59o4Z0SFo9V9CNCde1lR539JOKhDCxlle7ujfoubkTOADw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UxR+RceG6eyVqpifrvF96YDpA1HpeP9SjUeHRPHageKrsWlcCAlvw2bDv4eU71Bhrl2HAIR2Mk3CK5SdHifVzJcvVpvFmrc9QEUDhLwrFyuYGa4TLg+qGn0Dhc9SUpg3SCM+ddUxz6GOf2WFc2m7UrJjX6MZQMRwHJMOx1czkzmKSSwT5y1sHAP5U26nzyhcYR+h9WVNkwolLOzfuuM9rzjohwyfbvXLAo4BP0eU/Xeuv0Od7ZM+W1bXEiqE2qSVWi7FOTy+H9iAkmd6CMegP3y4KWyEKIxVcI+nJdSkmgfM9eMql3ddFSduT581xWyV4xwFWnnGPn131OQI1kLIfTECeeXrgeU/HqLVejoNsjE8FxefdtkYIm3nGJeQqMdktUppCakjHq89ebkbcTpy1dzS4LG4l17ZPmsk6beJPfPt6Df+BeShuemV6SXq5H9m
X-Exchange-RoutingPolicyChecked: 
	XTV+FROyqE0H+Lh8jVAx7od0UqPcRVwSmWKT46efDQPGf0gPXgH/GODqQkHlBXm6Rg+oMJKHtVM6gEfsKsprYtfIryDRk3vKedDeImT/5LTmr23KuKGydz5dxD5itZbSapc8FqkNpIWF0uQJVt5xqZWzFqPLnu8gvbBW2edU2ssERF5UhPArXEJyzIAkhefTsk46FQayGSAdBAktzFi8O+DAWjDe/qHGxnpPiM2vKfKaAjkXmR3XRAV5N/vn8IRTELr9CuuTN0CLRpSHB/QeJNEjjx+KpbyMhyimIkcQEHKA/xyu0ogy3r2XMpDrkwzlD4jt+IEL8X+gLSUeIeURNA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:52:00.6858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f82d3cfb-2d6d-421c-48fe-08dedd21fe98
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7738
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfXxsPy1lw8t2O4
 Hed238a7QeS5vmVjWBbOHagyhu5VhHSn9l7Ff8dTxyOXJhMETZkbaFmo0y986DVfHTS1mdLq3/Q
 pRRi3kgXDnq7XpHCSYa45V2FhZ8xHVo=
X-Proofpoint-ORIG-GUID: ZQTeHZOkg6wNAJv9_MiN7bKdrtuNXYEC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfX3KLjqxgapUQj
 Y1tTyMEw14SgaBW8iOu3APinkSd4AO/LqdTZ27p6vPqkbvEbYvuytMNxdo67twT5O6kPONxOET8
 lu4DsvlrxnlwnupxjsaexXSz3It74qT1LBRRFG0Aca7FAeHhy1Z98Yud4KjwOSTY8wAMXobiX0b
 Z2vcZ2mIZWE+Y70KR7gAXnhDXXCncJ4yy8GjUmT8NAdW+N8Y1O0+xVlHkpwTDY0HdHM69HgKTCg
 WmOuWTClRUvSAMo5Nr6u6PXPTILasRI9vbqFh0GnUirETgASG5So3pzcoz6vRKvL8dBqnpE1Ufj
 DE+4Bd8roReFanx7/zOj1f1sgIOGlmnasuq1bz6/2LshlyXiwC88wQ0l6VpJRJYEU15XWVkxfqq
 Tf2/lnaCch79u8EcepL4hWmOjptKJBUC39xLWZi3MDN8E5nsEyXiZIw5acRXWYn3sQhU3CFlkHR
 CAzBSwcj5KuTtXl3EXA==
X-Proofpoint-GUID: ZQTeHZOkg6wNAJv9_MiN7bKdrtuNXYEC
X-Authority-Analysis: v=2.4 cv=GtJyPE1C c=1 sm=1 tr=0 ts=6a4e9c54 cx=c_pps
 a=O2ROGSCZJc1UeeGV/dUHAw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=1Lw1To4mCTofJQ74EKYA:9
 a=ZXulRonScM0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080185
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 18:52:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20132

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index aaded6db..6867614f 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -17,6 +17,7 @@
         "skip_files" : [
             "meta-ti-bsp/recipes-core/udev/eudev_%.bbappend",
             "meta-ti-bsp/recipes-devtools/binutils/binutils-cross-canadian_%.bbappend",
+            "meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend",
             "meta-ti-bsp/recipes-security/optee/optee-%.bbappend",
             "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-bsp/u-boot/u-boot-ti-%.bbappend",
             "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bbappend",
-- 
2.43.0


