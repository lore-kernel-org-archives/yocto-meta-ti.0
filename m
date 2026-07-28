Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF3DC54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 14:29:32 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12752.1785248964777509355
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 07:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Qk9FYyjJ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=tXz7bGin;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDPbCF4118752;
	Tue, 28 Jul 2026 09:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=14eF7dypKPrdGzaiG5fmHjtac/+DcUFlsGqVq4+CG
	Yk=; b=Qk9FYyjJ5Wq5OPWDaAXQOURDd21SJyJEV8SHtbpRf7xnmWQdAXDVBpuhf
	1kIoL4mgERMhGpZ0fcOEwnkJrlcV1du0SVgfIQ9qXlfrDxAw5kisJ3tLBGS/fp1j
	hY0ym/OM6HGuUCJUtwoRSk4QuXUPW0p8wP/hj1lytSt88OcMMO92LE2O6aXnEWhp
	R6b8iLuam8JhBNgVVHCrrHzIk4DXJglkHzE7LXS/j6FYND6T048BVXNuoOQgNhip
	iEPCXPAnR1AiTddXgOGBcBpgYuUI1O2tBRtC/j5dkO0lnpfGrQJIgAseIlqjrx9R
	h72TyrFcvQcqhH8cc04MZDQv/oIoA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpseb1rhy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 09:29:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sl9xGl0+6+G2dsptuTxn4XpWt9lB4xTqvcSJer24alwFpYFv0Q6ciPIwfiru9bCEwm4FUGKFpirdAGKsHEQ915igZjNDhDgJD19QD48ZguLrCOZVw7e4Y7UqyKcJs1ptp76lM9+WCutAr0Qivy+ZVmBfwsplAaACdpM9ocCdQeQ1Gt+CkNwVgBoo/c0ALY/qJbaP1oQSCo8UZEYc1eG6CGjg/lF4erVnqWzPTh3doQVraO/A11Pwgn1sx4035gzEwHrwEU7ztK/C5QwAvYqKqlXVmnzmjeJl9CM7ziIQ7/LGmZfNeu9gq75vuRGr8gUWm6c4s5r7mBAdOFqMxQVIGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14eF7dypKPrdGzaiG5fmHjtac/+DcUFlsGqVq4+CGYk=;
 b=wyXo9MXmkIlSaKIVBeyxnrQPMvBXFxwc/4il4Df8obhWbIdSqnLxi7eCinufD7mosotubdIkf3Wmdt2THiNZdnuLyn7VSTC54S1fKW8M9r0mq+2CWSKYXKCRZbd//e7a0GUK0vyvnmcp6TEEAXoEApDJSjgIx+4wV+wHbxUbt5+JYHVPPNsgGC7wr/H9wUCCWbrYJby5a6kbt1/0jRfDAMzRSnenAE1T4IH0eNJp08kz/Cosf981ebZ4paRG0WiqrVLZ/+zBaC9gAEVrVaI7Bvyh0HcvHArS5EwKtPrfqP9fieEwBp6xVErA89GEh7cCJivVBojACpRo+a/baYNsYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14eF7dypKPrdGzaiG5fmHjtac/+DcUFlsGqVq4+CGYk=;
 b=tXz7bGin/v5a0+IwbLfQkoiYDlKhnl5w0EO9Gju0Qu7zPF/8MVDxL4921kagnYoac75gmAWaj+3066a7rgBSlfNV6IOX0lNpC7oN+NEPeAdSrXhN+beJ/tFWrC0oONAufxK82IK1wRhL3+NRhGcIXwVWsVLRLbGqW8RYRHox8/z/5GQkPxTFgWTDctOHKSjJe6J66tG6KzTReuKWUXtiuQJhu3q7lGGtJXDmiAAdFvnqlUl2lSUHoR3vhENw5pipoDcFrErKZw32JMUeIa4nXmBEK0wkPYSbZJ2hZy91k+dx2SWxtl6bTMLSToQVFV5FfbYJHgQVcY9pmOLg948kuw==
Received: from PH7PR17CA0044.namprd17.prod.outlook.com (2603:10b6:510:323::15)
 by SAWPR10MB997791.namprd10.prod.outlook.com (2603:10b6:806:4e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 14:29:19 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::a6) by PH7PR17CA0044.outlook.office365.com
 (2603:10b6:510:323::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 14:29:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 14:29:17 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 09:28:48 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 09:28:48 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 09:28:48 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SESm3m2918773;
	Tue, 28 Jul 2026 09:28:48 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4E2CB2A53; Tue, 28 Jul 2026 09:28:48 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] linux-ti-mainline: Bump to v7.1
