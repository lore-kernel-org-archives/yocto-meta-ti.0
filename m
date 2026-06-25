Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FCBCDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 16:15:01 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15043.1782404092681829382
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 09:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=N9l+xnxj;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=VQKUQo0c;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFd81v3683325;
	Thu, 25 Jun 2026 11:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=nzAb1L1FMaGzF40/CSZ2AczAuKjcjZ81TmsFIYKD+
	RI=; b=N9l+xnxjwSiEsfQVkciV02YUqZ+yZwp2j5kpBg3rrExcQDt+OGUtOCoo+
	FKAYE37gc3xvHZsLBx82ElEfoO0mIbkjsbcwF+U3/CG4IciaZg/3IwkAqMiOOOXn
	tKMEL5TbN4ES3qT/Pz8O/dBvZ1CbgWHByWUUXoN9bH1jdNj7ix9pj/cuDVRmZ5MO
	SN6nJptiPSvB7xzrKfK7MAKWctx8WPpLuSFIHRJ0f497eDEIgyy+Aa+1xAxpf5na
	8qwwQN08/8z1Ny/ewerF/XyVKeYTghkBNObeadLh2/NPugWr4WhZXch+0C8MVB6V
	wucy9cUxKt3Z0is1T79ZbE9QzgXNQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f13a0st9c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 11:14:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fo1BdU66ojKZjRKHNff7m6KuHVwvQ+Aaxu/XIsVGZwpeoAjSakFmiJismaT1f2bGekEQhbV1K+uKDG6uXj7wagBCVmvnA8Ta8aCVch9UX8DMNYO17s76uLHt/Kqn43k4ftq496gYHAA01XvtrkCRjL+Zr6Z+hw97rtwmUBKWciq4goATBYhgJZ9gpvJ+dfLhG8a0QyS0sdeE/i+8RytoHXHk4UzMV/ONyEH+OxzLl1eNt/ePBQIaMSkmRPtxrf6qEQPUaLrgjfElKLTy+q0O4JyL0/8PEWFBXzLATu4OZcUYyv1dmENi8X6cCX1eWIF3ZtdqlG1HKFSWmmWRaYhMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzAb1L1FMaGzF40/CSZ2AczAuKjcjZ81TmsFIYKD+RI=;
 b=U9KTGB79HcELwvVUs1vAVv3ZmUfjdw0eOctzara2YHURanSaQk6F7dt+Tb1IhiSRECi1Dx9gZLjewijes+vu4UMIZnNFYFJDckjJBlJRXtrlE6D72+1lcy0o9uOiG8M/kNiVY1zPL0bSRYAVk33W+tMPOo3Rk+VUoRcRzMTmK+IO273nnBrrLtV+ELSvNQVBkh8jXde+n14YXar26FjQmBjR2gpQmzIN1g3xtZ9NK4I2dwnXuJNc5GmGp3rSTTs/F93OfO9nlO+Pv/fDG0dxiro/ekgR6suF5bFJKNU2JbRBvC/hVedffGYqHV/oJ/mqgA7U2Fr91g4mL//fY3SBRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzAb1L1FMaGzF40/CSZ2AczAuKjcjZ81TmsFIYKD+RI=;
 b=VQKUQo0cTOEGMVEhuWMWm1KGTZoaokEY14J7rUyyTjABnYK2oqYpfLzRLkVMJ+Cqu5DTdko3q+JlDZC7YultYoxdPoEQ2quyvxzPK7vyl5mBiJqxmYYnqkEjj+W03kGJr12ymqDMyFz3ywKvnHUyB4QDO5Q+MNUjIoiEzJR8Z7A=
