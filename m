Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31124C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 17:36:03 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14358.1783532154051166082
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 10:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=k3EdqKk+;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=qOR502zC;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 668GHGYa2792033;
	Wed, 8 Jul 2026 12:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=FN8QhGERrykYQkoOsMV2NLRLxPs7MS/74ypjHfRX2
	Tw=; b=k3EdqKk+vcRhzG2Uv1UT/OBu4j+8EuikBSk4YgizKAzK0Qp3bzTSUwVUY
	C4e3BPn+CkzBSx+pmUpLqSeKcdbk5HUxZlu7EgZkUqs6JZsD3ewHCY73WTOzvaZW
	sEFhaJ5FuXmopYyFneaycLGe54WzP11C5kAXgo91W07uWMz5rLUsljuZinSK/jC9
	V0O9qdYx7hfvIUQxP8/OGbQl+hWpmeROgmEq4Jm2P/fl0PMJEJ+tbdMNUZwZ/+oz
	8coG0PuzpUVq2lijc5dNvlwN5JJx5s40hXdEdoZAeFWbao6ppBy0NnMTanMWZGQa
	Xs2qnT31+/ycvAQdwILsEUQbZNBCQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f9ng32k4w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 12:35:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkB1H81GYRABFH/n4xaIPJnBVClcG4JGrS1KRy65dXiIAMe4CptOPMrBRxmPc78xkUAqanHHL+2cZBsL7OXb4FHRIhFl9YQV7RtCsuYyiM0caojo71jHb0Lfw+ZTu71hN7trpxC8lE+f+ECFk/3VFrgUtVk8gy7N7bE5QcZEzqK909KKlG/v4LpFU7E++iNujQuUzWhJnuBxN4TamcJLdwxjapmIbcVzn9dOA2GsQvHSomB2c4GWuJtbwqbFddyByXjJZ+d4IVjfhsAE6J9hpGCBIBT9cA62Ptom2xm6HBdM84kCLaJ4vTQLOR0rWPeP1eDwxTTxOFDglfsYzjEr/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FN8QhGERrykYQkoOsMV2NLRLxPs7MS/74ypjHfRX2Tw=;
 b=FiQDZJPchddN+as9amsCofi7Z8t8NJU8e0AzLBqzXvhrGhs+YWn5GVKXdgY/TaTbk5T0XqRMYSVIEg7MUavC967YVujTt+M9Dy3LpNm4k3eaoRSBTYkD0/F83/YQPekjB+4Tf/fZhFu6GLMe/Olg7b8O2EAjwx036vglqGLaqy48gODIqg7TRpSq+bcnOwt/KCuotutDuDl1AtaLTBXVZkUxAIGvXImrTkM9yu3vVRR3ZXpharbVhw7IlT9PI7IRiTrIrMVVk73ZzuFuKIb4cY4lv2axGSxtVuADmOZuZ7ELMCpKNnxu6EukrZCztGSxIjasWNfT0iza0T2pNl67sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FN8QhGERrykYQkoOsMV2NLRLxPs7MS/74ypjHfRX2Tw=;
 b=qOR502zCY3Tt2UBBpIYc63fPpgDVpnLoshfU5K2+XEcpFaV5LPQ9xGjVDx+fh8yB1sS3usKW07bARGhDmstLmHWuVEZEcgPlhkSGZ7jN9UpWjeP6sJY3ewk737/+9XLY+AdvWRU5z0orDhR6J/VHoU9JjOO0uCamvO/ibXuRxs7OsqSpR8oX3mqcQ+dPnN6Z+eV9Us2VeWwypvmGsOyAXUs4BglSoLXOGO2lzPh5SAz9knYTPD67AUEHmFlX9AuAGuSnuk4D3+P0muW5Jv1Q+6Fu1P5tpXF5bqdf0Z+PCxlpkxV9HbCLnuemqztKUcQKNns62FX+k3xniD36prQqNA==