Date: Tue, 28 Jul 2026 09:28:48 -0500
Message-ID: <20260728142848.3917149-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260728140759.2850885-1-reatmon@ti.com>
References: <20260728140759.2850885-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|SAWPR10MB997791:EE_
X-MS-Office365-Filtering-Correlation-Id: 781b79ec-ab75-4835-2ce6-08deecb49b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	NgWMQDegl3XYwiI3jPrDFpouu4gC1bXT+EmvSlcHRsD1ANZMsT2DwAyTYCiEn6whds1i9+mwfzX19Rhsjob4Qq+yXhh/6fYUXfEAWoRJrjW0ELKJ7SQ9tINAFaM3fS0vOH3EJFK4gSo8k4YiZfT1Kin/GN63MPut2P9P5mYAqMP5kzzo5sGFny/4jP+jT5Mnn8eTNSFymd8Bn7DBkFGNNk64DcLQhfO8NCMIJ2fzDogt9lKYepiK9ScFb6+oqPHR6qzZFbVqJUCAwaGbjP4khy766flGj158pVE1zmvhuoIz6M6Vk2gqSmMqtrAAqrpKimHT4CqdlSykY4h3dFQ5/rb3IUzzA+gQLbULPMuMaiZfv8sCixMoIJVDmvYdIXoGEY4CGPP5TfRdv9c4A7yOmFOGxm/XfzigL7cOE83xg0hNH+k1tz/42aJbaXIJXgkrh6sLWsrHu8zmxSQ1SROvouqJz4Bnp7qqevIv/40JGi0QP6xfgbvQgkL1U/GcK0MPjJAB/Mvw2am+8/ZvjkFrV9h+u5DEtThGupxZQ8ADSD+ZigGJKH5ZS+aDoZSgWJ33Mh130GxDyY5mbs7jF4keWyfnXuGZnKaz/VclKt+t2yzk2PdMysaRXMt0N9h795BDoDMDxiKmFrKspsGQoZzgbuhQj9cwniYIiriEPT9oSnVSs7TwqFovraff4WEuQ5iHyDYgIisaWb6PjyLvVshQ5w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CWlaPp86NhFRELoiikPoVIrqk7XVVCx087czaiw3vll/501/xYv5UXTEz5d0+6KP6Br/0jRoe760iVNgEA4pDM4rUgB9Wite+kPddMbZgZlSDVQZRU+Zf3y0yyVrAOZrKf09ky82ynOkUJX3bZaHyqm8VP47w3fBbtgXQJFHgnySzi+5SfN47rU+ACnzf9dZQYJicnW52ZIO0ldG79syEBwyNbzk678PqolQ4G033EJuuDsjQncxzuTHUxjMbFHbm0NaI9LQlyIvrVIcamQZS2eQnniGoAoR/a2RgjbFJKnwain9XV4TjkPJfEb+8k4CFECzdeAXuyB9D5lkpF2wCF+qj8veQv3uBBsTzwP0YP2c+co352AoCLoQRDPP0ePxAo6mK5jqbl+O4VCULA5dG0BUEubbjRhP/VfkzqQVlrGKka3E++L7Etqy4Jgr31Pl
X-Exchange-RoutingPolicyChecked: 
	agV6f0VctpgIObcY6By+2RmSAoM50MoTbimcR7obe9bkJYHBTAiA8Mi+qF2rRhAwDj5e9hhj/TehMOCi7Aj0RfW+oIa+2G/FfkW+G1m+64oLoU2dvcmOX+swaFR7nF/CuFEpfabXyn/XZTGGhJZ0uvJm+4dTqccf42OUrkMJPLsU/Y4/1uceLsBWY1OOLDOITR/qAbgUAsyqxahmqGRHRddFlLFNN94tfCItsHkjLyfZPgKaHJ5U/4QswvxRPUdwa2s9x7bbw2net+DH0ePm3kPg5gz3UO4fwSLzKFbnMlBPKXXTFk0CApDAUN7kWyHdL9/Sv7HUGUNhf85o6nUqWA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:29:17.2508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 781b79ec-ab75-4835-2ce6-08deecb49b15
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR10MB997791
X-Authority-Analysis: v=2.4 cv=c46bhx9l c=1 sm=1 tr=0 ts=6a68bcc2 cx=c_pps
 a=PeFxPTU/9IdxQzUa63kYNg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=4g7qCo5UfWO0N8URmDgA:9
X-Proofpoint-ORIG-GUID: RQHERKSDXMT28sNFqaCHyXGZUlY9BJA0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyOSBTYWx0ZWRfX/FVEfufRwcoU
 YA6YIA0H8zL6ZKR6OztvsPa0lV1+/z3HNxKVVN/35Rxriw+eD/VkeTNlPKkiJ/HHLFYQBw9ZSM2
 Q/CRAbfCoKq07Ct1PSTe+LCVa4lu0s4=
X-Proofpoint-GUID: RQHERKSDXMT28sNFqaCHyXGZUlY9BJA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyOSBTYWx0ZWRfX0lkrPveXjQek
 xq8KdJTcGxfv6MWz+sPEQ+BaFiYzia9Fm4XJg5MEjheYFTAkhmGWHcx6WHjp5rWfeXU2g3C8WJ5
 dNeFwMpWg6GexqR1/Hq1bUUQ7nSLzIvE2eRCZdDfK5fwyviajRYdb1sxS5ptIlYCNvqPvwQCk7q
 mivChwgilxFhK//g3p24WNO7Jch8u3kSRCUoUvSRUVHaNmQF8zuEO+RGncTv70BT7rc2y9MOHGJ
 yXR4Dt6S7WNUcSh1xAWFNSmc/OM0/5pAhjaEq5FARR6TQc4VuyMhQpjMC63usnlQgfZe7qg9PdD
 ynOeLKW2jZr/1wsvHCC9wCnDK1RqrdamUduHPqEWE4Ts5E1TGHi9205WlHvQAHR+zOpLYpT6eg2
 Xemd9V2sdSt5ZwmylslPuxMJJXzj/oA51EsO8hPzze49qCg0KzFn1z4fxzoFUQvXbgcghrmwiim
 ftiZ2KRV18S7WjRoQug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280129
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jul 2026 14:29:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20199

meta-ti / na / 20260728140759.2850885-1-reatmon

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
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] linux-ti-mainline: Bump to v7.1
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 28 Jul 2026 09:07:59 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a34f3344a42a0c9bdd73e3523aa6703cf4b98b81

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-core-initramfs: Decrease IMAGE_OVERHEAD_FACTOR
- Commit SHA: 087f2f1fffb315ac46fac3c3610421072faca5d5

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] linux-ti-mainline: Bump to v7.1
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 28 Jul 2026 09:07:59 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a34f3344a42a0c9bdd73e3523aa6703cf4b98b81

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202607280400
- Commit SHA: 9ec6947af21e798ce65d088e67429b4d338d52dc

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




