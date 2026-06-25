Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEFCCDE00B
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 21:50:55 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22658.1782424247252681310
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 14:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=SyOuia+2;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ITCX7Mhr;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PHiRjV3869935;
	Thu, 25 Jun 2026 16:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=nhQVQRqQcyrNZ51sPApI6F8UcBmlCf/mLDgiepR7o
	eA=; b=SyOuia+2KuszGhIwTSQsCmITOjbqHXuuruE73TOrYi23/IRcLKYaBW2VY
	tJf609Ytf7hm6EM/1brhtxYVLG+T0wMrk0k6NNM1c3ip2Q9C3mxuTaHz1OEpg6BF
	h3tUf5U1Ie+95AdQQC6Qx3Ia/j3u5RogBx5RddrzIYVuo8rbXk9L55FT5nLKFogN
	V2eyUwZaaU/p06gWt6DUttNpF/bumCeOpfjuTBX5miAFtmwEHJNMNmDO5jZ3acoZ
	T7Idn9M/HWORsBYLyWsJUxC15WCNvCtdulOg3wNbXj4XtSf0c8VbbCSEOP7flq5H
	LdUk804Gk41B3XiKyCuFxH2dZQtsg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010023.outbound.protection.outlook.com [52.101.193.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f12jcm2gv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 16:50:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvD9MXb6VxvlVdmGSz8ffo6kg+6O2fGFXB9NdKEG/o2y+xgWEDSk/Rzdt5vxo8wZTbjaZoLzV/H6A0t8O2jSJiuJYv41dJEhdXEUAYIr8fBiOfSiJj0Xvs82u3gstWjOJ2sSek+urwePkBcd+xm2dg0B3kicPjg/UEWD0yEvNuzLjRs6Hgf8+HYCL8rMFBTw5SH7KFHkOpJzPjVrj/grYQvzBg3ToLpLZqI7tePE+WY/wGsS5hy4a0x8OP+C4EsrGxIqNfGSNPQm2t9zr9XpsHSWsBSTHf0g6VZpGcYsWqg6Q599NPxnb0QxIrzFdbn3jhYSeEz9BSPfDPYeSRZLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhQVQRqQcyrNZ51sPApI6F8UcBmlCf/mLDgiepR7oeA=;
 b=N+7+MsJjSx2UEmNfRVo1gjwwZcTe6u8May9Kj/rrCZaDe3d0mGLykXcxnqzVcpYlbgBa4Q6q7ZJiiSpkat6++L2elT2/s2ys/ikCZfhlqxEO2Qn7u0Yav8SyJhJpiRyBFVWFYEpmtV7wwI0sJOyD8xq2DGJvKcJkXdjuLb57tRLOSdNGBX3+05BLcDVLrDFi4Py/zc+xoneGZ2Vju0K5eDay25HxzAZymeAtSVI4ebaPjG67MQPDrcKGwQoDMmEtZ89HYoWFkgM4+RzzEZ26wtRC9W+xPxlOFr/qlSwaCfTUCv5aGn0mMCVm3sbRhG9Aw5bQKLRZZ467aowVm/ICUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhQVQRqQcyrNZ51sPApI6F8UcBmlCf/mLDgiepR7oeA=;
 b=ITCX7MhrsfVw3BpjzJpCAL15leDXQGYRLmoJXQeiGKC+A1CWSrJAUXr/FrxqywjWS6wt+YfdVGJq4VvOUQ3ueNJEkzUSY60r5kIn/zYrRnygt4yzql7ztBG9/L9XJwmzeNbnZV1R2H27oqfvKAdY8Gp3rT7OScWpS0xw4xXyyNl9N5asSBRjtsTbrxj9imrPX9PZiiaEy5rteYqjbfRpDJcWjtleqdhQJyxaXBQq6HkIOGLbG5zuXN3Jd+4QxcyAtzz4+1bJzef2WXzFb6FZcJcKGDEQXjw9zAhS0cwuXiKGvEoXFkkK98muunU9HBUZGMDrmscwS5apL6DE40FrDQ==
Received: from BL1PR13CA0006.namprd13.prod.outlook.com (2603:10b6:208:256::11)
 by PH7PR10MB6676.namprd10.prod.outlook.com (2603:10b6:510:20e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 21:50:42 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::81) by BL1PR13CA0006.outlook.office365.com
 (2603:10b6:208:256::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6 via Frontend Transport; Thu, 25
 Jun 2026 21:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 21:50:42 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 16:50:41 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 16:50:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 16:50:41 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PLofsw034733;
	Thu, 25 Jun 2026 16:50:41 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 5CE569ACF4; Thu, 25 Jun 2026 16:50:41 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202606241800
Date: Thu, 25 Jun 2026 16:50:41 -0500
Message-ID: <20260625215041.875669-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260625190334.3816457-1-lcpdbld@list.ti.com>
References: <20260625190334.3816457-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|PH7PR10MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dfc8898-554f-4176-8365-08ded303cdaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	k5MgxJ7knb79mbtiNfFoGdiXEVdjOKHzn7p66DaeOFdyhbC5FK5AnXUT7RfgQKksd2to1A+wuEhMRBTcwBd4QKpMBBt+9SO9PySCGpWcI2wUIdSp+l1lgmRMoxnNpspNybOUx30SUsLrCnQl6VlQJYkP/hEXQubw4RaMEzMtnSfzFJOQ1bhA1+67671EJlCCJ2oRUlrThZCFDdPJZZYGb661uSxUiU4l54lboXMwDOFKiRMvV6W/W5Io51FLhzZqlmsbDx4vreRuV5XDv7oSetkpSIJJrcaFOG1Cu7N7Zpk4/Emxi9eTZIXRvlxBA6avmn5NghanzmGH2oWbbqa/eeSV39xI4jg+gp2O9UgGh1fCmIjEVYRI1K1dE8V5lxJEQoAlahmcbJ0YtC9Oq3OXaUOY1mY1YIyvc24EcnTtGzw0q1/2ufe9Q9Vx90vl91zWGiY4WifaBXM7YbhxIhH5l5XMwAruf9QbRp4XPB9MOBl0xifN/ikQeYFV2sgc8Babl7pPhmqucm5N2n3rWzegygBzyKHTt/WvpmV623RfW8Q+BJW1zXWFErd+P82+oitsxFwK+hzf0QzU3NMFpbflkLTM3A7LSy26c7hciEL99yIOcTKbpFZhNrnO8MGfK3jNiuMhkA3HcaJo0gXp0diqerc+YHITSppsmZ+nzQ7pTDQBNQvrAR1nNTr7sehi44sy
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CvpqXGJ6naU3GVtMRy7ivRSsPt6ElR8T1VfcVS1PToR6hUdfTLknVmR0nvmpjfnF0v9Ms0k3eXOKS/xVigaS8nKgrwh6z7i92RftBVJpzRQkfN5MPOaOrpvkw6EC5CkXhnCK5jnwXN3loQxKe39avoDjAhjWWpEGMJveQeYghlTl4NrxkZf/Hk9a116yP3pFNVs1Ii2UDFRSPKJB/qG3nORo/wOdCHYjtz3Tr3RQx+rppWVxKYYPTTJ3TB9CmVKZy3S8VleRspYMbJqzXOdIiiJq4JTamsNFpZgvopoOzJ1TeIMo+lakRopvPpIhA+f71NFhvIHzwNarsA3P+lFcfU2aMzix/QMuDaw0JYYuM5BqaMUlUNqFR5Kfq/6MudTytvTBuh3CiGB2LtLBh9pvaT3Dj1hyVtol+n35+4hnjem28qfvsPyvWWvusbZfIgkP
X-Exchange-RoutingPolicyChecked: 
	U/oAJgR7kVs8Q8bab+YaiRo6BK99ysPt+oCxhSAfNYJrQ27pQaEoC4ub8LM7NXxz1m6F1wpWFpX+K3uWOGYeQch4Neqq3Q8bBIJYrKba33aFQ4Wi8l9uyK3pAESpyAHIyoAaeCtHEfbxlPaj5owLvill/EzTpky5z9/ImsZvnQ52XtxbasTXnomzaKISwMgO1R8kD3AlO4yYh+v3wsjH8/rqwxMSGXgzfz1T+N4VBPALfAm9oLstliZ6AvzW4kREbyac+aOtcnoV6/j6Y9sRZnjSPpUoM2BPsVkNL/fzmUjL9FxLVDBHUy5PgUwK04cQfVzhzxhc+ecd70m4nba92Q==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 21:50:42.1199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfc8898-554f-4176-8365-08ded303cdaf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6676
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE4OCBTYWx0ZWRfXxDEUsdrIoWJ2
 GBrvkpAUjui09/S6PAdvAvJjp2sAqrvY80Z2XSJI2srsn7WtROopMqV+lPnFV1SK+zuWX3cUlyh
 prEdnHeDzIybJiX7pyLNEGLzqSGbWgnvg8DRJ1SrGNqCsMG3PwtvCqB4YWayR3qWMpHDUBLT2LY
 Uv5fENJBY9jL6dlzNwurW2Ii4tN4GWDxoAjKTvZdRhG1gyqJf9u1drdY5W9UEal8Zm7uMZE7c6W
 u87wvyHJPUHXZ2zBxR/xiLQOlSv7LAZjworjL2PZ7OJ9vFRqmqV9W+Co2KqdZZaMa9VccNJ0eFF
 tV6ATbPMVnKL2/ikKjffJtnZwD7bwRGQpm2bDjTtf2h0CinkfUWVS5gMtIWp5MrIn0IRKQXvWou
 49pobncx7gfq0OIqj/8R92yBVzCMjggXIwMbdMnxaMO7UBoBvpVKbCPeSkJiwltydxhp3J3sfqv
 QhKjpuH2rB70nVmExhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE4OCBTYWx0ZWRfX+XaX6/A8+8TJ
 bD0Fej3w9nawFXJFnraOWZhg5C2dt0dHROhIJPkVPjGTZSQQ6UPonvlHVftCmXGHAWpQe2EZnVo
 oXqZfLfNH7MUcRHVWLRohqU4D+9Fiv8=
X-Proofpoint-GUID: 8iUCCIEyDpZxwE99u50U56hEtWDzQCgA
X-Authority-Analysis: v=2.4 cv=WrUb99fv c=1 sm=1 tr=0 ts=6a3da2b5 cx=c_pps
 a=ubRrNrA1i3DLWGMHTGxaeQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=u8sGPWapkTYf1z3Aw3gA:9
X-Proofpoint-ORIG-GUID: 8iUCCIEyDpZxwE99u50U56hEtWDzQCgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250188
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jun 2026 21:50:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20099

meta-ti / na / 20260625190334.3816457-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202606241800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 25 Jun 2026 14:03:34 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bdc0951f8599cdc26717e2b103d3ec4055440460

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202606241800
- Commit SHA: 937a0b45728e16c279a7dad65585da061526936a

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed




