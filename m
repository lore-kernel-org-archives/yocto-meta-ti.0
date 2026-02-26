Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A39FCE082
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:43:50 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70024.1772113426838126620
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 05:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=RxkgJiJo;
 spf=pass (domain: list.ti.com, ip: 40.93.194.53, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVfbiToPK1PshWByByCLjX8lbCWXL8xzqqMxNTAuRBtvpF716tHjWQT5o4eufH4f1knBDq1AxIadWbvPey3+fEduc1hTQIwcIMoHmWUquRuR7seg+WTqSwgtrhPwi9TbuH1cTwJmCxYGbVVxCFwqScAJHA+9kz3xeeTV5pWexdcrlDhFz8v2CPlaz+jIBLKGnKQiOeal0bLks3d/wAtBeYAQA0/b+x06KW87X1K1qWvWK7KPT6C8eZOpe89lNhJM3cheitDwb1qvFEF2govwHMQrIMjcaPbo13z8oWcxACoYWCx0S4+tJzihTxRzHZlufjFC8qavRHJOJ5XOyjP6Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfJ7a866I0qteFEFyRUsqgJpBusJmCZ5agzGOAxECNc=;
 b=lpxUo2ekNcWqN++/ehCQ53ebE6tvHJxKfidfYucz/Tvckpxz9OseKhLtfWDaLXgTN0LDVVWqC6+Ytd4so4pUkb6O9BKlaFhEmGq7w9yR+xe6wV2R6WXV2Q+ry04WB2c7lqTQDpgoLBnycS72mq4e9vuv4FGL9KHidknrxErpYl+BOxssrg4O14UczuAQHlobvc+ueaXc2eQbmujnCvCyKWha5YJkLRvC5X5PiduZr7QKhidNEdRaaQDwdiZAW5w50WNLs1IqgiXNG86QSYRMF2PDZEjQ3BnhWI/rWiWVASPKhSVLGdxT3fKreSlKzr7aloKcNUXHNe5bawiD4bP5vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfJ7a866I0qteFEFyRUsqgJpBusJmCZ5agzGOAxECNc=;
 b=RxkgJiJoRk8OBYJE9tx5HMlS08LmrdJOeIuYDrAtAQGahJ3MxN2z+Aej7vQVdip5XGbcCEe2rGivR5slGPmeCeX80AIdh5Vwq+RidKpNPO7Ohu68MxVroo17yjiEPtZ7b5UZCXz/jXq6WF1DIeSQTpu0dJ8WUgFqCJutqUIdOYRkM7mky/TSO5ny4WKU0095lKQfzP537cMEsIuE+Sq4oVkHq41m4yyHe4u08EgonZ6ymKvk3YaNAVJNrWc2evKGf0PRnYr+NFUH3D/g6Mfhcer83YtJHB4kKDkCobsBSkCXgLeRYEuOzFAagLLt5UZl8kGWD5+pMMRFe8inw2VWHg==
Received: from BN9PR03CA0574.namprd03.prod.outlook.com (2603:10b6:408:10d::9)
 by DS7PR10MB7129.namprd10.prod.outlook.com (2603:10b6:8:e6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.11; Thu, 26 Feb 2026 13:43:41 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::7e) by BN9PR03CA0574.outlook.office365.com
 (2603:10b6:408:10d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 13:43:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 13:43:40 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 07:43:34 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 07:43:33 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 07:43:33 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QDhX1c2335144;
	Thu, 26 Feb 2026 07:43:33 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A110513F520; Thu, 26 Feb 2026 07:43:33 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <v-singh1@ti.com>
Subject: Re: [master][PATCH] conf: am62dxx-evm: Package k3-am62a7-sk-e3-max-opp overlay
Date: Thu, 26 Feb 2026 07:43:33 -0600
Message-ID: <20260226134333.571297-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260226133214.540583-1-p-bhagat@ti.com>
References: <20260226133214.540583-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|DS7PR10MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: 019d7e44-476c-4951-843e-08de753d0d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	4KEw35ATtVAhcbTuGje8JdaGC3Sn4uygMqZK/Jl/xDI/565jaZlTsY70w457T9JtUwqvDwAdSXcxjYwr/NNiTwnEg9ATWxrfICLzywiTIq+cPDDGI2q99rqozJj3wuUUX9wKxIYUOwC6zh3FLkJ8LVn/WUTTk6wYm1FbYAur0jfI19wTbluD1Suc22Q9lYa50OLEr/5Fo77Vpvoyb1j6V1qypyDSFgo1exUdFWCwCyuujoH+aCsxjqPISvsaS8Z2FkjSHjqiCrV1/V4/uH36wp9zmClEhLtFuDIYuHJ9CZ7wlLf9AYQPZJb65hRxnY/92cnDYZQqqIQI0Y2rAQmU5hw4y7t7nGsBv4s4zmSLZXJlif4vapVcVbRs1nFKiMAwpxC/N3nIu73J0ktyoAugLclnc3AO+q94k0ZRqT8Pxaf2scNMNCqA7jEimbKd2TNA6teMbKDHu123O1/+xBz2L9ytgHPAt3JZI2ODuVPnpamefLuJofu2pXGGPoMrd4vf3EGvgc4O7I1pL4+U5k1fITKr1UgL8VFNU/PfJ0Q02Mwd9ZVfV8P5F0L3IBzAmRnIcJpGYEc/w0tQiwP1NVsWpVhhtIK8jtcyhcgsg1OE+6gZNO5Ry7pJH+tnxirJbI1fjhHXml0S+UdpRuuY+m7vKFsmB9v6+I+DcxkFZMykZQLRSSnoPSGuxjlWd1IvQoZrL8fAZZRASvJ1mjdWHbc9N3iTdTemQd8rkKcc9W3C8lOWbJVFeO2lfJRCcdD2NcQ8ULJ9iqvsthjSh05ME9E3ia8D1hPS/g5Fam74uTvTnCKsjK6P3p8bDZ1XqXKLLfjjnS83vKZ/PdnkON+YoQPyPg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jZ7aLrmFsm0THkeeOIImtwiQ+rD2s+X55B89ZA66kT1qCwly9SYc12ZFwWApEYacdivFhO6qLEULxPiNm2q4U18Xt3M1CaTQRc3tBJIRDZn7W6Rkh8Uj383tzT7wlVERGg0UYwYryOHTv8J+3/UrsqVBqjgiPo+If2xMPtpLFZQsoG10C1ie0SNJ1x3Qx1cV5u4ZCYkDRdCVCZmNRrlZQePs/hh7ImlQBm39SwRVgcs4Te2NxkFUrKgldGan3S1a9n/M2RqrAMKf5Guj4QD030yiwGHrYgElXyH+i4+2IzfkXjHKVRGqXx5Ur2OBB0hN6tiLptuUqMgx9UR8JhZahCfzveNHZrYd3KfC6XhEozLzYtKFqUh5nPd+QGj1/7/7DbJoM4OvFpujMhNtIgT/zn713sko6f+R47aEVWJEaYne+lma+ZWqj6oEW6r0HXcU
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:43:40.5812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 019d7e44-476c-4951-843e-08de753d0d21
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7129
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Feb 2026 13:43:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19618

meta-ti / na / 20260226133214.540583-1-p-bhagat

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [master][PATCH] conf: am62dxx-evm: Package k3-am62a7-sk-e3-max-opp o=
verlay
    WARN: Commit message should not include directory path to recipe: conf:=
 am62dxx-evm: Package k3-am62a7-sk-e3-max-opp overlay.
              conf (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master][PATCH] conf: am62dxx-evm: Package k3-am62a7-sk-e3-=
max-opp overlay
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Thu, 26 Feb 2026 19:02:14 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 32ced134f278750943c900a9ae81319ae=
bee0c6a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: beagleplay-ti: use the am62xx.inc
- Commit SHA: de3bcac5598074abc3aab258416f1028bb1e338d

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




