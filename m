Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12627.1794899849357878760
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Nov 2026 23:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=GK2i8BIB;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=rXLGutme;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2b3D33290809;
	Tue, 17 Nov 2026 01:17:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=fZ3A0zypcLCBV
	X9lEVLEKixHpuh8hjrOifp21g4Yscg=; b=GK2i8BIBXI218CoH4fqshVy/YWzrY
	kLVvyEcVqBQK5K9y6tEoVKnsytfrOthOwPJT3IKTMDahCTnB8PAjgKYdQMPrU0yf
	dptgOWVaJCLOlqog6Q0hNxLEBo8UwQYpSdWlYxC1YGPpd27pTci/k0YLs+UzWS/E
	o793qyzuLmWjSYBviFaxyQETRSCR//dNkzoAgJqS7quUTe4vkzroX2ABPc6AWciT
	Zq2sTBW1a34ILOaq3sGhyLL7bEoetKBlFq6Qbn31SnHVLyj0KJRPaSxVIJRj1CbK
	/WG7w/W3uzrWW/Ajalda6wPdp3w34mEJGCl9qVjymwl39diVyjOQTW/ng==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013058.outbound.protection.outlook.com [40.107.201.58])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j0cbmhssf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 01:17:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJoig/pOdUbsTGl1SrR5jlBEvSMkqL/WO+ro7zd0zuKmyh6zXqXY6AEbsgv3XsRVGh3UZBwSMBy8SvLJwRKMmCSHYxhMQDpOS/F7a3VjgJid/RfAlz9Iauvt5YYUJRrTd3bLf0s28y5cavnX0gHWZawVzhTbIcuVowLpio+5shwZ+D3zgbgt05zyIx1rVBfGvlcBALuaDlkAGlVo63pS8FQgDUUn6cv2jdkkgok3ftJoRbw6wod9eElLgxKcN3XA0Citc0AU8waUHFupEswyUztAIEmQxeJGwqd6pvjVLlhs83F8mm1XhdC+k0h8se/tGMYgXdD2v/s3PspWdzxKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ3A0zypcLCBVX9lEVLEKixHpuh8hjrOifp21g4Yscg=;
 b=yIVMrWmdrWLCaA3s/FDSm14HNc5l9VN9HUK90HcusnYEMps7uoP4jRS0eEDZf+Fm2z8P/bOujCu9r6MkqfwImLLFgFx+K/g4GuXk7KSJktbeogaKjv+flOGtRDCYZdmQdzn177yK8VeaVa1gxgVqnlDMiOwsWmkaasevuivCpItTyox/oCEXIcUu7+ZYBvdJu32b3qtQISPuIz389ZqEoAjsTK8OyqkRwRrKHyofk/P5iwnCZwMYoh0DmN3YfqfUlUiSvUhYlpbRMB/EzLpCL3pSdeNueMtyvwknEZdT1wh1ET5dslajN1fiPhtQgaA7HLvCDroowfWCLsuuTbA9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZ3A0zypcLCBVX9lEVLEKixHpuh8hjrOifp21g4Yscg=;
 b=rXLGutme8IUie/qyGRYiLXiVDJ0B21QVIpZlu3x32V2ZFRp93zlqM2Y6as1X8Ln6WD6QfxJR1/HDvClybOGnEYf97ZGO9ruryFYBsg7d0Pqil4j7UPoOxwvgbbMm9K2nQR+QhEFlDvmFQXiofGJdHGCbeaAgWYrh3P35xWdLEAGo/IRXvTjvtWNZ9dfxPClJ3ychFEPQhj49DEZZIQHmGve1B6MEJ+e4slZ6aui47IjGLDL8fVcPSEw/vrnakRqboJbIr9LiBukX2J3xS+Q5a03OT2X4B3fRz7tbFNBfx8B1MdAG4cekcfnJWHe6z60CYIYB9NpujiWcUVo/FecK8g==
