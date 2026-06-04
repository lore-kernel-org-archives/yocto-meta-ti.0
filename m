Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5460CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 05:59:55 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5109.1780552793189653125
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 22:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CYtY65vZ;
 spf=pass (domain: ti.com, ip: 52.101.62.42, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdsNx+uf19QPVezCKdzX4YI0rx4hYu+FZP0eZu1hZ6BIm/1I9aBvahqLUsdmfO3hfDp/7o5hzKqT5R5AYdaZ9t3JigM6AkETbsnv89XbPprtfEnDK+jk7eQD07C7h2coGb13nSoA7fMUv4KHQLgx3VJX4UQnhd+duPdRHsxQLmYEA5NhjSAeEZhHZkfz5NTZCF0Q45TEh/wf8D62t+9QoUXWXVV7uBU3MYHrsVwUuLt5t9B7gly7wyso/RHGTQLmA0W3R/7+IxvSSU20OAzLZRTodGsP/RIuLqAYEW2IjoNK9qBMhoauuVnz/1qRr7LtTh8EmFMcKHIpnEpODT8DAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsKMQ5On0c085/txnjmo0j1mvRhhd4n2WcF+mMY4rP4=;
 b=UQi0zO9COVxN3YtdczsqHzjm/tBXvoW9pVSaXiQP5oFtDPHymWLd5/qA514kKoszYSF7T+SMQ8yfHy1Fb+aAACRZtNx1Yc/85cha5D/DvVoEIxHwIyHaicAAB/ubn5miymE1Q71TJBWYXTdNdqh1nPihsL/BAmPpztKFTXSIxUJJ/GSD0t8VS79/2rE8KSQJfapTrdhwKqBWS4RAY5FRKw1C+UG4Vozb1jrVWVrOG1asGxr/9FqGAgSh6I4mA1ZOF1rucsNTTMDLm9PH5FQz4p9twLq17v/H/vOpYjY12cCNIHD5nqeXE1v/pzPAtrT6rMf4Hz8IgnUFSClgQWgkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsKMQ5On0c085/txnjmo0j1mvRhhd4n2WcF+mMY4rP4=;
 b=CYtY65vZ5CVGJFRGSkvdQEurOsU4tMCQW+4jFifcZDFWUay5Aj9dizugZwmCZs8nn3iyjbhb01AtzNCDS8LyDssubkZ+xn8211tcOx8AG3QP9/Hh7wQoKYT9WzeaZKRO7RcC3iwqzH+iQtzXpYNrce3GD2wcAxzuvB57jYtQR5c=
Received: from SN6PR16CA0056.namprd16.prod.outlook.com (2603:10b6:805:ca::33)
 by CH0PR10MB4890.namprd10.prod.outlook.com (2603:10b6:610:c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 05:59:50 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:805:ca:cafe::8d) by SN6PR16CA0056.outlook.office365.com
 (2603:10b6:805:ca::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 05:59:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 05:59:45 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 00:59:44 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 00:59:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 4 Jun 2026 00:59:44 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6545xfnl2773860;
	Thu, 4 Jun 2026 00:59:42 -0500
Message-ID: <1febb3a5-4e8c-41b2-912d-a97a9571b567@ti.com>
Date: Thu, 4 Jun 2026 11:29:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH v2 1/2] k3.inc: Add CPSW modules
 to initramfs for bsp-next NFS boot
To: Jon Cormier <jcormier@criticallink.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <nm@ti.com>,
	<u-kumar1@ti.com>, <s-vadapalli@ti.com>, <a-limaye@ti.com>,
	<gehariprasath@ti.com>, <denys@konsulko.com>
References: <20260603072932.1273938-1-m-shah@ti.com>
 <20260603072932.1273938-2-m-shah@ti.com>
 <CADL8D3aFJLbtWr3wCNwsFCMj3UO9XNS5niZL+Uj7hPmHXbd6Yg@mail.gmail.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <CADL8D3aFJLbtWr3wCNwsFCMj3UO9XNS5niZL+Uj7hPmHXbd6Yg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|CH0PR10MB4890:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c228e1-51ee-482c-75b5-08dec1fe7a58
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|4022899009|376014|1800799024|82310400026|18002099003|22082099003|4143699003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	f7PVDXWQbCmnd4bjOg1XVS1iPQI7f/uAtxF9W6S/OIN+eSVlW8fAdJ3XN04qAqMXoetu1zC7uRsJBq2DG3aHgY//pYSU+4Yl3zHzXo1yMhuj+PYYh6KgNNaRz4cfTfrkXltfl7q5h9eNMYMVgBn/sDegZvhcMn7GMwmzhXJKzanZsuYU5QKJfFt+kVtsdvtoJKZ9E+d9tOENqRNAdWOQE8b6bGtE9SZAHJ87yuZum/ctXEAPj2kVeRuzFWeE4WquhGTZmGgRZai9I4HgVg16R8q26bGW4L4l7T3fSkc4RW6m36CU33msdfIEpbMLQS7SOWn/HWPxgstAuFBjjEQyCDYlABLTHfLotXXwq7XjZR/KotwxL7EuxcSfx9I/+E+n+Jd8YX4wzrrRqFfA5433JvtNXj4bIqupK5/+vCxzWXVGvQjKCZwZPwLA55/Ie8O6lvshD/SKkRZP8nUPMAnb3GuHmPCFbLI7uhwV0MA9PXa1scj9t0tGzeUUhvNIOBEo3E0nJRCOhJLdckQUL23c4YTous9Y4SXrE9V32SSbxweyAweY9vonmYhV6p8AK7035LjB2litS+39F9eEg4C+dkWoFjJy4U8mcsVlmxyBmKtw/XYQJLhuZyVKaDiooLef6G3A74ZYyoYfRwVd295sKRMqo0Ea8LexPcUk3iTZblViWs6N0lgbkbEEcNidGJfF
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(4022899009)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(4143699003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8fjEtYO/E6CaZBPlXGvtzXvdBWj8WQuhdUf13ADFRGew6BvCRMN9ZPP9A48+j5TDAmJzyqmrdfxp3ILODVUrgqF4Erm2yZlkugrErB2MDYCW8Ol+V5c4tPTFBIC+LVcBIJ2L13oPFtsOHBAdFRfwItHAgOTsVXWAkTAaN3414iSZaRNNtURpU+tSzt3zn9vq+Fp2VNiPxElgndvDZiJtDC/9o8hu03/kokkgk+O132oc2dUlM6fgzSPfFE3OkYzOCLd7/QWP6wYuJAavLoCn8pPaeEEj8SGbOc37QX5DFrBFmFsj2PfyqF5m3/heexyviaW3dfDHSXkt2aXbooPqQZNefT8UZmagCF3B8/PbnOj0TYTBtrF8/NQYtm3712x1EA2ACbQRbX8fZ9chFEn7iWIiXjjH4xkyyikRdzlPQoeNDqRfDKsJnI+SxY8twDoR
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 05:59:45.0963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c228e1-51ee-482c-75b5-08dec1fe7a58
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4890
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Jun 2026 05:59:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19972

Hey Jon,

On 03/06/26 19:55, Jon Cormier wrote:
>
>
> On Wed, Jun 3, 2026 at 3:30=E2=80=AFAM Moteen Shah via lists.yoctoproject=
.org=20
> <http://lists.yoctoproject.org> <m-shah=3Dti.com@lists.yoctoproject.org>=
=20
> wrote:
>
>     AM65_CPSW_NUSS and its dependencies changed from built-in to loadable
>     modules in linux-next. Add them to TI_CORE_INITRAMFS_KERNEL_MODULES s=
o
>     NFS boot continues to work on K3 platforms with the bsp-next kernel.
>
>     Signed-off-by: Moteen Shah <m-shah@ti.com>
>     ---
>     =C2=A0meta-ti-bsp/conf/machine/include/k3.inc | 6 ++++++
>     =C2=A01 file changed, 6 insertions(+)
>
>     diff --git a/meta-ti-bsp/conf/machine/include/k3.inc
>     b/meta-ti-bsp/conf/machine/include/k3.inc
>     index 6833789c..726c071f 100644
>     --- a/meta-ti-bsp/conf/machine/include/k3.inc
>     +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>     @@ -61,3 +61,9 @@ FALCON_INCLUDE =3D ""
>     =C2=A0FALCON_INCLUDE:ti-falcon =3D "conf/machine/include/ti-falcon.in=
c"
>
>     =C2=A0require ${FALCON_INCLUDE}
>     +
>     +# AM65_CPSW_NUSS and its direct Kconfig dependencies became
>     loadable modules
>     +# in linux-next (post 7.1). Include them in the initramfs so NFS
>     boot works.
>     +# TI staging kernels (6.6/6.12/6.18) still have CPSW built-in (=3Dy)=
.
>     +
>     +TI_CORE_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D "
>     kernel-module-ti-am65-cpsw-nuss kernel-module-k3-cppi-desc-pool
>     kernel-module-davinci-mdio kernel-module-ti-cpsw-ale
>     kernel-module-ti-cpsw-sl kernel-module-phylink
>     kernel-module-mdio-bitbang kernel-module-phy-gmii-sel"
>
> Is there any way to link the inclusion of these kernel modules to the=20
> inclusion of the net boot recipe?=C2=A0 If we don't need NFS boot support=
,=20
> how much larger does this make the initramfs? Just a thought.

I am seeing a size increase of 1MB in the uncompressed .cpio(88MBs ->=20
89MB's), I will look into the selective inclusion of the modules once,=20
but I do thing it is necessary feature to have since the kernel is=20
moving towards making those drivers m and we will need it as a part of=20
base package.

Regards,
Moteen
>
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#19959):
>     https://lists.yoctoproject.org/g/meta-ti/message/19959
>     Mute This Topic: https://lists.yoctoproject.org/mt/119625158/7902621
>     Group Owner: meta-ti+owner@lists.yoctoproject.org
>     <mailto:meta-ti%2Bowner@lists.yoctoproject.org>
>     Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub
>     [jcormier@criticallink.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> Jonathan Cormier
> Senior Software Engineer
>
> Office: =C2=A0315.425.4045 x222
>
> http://www.CriticalLink.com <http://www.criticallink.com/>
> 6712 Brooklawn Parkway, Syracuse, NY 13211
>

