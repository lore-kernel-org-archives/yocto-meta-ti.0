Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBF8CDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 09:24:55 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39190.1782120293887711685
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 02:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=a4BEUBmg;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=DTwTnB48;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5DNax2205188
	for <meta-ti@lists.yoctoproject.org>; Mon, 22 Jun 2026 04:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=v2uqB2tjj05Wb8UMtz8yVTwWp4edYDH7/IobLSt/m
	Lo=; b=a4BEUBmgAJBMLpTW5pcB0rjJyHS6CDs66GEqBJQWx8NLCS5GxavbD+17v
	F24NoQ1nE3MzLo/TC4iBoJvzarXxftjfMoO0/RWAgnxfA1+XoMshvNkoIKqRM343
	PSpcwTOndg/vrjuS+3DfS5MBOlkejDbXn2GsrslORv4xdxshFr/GYJoj5GtYcz3u
	lWbfEnLl1MU4LuaXYLKxyANc/FYd8S2xhvVJrq8JthVjZOnbX6iSE06RZCgdUwij
	S8MzrK8ej9OKGRpsC09D2H7sB/CBkzOw991L412fsteJY81ul0AOExfcXiZi1fim
	Itr1wgAQ0AqZma5+nWETau5bI3cdw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013010.outbound.protection.outlook.com [40.93.196.10])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4exa83w714-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Mon, 22 Jun 2026 04:24:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQ/x2QyCQox676W0Y96IBOaQFg7zD5KzAe8OiIiMvvJRfXLaFatTdKa6MzjjYArkNCyAPSKKhZqfeQLodblozFd01m771OC76VI14WltMMbonLIXUBsD3vQnC/SdZzkNiA5NzeC3yL9D2uNV1rlH0gOMkNmbljJwsyyloNb8vQ5ygv8wHZd5FUM2hAE97ee9l9yugq8lSGeaIwNBiMXeioDWy1JWO4Ab+L+SrOPagiTYfkK1wOhcqRdA3KQNgfA7muWFrVnKBIFsAFboYroyD2oSxBGsxMBf1M3NymLJ+K2mEgsKfCNTpiAdLkYy8FPIeLFc4ODDPQ6z9BEvoTf11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2uqB2tjj05Wb8UMtz8yVTwWp4edYDH7/IobLSt/mLo=;
 b=YYlmtP2XxBAe3bwsnVET7qTxM6UA/VWxn2P1PoRyINdpEiQnFU2twydSgMMsmHvu13wA1+h2d8EZtCdTlk+RmaJgxKcyrAJWL7bebhQ/ytuxrNdD8nuoT2/nBKdYrAfhf8++FthJF8wJVzS6A7jmdQO2IEHBuQTRfZjRYNDpVycx2Svc4qrZgNqQQypF4tcAI4mys3HQnRuXHFQiYaoeT4t8cMkCKvL1rNx2jZ6ivcoV9XbBY/fheI+i0JLdagc3q59HoK2x3Zi1dJVxvrcA+oSqKVJbtgXX1eR9B3tMexypnTX2XIAFTL7fk/ERM9OnLvaTGbS3XkblsUOmzpDDJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2uqB2tjj05Wb8UMtz8yVTwWp4edYDH7/IobLSt/mLo=;
 b=DTwTnB48sInTclcaFjJI2V5VRqUmyVbsOFL04F5Hdcv5t73+Xjxiv4+f3PIdkTPeXJEeiK7AbXxINajcmhJvZOrjQdAhReUbACHqLI3NX0gvsofG5kjQ1uXkjMX1PcBJkMjYjNQAvw8rLyxsHevz+7MZ2BO0MqKDhhxWh1o4s7IKDT6iVYOAwcj1GNEZOOmo/qnNSadpikg4E983blVO0bQaHCPLk3UxTyPIRSjCXvEHmV+nWe6niY6JMxsHbyjaGCVzdaxUnLefPPx87fmkvjAF0yAB24o2AcQ6f+yWeQNKxnP7PlzWRKbgbNXrjg2jpek15CY4JMlW4amZzTBqwg==
