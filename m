Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8EBCDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 19:58:13 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16246.1782331088971269744
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 12:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=cBG1kweu;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=UaGf5tTQ;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJsEsV1332216;
	Wed, 24 Jun 2026 14:58:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=vv+Qw56e7xhjD3j//GRLRTc9/XjDDDpO3uao2SK4p
	Fk=; b=cBG1kweu74yyM4mhPFIS89mxvTaXekVOr5ljvTv3dgJiX8S6ODz/tdIzd
	eQrivDCf0KgAY5h90c7FOHTFZMXbJPlZyIz36dg+zIiUAtBmI2HX6/ddUoSRYAp8
	p9lb3xIl33Y25BaIocCAci9YQsTQWwsgCXyak0m1ZwjW8d4xtJPOT3603h8EOf2M
	yFZNrA1mhBEeoSpTac+bsZvVcLVe4UK1KYfJ+6U+LZtg2DaAgLTB2Qdg0MOzoqgq
	9RVT63zhpYlcwJjLEiVpRpN+WyCHECJEfuaSgdupdy02HfH2plehsxJOQQEkZobF
	IBGekCehL2WUfhhU11d93P3Fk8CBg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010039.outbound.protection.outlook.com [52.101.61.39])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f0aspcd78-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 14:58:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/mEcoprS5TFnJltlzjaKoBaFFDWtaoBYiU7tLY/oerjk4q34U5JESdU6JtMYu4yGWgFq1NOol5sjFru4H3KR+uS/6WtES3Dl/UzHP7UNtZZxdnJvYHB/C0V7ArWnItaqM4LDepO9Um0YCl+yUSEOd5Vqh1YYEZZ24UkVTUmfna8+jNa+KCA6/wvnf+/dleiuAMNBSE9kbVjlun81UpixdPX5lWSZtmqHhHx+6OetRfIfDhknCv/zb/TWxj683SS7PykYvS8UkZz0WDarBmCtCs3b/l5QkIR206KYxNBiGE2YcdpbN/mwPRlulLI5vqjiC1PFn6COL8JjDCCakxuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv+Qw56e7xhjD3j//GRLRTc9/XjDDDpO3uao2SK4pFk=;
 b=w0F02r8wvRXvWrN0zsPTAp4KTWmsBUJIfUbLvptWZsvzrii0rJhG/dEXSgU49Me748RK+FOHXtGqk0+OVtuZXPpyWWfQI3KajAlVng7Kvmf+/SKjzZ+DayGRE2c386VuWw46o7c8haOfa3TO7che7wZxGJjqGmGaOKaDA0qpVVSXaZo2SvefOEVRi7kY7T+LOG/SBm38CXLQ5vAlHCGAIoHYWnMfCQ3URbgyWpKkqWsnqwp07EJKoOnl75daVNJW1RT7QAnTA2meTD9HsF+pLD4jPU//b4rOfL8ZO1QKT2rIWAt7xiv6M2wsbju6wU/gDpUTeAR2bP4yeVItgM4xsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vv+Qw56e7xhjD3j//GRLRTc9/XjDDDpO3uao2SK4pFk=;
 b=UaGf5tTQiPSFBIYtFWPq+nlOyqurNDHR0yCkBxF5+nYUBiaGF15Ip65a/5Qv2gUH3apCLqsM/Lfa9Lc0HOGv+lT9coxNuga9021nxvfr93MHIdGs25JXX89ORApfPGUky6y8kMjcVA0b/8scvwI/fnWAfAl7hv6efR33wGCtjSkkCMg3WFO6gZu1LFU9eEo7/a67HmNEXxyNGk79KxUqcHhGQngMAeZqUBYNOD/6yszt8enJRMXW+z8csZwWhPV+vns3tob+qguPXIo98WpEUL5Znx4kk5n83RV2CTvM1G25FfKUPUaI5wJ4tKIuswmp2GNCOyIdMg2aR/awff/TrQ==
Received: from DS7PR03CA0015.namprd03.prod.outlook.com (2603:10b6:5:3b8::20)
 by IA3PR10MB8137.namprd10.prod.outlook.com (2603:10b6:208:513::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 19:58:00 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::7c) by DS7PR03CA0015.outlook.office365.com
 (2603:10b6:5:3b8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 19:58:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 19:58:00 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 14:57:54 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 14:57:53 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 14:57:53 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OJvrDH3025332;
	Wed, 24 Jun 2026 14:57:53 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AFCC99ACF4; Wed, 24 Jun 2026 14:57:53 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] am62lxx: Use upstream TF-A board name
