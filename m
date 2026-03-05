Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50333F47CD4
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 20:51:58 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54401.1772743914444042800
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 12:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=xR5YHAJa;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.62, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLyVZnQoYJRZgIKyfJJoIo/B6U4rbSkFWGNs1DHe7kGjKDYLKeiwWxKJu8nvzDODC5bQn63n4Mfs+1lYEIiTiDy8s8B0J0sIo/CaaHd51UBU69xV/Mq4xV5C5WdKZlZ/2WHiZ/QiNFM1k2aLmXaTQuP7antaJv4pg8lmkUqzIkEkPdPrzmebTl4F82/QvKCPeem5gEnVPEx74jzHXQ7TGvikME2uTaNJqfs8R+7xf52KQkeLawpzOjG82aM1dizZfkUVzucAWT/e69jN2tT7N4dQ4TGXNaJ2TjS1f8LuFxgQ28TJRoshHurAi4SykD28Z+axE2ofillHb3qPimEiSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XayTbcJNlLQilQjpa8OiKlM64DFB/B3+cXNC/BIP3IA=;
 b=WqfDFW4SPdo40lP+/7tCtRCzQs+ySTLvLKSzUT6U3b/dHpo2r7QwbJfvJTR29qM8tS48MJMiyBh0NebJvFBkyKUYw1OlYPWs7MIx6IvH3bg/ac1zXUp5vw5NkgAgYmBRsbmQD5UacnRmaoi9b/gRAOSLq8Zx1p5GBHsiNkQcK1jpRMCiPMrkKnGF+iuC1fw8HwgdVqyHRVQhIk0WXUCXgh5sv0O5kjAdxzzjhbIm5TgGBjNCnGzGQwf6lOUiO/2cbp1OEUa/t5L9VrGlysCMGHnVzTrmPSgd12KrhgJGQy4uRD8pRAJbw9kOVAgfwgyBSe1XB2YiFoUN96ozXuYLQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XayTbcJNlLQilQjpa8OiKlM64DFB/B3+cXNC/BIP3IA=;
 b=xR5YHAJalAeno3SIDnNePhvcaRQIltOnPyDbNUHzbOT7O0wE3Ay68NC5SMCfU+4yeyM2/aFTr6BqbzdSq9HpyqaFnEDWDMo+Ht5MNI2m9rU4bG077mzdBAcOnbys+ruMcKLCQ71w7kwI++c4eFv2VBV6Ok5si7Jfl6goKY0oc7g=
Received: from BY5PR20CA0025.namprd20.prod.outlook.com (2603:10b6:a03:1f4::38)
 by SJ0PR10MB5696.namprd10.prod.outlook.com (2603:10b6:a03:3ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 20:51:51 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::3c) by BY5PR20CA0025.outlook.office365.com
 (2603:10b6:a03:1f4::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 20:51:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 20:51:50 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:51:45 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:51:44 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 14:51:44 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625KpiuQ3018665;
	Thu, 5 Mar 2026 14:51:44 -0600
Message-ID: <525a7c96-f504-4ddc-81b6-709974825760@ti.com>
Date: Thu, 5 Mar 2026 14:51:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v4 1/3] linux-ti-staging: Add LUKS
 encryption config
To: Shiva Tripathi <s-tripathi1@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <rs@ti.com>, <jcormier@criticallink.com>, <praneeth@ti.com>,
	<kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>, <denis@denix.org>,
	<vigneshr@ti.com>
