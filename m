Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4590.1794605926719809689
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 13:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=T9r2CoIv;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Drm0/HEk;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ADL1WiU2675793;
	Fri, 13 Nov 2026 15:38:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=qG41mP7xJ44QZ4hYU6yWtrQd/G38veAdpveGq3/T/
	fQ=; b=T9r2CoIvWPQ8/IeINVUh/GpJTrhgCvxjtQU0cMWJYerV/IhT+7pnxC0Z8
	b37URCKtoMn0Fe9J7qVtO5HyApd9hrhOBMvDOLnNgj+XSdjUTFbz0Yki6+iT4SaR
	RELXNmQNBnL201z5D5AELmr7+bGlv6xUKMGC4rBy1Kc1H/eNK2roDYmMHV3A62TX
	aULROCcBXr2J/YZT4gnL10eaN773LaLXVtIedP/QeNCTcfjaPofAPagZ6b4VWmjr
	v+8uC9rpHa2Ev8CeA7HX2zyp75T0qEHOgb+3mhf+hq+9s+LSs4yuuU5whbk4aUsl
	EYSagXGqUbZxYkU0HO3kgyFBMCUiQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012010.outbound.protection.outlook.com [40.93.195.10])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hwytcm4cp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 15:38:43 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I816dJ8W6+xBwkvODvdgmvXm/sOA3iVP2wqTuXxEuBWnwJWyxPHQOsWW7dO1tJfpq4Fi9AStxwyacjnSXPBJN2+y2kQcbSJ8Drj6BbYsBUECapdCMWNJZpTul2jYRHqApq1RJfTyE1RG3mXnZHth3XLOBTuhJJl0HYh/7vriPSZtpxHq3//eepR4h8YdKJ+pbgDOBStiWTfigxRSGTjczUX8kt/emkibjFXv5UgJp7hMpvvL92mDHANDsU5CpQe92F534WS63oOXZRWDSjTs9B1tpsy7qT/AtTiMkp+mgONuiGJOXOc+wc0RQZuwnsTeHTwrON9a5RHNRRtgLUMQcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qG41mP7xJ44QZ4hYU6yWtrQd/G38veAdpveGq3/T/fQ=;
 b=dgUqHJf4ixtpR0W6JdM+Ln+84GPw25zY4zXjmjN7qS0HanQ0ESIXJOvJ7wZnZ2gP23bZaNjk96Avk9I3Ca3h2NnoB9t7U3D2E18u3pWErvSrMrRkQxQrZu9aCKOHUlCy4FnRFKgZUbnn/3AKKTcA3KNT9vvAvVU6k4m7ZBs2F2ljNi364WJxjSURzxH3UmFfSgy7hbjjMJdOzzRSuZyZ/c8fu2g7/11kNYkffNySw5gVl+HjTtSKNxdvdlcrdGERCjdSoiRU2MGXaL0+cF+l+P1QqOEVO5k8LBCtOIh85Lua0/6WbGU5p1EujEbpnpAHqJ+utHIuCIE107/+eSiptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG41mP7xJ44QZ4hYU6yWtrQd/G38veAdpveGq3/T/fQ=;
 b=Drm0/HEkHb2UidsHTwSltcXaG4ahAOFrmSenk8eBDe75NinWaENRG0302X9FMJJlZGzVo1koYqa4bACCTXo0ixlsEzlISwGcDAU1t0RJ1RuAXi/5jJJ34S1BRhiUDIhnofpWguIoWPZSTZk1DCaa1ilYgyH7rD7NSZWoCecXhAcnZxbfFJG/21HarQYKbdjRQe7UNJXmKepVbB4z1i1433VlmvaZBZ0Wvv9LHWQMHlpnFuItlEcI55tdS/y+LssBITla2SXKBwOVdZvSNkkiEiPHESitFodziMJgJHqTqcEzpP8p89XCeg2oOioIm+nDooNMLlNhBmUMWhiOhA2nLQ==