Received: from DS1PR07CA0014.namprd07.prod.outlook.com (2603:10b6:8:456::11)
 by SN7PR10MB6666.namprd10.prod.outlook.com (2603:10b6:806:298::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Mon, 22 Jun
 2026 09:24:49 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:8:456:cafe::23) by DS1PR07CA0014.outlook.office365.com
 (2603:10b6:8:456::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Mon,
 22 Jun 2026 09:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 09:24:48 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 04:24:48 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 04:24:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 22 Jun 2026 04:24:47 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65M9OlnO197314;
	Mon, 22 Jun 2026 04:24:47 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id BADDA142E1E; Mon, 22 Jun 2026 04:24:47 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>, <k-malarvizhi@ti.com>,
        <s-tripathi1@ti.com>, <t-pratham@ti.com>, <vishalm@ti.com>,
        <praneeth@ti.com>, <m-chawdhry@ti.com>
Subject: Re: [meta-ti][wrynose/master][PATCH] tfa: Update TF-A for K3 devices to 2.15 tag
Date: Mon, 22 Jun 2026 04:24:47 -0500
Message-ID: <20260622092447.2523785-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260622085723.990271-1-s-joshi@ti.com>
References: <20260622085723.990271-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|SN7PR10MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 83cb634f-c009-40e6-e64b-08ded0401b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|56012099006|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	TTVOLUeFrVIy3AZtkLXHjngJz5mUVzejC0rD1ZlTMe4+Wabyaxb/DbZMuT9PtUaurMb7ce88FNtEBmejcIcDpHN+AVGOCS31OX2of0dmJSU5DZuMJABJsA0cbzlQHm2l/GZhAJ6sCEshn+Z7XtOsIH5xIfzoEJ8YtUff7W7jRSdH1AMv8iSTlOf1B+bwAE2K+wcb3kgA5wz2E/xGqabsvDBDYp3xxsms1PC+/I2whhmNcaKALSKuxzPAYAWT4VxqeTafAdsQ54bES1scz8Wu6KU9InUQCF7xuIRbXX/Zhi7s7RkSY/bO3spnPvQESX8e8qDbfQXg16URg/C6bxpfXxCig+ERACmOD11qHvfT8jVzqDiL5WtGhxdq4nbFfEYUJUiB96zb0Z33YyLkks1UCeStzHkCMORW2SUfjvlzhE2tDAz/71bB10NNlAkjbkCuAdqABZ6q0vhMQXdPZTz32Wi34ogcy/DPAqXd9xgZjgtDupU8Y+PBDvGTniuvkiELoF6fQQANzczbRJViZfwLOo27acqVmL5meWCIQgQTZw9jK8X1PDPK0bVyApwE7oeRi9wOA5NaDHLq8u8N4onR6O0wd/R94RAWDGfNvF2Q4kWzqgmd94RcbOQyjlOkWLzXAf+eETxYgA2EDrLoFMtAA1Km2xEgUyY5TK1x8DYJylhLd1ovxd6M0ug7IBldNz5ESW+KKwUBsyH7q3MAzpoK4g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(56012099006)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	C8ubHnT0QUi2EA9xFVoYYZpViQjb1T1rHflw6VsNiINS84/LRpbUX61PH1/lf3TFXj7V7cq6DZ5LEYgxbHhjfgwbszHmdgRQCUJAecEuQ3pcXfPFsXWe+1vAzR1cpLNOn9qvfT3Q2Kt/8i7DTZjfM8qgjNZi3uiS+FY+RFGI1rxqnta+JGvGFFjiFBKprIDy2ibg6eLbmabwHk6Inw5SZknayZAKa44K5EohE5Q6mlIUBCtkope99D+muIuRqfXKVVHav0TyqkXzQ3ZBAcNGovFJhciG0sHFcFLP+9CwSw+P+TMCA+GrQL3oHmf4c7M7s3SWLEeWbdq89JeW1t+qvC1SXifxUAdFq3/RJKk0Snyu5jA62T7A6lOmnDxTm/OyxuGk5jzUouiwOp1Sr5zQKcXPPAI0zwVPAaarQfZbEGyb3KYXGXldGIS5dduj6e/h
X-Exchange-RoutingPolicyChecked: 
	UtELaewN7rsaQRKzjbSnq6q2Gdg297fZ7WvXjgv9CVfRwbM5osJzv9/+suUMgEWWmdnH44qWvGJB1rRFUZhRlL9hwJBYHha1id/taP5wtn118sjzuTB1pGTOKiy+XAxy0CdAJzRGZ0aAGnUAXP1f9Q8ruOvHuxcF+XLsrNZ9SxQBuQEKu2I6tBEVbzsidxvFdFTlu6u6ilgcnXeHfE3d4FYqK+NFTkQzgy1Z3JsV5YOBfur0hy392H/cQDIpCnG2+oG2yvNbyApeqnkkfi7PWWHF6aGwjMYVOkzqlpJz67BeQzxOXM9pKU1yNmriOI+dpyHH7WFKPRhGUJ6nsgRnkQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 09:24:48.5893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cb634f-c009-40e6-e64b-08ded0401b3d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6666
X-Proofpoint-ORIG-GUID: 8NxU-N2RplXi_MKA8V0xi2Tr8NEllscs
X-Proofpoint-GUID: 8NxU-N2RplXi_MKA8V0xi2Tr8NEllscs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5MiBTYWx0ZWRfX9ADBGTg0yDMb
 RgZtZ/wxRiv5AwzM9WuxqIeRp35tKeqrRvOASOg1JdG1Fv3nClKkY6OzvfDz9DIVAL6gpfCF6UR
 1c21orbAVdaQn3jnbgChkQluvgMVffL9iehNjczN1SnvbD8b79AKakY9mKN21gAJ0AlgWLgOJyH
 r67LTUXhyIBurF7FReYCmCYrv0kAsPM7xQpsnsATrS3Y8aN2nAdS2xIyyJ9DVf3jdGPyf7kaxfn
 D/7ROw+wdw8fmoV01YyTKtP8kJ5NOZw0770vMatRyWIaof+i38lhEmzQTtMXxaKsSAtJxz1M8AP
 KKCfaypYb03XvMCtsvaPTJ/2eF8NpYu8yLZ2mUNjK8FmJjWnF9iHCLZib8L/tYF8D7VvwiY0qoj
 x1gTddKSvodUNQVAj7hd68REOBe6VpMij+PZyfgPRv9pxuMtnKJPwRmFzc6KLgTkHgLaY7n/NcE
 rdRXafjeZVilsnX49/g==
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a38ff64 cx=c_pps
 a=GLOgxCHNDJEaGAThK2D1wA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=VkkHSWmPFM6PHLY5UBcA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5MiBTYWx0ZWRfXx1e8XUUY6mUc
 dR2pZhc1pmcIcFtj/vIIMpRjAIaa+zpTUiGb1tAF/Mb3Xi6o/WW0EIoYvYB0w8zLCpXO5VaZ4Wo
 Pe0qmS4R/k6C9lt5JTyQHR52MqG5Oqk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220092
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Jun 2026 09:24:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20047

meta-ti / na / 20260622085723.990271-1-s-joshi

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][wrynose/master][PATCH] tfa: Update TF-A for K3 devices to 2.15 tag
    WARN: Commit message does not include file/recipe name: tfa: Update TF-A for K3 devices to 2.15 tag. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose/master][PATCH] tfa: Update TF-A for K3 devices to 2.15 tag
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Mon, 22 Jun 2026 14:27:23 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 80f7e58333a6c6f33bab11cfea0524b2dbdf3f01

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: conf: am62dxx-evm: Fixup packaged overlay list
- Commit SHA: d6532526fe8f4d4a2dfa4fcdc85cc224f0a13fa2

Patches
----------------------------------------
All patches applied

master
=====================
Summary:
- Patch Series: [meta-ti][wrynose/master][PATCH] tfa: Update TF-A for K3 devices to 2.15 tag
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Mon, 22 Jun 2026 14:27:23 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 80f7e58333a6c6f33bab11cfea0524b2dbdf3f01

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 9b28ccd19b2ad9cb8f8e1d5ca9fcafcc11c40dfc

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS

master
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed

master - PASS
=====================
All checks passed




