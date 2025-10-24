Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AF6CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 16:00:21 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.15422.1761321613092726404
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 09:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wvamfr0y;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59OG0BU51919817;
	Fri, 24 Oct 2025 11:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761321611; i=@ti.com;
	bh=n4GnxdS8ijxgfpGUv6ZBsNV36Unws1vDQwDuqDblHgI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wvamfr0yece1NB2QD+awn7okpYdV/f/Y7K2gqc8/ITQYdX5M0jHp/pumKeTidKtY3
	 luWswxX5nUSauzLiQ2KywvG/665S875JcUsvaYNeJJwRbBpnVJWAn8GZAtHScUA8h8
	 1dmW/pVUinySzwZyK4Da6fprI/FGKG2ud3Jw2rfE=
Received: from DFLE213.ent.ti.com (dfle213.ent.ti.com [10.64.6.71])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59OG0BLE3985263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 11:00:11 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 11:00:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 11:00:11 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59OG0ABn575245;
	Fri, 24 Oct 2025 11:00:11 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E5195181223; Fri, 24 Oct 2025 11:00:10 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: Re: [PATCH] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license
Date: Fri, 24 Oct 2025 11:00:10 -0500
Message-ID: <20251024160010.3526021-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251024155651.2688089-1-v-singh1@ti.com>
References: <20251024155651.2688089-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Oct 2025 16:00:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19174

meta-ti / na / 20251024155651.2688089-1-v-singh1

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [PATCH] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:41
            Subject: [PATCH] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license
    
    WARN: Commit message does not include file/recipe name: meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license.
              ipc: (COMMIT-MESSAGE-3)
        patch
    
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-UPDATE-1)
        patch