Received: from MN0PR04CA0001.namprd04.prod.outlook.com (2603:10b6:208:52d::35)
 by IA1PR10MB6900.namprd10.prod.outlook.com (2603:10b6:208:420::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 13 Nov
 2026 21:38:41 +0000
Received: from MN7PEPF00000150.namprd04.prod.outlook.com
 (2603:10b6:208:52d:cafe::24) by MN0PR04CA0001.outlook.office365.com
 (2603:10b6:208:52d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 21:38:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN7PEPF00000150.mail.protection.outlook.com (10.167.254.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 21:38:39 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 15:37:45 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 15:37:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 13 Nov 2026 15:37:45 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ADLbj0R3993028;
	Fri, 13 Nov 2026 15:37:45 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0513A9ACF4; Fri, 13 Nov 2026 15:37:45 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>, <afd@ti.com>,
        <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCHv2] ti-sgx-ddk-*: version bump to support wrynose
Date: Fri, 13 Nov 2026 15:37:44 -0600
Message-ID: <20261113213744.2783238-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261113212342.1705645-1-rs@ti.com>
References: <20261113212342.1705645-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PEPF00000150:EE_|IA1PR10MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 57274afd-dce1-4c96-a4a0-08df41ce7b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|261026140227099003|56012099006|261009223027099003|261022105027099003|261026121527099003|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: b3wCi7Fyi8QURudrS5APWNgQESXE0jcNqYNMRBdVJbve7xhtjvMGs/cOBBxHkoAKv546YDdWQSgHdrC/MmeWKDTe7V4nfMu1thYpcI0IG97pY6ecfm0gKG5/LArUZnhIRhUpOQA3v5gkQbgyTKykgA13Uwf91oTFzBao1TfZ4szgFzKITX38qQE6YKVwpcmgjfdGm8GiOtNBd9Q2ra4kWIqlL5CFbL1W8u+7kjE+viffEBzNj9o7VlIS888gXQesrpNFcqBaHt0JSOJMRwW5UhZgn0v86uEv275oSco0lOQQQc59Og61lDqTh2l2NryFDVUdN15e81OrrOM69oVGZwuIWD2htzImvTg83SLWsBHu1zYGRamI1uyK1hkO4/EeTc6Ruyw0jSNBwJV+AJOM7U+zxJ3Z3oFzxZxgXlLPgX2kVb5AAD+7+SQ/5IoL20WCChWgc6b+zvBY6MCWCzMiuj5Ze6IqDVrys80h0EHEjiF+C+4TK8jvcH6H9/I4uZOluLPxx3fknWnpNjO3faIky3jQsZDOeO7LhG5sCQlWsMHyIt+DgrPBoTaFvVtIVt6E9JrPsPdKavL9Xni+i96XXXo3J0vbuNRZ4lD/Bnrwyxc0z82oJmZA7gTyq4n9GIgiAfX/buK9K+edeiLDhfLzgw6XCMM6ZVPGrFj5uiiiZrA3zL/GAAGYbSDwK65MKwMmM/zsEW4BmxsG2j9Pe/rpkQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(261026140227099003)(56012099006)(261009223027099003)(261022105027099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9gszbGVad56CEs7mmyHGOclY5rVoSI+dz78ZgPzgJ3snT5BZWZcellEomkHF7Gz7LhedM7OJstQMljH776JR5KXVGOdsnjA87aTL8M34XAI4aJuVkCMnzQd0YPcZSB9IiO4IvbugpMFykZfUGtQ0Ta0TTpjHZcUOn870hd4i+SgsuJ7npMDsCqQUVL+62/Y2AQmFGGtNCYdxLH2uIpMj9a64ycRtlnX5z82RfltXE7QKCHaeWsS5EOlVNgOp9QcuvuGR+enXjONKhLt7gtyyRWNIJ4BZ6jsX+X/xA4DZFLlnv2fLWKcuKNEHovpN1TWh40V8+nP13EBAkBH7ztAACQFf5dC2wKE3rl0MhlSOdpo+cyDw0QYGU/84M/mJ6rH+oOv/PDrXzoTfKwWpuR5aJe0VuhPOHJtyDxarv7k4Bk2Ol8gERdt1t8B97uO/lft9
X-Exchange-RoutingPolicyChecked: OucV45dbciknEuYl7eIVINSFcXyeXcXZQOVLsEcJ0hYJiJu5DRUVF+G8xNsEbXqdXIF3ntkSk4NwQb5x/Ev0rxALat2N2fw0WSsntCSesnKjYbblJ7uDQLxRusKj8CM+T7YMWyTjPHUpP7H3bbVZ+vay37utM/ZcqYpWBrz4sC/Zvy/D+ILIVI7cMLtnPkifYpNsrkjF11AGOxupCdI5HImzxKaAHdpr8nRRdbW7f8GTLrgARC2VXgJJn2DrDK7OqRr51+O1abmUWOtO62mkVMpqPGegbGXr+SU5ys1DvWz3KupjgO2tRB70RLLS2Df1m+c+gMXr9KY2rH88NGNMIg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 21:38:39.9561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57274afd-dce1-4c96-a4a0-08df41ce7b7c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN7PEPF00000150.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6900
X-Proofpoint-ORIG-GUID: ZI_4ehj0YMxeiFZPufE7j6g-hO0Nbxxt
X-Authority-Analysis: v=2.4 cv=fYI4WEQF c=1 sm=1 tr=0 ts=6af78363 cx=c_pps
 a=78/F3YNzMekUCeQDO2i9lQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8 a=zChWxYCp5lOlobbw0VMA:9
 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4NiBTYWx0ZWRfX3xgYEeBZgYsp
 bNW8DuclUu8zUqlX6/MztSwxzD7xpPL6kFq91hxeRh6EbsXB8i/bgBN/v6XWiDq8PPnKS0Oen1e
 siJ6SOSe5zesWS2qbfnMk9Gu6fiDQmw=
X-Proofpoint-GUID: ZI_4ehj0YMxeiFZPufE7j6g-hO0Nbxxt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4NiBTYWx0ZWRfX0WDOA3pdraHq
 xHT9O65IF8Z276Daqto7kFBpoRNNIwdy+48atsLeVMBNE48WoIgwjWxIYVsWv3T0wMBq9CbOh2X
 hu3HmfBOkm0Uhx1+Pzqog9Ed6A5vwZ6BCucLnWkzyPDa1FPmCdfsoxzmVBq4pm9S17Sd6kFaiiS
 rVavpIuRvyoyflaVSH2vc/U3QPDm4qWfB1DjQrzqnAyt9OYreWgUElOiNH404agG0kHHZSirXSv
 1QNYp+NEpsZUzWJYFeCWqKsDu3ZCkV8xKVdkjZcZ5BU6j3oCQW6vefyXI4pXZBqt34HSSmu5y50
 I68HdlfXl1QQ5GpyUaCRjXwiir7n0830qpGrH3haULSfcJSHyZlvyOtdlwhHS6pb9eC/cPtKVr+
 QG8pD7BUOjyHhvSsSDUK7+V3ybRLBOmLPoYiZMREgDR2592p/Xzy75pmQXaQHvhpyygl+WRkZ9W
 XAKHItWfBhXHpH1uxpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130086
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 21:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20544
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261113212342.1705645-1-rs

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
- Patch Series: [meta-ti][master/wrynose][PATCHv2] ti-sgx-ddk-*: version bump to support wrynose
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Fri, 13 Nov 2026 15:23:42 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6ad2d84a0e1afda33cf73b726592663ce517f71c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: ti-sci-fw: Allow empty SPDX deploy artifacts
- Commit SHA: b3e4f2c6efcc4cca09550f4dfa8d4b87ef5f98f8

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCHv2] ti-sgx-ddk-*: version bump to support wrynose
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Fri, 13 Nov 2026 15:23:42 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6ad2d84a0e1afda33cf73b726592663ce517f71c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202611051452
- Commit SHA: 1e80335cb1f082e67f11f342e7dd8de5b4b84d98

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