References: <20260305172148.3684377-1-s-tripathi1@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260305172148.3684377-1-s-tripathi1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|SJ0PR10MB5696:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa8d956-5171-4f27-f2b3-08de7af90654
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|82310400026|1800799024|36860700016;
X-Microsoft-Antispam-Message-Info: 
	bOWBIYvbiUvLuZfEkavJlt835Pd7jAwbuZRt8etupFRq6fDBNS9FDiK/YZ9BxKP6j+ffSbvC20e7uC3QiZm6IJHCxolFaYlsYWdHst6jjOn+51bOiV5kUQyNw49nlUSsEp4uRHQ7rHTw2wiqflAHYqqd1kbVMpH5ZiEuiZLexM8OkGMytxiC/rpDrOJpwHY//UtityrYCiq2eniX0/p0V8TDi/ZI+biO2UWuiz/782+fF70JLTnX974FgYnUyy+Rj3xAlBE57/eFtVkJpCAt3MGNR7WyfM25faWrGWJNHf786Ht2QleHpbmlJYhkJ/0y+nrazLsmJI8PXlHVWIuR+0Xpzg0fzBz9TRG+Tl0OGaZupWRzC4ppAq+wBtoPafA1/GUk5xDE2aUJ7wKqUQGDYD1gh49VEtamJu4NIzaUmymYmKj3N6jI7ZW4w1wbTEMRmbIZt/NI+jWp9M4aIn5dbIWS6nFAP9JTDafUBh0LQC8pWDmBUfdeiptx4E+088GgTfenc+MjektbJqZZ1BWtLBvdkO5y72Pl1syb/YPQ6W+cy3d1vnOVuGMLlPpKDq8aHYrIipEqIzydS11WWPNnDelaOblICSYs8yqw8RGsZIHxORCbmaEmQ6Wxbg9B/Q6gyLE4I6bkmrzTPdAZ+uOn2TqAUP3w+It2bnYe6hMPw9Q6hNwJ0lYD3w1hRr4mr4aAU1/28muNZ7iAq2W1imOLQLSbjZwgskXunzabKoQ/E6XqbeQpMLWSpiPKGPsj/PgIqZRT0tL3bk+ynyKsBY92iQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(82310400026)(1800799024)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	czVbcwYqCyH6N82JrOvcdnQ4aRCxFT1nHoAGZ5ghk/lYe1JMxsOU43zdwZUAInqAqadd5q51tYtEmWim3wEnKOKbxUYG4OPz5tomR+BDWDD0ub3ZJKJhYYihWzoI4w133j6qaQPiU7Uf23g9BJ+ZOkL3omIDyWLfXtRAApNEfa9lp3uLEHFjqeRp03Wc9cGzuwu8U5AyiwcELA3N+ot5pzyZjELarA3N3VgHevXZkTMk6jBhPQL76L4ssT89PpS4abwQgig6mgqkn36m4T357P9HoBZ1TbwHKzAbU6Kv44jQ94AKAX22aYG/wAQ46xLZ05SdkHexwjvJN484kk98Kz+ou2sZuhU9ktDFuE8dFt83QMQQufG8prKRhWLmnURvmSAJznKzLTUaBr/mWDNDO12FWj4bvdHlTo/8VuF1LlneZVa9Xg4PRgp72ogFjyGt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:51:50.3508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa8d956-5171-4f27-f2b3-08de7af90654
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5696
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 20:51:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19659



On 3/5/2026 11:21 AM, Shiva Tripathi wrote:
> Add conditional kernel configuration fragment for LUKS encryption with
> fTPM support. This enables dm-crypt and necessary crypto algorithms
> when MACHINE_FEATURES contains 'luks-encryption'.
> 
> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>   .../linux/linux-ti-staging-6.18/luks-ftpm.cfg | 28 +++++++++++++++++++
>   .../linux/linux-ti-staging_6.18.bb            |  9 ++++++
>   2 files changed, 37 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
> new file mode 100644
> index 00000000..234cc087
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
> @@ -0,0 +1,28 @@
> +# Device Mapper support
> +CONFIG_MD=y
> +CONFIG_BLK_DEV_DM=y
> +CONFIG_DM_CRYPT=y
> +
> +# Crypto algorithms for LUKS
> +CONFIG_CRYPTO_XTS=y
> +CONFIG_CRYPTO_AES=y
> +CONFIG_CRYPTO_AES_ARM64=y
> +CONFIG_CRYPTO_AES_ARM64_CE=y
> +CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
> +CONFIG_CRYPTO_SHA256=y
> +CONFIG_CRYPTO_SHA256_ARM64=y
> +CONFIG_CRYPTO_SHA512=y
> +CONFIG_CRYPTO_USER_API_HASH=y
> +CONFIG_CRYPTO_USER_API_SKCIPHER=y
> +
> +# Additional crypto support for LUKS2
> +CONFIG_CRYPTO_CBC=y
> +CONFIG_CRYPTO_ECB=y
> +CONFIG_CRYPTO_ESSIV=y
> +CONFIG_CRYPTO_LRW=y
> +CONFIG_CRYPTO_PCBC=y
> +
> +# TPM kernel modules needed for initramfs
> +CONFIG_TCG_TIS_CORE=m
> +CONFIG_TCG_CRB=m
> +
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
> index 8e4ccd7d..69d6217f 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
> @@ -35,3 +35,12 @@ module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
>   module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
>   module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
>   KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
> +

After thinking about this a little more... I'm thinking that the 
luks-encryption is more of a DISTRO_FEATURE and not a MACHINE_FEATURE. 
"tpm" would be a MACHINE_FEATURE.

And the best most correct thing to do would be to do some combination of 
the two.  I assume that only some of our boards have tpm support, right?

So I would go through the effort to add that to all of the correct 
boards, and then change the logic to check both variables.  I'll reply 
on the other patches with those changes.


> +# LUKS encryption with fTPM kernel configuration
> +SRC_URI:append:k3 = " \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'file://luks-ftpm.cfg', '', d)} \

${@bb.utils.contains('DISTRO_FEATURES', 'luks', 'file://luks-ftpm.cfg', 
'', d)}


> +"
> +KERNEL_CONFIG_FRAGMENTS:append:k3 = " \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', '${UNPACKDIR}/luks-ftpm.cfg', '', d)} \
> +"
> +

${@bb.utils.contains('DISTRO_FEATURES', 'luks', 
'${UNPACKDIR}/luks-ftpm.cfg', '', d)}




-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

