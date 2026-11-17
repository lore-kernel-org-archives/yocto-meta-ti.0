Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20180.1794928183186146861
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Nov 2026 07:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=A1osAox8;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=nDzlPDdX;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHEFbw7465269;
	Tue, 17 Nov 2026 09:09:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=EZfGBNbWwxJyf
	V1eAMV4Woq68zau2EBuht1/8LMviw4=; b=A1osAox8MIjbcrMGMuOVtsxXDQHO1
	FhY1nSKJ69Smb+YoOcfvSFeaB/0hqSG8vfxLPcwxXjqUsj9oFiQA266LdfIMrFxV
	7CRh3fyqjiAl3cFc8w/PysFPkNVirkpXDIwtXq+y6tiTuRKVcmn5HBRFKanvOvkD
	VtbHwW0L32G0zDD15TUIpV+uFhjuVCk/AuEhWv+IZjeGkVweh/vNAl3KAz4DAuWC
	ABKG1pXohDSYJzq1zhRnJ7r0V3uBkMSPFvaRuNiVuEuegmfzz/GDjn0+nRnPD/3C
	4hu+RKYFGvl9BUedGvhTGgSbvzmDYgKqks7hp5OBo37ZTrktnnzP4vmWA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010059.outbound.protection.outlook.com [52.101.201.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j0kxtj1wc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 09:09:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvWh7dV70o/JoAmqKOjDx8z36IiD0pUSQKnTP9R9KFGMcudhznqz0UTwrzLH2eSSCPEJRkkFqvsDEGCXrWHXpdVCzt4nNaR+Hj5LjQ06Ujc495bZmDmU9X+nStS0aaaWAbo/mI6TKX964j0COcDez27pMOSJE1B8qjM0n9V6JoJCpRnw5p8BioapW+Ye7lE5QM9+QLFc4wo+IAhpNPy/zFkuEy6ADmIx8TDG9p2X6Ux523PAbhV9axqJ05jB9zAu6w+RbuKPCk7Lu+/cs5f1Z1IFJVh2Nlra/T37ZXoTUj4NS/KZ+OC+SjTYtTX4QSN7yBdC0k+RdTa4yaDNxK7eKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZfGBNbWwxJyfV1eAMV4Woq68zau2EBuht1/8LMviw4=;
 b=pd7T37by0v4s0QszC5/XFv+dnlqN4TvQ+13e02spt9HtzXtwvP3AGryA/PfuxygZjV5hBXAW15/UzwQw4Pcf5Hj42fY5QpGgITBIcMMd9v3LRrwfpS3ddgH8QQY3QDqTSL41gNCyCqaOQXAp8FgXgjlFFHTo4tSOOtlfDTltoRpW0xzF93fNqWZk/W9SBlL3W01/GT9Ghghlg/+tc/sbSabZfHZCPdJSNMhG8p09k6yhpYV07y/luoJ03flTMObG7g95ZG1vYJsKoCQPfu9dJzepgNGljs48xjWrGFa8HbLkA1xWWlW1/xGw8HXSoRil7Md25x+b7y36D38Nonxhwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZfGBNbWwxJyfV1eAMV4Woq68zau2EBuht1/8LMviw4=;
 b=nDzlPDdXynkLW52vCQV8Neivrm+3RHY5lMV1TteeIrAgYA0yBg5ZR2e3bHrfGawMZfWVht1uaD9QDuYLkmG9OC3K3wNxusY4gWUICOqlayEB1x19/4IHGOYa3tyZP6dFvdTACiQw3SEmkdNb1t5Q88p+kXF6tPHcqYObNpjv/dM=
Received: from CH3P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::30)
 by PH7PR10MB5723.namprd10.prod.outlook.com (2603:10b6:510:127::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 15:09:35 +0000
Received: from MN7PEPF0000014F.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::53) by CH3P221CA0018.outlook.office365.com
 (2603:10b6:610:1e7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 15:09:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN7PEPF0000014F.mail.protection.outlook.com (10.167.254.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 15:09:34 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 09:09:05 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 09:09:05 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 17 Nov 2026 09:09:05 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AHF95513172755;
	Tue, 17 Nov 2026 09:09:05 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xTKnw-00000002yuL-3uHJ;
	Tue, 17 Nov 2026 09:09:04 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] meta-ti-bsp: layer.conf: Add guard to fix yocto-check-layer
Date: Tue, 17 Nov 2026 09:09:04 -0600
Message-ID: <20261117150904.710778-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PEPF0000014F:EE_|PH7PR10MB5723:EE_
X-MS-Office365-Filtering-Correlation-Id: 02346f54-35a9-412a-ad4d-08df44bcc9f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|261009223027099003|3023799007|56012099006|261102123227099003|261022075727099003|261021121427099003|261026121527099003|261021123027099003|261022115727099003|10067099003;
X-Microsoft-Antispam-Message-Info: FfaXmr8D+Ef8u8DWbZpM/zHVN7MAvaD+kELA61CbWdeHFn3qc78BAro4kHEuWgrUfXS1QTgcEA92wuREfEvHGFGgk13J31vWKS+AyLGIMKMy3x537xHU3cfxQ8DMmHcCFpfd1sBg9Vs0/sbIJdj4dEZVy4QrpIr4kjLHcmApuGz1Gb9lK6VlF7/3G8KNuILldQdPebNYDLEOaTNdhD/SCunGtlV3KXafsnK5FdGWgSNKLo8wCpmnHnWIAbkqHPPm721SdZAV0lpvY0Ce2VIK61oN+Z3GukpUCnIuY7NbLSSVFPpfI9/hzYXlS0pJqQLxoueJWFcJx3Gzar1FHovLyEgQpYoDAY6ICKrthvKpQI2HDLQPntOu364wU6//YDrqU3W8UYi2PsKDfGN2R8H+vT7F2TxEGsvzw+qZRTrxh3xTygJMy+/QTGyHNVrQfwJfEtFeI6/DVX926XAk8GLgvWKuZ0fpef8mk0LgwXraXAho7hN3RQvdpPOx/JwxxosqhwjK18yhWO0ATkLHqnGZYfa+N/76DN4mLgOP+wFoHRAAKeQmZA76wRZygNRSf+6hrIieb8ep4pJguUp2FVysbc/nw0kbBmFjRFvVrHgdvsSsdHHW4fsn0dzZLkym8aRakWmmCzrKvRUpk1wMkiBKyMFO6s7aoNrTUgFpiKXdWbPboOA0Exv2AZydeO7xgx0fEVsK8b8GWkku1///9CSSZQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(261009223027099003)(3023799007)(56012099006)(261102123227099003)(261022075727099003)(261021121427099003)(261026121527099003)(261021123027099003)(261022115727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 82O2ICKu1ArT6MqKRujzCQ6M0ceXTFf80OEl6aj3P6rIJlgN0798u2BSaID/mm0FAAsJGunYZcs8CRzJlo6qwv3qVc8fFTkyXZrb5kCg4dTYN9f2NqQVfOcMAjWYIuE4B1tlnMSfZe8+vuSSrGgsr78aqI3Mrl6wZU0n1d274U7wylrKiPazHa2sj38GPlo4SMyuEhe/aR6/jN4WBQUKRAlhWtVOkWTYpaDbtaNoDS254tpU8yafB6BsZteOb/sErCNNWIov7mrJQvR4IKEHisumutLSMFK6efJLeBGRWzBETvEoo3c6iIjMzwFpIMvrh3gULjqcDbQTz+BqnJBcpzCZsOIQQ6XTl6ABREvnKEodBiZvtoA7sEUHtce5e0ZLgRTgsvxri+APRzJqcIwSkhy/Qp+4vZpL2/5sO3Qmy3gW/r40bvzBrJ9wmGZ196ZH
X-Exchange-RoutingPolicyChecked: 052CvFEDQsTexoMrdoSu9idwVxyvYCFHqoR5Lc7p/n0hAL/Bm9yu4U7+LA8khIdPRlrWfmEpoPTOBgRQbLIxJlkW5Ej6QTu6dIYuKO0T3MhYYNw0dkKsWTmKIRD8cylrSR1bquWNvEzF8JLcB3rL/wyr3K45vOpaUbdK+T6V138LqfR8ZDgIJG6jUY1Rs1sy0Zaw1Sg5x/snEXtzvgSvpZGm+zhysEDpWk9QbALDkP0F26VJcIxZV7jZka1lPC+6VzAT0c4E6IssHvk2h/ramQ7ggZdj4bulYbjOSlLsnDpy8GyXrPlOh3gOA9+MN7kSO+yVhDTvvGlzpxiclOJeHQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:09:34.1228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02346f54-35a9-412a-ad4d-08df44bcc9f0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN7PEPF0000014F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5723
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfX/Vqx2fDXJKlL
 MfDxiFhrI+fU74GqrMJAQoHUCTJ9dzqq7+TzO4LYZCJAymDBFiErDGBP8j2N2r0lH8p05UYJikm
 YD/ngFj3Ss8oYnTeI2fDCLGmCSvxusg=
X-Proofpoint-ORIG-GUID: dUptxZaR4oGBATSxrwvCcn9zaG8IHqXj
X-Proofpoint-GUID: dUptxZaR4oGBATSxrwvCcn9zaG8IHqXj
X-Authority-Analysis: v=2.4 cv=RYsFmFtv c=1 sm=1 tr=0 ts=6afc6e34 cx=c_pps
 a=mPJaQZadrGlgYT55Vo1ogA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=01ghfIwfyiYmgJ_Txw4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfX0CegvcKgC8Pg
 IVpr+mm8OWdXSdolpD+PWBig8CrrSClPvkJ9ThSeGbc2vw0Pd043qa84eotJMyNJTz6GE2YSVlj
 4pl1gDOFm94vMhjzt7tRpj5J5JtOqR1PeGs9Svt8VNRH9F/fZCNH/9a3nvrIHGDWwgnksHdAEhh
 H6bmL4vgQcNU6sYf1K0WsvEqPMntwHaVByAOd1L2zsfSocr+PN0dwmHzeEspiHrTEm+d15/KdNC
 QEQxqzR1+Hbciq16wK4YqxVbjbGK8mQJBzGHbrc9WRLEzPUGmBLXBXpIc5LMvgqnjnr3HA+7aIl
 i6gm1ehknqOA/d4SKcPX5txuuBsb2cVDhlmQ1TlNT0cWYe2ZzpWyrr+Fh8G32BMWVTP3zV1KHw8
 l+GqTF+ggVMqelq3QfoFooL+tyiLe2RvO318sWP2+IWujGnRV8J3C8xCDZIfbHJHWT1ZtRnGTBq
 f0NMBSRaK2cUTUmssCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170060
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Tue, 17 Nov 2026 15:09:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20555
Content-Type: text/plain; charset="utf-8"

I was not fast enough to apply the v3 from Denys that made this change,
so I'm now publicly shamed into fixing this myself.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 3b9085ac..97aa97da 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -44,7 +44,7 @@ DEPLOY_DIR_IMAGE:ti-soc = "${TI_COMMON_DEPLOY}/images/${MACHINE}"
 SDK_DEPLOY:ti-soc = "${TI_COMMON_DEPLOY}/sdk"
 PSEUDO_IGNORE_PATHS:append:ti-soc = ",${TI_COMMON_DEPLOY}"
 BB_BASEHASH_IGNORE_VARS:append:ti-soc = " TI_COMMON_DEPLOY"
-SPDX_DEPLOY_SBOM_NAME = "sbom/${PN}-deploy-sbom"
+SPDX_DEPLOY_SBOM_NAME:ti-soc = "sbom/${PN}-deploy-sbom"
 
 MIRRORS += " \
     git://git.ti.com/.* git://github.com/TexasInstruments/BASENAME;protocol=https \
-- 
2.43.0