Received: from PH0PR07CA0026.namprd07.prod.outlook.com (2603:10b6:510:5::31)
 by IA4PR10MB8399.namprd10.prod.outlook.com (2603:10b6:208:56b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Tue, 17 Nov
 2026 07:17:23 +0000
Received: from PH4PEPF0000B60B.namprd21.prod.outlook.com
 (2603:10b6:510:5:cafe::51) by PH0PR07CA0026.outlook.office365.com
 (2603:10b6:510:5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:17:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 PH4PEPF0000B60B.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.0 via Frontend Transport; Tue, 17 Nov 2026 07:17:21 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 01:16:37 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 01:16:37 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 17 Nov 2026 01:16:37 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AH7Ga5o3417667;
	Tue, 17 Nov 2026 01:16:36 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 521BE2A6C; Tue, 17 Nov 2026 01:16:36 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202611162200
Date: Tue, 17 Nov 2026 01:16:36 -0600
Message-ID: <20261117071636.1042902-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60B:EE_|IA4PR10MB8399:EE_
X-MS-Office365-Filtering-Correlation-Id: b18085a6-880d-40c8-e3be-08df447ad21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|260925021311599003|260925022911599003|260925021911599003|56012099006|261021121427099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261102123227099003|261021123027099003|261009223027099003|261009221227099003|261026121527099003|10067099003|3023799007|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: R5raccaatFnLKFhtCg4l2KKyaSFpp0yunLO9O4eY0uOVGUG+WAaKSPen4l+l1CY8eDIwut2NhofAh8Dn1JCDpoiHRij6sTkpIHQ7e7L5khavW0Fe7UfFgqOtu6rlvUcBhRdeS7z+7NUq+kB8VUsdKbD/5v0xTODXA1DcyPB9HWKrgys6wxx91CxCzJBmztJRrtaqqS7Vo7PX/lC3Tgws8UiNXWfErfyfDptyL8q4qgSap8EB3eu9K6/aohP5taa3pvxObc0P7I68xXchZYJmV3AkABDa9BO2NaMPI7dfkq4zUmSbv5M5+HPi9h8A8IukJwv9AUut6qoQSTQWKODBhTJWgslZfmkJVlcJoEfYK2pZdIkduLCIl9EG/93Yg+TNaICVZ5EviIdbD8oPERvpM+b95v1hEpp2N+9aw736O5SkV94mQsW0El9QIIso82TbxHFVKOvnSBiEoQNNzJED+u9u31GG+5gO620LN2cw/s0geR1ax1cctux5Vbd7aBzr3f1OeflmktIwOlhxkzvTxHfAo2Nig0mIyubke4SoDpsZleevjL/hWfDHY3XhzynFKdirrhJJ1Zp4uMiCQA6L+cnCEFyxB+uX9LLqCGzxrRExZooV45tuOyjKfk2Ewrv/aWSSlcbynfVxGAZTWiQzlxnG9FC9hZtDj4N6aVkwXON11wZwyahaHZkN6ZOHBzz3F3dxrJF36oL4msdjAYIcqg==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(261021121427099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261102123227099003)(261021123027099003)(261009223027099003)(261009221227099003)(261026121527099003)(10067099003)(3023799007)(6133799003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: inucIoXFCNtdONx54oOdIwSU7/LLeV2hWHODrBnv/vIX2aL4mSYy1krulKr/K271ahj6LQWSvEQoiN5NGQWaHd36wODi6o7Fvj3MkUTRsn/zOKheyH8Z16Q5Re0bJ1jGQY+w0gVjV++RBrJKTmbruOFhxg8fslLNet0kVpIFMdw37BKWuZU8CvzIO5UgsVGkf0XKg07UHFUnMTW9cC3vOHsDnB1MLZDpFP4m0BeoYzhQ0IEltOWeIXbDNHVXCoJTisYzdDm12gyhtXMxpukAW4Bxzq7djPVKdCGJqEHaepe1TUZKEpE7NoihbDWCzEdRKShuKpQzZ3szgLymJ3k92D9gAKhVFW9Gb+BWprBx7ALirKPNbhoKtexsoW0PaUHhjjAaAHWBjzLPhjn6/YQrE+2NruW12d23douiR2bnlxX9d2cuPPZhyeHbbgbvNQ4h
X-Exchange-RoutingPolicyChecked: F9z33aphaZAgzoyrlT1Xivjg2BNgHGjn40SaCte6zoafOJXsI+w/Z/6efQdpWFNIxmKM1yl+MORpzLyTvv5UHAdnYkQCqqi/tmR/+BedMsR8rTuvj7FSZD0BpFvAW9TV0EW47fqMOpqfTu3891fH3BPy3v/zQQA3kn9ohDaE8VK62cjHc1r83cK8tURABv5eos48wSthGN0gGwfJd4CakfbGBUNv6ADc902UntCfqW/7y4e3Dlcf/SqpO7drTGbbCKSdLXim9DThW2TDg0DRhf7US5KPBByGG2vFAg99UvGRhC99TIQc+XkQAzbACEYcd27xF+l7M6HheLLXEItozQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:17:21.0524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b18085a6-880d-40c8-e3be-08df447ad21b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: PH4PEPF0000B60B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8399
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOCBTYWx0ZWRfX1uk/0+TLbvMT
 lgarLtJ7kBsh9ox74AsT0Yai6nId650Ab9p8H8JZY1PL8o9iGwHA8aPTismWDvK6V6D6ck4hm8l
 Vec8GxdC4ljYBNHL0gR8OJW3h3CFELQ=
X-Proofpoint-ORIG-GUID: -IuqimFYRcdEjQHHQ223t4EPqM-ZCDab
X-Proofpoint-GUID: -IuqimFYRcdEjQHHQ223t4EPqM-ZCDab
X-Authority-Analysis: v=2.4 cv=aZz0Dhot c=1 sm=1 tr=0 ts=6afbff87 cx=c_pps
 a=kezO0BecKy1es1U8+DqiPQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=b45o4kL6AAAA:8 a=NEAV23lmAAAA:8
 a=NNU_p5EPWdBFXTKTBFsA:9 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOCBTYWx0ZWRfX3NR2hLAxs7vf
 2jsbDyE71aubixnMy9wJZJ9N4w/jSQpVu3DojvufxC+RceHMP6uHKNpGoOhUge+FtQpYQQ5F6v9
 P31Z9f2tqIn+vGYokwpf+ccgRxK6XcwB6a0mPqk5a/nY7YXFitpuvD+KUmd6f1L3y4sgk3Aau8V
 6eqWwFFVUrOHO6TmLERmnaYNa9L7nx/vpgObF2HxQyk1UBzTEVYY0QTVLTXhZab6n/O2ou3YZjg
 Qa/WNUiVcN/cvBA8MoawoJmKVjnZExMbS5kUHK6NKYYJeU9SazsLIrAebio2Vo9gV59xAbunsEe
 4WbLoDTv9b+kSW2/e9wG601QmmnXtSzNWyBvU5/SNJxErw/5my+1yaMNYxhuVBssea+EEyxU9zk
 C0+GcDrrcCnsBy008wvPlB1vJsYEtQ7blhiVfhPUyqDAjConE7dQdb3V4hQfiqWq3hey3DnaRnI
 OlMRaSIGlyFdfcvqlvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170028
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Tue, 17 Nov 2026 07:17:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20552
Content-Type: text/plain; charset="utf-8"

Updated the value(s) for:
  ti-linux-fw: PRUETH_FW_AM65X_SR2_VERSION,TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging-rt_6.18: PV_ARM32,SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: PV,SRCREV
  ltp-ddt: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=1028826ea156cc6c1e9d231ec9ed871d53b91f6d..9ad14a1a97699561e45da56e1ec4e59476ca94b6
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=a0c21f799732ae350ebc31da24297d12f3e945f4..3bb6367dd98310c1651974402f23ad03fb408ab4
  linux-ti-staging-rt_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=76a19a503a6ccd2e9f9b2ebab0b3b359351c23e6..e548aa37d51312e4dd4f383eb99820e6e0e64d22
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=5c0e395a2f28422a330b6db6341460879fc78454..14023e509923ad141453ba75bbe081aa9a7b8915
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=97becb13b81c314c1d17fcf2226aac9a32086f3d..fe51a7637cfb7c37e90778949da9338daac552f7
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=9ba35283d2ce7c97e633d16abb4edc06bae02319..eabafcdfc283007d86b1dba7f22c5e13b02a98a3

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 6 +++---
 .../trusted-firmware-a/trusted-firmware-a-ti.inc            | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb | 2 +-
 .../recipes-kernel/linux/linux-ti-staging-rt_6.18.bb        | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb   | 4 ++--
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb   | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index b09ec7e2..474a5569 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -9,20 +9,20 @@ INC_PR = "r4"
 # Firmware versions
 CORESDK_RTOS_VERSION = "08.02.00.04"
 PRUETH_FW_AM65X_VERSION = "08.00.00.20"
-PRUETH_FW_AM65X_SR2_VERSION = "02.02.16.00"
+PRUETH_FW_AM65X_SR2_VERSION = "02.02.16.02"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.02.07"
-TI_SYSFW_VERSION = "12.02.00"
+TI_SYSFW_VERSION = "12.02.02"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 IPUMM_FW_VERSION = "3.00.15.00"
 
-TI_LINUX_FW_SRCREV ?= "1028826ea156cc6c1e9d231ec9ed871d53b91f6d"
+TI_LINUX_FW_SRCREV ?= "9ad14a1a97699561e45da56e1ec4e59476ca94b6"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 3d6baec1..0bc9d717 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa:am62lxx = "756dd70d3ef34d7a308370d941c9ff126cb6af30"
+SRCREV_tfa:am62lxx = "4606f78ef878a640e9b7fd412a2afb0837057972"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-tfa-2.14.y"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 58c1ffc5..7f56e515 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,7 +4,7 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "a0c21f799732ae350ebc31da24297d12f3e945f4"
+SRCREV_uboot = "3bb6367dd98310c1651974402f23ad03fb408ab4"
 
 # u-boot/lib/rsa/rsa-sign.c uses the OpenSSL engine API, but this has been
 # removed from OpenSSL 4.  Upstream u-boot has been fixed but we can enable
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index cbd0f834..a2613d9c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -10,8 +10,8 @@ BRANCH_ARM64 = "ti-linux-6.18.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.18.y-arm32"
-SRCREV_ARM32 = "76a19a503a6ccd2e9f9b2ebab0b3b359351c23e6"
-PV_ARM32 = "6.18.57+git"
+SRCREV_ARM32 = "e548aa37d51312e4dd4f383eb99820e6e0e64d22"
+PV_ARM32 = "6.18.63+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
 BRANCH:ti43x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 9eb82385..5e6f5438 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "5c0e395a2f28422a330b6db6341460879fc78454"
+SRCREV ?= "14023e509923ad141453ba75bbe081aa9a7b8915"
 PV = "6.12.57+git"
 
 SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 10c8e76f..2331234d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -25,8 +25,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "97becb13b81c314c1d17fcf2226aac9a32086f3d"
-PV = "6.18.57+git"
+SRCREV ?= "fe51a7637cfb7c37e90778949da9338daac552f7"
+PV = "6.18.63+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 3a379a86..14737586 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "9ba35283d2ce7c97e633d16abb4edc06bae02319"
+SRCREV = "eabafcdfc283007d86b1dba7f22c5e13b02a98a3"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5