Date: Wed, 24 Jun 2026 14:57:53 -0500
Message-ID: <20260624195753.2316646-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260624193910.1149173-1-afd@ti.com>
References: <20260624193910.1149173-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|IA3PR10MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b4760a-57f0-45c4-57f9-08ded22ae521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	9lHnig7FmtSc4npuSVqx9cPBOIvOInjZfdCQtFEND+YfVkaBhrq4Zu9sj4QieqmQ1wiTaEBnalB3Nq2c+GFJoQ0k1iQF+q2E2QcT6jUGAWz+oqOF94XZQj1uhAtq4poVJEUHNOEPGosaGuZxvqK23g6+v9TklI6no1MxsumpEvP7UAWvcbYYGRtudTg+7hDmxhU/URq/Ym2ae15pYsggZpX3iEXhjNT3Sfdl7S44EkXwKmzb/+dMxVbl0SWLvgZsm83f1Pgs/lITsbLCBtnqBvuwtKdlnInNt098aiyuTZICIPVkaxQPdM3nNr7l3vAWnYoIdVPAe4VqN+IvzNIZKoMBwemGIbElx8LRnRJpwQqh3f1BUAKrw3/gTBkbCJBIakU9q4yniNGSaJCrbFH4d5mYYuIXbit8DJ1QO00VlQ78czlkZkYH34h2bWfm6+3pesWDLWQhhrJ/jC7bbK0WFQRSSS4a3pb2J6faNOPYdu/mfz25K0xYRv++F5oy7PjucQPBKAnCxRwKIoc2771dQ2jZ9dO7urUwOyYIEYCbtexblW/w5J42lwMnDrJBEGgfEiMkYJPhpCTNaeTZ2B2uyN20iDmNID9kUmiRNzCL6F7oLLHdB1cADavRMaEpLyDufgT/bMIdm7C3M/+EWip/saV5ZoLK/o4h4QhvrZwC0HSIzng6LFXB33i+KWukN9bLuGqYvgGQjS2J+GJTk5qodg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	szDQWvRT/rh6KsIMe7sBiRsE8I3yNEAwVrF5iTsjWEDSRi4DsU7OEJcFqjCmJcheu5j0wiqZE/DeKEGp3ykDZID+0s4D9Zzpl3l0KbDeuCeCZ9+y3Y66YDdSP8miw5nEt/ekR6ICn6Ulvo5ZdOPFaLOe7asqrChjwZQSQn7h5GkhlWtiExT3/VPMUGRrMTvfmHUViI5rRFR701JUAXV2QBlAux0axfN7aec4RmkCeqQrzh3zu37lqBDKFKTDnGdYbD0I2adJ0CnSVq9jgi6nURRfyjlXjKjGo/PGf07abWEzwbXQAd7aD0puqnQb0rmDgppTEq9HUaLCJ7yYR3sUM0U4Pl6ub2IM4OX/+x/i5nnhAn7NB520413CDHyeXPlzL2VFBqFO9J9Fq0BdodXKyp5+SIVGb6AvYNzNNTwxNeeuw3Mmt9XjjMamLUQ0/A4E
X-Exchange-RoutingPolicyChecked: 
	HwjpX4D+gnsn+GzkN3LabDcqbOl0cR0uRD6OKXj49vE0IajLyMa4TVEaLOIZUba6DQxkNbysBr3hTsGUHyPJfnHWb7lRh1To+6etsDY/HxUo6o0FXllkxlbTTQKy6mT6YNA3BoDzbG1DclyBPKWzxXvK/pcCWyxY0ieVNfoKtMCSZWPMWIoCezdmYBSqlE0UCHD69S++xgi2+mG8nldNh3YwZ3Sb/21oLUF+rDeQ/7+nya2g3aOZ0uT2isyV4aE3iAe8XdWbICjtRRAMa1Q97gM3krFCACMCrWfG1m5kzzc7KCIVmq1THarye9PspGIku9phD7/+f4pBcMwh6eincg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 19:58:00.6797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b4760a-57f0-45c4-57f9-08ded22ae521
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8137
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2NCBTYWx0ZWRfX3j7RCWiU1Ds4
 ELqtZn+nH9HAiEqAuq+zi/rfC/CFGDLLVbjKFlMdBm6sByGQ7b5uK4548SiqrcroVt0df3Ozrjp
 rpoibapM2nLYuF1IhWV13NAaluqOzgEUkWQ/ECDNzcDGvgoz3maSZI8oVOPK5mttx7zQsowVLAk
 EXMiJWG3VLVnrsL3pjaS7vB2qk8TUth+v76a2Y8YNCzAvVKmB2nrd0rorVAIdEMZ275OfLXHcZu
 twT2bF+d7/ls6r9q+/DEskI4kqY+ks/FezgdCtrIiVSdNDWau2J8BSFW7bY11VDi1FuNWQ7mVaX
 KjmdxC5OUEDGXnsADXhTdoXWmqlfqM3yqUB46iMJqbi6UF4vkAd+wQawsGNVy4G/cwsSJlVd8eJ
 +lN5TyWx2BYNXzH2I939fKr+Dbn6PQ==
X-Proofpoint-ORIG-GUID: fzbIIpWTTF34pEuY1aqUKGvuf84ZpYP-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2NCBTYWx0ZWRfXzj2DRFW7QlLA
 VoL55RsC6Pt05epvdtOqJ8uJpQuu/bCQThB217Q5ooQ1v/8hlfCW00BzK7IIlty2ZeqK3xtNo6J
 bal9tU9Ts9ctJl4ID/I3/B1FFcyooUw=
X-Authority-Analysis: v=2.4 cv=RMCD2Yi+ c=1 sm=1 tr=0 ts=6a3c36ce cx=c_pps
 a=gUoplhyZVfsoAH38zi7lgQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=VkkHSWmPFM6PHLY5UBcA:9
X-Proofpoint-GUID: fzbIIpWTTF34pEuY1aqUKGvuf84ZpYP-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 19:58:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20075

meta-ti / na / 20260624193910.1149173-1-afd

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
- Patch Series: [meta-ti][master/wrynose][PATCH] am62lxx: Use upstream TF-A board name
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Wed, 24 Jun 2026 14:39:10 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d1056000d675ee4451e546b444cc25242c2069fc

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 07bd4c181e2a400d4375ddad7a20fbba6578b133

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] am62lxx: Use upstream TF-A board name
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Wed, 24 Jun 2026 14:39:10 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d1056000d675ee4451e546b444cc25242c2069fc

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Suhaas Joshi <s-joshi@ti.com>
- Commit Subject: tfa: Update TF-A for K3 devices to 2.15 tag
- Commit SHA: 88ce8160ec6c5804820555e0bc29dba23059a4a1

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