Received: from PH8P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::10)
 by PH3PPF0A8D5CDB5.namprd10.prod.outlook.com (2603:10b6:518:1::788) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 16:14:48 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::4) by PH8P222CA0026.outlook.office365.com
 (2603:10b6:510:2d7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Thu,
 25 Jun 2026 16:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 16:14:47 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:14:02 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:14:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 11:14:02 -0500
Received: from [10.249.65.70] ([10.249.65.70])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PGE2T33693824;
	Thu, 25 Jun 2026 11:14:02 -0500
Message-ID: <9c82f77a-2c48-4cae-be34-cc5ad14d3d66@ti.com>
Date: Thu, 25 Jun 2026 11:14:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] linux-firmware: Move recipe from
 meta-arago
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260625155800.28627-1-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260625155800.28627-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|PH3PPF0A8D5CDB5:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9a9d6a-9646-433c-d91a-08ded2d4e04a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	UrZbC0Z3yoMZQw1yg28EyzRTmIYrRpEB74feQKp0dhSVxa6Ojob4IdBK1j8ewi7FSxugu63XHy/8DO9BVdkYvIHPSj4vlJLX6VQwYf7nQ1093cvE96/j3wviwgIvOqOwZn1NO3V+MkV8LvCBDlil0ayP7QDUdqdxbUmPSTLeUcCWI1wM8owdj/aVefaE70KfzWxKITlSG/zvKR4tV3AcbuOfrpmzTWZSq82JkP565+4I4AUcpfyBOV6s/58d40BTuCP42i/Uwc1tpcquHTeU0zer2hLLqBPWhylw5NMJaYpNLVKSTHm+8QE7B7hnuiP3P6gtjIrXbWCIuIjm+1Gikuc8UdCzz+e9t8rQiAD0OG2+DJe8Bip0g+3tphlTBSRXu4ha8Jxd7+8ErcLm1xtHEvfn7WWFK/QSlXo+3VqQ1nMRSgGs+VeuadK5dJ0Kq77Z+o222QRz6Tb0T8jEi2UHGi9xKiVElMYbUIbYCBqeGm3txc074g9Efy8cO43xtz2QUeBUb1RRjGcHVXTE5qDg9AXSKHQ3j2mkgAXGXBC9oKc0u68ANmC0KWlOD7sqlVTcBq3wZ1bC17IesAyn543ClVNVIoZYyWsaDvTo3f7iDk/qqRv2ZUSqOzg8RJbnNa9Af8bnBatF/SVBzFWkGFvMsyO8vxB3YqwuBEvWa7A0jVKj4tpAWtXJsnr4494YKnmkJytTH63PzGqCjP+OpoH1LA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eh0ijtfOgRHD11qbMmB/okRKvIXV0JQvm01j62erG4o/AApx6LWEACcQ8v+eG23Zb+uCqa32EoglgMnD1pK0eQGVqLl51VZoQlbRzh9Fm1kFiZZ0gNor8NkQhAPQJhVx9e6T0bAO/MXkYZYrBI16O1f7H74lJk49UrTUpSjDgo97h0WaVslsg19D77GHNtGZ/V15eVQH44C0lPaXr53v8bXdITslA30kP5SkYi8eFZOT7jE0izveq1dfsYTTn7NgoCdjtiytawXejL7B48tuPNE8uLjRmg164V4MhELjpQPgORYhNLAAUZvtBzdvCkLQslAwcgfEusULs8fkf9CQk4PCie8Cr18PAYCaXXIAsJo3A4nryvFjngIhMP9Tnn85HALuFJyd9XTcgURnLfFc9dW/RpKifqqGC/mM61lKD/dTAeGC4E+HPErieEZuqt3U
X-Exchange-RoutingPolicyChecked: 
	YhTmJzA3mVFYrLQcjIT9Al6ZQpM0ojqjenViNp4xKJAYfBMuT2XvzwFCqFPpeaE+P8igtRwTyU1+J02wAXPWEwjAUuRP1z6o5Puvt41whee3HAPmgvhOkODZUDE7m2jYMeRIN8l5PmLKPgCOXQMFeH4UXaI5g8BJZi+L8GJHSxL6vt+dqBIrHyAEA9Yc6pm3HvnlssbV7zsVtLDM+xYKOmysogvV3bS7si1RlY1GMDLhtz4gdYZi/DNR/6sJu/K6xRHHeveFfonTQBrmCJ7GEHj7SG3Rt5Umtp9yP+Z8FKfsTtRP35TrBJMXbF53vbF9KzkyP1Zg1nsdYt7pq/NLsw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:14:47.0350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9a9d6a-9646-433c-d91a-08ded2d4e04a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF0A8D5CDB5
X-Authority-Analysis: v=2.4 cv=WrAb99fv c=1 sm=1 tr=0 ts=6a3d53fb cx=c_pps
 a=3tfckwpITFtzIurveUQz+Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=J9y0zUTN5ob78gmyhsgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: QfUDtwS9-UilHjoUzf8rRII38tFdjEY-
X-Proofpoint-GUID: QfUDtwS9-UilHjoUzf8rRII38tFdjEY-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzOSBTYWx0ZWRfX9GWwJ/bJy+me
 ghOqTC4reJEz/IMe1i2Hjn6urbOmmamRfIvtRwURpFRyz0m7MVIEtOC3JvzNVH/kob+QYGyjFAh
 WCViv6qUZGV2SYbuwnZoSh0Tv85k5Es=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzOSBTYWx0ZWRfXwSAje7ld3wlI
 Ur6cSLWUUTaIav3zuOjOtuD3Z7IH2xtHufWoEOj1R11dHwmUKH7Wj9zIj/dd/wuLV01TBj7FmMC
 xAT9aBGVuLH4EYnysgDQDhC7BTHvPejZamThfzfbF5iet8y+oRyqd++F/aWz8HVwdgpXWGhYH2n
 UWPxrVltVlRg+K/BlREYNzyCkl+1sfSYtUDnOjlKaCNs5wWRzv2LIJhCEu80XPwxorVaWmLrAAY
 d/834EzsG/a4uzoc091Gh9cfJKpBOUrB5zIGZcijXU/pZDYvKWKmWpF9pi+ZjUQee4yHzWh0MXY
 0gn8cB5PfKC2GquoOthjWGzU3ROBY4qqH3wfBJAG/k8lO0gE/qnA2ay7VQDAu6VPJj6k4V+YvRg
 7BVNcV/F/99d3SyCtUI9xPs7UxfwMXKkDWD5EJSyIk3yRq0NAe/Xkiz6pj/FH3k/skiM1bQkEFx
 84GJp/EahLVXBab3iJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250139
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jun 2026 16:15:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20094


Is there a good reason that you dropped the guard structure that 
meta-arago had when you ported it over to meta-ti?  Even though what you 
are doing is technically ok, it still stands out versus almost all other 
bbappend patterns that we have in both repos.


On 6/25/2026 10:58 AM, Andrew Davis wrote:
> The conflicting firmware packages that necessitate this bbappend are
> all here in meta-ti-bsp, so this will be needed by any distro using
> this layer. Move this bbappend out of meta-arago to this layer.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../linux-firmware/linux-firmware_%.bbappend               | 7 +++++++
>   1 file changed, 7 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> new file mode 100644
> index 00000000..b37bec7a
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
> @@ -0,0 +1,7 @@
> +PR:append:ti-soc = ".tisoc1"
> +
> +# meta-ti-bsp packages newer versions on these
> +do_install:append:ti-soc() {
> +	rm -rf ${D}${nonarch_base_libdir}/firmware/ti-connectivity/
> +	rm -rf ${D}${nonarch_base_libdir}/firmware/cadence/
> +}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