Received: from DS1P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:44c::14) by
 CY8PR10MB6540.namprd10.prod.outlook.com (2603:10b6:930:58::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Wed, 8 Jul 2026 17:35:46 +0000
Received: from DS2PEPF000061C7.namprd02.prod.outlook.com
 (2603:10b6:8:44c:cafe::7c) by DS1P220CA0027.outlook.office365.com
 (2603:10b6:8:44c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 17:35:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF000061C7.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 17:35:46 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 12:35:46 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 12:35:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 12:35:45 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668HZj5d3360856;
	Wed, 8 Jul 2026 12:35:45 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D53659ACF4; Wed,  8 Jul 2026 12:35:45 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] firmware: Update license path
Date: Wed, 8 Jul 2026 12:35:45 -0500
Message-ID: <20260708173545.3864826-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260708173235.1390439-1-reatmon@ti.com>
References: <20260708173235.1390439-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C7:EE_|CY8PR10MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f46c1b-4486-4dd2-2db2-08dedd175810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|18002099003|56012099006|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	TnwJgu8CLKhyi5bHLm5vHrQgcOi/x1EFrl6NJIo14mGf1Beh57AkOfTRvjNptboHShTdIcUfhHz6VWX/A4F7i2hIm1U6kUuRPYlDRUmmXo8oMN5p6ph/FX6eag00Y91eIFPdcdU3bmDte/CT4YgDXn+7MuljE8IT2pzZHh9Ebj/BOrBgGFeIzjGporL5RtcQgrq3tYkqoNkAo9TEzfqGJly3wEBSk2FK00tL9Zlev0ZvowmYA5Bw6V1+ow1gN3Vq8kgynYUg41zjyH16O1jgwb1nH2UIri8K/AC/DQT5We4iVnWA6XKgO7UvwF2Cyos1xL+oK+wRHN6UxFMiEUnNdUGHtLgEaQc15CVJV6gJxNaR0WXP3Ki/H+UJGqRFcscVGaG5zCGKoRrIsg+cryCPMQTcl6eCOamv+NgA/RrFLcADbj6aWApFvF6iTDnexzEaLWFWTAHB+qIqluvAuh5+g4XZkknqwQNgFJ2vgsm/RZo7PZZN5x66mrZiPOMHtfOhsnp3Or2+OfyWoaLK6uTJjoeq+Yd3XaW19Tyk1yGBL+9/AwiMbVO0oiP23+gLX0qMQmloftH+6oFD74ZsTo5KrVg4d+vduZHzFpAClbb8yh2jch9ugRtRv6+03A+pIt8rC5z8EF88G3cZv/WHXFnrm1Czkk2t7q2gOTfnIN9VOOIDLPhWAtSE7H0NmOqq0XrecOPHiIWCmnCHFWDsge5Nlw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(18002099003)(56012099006)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CgLzH/Q2iXzEOCLNaL40uJk3SvtVxKc13A1iz2mW9t1ALssylfa5TR6fH5o7/xMWJw55z+JOYYilwM18ItS7obhhRxRwRaAFzkeXS4Zhfbai+WO7MGZeDhc/6nkSbpjOJKcmqP8KXfQKZUCHKpUYXtcmSYZfir25R7b/H6PNXalgx91wILZODfuiLHNoCIPwLBw4ue6G1tMO5HIvpsZHFio2E89C8menvu0r7RX6aJHSGGCGMkNgjTzOndSwsA86m54TH7xFOeflOIvKLq6iE29TP3HmJv+bBjyqkq0ZyxJDU8X8CcMZWvM4rUDflfnfsLtgOfUirhyRnYcdpou23aR3TF0EIIV0NVVb8cVtaUn1xax61mAQHSWG1ewJCw8OkKEzjtvgczNPPtMiUS0oz/JVTGNkj7CR2SbLqwv2RECKnTi5yNGVOn3SyvP5qzKs
X-Exchange-RoutingPolicyChecked: 
	e+T5WhGoHpv5J1wzvMAsWN9R2VSSflVbPFGi9HC3xUg3bNEksMwFofVIi9W6BHz+L2WsgtOIIEqUjbfKE1Tw+o5lNJgK7d9tpalx52JzLymYl8tyiGUljZ1BDopH/JHVGtX9B2lRJC5QbJSe9vkprVeBIefxD8+2DMiP/iPpIuVYJwpm8i5YpfSP/onD2rtpHvi7dwlsW/xIT23c6XdZ+Ge2nnCu6ThsytXDNefgVEuOZEzE3FWXDFnz0Bv/xV/HZrdgfFjir6W0YPYh/38ZZIKKuAUzkmoDl4n+vqGXV/qV9C+N3EPgnPYdCGm1JnCTZabVCrwdXif8iCA+wwBfkg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 17:35:46.3690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f46c1b-4486-4dd2-2db2-08dedd175810
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6540
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfX9GH9BqF8erI4
 zo2x8FtbVeUpwvGTfH0UxIXFS+uKljNbcuhp0I6wlP2oTjkgdEBu95e0voWJZcrVBZIE4G5R6ZU
 k8JtFP6ibpTNkwcgLTCbhW/ewYKI7lcZPB4EdgD7mS+18zYFu1SSfOT9N0MSpPcR7oz0vRoX3rk
 Bj3D1wqpQhT6pUbAW6gah7N0mpBEIOTuF9vOuUsTykUY4RpoOO662JMRd6foS/kdb9wc79dO0KT
 pfwb7LAr7TfoTEtEF7cWpIg5W+wy8XrnmqjzX1GUbGlnZvJmRb5YWA2XwEsV1Cz7mrZQi71k/1t
 a1Ru4tIT25urVPf6WHBrwBMrtG/JvdruAJPQiik7LjBH6j/1C2MMyeQMiZR/KpU8YUUqo0SrRgQ
 qCIvSaRM5VPrXBnVAOwIvOJgyI1XC4Hf0pFUE0dX2RC96PaoJc7g8qC0bTkrDfSnbh4NTGWJfAB
 C8UVX/6TeZWpx/38Ryw==
X-Proofpoint-GUID: YFR4mXhDjMBEGHLg2hX4gX15DXN0jAGD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE3MiBTYWx0ZWRfX4xpxU+FENVyN
 r6cAY44HRKROoyUhO58LZdyU0Ty4FsEB5QFPuoy8MJk7hReNpbhDVTm9+svCnL9Kdx6Li/PMjEH
 LTVOZZaEiv9sIMuGZ4OKPKmvkkKdu58=
X-Authority-Analysis: v=2.4 cv=OfaoyBTY c=1 sm=1 tr=0 ts=6a4e8a78 cx=c_pps
 a=miuBlqXM8bFb40OTON37XA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=0s_NB8mUqfqaNBXqQegA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: YFR4mXhDjMBEGHLg2hX4gX15DXN0jAGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080172
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 17:36:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20131

meta-ti / na / 20260708173235.1390439-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master/wrynose][PATCH] firmware: Update license path
    WARN: Commit message does not include file/recipe name: firmware: Update license path. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] firmware: Update license path
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 8 Jul 2026 12:32:35 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 88f7d6082c506e9a70476dbaaf70a8fda1e61aa2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: firmware: Update license path
- Commit SHA: 34f7f5a57a7687968eb4369f5da5562bdeaef379

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] firmware: Update license path
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 8 Jul 2026 12:32:35 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 88f7d6082c506e9a70476dbaaf70a8fda1e61aa2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202607081115
- Commit SHA: d3cc22fcccef9fc4d1af0e122817e16184443b71

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
PASS

wrynose
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




