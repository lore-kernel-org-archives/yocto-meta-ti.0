Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BACAE68158
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 09:55:45 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8747.1771322143399568141
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 01:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=iNpY7+wE;
 spf=pass (domain: list.ti.com, ip: 52.101.193.10, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHtSXaq/nJeEfXCQKbKikCMQHvZSlsjIZQdzT/FHAaIThtrL9dgXl9nfSL+7ar7ut08aeBlBv9jdxGaKZCNjL/uFbRJRwYqdHeu3FS2+ZanDlbzp4Hs3CaaQHn3NGyR/fU9SOWHwKcG2MWOteSF1k1bGYIe6uUVDK/bgndg2WM7PVE9HgV81RyeQ/PcstuLKqKS4pPMHkNl36VGQkenTOzmYztrxwuYo/FU9EdA+E9JETpkjlpl79tx0ccDC5CaHtuAxbVDfnVTqjPkVgX/nvKioY7UU1BIGtKcQIhoGdfwkWnyuuzdvm2UHp1mWlVga69rDNKZVGKF9fzFH1/rimA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPzRC8fOKZiXsD0MRXOGa3Ttn8X8Yq6Ut+L4UituUjs=;
 b=PU4D6oN3Odo1bkN41Uk4Hy9JfJ1dAx2Me2irU+TlQzd8EIJpaDZrF9yc+LgunTY6HzvacZfdLRLaViEpEQ/a0IQ2c2tS5lta5/YAP9ZtpDEBw9pu+VhpU0AXRw95biWzZBn1/NyH0dMBsOFZ7JU15IS2Nuaiq+kfT+DPpwEW1Rmix6zF8rFa5FioAvL78k1BJbXhGC+ZYbOY9eDsg96VpVl9n+VvHVAp5orzOSnj5M+v0zPZmXYf8y4NTmVjwchtwUg3spDQoOIVQdhijxMHeHcW+DMTc+2elbDDTfWZO2sAkG7JDFjQ6Sl+aiWGzJONfqZoHeo+gQ1UHu8QpONbmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=phytec.de smtp.mailfrom=list.ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=list.ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPzRC8fOKZiXsD0MRXOGa3Ttn8X8Yq6Ut+L4UituUjs=;
 b=iNpY7+wELghpcKsjXVCUBSvEjLo19xwClsZNmn2nu7Y8YZs8mByGFFT76Cj0KhmZsEvuhFV+UHMljeFDhJbCayTqMS4Q7ggdS0wncokgLzqmMH+9oJzXv8tyFRSYGBAwiY8n3Dpc1rM1DhokNIPrbzUJOXDdw+6iTrizjqXDscm+PxqCpnLzuqRd3r1NVv/rDl0lnKa+hzD3j4/ypBxE3h7z33/UpGxJ2LypIotultChGnzgfSm9aj1PN4/dCd5K7qwoSsBnhalki3vdriUJwxR6biEm321U0faYB1iaF1+m6wMGYDyVuOxM5LLIY8Wv2rawxswsOD4lWFO4r6I6Dw==
Received: from BN9PR03CA0260.namprd03.prod.outlook.com (2603:10b6:408:ff::25)
 by PH3PPF860E415BA.namprd10.prod.outlook.com (2603:10b6:518:1::7b3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Tue, 17 Feb
 2026 09:55:40 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:ff:cafe::be) by BN9PR03CA0260.outlook.office365.com
 (2603:10b6:408:ff::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 09:55:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 09:55:39 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 03:55:38 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 03:55:38 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 03:55:38 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61H9tc1I3159402;
	Tue, 17 Feb 2026 03:55:38 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8F2FE9ACF4; Tue, 17 Feb 2026 03:55:38 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Wadim Egorov <w.egorov@phytec.de>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>
Subject: Re: [scarthgap] meta-ti-bsp: ti-img-rogue-driver: Avoid TMPDIR in debug paths
Date: Tue, 17 Feb 2026 03:55:38 -0600
Message-ID: <20260217095538.1240295-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260217094614.1925493-1-w.egorov@phytec.de>
References: <20260217094614.1925493-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|PH3PPF860E415BA:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f33ff0-ee93-4699-31d5-08de6e0ab4c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RlvNaa7nyLRLRttlcIcXHGr/mSPWKZGNqhm+BxdtIjuo/H5vAIKjaoE9d6jO?=
 =?us-ascii?Q?JZQToGYRUL6EPqjCTIDolocZwp/JuoyAj0O8GfCOVs0WT24MoEqSV2/fqHFb?=
 =?us-ascii?Q?R2ia4wgF173FLHdrzLzpGn30t72oOkJqK5YhhtzwAHhTjLzliZXBx8HWpW1o?=
 =?us-ascii?Q?tXatwCI5m185xFYkm90W19qMdPIorAaRckXvf4So1Jkur/YdgDQQCTxGU+Ld?=
 =?us-ascii?Q?ijtBZBycO5zZfBi44VWShpdTGxARLssfHgqgQFP7hFY4SofxezR7pUbpIbkm?=
 =?us-ascii?Q?lSqbx37Ljk3cIElJFLRp5pY/zfJaQoTRGClpNp6I+l2XIyx2KKzg0MaIj5dW?=
 =?us-ascii?Q?YWrf5jEgcxIzdCYY9AE7mAH6gP4wsv4XG7ug30bSsRfvmH1YBTyRMY4Bdpf2?=
 =?us-ascii?Q?0007S+MuFvpnF4povHHmrGwcLr4tXXSjQfJHA3BYdxyoKL1UiO98alqrh966?=
 =?us-ascii?Q?1wO3bXJ5dAvegiSCxwNGZmSxLPHzeOuSX2MGnhEgVGRzgNC7QAcn6YHEGmVe?=
 =?us-ascii?Q?+ms1Kklwc1a+F50h+FpoNWY+LxjCbtXTT4JoAXv+J8FBcZWUsTz0cV3dqtzR?=
 =?us-ascii?Q?VPzDv04YN0F0nK7uXC2rFGt7GZMh6auNef0S5lmFDShDteLBX4ZRN/qb2pBG?=
 =?us-ascii?Q?gUxEdfHGomQ8NG3Xpgm3ZfjUE0HtUg+NCeERuwDsNb9e+pioQw0dXNqsJ8cA?=
 =?us-ascii?Q?6oa3vQr/Cr5PZxqU4sFK+Q8gejf35xwyvM5pngtFkySryln4pHQBvTLNDqCY?=
 =?us-ascii?Q?umn092LwlgdEURBC/GfamEPVbVjtpNxeb9vFmE7i8bBaxF53yoSWUpKh3W0t?=
 =?us-ascii?Q?PyxN71uYe5OjYrJYMCFeeXkXm91iPJZSBA6H++nwk0ZEvc/sbT9vw5OxJvOx?=
 =?us-ascii?Q?pAUS8Cnxllnlji6L4ANywCP1QKum7aktwBzrRogXyG5zjhMIyIKzYodPq7rE?=
 =?us-ascii?Q?/YnD8pOqcdS6Nchw6DIkH4g81ISETGDxD/8P3fw3t+d/+6JK8457S7k5rUgz?=
 =?us-ascii?Q?l7Tu+2oiMwuErbqhSkEWMd27sJ/+1rrJlZZNw53br4Sw/UtOLgsUtYN5U4NS?=
 =?us-ascii?Q?4wNlrHV4XbE93iw47vRD9SV3qbG+WqD/+ruwcWSOW8ZrTCBqI59DuydKvzlu?=
 =?us-ascii?Q?cqtqxCFeNviRASNd9XjbhERjp9Uq6U1KThVGl42tkDrj4rwKqDY1u8wzAF9U?=
 =?us-ascii?Q?gL3BVMJ5zXREyGG5c0+Rylei4BxTNXw6npwif+TdYvb2a5uOuhw4xRjnJiH0?=
 =?us-ascii?Q?eahhZV3310qU2lUbuAb7SCIxopcWeiCZ6Z1JqeAbBshWq90HS3lDBw8HxOr9?=
 =?us-ascii?Q?Az95xtpfjDnvXXO+GJU/moFWw0fT/4wCVaSvL0ruKy5ktuDOtI5sd761nbbS?=
 =?us-ascii?Q?qxNjcIqi7lcQyW9IG8Nc4piHclSzDTOtjN98OLzQI/M2B+BALVcfQJkCT31D?=
 =?us-ascii?Q?j5500evYNt9+p8ZWGdMCFLGtRhT/WNGmZT+tljdeLM4HyXv6ysxSRJRxvAUp?=
 =?us-ascii?Q?1TXqjcXHtSUppJxZ0oXz8y7tUXfx/affZrfUTHEZ5BDyE9uRd35xmh15J3j+?=
 =?us-ascii?Q?6kHnYEKieJbH0MFXs2YXK5XYM/gPwY4lg5EbvuR8e/tM/YZLkxluZr4cenla?=
 =?us-ascii?Q?uw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aHJdAVciXJwjtM7C+BUvYQhVGPgzrQsENqwCqr3On6y5m3Lwzjs8h4Ta5pX+/9fqTcBq3yE2w9tSU9A7eSeL+zL5/PMsud75Hfox9qkkKQNhNvO4nMqt/aMZ5HYJkazyDmQMxUU7k/36howD9imy9RD+vSDfCfod77fPs/hB9vccU+1hqan3ayDHofCyrHSiwcGmi0Q0GZcke2UcJgbXouPJC4ycMQsTefx19Dsk9ID8H1ve5FCXQkTqyY4eyOtDcbmPcs9hkptkP6oc1sz+zIcujJf7ADGzCbpPnXZHKPj6onbePL0HxJE+2iIJhYCki/teMfigyx7SM2Z3Ed51YxyJjwMD/MB+ZEmrmNgX3rhE4XYwhplPxOHUzJA3eKwN89pavrYcAH3ScAhlJ8LgVB/4XLBwLo0iv/1X2HczYsE2bGmDJDNw3ng5g8FEChAa
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:55:39.3568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f33ff0-ee93-4699-31d5-08de6e0ab4c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF860E415BA
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 09:55:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19522

meta-ti / na / 20260217094614.1925493-1-w.egorov

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
WARN - [scarthgap] meta-ti-bsp: ti-img-rogue-driver: Avoid TMPDIR in debug =
paths
    WARN: Commit message should not include directory path to recipe: meta-=
ti-bsp: ti-img-rogue-driver: Avoid TMPDIR in debug paths.
              meta-ti-bsp (COMMIT-MESSAGE-3)
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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [scarthgap] meta-ti-bsp: ti-img-rogue-driver: Avoid TMPDIR =
in debug paths
- Submitter: From: Wadim Egorov <w.egorov@phytec.de>
- Date: Date: Tue, 17 Feb 2026 10:46:14 +0100
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9262adf70e18252a86d30f9fc5e2e2fca=
00958f8

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Manorit Chawdhry <m-chawdhry@ti.com>
- Commit Subject: optee: Update to 4.9.0 tag
- Commit SHA: cca267fc320200cc1561ebe11d7f5af9949a91de

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




