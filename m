Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1447.1792700246123633618
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 13:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZapDjssv;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=xX6RRiVn;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69MHsUil3652497;
	Thu, 22 Oct 2026 15:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=H0wc4ewYH+XQleyJx1yJ/AF2VZtzG4oQi8Ft/mBJB
	R4=; b=ZapDjssvmG8P8UZHkpq7tjabQ2loMBivTZy04y9GiCdNYcdTuJySt/cTf
	QlqpS6OaPfjUksTbfYsA7M+WVpS5PaqVEkeYaVAvicgpRYa1i273tWmIe/sfnmII
	+lb4VB7ptCCIrbQRap3FuF4VAKFuDDmAmyEenuDhDTa5et2OYM3KI+GPxF1Y6m2M
	g/IHxbhhTUkuosp9rmK4D/qwunLJ8Tj2bExRpUvXiUaA6SBwO6EwjKcsz02NEFfd
	SBPxULbJid6s72eAniyAecopv0zEgASAo1AoXLpWeJ5GvsKniU0K/fB/r5FoIg6z
	hjdPO85dS4i/vQPuGEDCUDQ8WnJWA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010041.outbound.protection.outlook.com [52.101.201.41])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hfmg822j3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 15:17:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csH3ISPoOpkq3P7Kwi67UOIut88HXizPphVFbncqTp7xjiVUC1nw6WOa48dilzzE1+SYUDpnzp2cUlDmKBmoHa22kKGEgKD+R6iw7ktxgeEhghfxwY+jwa+Vp7ZXOHQANzV5WsjnxLGpxdDbO/S0q6ODUZxxxGcK7towuPYeYlmL5yBmlHZkbP9venYfoyDxpfbK7I+lKdpbEdCdFxGg7CvdORnBZCF3ksrG8SlEQEQcUuWBGl1rtwoSX5ivazU9xYX5X7Zg6s+QSYaCMw+XLxuQUk+sQ+HdN2asbxypZoe6KWJ8Xinnt4gt/H6JuiaAAEtrxk/hzNYSa/rdteAhFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0wc4ewYH+XQleyJx1yJ/AF2VZtzG4oQi8Ft/mBJBR4=;
 b=sdptFAJPp46eCP8PWGuVEmfPcDKZDmTjW+NlWnSTYgaNQg2QXF9c7ghO7jcr7DRXudZ716o4GXv59aReHJ0srFcON48wV0AdP1hLosdiJgXtzJ4d3kLfKSQw61XY5IMqjQyO/vHbyavxzBJSSEIFgdL7HSpzB3qimGOn9xUhvhPKuIWTIso4kysJoGBeMEkyrmJN6IZUELuXBNUt/40XQ29MxmCUD9l9OdG9inzcKwzdyUN/dosluYrrQHRZ7mbJhZ2dc3dHz0K4Yg0jlUOLn6lr1sqJV8NMlabFcovZqdG2CfEMjIDtEfiWMdrii51n2A+KZSCsd6usXxlMTf7W2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0wc4ewYH+XQleyJx1yJ/AF2VZtzG4oQi8Ft/mBJBR4=;
 b=xX6RRiVn2r2dSbMyQL/VfkhN/U5i0wpkyz7yLNVIOgZZTCTPRTW0ZiA0DxSRwivKI4CFF83e/VvhJk6+lkMsrxfSybqQ67hx9uql3VGe2kCkg8atKH5/sapOzdMP7U7PJ03ahSlo9wigVvvgZw8bUcQRxyucpMn6BHQrji1xK6nAFbdiOtsxn/lSgIv9oS+6FPbTqsdq0PRioE/ahNvuHFARne8BV1sZqEWl4sFsSJkpXhIC3Lq+EPxREOjJh1FPVRQePvyS9LcE9iF0BpGSynTbCUa+nUyhqD7uk9cjs2fIArbZsQ0YQRPBxC/ioKa7HZPtHZF75DHgUCvS6WqdeA==
