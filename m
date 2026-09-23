Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05D4C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 15:59:18 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1222.1790179157813027678
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 08:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=fp6BLc8W;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=bWlYpMqj;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68NDEOYo1611705;
	Wed, 23 Sep 2026 10:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=nC5C+tv/vpLEYOB4cCV7oHwPDJdVeS09ZFkk48FJ9
	to=; b=fp6BLc8WvPwShOVH+d8KPXRt9Bfru1T2YuVK0YGo591+FzEyl/R09rrrE
	VxiY4cf9RF6Vo8sX64JDKzBJkKvrI/CvZzcHpNl32ksRgYjvEj+jsr5RkSU5R+Qs
	uGC9TcGTyNHiew8cncArDeRLI7MElQ25mA6tTB4uN/jVL99pRMNYTFjxT2dXiIFU
	V08LOwAOJIiOFzOKMgJiVYSZUJsji0UScB/bnZtS1I+PhZE73v/jaZ3Ha8fWviI8
	DRXIbXtqPizybfNjaAa9aVRY2VNd1aEM/is9f8b4mcJ3PQzRQvlNkU9RWbGrVvTC
	J2r9bv0WbuxHGU9nLb+16Tsv/z4rw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013030.outbound.protection.outlook.com [40.107.201.30])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gvb77tunh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 10:59:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H04/sRPj0q9fHb1APwNQ9/1U0QqfgUUuZOO/msgM8fTDz2D0BohY9IX+lJ1gRM+FYlZc+3GvUgkdzAQ6urfYyihz3QAzfpKe196I4vIHI+heJ/2Tytw2V7iIzlLKdInSg0JsKxJQMuLJ5py7NETCgdArHkuSD2ycOu1lTzbkMl2FXJt8TuXfv2DVNSAm20fTfgPuQsW36pfsBA1HynWKP85w4YjsdocsHFL/EpM0Y6kLfj/pBaB/J9reiFyXKfB+i1mwXBoyUhwZI7MSO1Xw0JZGyju7CCZrLZ12H3z4ReXak46iHwQSRXPv7il0osfSMVORRlrd4TQPwy7R9VHOJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nC5C+tv/vpLEYOB4cCV7oHwPDJdVeS09ZFkk48FJ9to=;
 b=hVxuikeZHaVXC+5ddkSs4Xy2CAjKaUMbKidbv53UoTUK41hKHjNOHlHw5R1cxdB/d86Jxny+U2y5tW/fj2mo/iKFVqfrcE7K4pMvdnO73PdHkAVj9OrCVmB46oLR/NWIZ+VN8j6SkT/FYMNvrFNA8gg+XgHnToEmnu7xfV5yVu1jlX1yMf5BnPZISzlkZBBDXTnhEXs0hnp0Mf91CT6WmWnaQeVSfE4Gf57PcKJieqd++1VQG6xCxHQrKVHQrapimInNHaFkXS0q/MxugAmdxd8+zkA4FZ+sfruUxzqtnKOYGfMG02Ggiu0mqLL0RQJ2XwxnuPu5GvFJOcmRa8aVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nC5C+tv/vpLEYOB4cCV7oHwPDJdVeS09ZFkk48FJ9to=;
 b=bWlYpMqjnsrXXlwXgvIXJq/2aDrDENRzDfwXj7RzfTbDTpIrsBIBNYWFR0JUNGAnipRWGLGnftPNOcBWWvTzT/RQk3wh/lMOUgjX6T8CHFNCPCPp/pqqFXhjKUD9yvgHmBR49BarrX1dKUqt+idcDegqRdnF4PDV0DfA8PSBj6JwekTLx5zx5bHr5EX0iCFuyIOlZUJ322HmG+3rwHg5I3NSumIrlFKOa3VzI6oOU7vtqDM7olZdExh94d1+/FaYkHV9lET7wL3GQOjlujC7llcWBa5Vncc8bGMS7xpSfWYnRFt4bTqFxeF0vEk1yhzALVBqjztI63xgQBvfWTKEvg==