Received: from CH0PR03CA0298.namprd03.prod.outlook.com (2603:10b6:610:e6::33)
 by LV1PR10MB158943.namprd10.prod.outlook.com (2603:10b6:408:50e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:17:21 +0000
Received: from BN2PEPF0000A7FF.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::8e) by CH0PR03CA0298.outlook.office365.com
 (2603:10b6:610:e6::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.18 via Frontend Transport; Thu,
 22 Oct 2026 20:17:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF0000A7FF.mail.protection.outlook.com (10.167.245.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 20:17:20 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 15:17:06 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 15:17:05 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 22 Oct 2026 15:17:05 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69MKH59t3812389;
	Thu, 22 Oct 2026 15:17:05 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 01ADC2C86; Thu, 22 Oct 2026 15:17:04 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>,
        "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master/wrynose][PATCH] layer.conf: remove TI_COMMON_DEPLOY path from task signatures
Date: Thu, 22 Oct 2026 15:17:04 -0500
Message-ID: <20261022201704.2272926-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261022195649.1501987-1-denis@denix.org>
References: <20261022195649.1501987-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A7FF:EE_|LV1PR10MB158943:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a85acc-f0c1-49bc-c81e-08df307979e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|22082099003|10067099003|18002099003|13003099007|261009223027099003|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info: pp2R2GXwucRwa0miQt51gxB4B5E3FnfPLLlN1xA1oRqCgCU5a1eJBjMGVJlq1r+PPrcVPDwIcmaYHBn9El3nz8YfgWXtu1zHEhx3FaF0MAvTJFOh+1PwqKRaIrWWju5KZ5fUTlkWb44o1InZiMXSTF76EA1CFzPoEE2MwjKW4Sn0YQYD/BFZzSrSoaqfBYXFONfMs593buBt7rq2Z3gWekQIBB04+I2HiJSS0/vjwvMc/5eGToYHM+ttj1NvuGfLvcE8S+OUC2TNJfj+ZC7Ut4sW3EGi2m9QAkETweIoNxIe5UOzCMeYDCZRzSGeInMAbioZnDq7Pko52RoCzhVZ7ZPYavmtKQZNpDpshhTtcX7lUKlmXNNWDmrluMLFRTHiKfnuosOECm+DO6sF4YFKNS1rE1BWUATvSe7qCBFwzSqze3PL1kw7F48OXiSeINQtl/op+d3nhgZ4Xk0pszywBwggn/mM6WpC8TPQuX5Y73XaGsE3EyIxHYlDf+N21gbfF0lq2Mi5CQfe9L6meszIYbV1+V/UwnbCYCxJMFys2Bn4LJflOKEaKsMRbKO1A+h5aIZyFZYHVzP+4aagCLqOX+HlYwoc+OErsfnubbRTWvzcc3UjMn4+WAvgPCK+jPria7PifIlVOu2Qcrrw9ldk5w==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(22082099003)(10067099003)(18002099003)(13003099007)(261009223027099003)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UrFf0EXyhh4/NAx+IgzdTpQGj6zbRrq/+ShigMZIRHbD33qwUE/ep5NY/aGWFwDeGUhVZ5lrzpA85bj+Ww+hDQ8ArGS+VStOLwBi/V9ZQeqbbu84Pl11mAm2NdzjRPKj77zLkQDPxzTQbJPFYV+lXvs4lZ1eC+WJH3AtIKMjeGH35eIweezNrLGV5ju3TcHJ9NhkzwyIESE6WpTxI1lIYbG/+eh8H9tk/GA/744mH+TGuZZZqxRccMOTKd8Q1XXftqrfQIfWlaZX923q+RzJBl+A/owhAJDSampAsEJwfNPCwyQSnspPws/QPLqReUwO18Qp6hjpu7dNMPEym+jAsnc/DLZzVTC3ZZTqLNMLoLmuepv/nJGpcJ+mYSZdBqqiDR16SmDSlVh6xN73rigZ7gdf8Gk8K08wGS2Sx7kXdbFZc1MGOIrdZOKYLI3dnJxd
X-Exchange-RoutingPolicyChecked: tMJTZo7KdJ0RDYYlxgIc6pxFAbhrwe5bHY/oPfkkJDuBzGcCVmGRDLr4/wZm44WQ4xtz8fesdvagNphk1Fh//QKyyIpCIZN03gAn7BtjU0W2g9FzCzBR+KqYGUJVURgDtFD4oyQsrJBjTpB61NJ9wXcDgoNBmyfFvI88blfxQzVtFLbjbhPueuLYmK5Wlbiovd9TJJIkNik+SP/Ja0J/YyHkmpIp8Zcc3zR75VENuHj55gaHlemxoN6JP2IlrtDQfgLru++sTWmbm8uNR7HFuUHPq54tQ7oVHcxZyABP9dNOm6YfUJTsJdATS9Q1CnWTm3LG+YMcoyhRFYyjB4qK0Q==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:17:20.3197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a85acc-f0c1-49bc-c81e-08df307979e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A7FF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR10MB158943
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4MCBTYWx0ZWRfX2LYA8Pb+tqXN
 JfB4Lfsp0/+ynDoOQeZWK5zQTGfWpPiqJlvf1CmlTG7lklqiQHQo8w2UD7HCMzIFRe7YRRg++4J
 GpSFJ10fZnTDfquFaupaTPMkHXVz4oQ=
X-Proofpoint-ORIG-GUID: N4hjf13wNgjW9cL-NYI55b9JUEPBgbu7
X-Proofpoint-GUID: N4hjf13wNgjW9cL-NYI55b9JUEPBgbu7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4MCBTYWx0ZWRfX/xKQIFz7qQOC
 sHM8jO7zwiK2v1/FWoMt45mt6b3X07cnxDETuTzEXUcroWJX7gzCb6fKgg3vGUDjrSUSNnY902O
 ujRVavF2W4AF+39jm1iuRJw0HWwenbhoyd1muC/oQRMgU5uynYfrYOs0BVMRK8SPNdB+HWmm3re
 ++hqq6Fh8gvlDJMP5B53hoKllRMbrpWzaK+wEqYHuzHRxPoS3ZgDiYuB4Z2NWJ3x3Ux3PdfQaMR
 2zghy40ofKVr4KeR3GNl3xs9veFarXRJrkhnksOLcS8tRfcrObKPKWp5Dhnyo4lIFt7q7gaOs0n
 s6OrjqDkw0Ka+K54oEipLL4UxWQoVeibPyV3+2oIytbffN1amUJJmNE8mS8xbTd1CwDd9dVnHBb
 zAOnXG7m52GsrSgZv+9aMc1sgZO/w/r5cD2G5qcsZyWnLtoIvfKaH0iSqNRQAtEPCOeveb/yX1z
 Sd5YkXv9Kule+z+mimg==
X-Authority-Analysis: v=2.4 cv=H/1OUOYi c=1 sm=1 tr=0 ts=6ada6f53 cx=c_pps
 a=xSIn1YjG+VojQN1dL9/zMw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=0gcC27t9AAAA:8 a=k-42gJp3AAAA:8
 a=sozttTNsAAAA:8 a=zlJusiLjK_legP_HGe8A:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=f5sM90hAhNS9OGT-JDKn:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220080
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 22 Oct 2026 20:17:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20488
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261022195649.1501987-1-denis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/wrynose][PATCH] layer.conf: remove TI_COMMON_DEPLOY path from task signatures
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] layer.conf: remove TI_COMMON_DEPLOY path from task signatures
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Thu, 22 Oct 2026 15:56:49 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fa476fb62d9eedcf297f3a0b4bddd29426ef20bd

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: 96705c6687b2e7ffa3976e03658489d5d56e2629

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] layer.conf: remove TI_COMMON_DEPLOY path from task signatures
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Thu, 22 Oct 2026 15:56:49 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fa476fb62d9eedcf297f3a0b4bddd29426ef20bd

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: Add dm-verity exceptions
- Commit SHA: efcfe2e574b2848f0de4b3b57db4b3a340b2b6a6

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed

wrynose - PASS
=====================
All checks passed