Received: from BLAPR03CA0143.namprd03.prod.outlook.com (2603:10b6:208:32e::28)
 by CY8PR10MB6827.namprd10.prod.outlook.com (2603:10b6:930:9e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.6; Wed, 23 Sep
 2026 15:59:08 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:208:32e:cafe::4f) by BLAPR03CA0143.outlook.office365.com
 (2603:10b6:208:32e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 15:59:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Wed, 23 Sep 2026 15:59:07 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 10:58:29 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 10:58:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 10:58:29 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NFwTSd2327975;
	Wed, 23 Sep 2026 10:58:29 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CA21A9A9C4; Wed, 23 Sep 2026 10:58:28 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <denis@denix.org>, <j-sahu@ti.com>, <p-gupta5@ti.com>,
        <r-soni@ti.com>, <reatmon@ti.com>, <s-kapoor@ti.com>, <s-sinha@ti.com>,
        <sen@ti.com>, <y-hegde@ti.com>
Subject: Re: [master/wrynose][PATCH v2 0/2] Add configuration for pipewire
Date: Wed, 23 Sep 2026 10:58:28 -0500
Message-ID: <20260923155828.1536307-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260923153904.2153823-1-p-bhagat@ti.com>
References: <20260923153904.2153823-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|CY8PR10MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: f640ba5a-0275-4a91-6e05-08df198b993f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|13003099007|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	aGbjbKS+x7Sd+cfl/RzbEf8WZuMz4XW5I5ND/0mo6G7rm9LCJTDfinope1kk3UgWVb9gP/wvrzbyApW6Ixe+TdWZDXbwhKLOdbAPOxvFBF1Nwp51YjUzidcKF1CaNO5sJgVM3wL6r7RcKoT8rp03V57mOK2M1gMJeT9dIAJ2VgsRmowjaZus8cagpyChga7Bd32a2Iz1r+VtiEKtixoCGK1OcNPTivwvPdZ3gmVs5emEWzdfP/Y15+at+Ai2UVuyupLNwgQSsNiZiIgiHzVH2K1FA7voov7Dq1YmigJSeGeYfTJ7BWdfLs5RVokXbcYON1rhKy9rMSshbHZARPKdssD1p+xT0XNrD9cccUcVe/jTKFgxth6JIeg+Vd/DbZt8UsXQhDn8OdH1uWwHIy9QPusJd9uP+hBu/JcjOhyiq16LdS0urb9TMmESonkoetGzbVPXjU9S/aeln/dKOCbbhxurkNat7P032CAne4l6oRi7rl6M0KaDdXQZU9Jt/qOXYtw0nN3MWpaZeKSYakGzo0DxsBZV6lcGl5dn1xhowKGZMSlopJv5+3ltPlxquoANljZCdf/KU9GuZyv7yb9Bxy3QoJZHfeW907vBH7nWVonWq7chpU+41o9jnB5i0LJhEhbjna1J118HP6zegnD/IA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(13003099007)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Nphb/OiKjq5TUGica4a2I9Tx39PfpMLVyCBQLP3v3LM+D0jvfO9l3/SzGYLhjNprz34HTaDht1fP/C/muMo+kwPngBplrZdjZGxyDi6PMG9/qduWwHa9IQOxalTHaypqIBhX7EADuQaEHsuqU1fDsc7D59MvRg6EILJe4H5DqUTbdolI7gzKelRmEMA+tpltgJ+PA4NKIYR17ze5bzf/7LQRCnuKQ/2LTzmbJA/KKes/qxUJp0wWNourQY+nIvAKMovGYFXgVm7RwqLzHERup6l/vLKIEZIMNfoq/l2TR1E6qLfq2+FebSwEDlD2rPYkv0dzmi9x6ZwpsnSz8Sqqasb4D3W3GkF4zPniM8+ivUh2/Ow9KTsmDOvX+Y7qgx7tvJMLfoLN8zLqCHDZyxJ3r802P+GmELCF/nMU4QSt/XJyYWccZ5tX0BAUUhSLEJbZ
X-Exchange-RoutingPolicyChecked: 
	lCjdORzXx9WenrYWBVquoog9ESB2Z6bdogHDHzmCCIbTKzMZIe91mo/qhwzvh1h05AEU/UjWHLKAHJm7sIyMIy5KF6Tl66OvFic9Vvys1OOl7tbkIowUSojJ5W5efanJ5cZKJoOe+sH0M4w11Jec6zjUu3i9f71XU+r9Vjt/uxIY3cP2V6Nio+XKBJnbVGBB44pJzD5mjscQWO/sqt8RvqCmNcDhb8rbksuneMgtRbyKXBZkyMkRpGDxi7JBUGau3DxY6SmpkfSD7nPYXti0lM/KsoVI26MMzUSvrDuY1YmaL8154MINsQLG5qfNrna/XglbWmArQV+Z+sGA+mARmA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:59:07.0956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f640ba5a-0275-4a91-6e05-08df198b993f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6827
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX0uFeTiji+Ex6
 QrVXUWiYKY3XCZBiV4d1w7LghSeUYobIAc79F+LqO+HmOKrilNVF+4J8K+sWl1G6C9HpXsaY/2+
 YAF1Jsj02nDiqKxIuprdXyvOMiMk6/LTEWcJl+bD90UDUmlzYHAkB9v74LbUQp8ZYB/ID6iaP8+
 xrYl65fVnjO8R59FLxzZtOUo3OBrOLne9o24WWQJpVMKLH2B/bn+sVilWjXpf6Ab4+XHh9f58rU
 rteRjZfDc8ZmFCC3TF44eUTJEC9Oo23hPla9qPCoGpFeGO5Xo9zKbkz6vdj/IZk3odvHubaOTFB
 KYc/HOqqp3CHR3+QGykjH0Z0C/DDZHeFYEJrDiij+AdQh1DRL/+JmhfSqBGVowzquM2nBTddXWc
 GQGYQ2D3j6JBu69VfYlbFw1hQ5rpfhcCKKRp+bsYmJaCx5a40vki9Y8l1PwsPhnhTfl+YiP8A1c
 eHoMlzEZn2NFBSQ4zTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX6D44YH0TIHpB
 Qh7xyX01PBHelnc2y73iUyNPchT4Up2Sp1kT0gOh+rAeZDJcCapoi8pEdOVkwZZf+Lc0qDItAPP
 vqvxyTe3jJjz1USebEMynd0Cm/5FPfM=
X-Proofpoint-GUID: uD5fDt5vPUwXbOAMtinfXAVWYWi7phiB
X-Proofpoint-ORIG-GUID: uD5fDt5vPUwXbOAMtinfXAVWYWi7phiB
X-Authority-Analysis: v=2.4 cv=cPt1IVeN c=1 sm=1 tr=0 ts=6ab3f753 cx=c_pps
 a=8mz6MTC2HIKUG4doMpATJQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=nnL46HX7ZhqttYSoqB8A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230063
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:59:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20406

meta-ti / na / 20260923153904.2153823-1-p-bhagat

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/wrynose][PATCH v2 1/2] pipewire: Add platform specific configuration
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master/wrynose][PATCH v2 2/2] layer.conf: Add multimedia-layer support
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v2 0/2] Add configuration for pipewire
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Wed, 23 Sep 2026 21:09:02 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: eab5b0b7bcc39c71b6b70a67e03fc33997fc012f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Commit SHA: 64a48b4c9a61d39888fd2d410e3a7bfecae76072

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v2 0/2] Add configuration for pipewire
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Wed, 23 Sep 2026 21:09:02 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: eab5b0b7bcc39c71b6b70a67e03fc33997fc012f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Commit SHA: ccbe816aa7b08a7ead9b5e27195db4d25c5a357a

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




