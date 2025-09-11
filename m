Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A96CAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 12:20:19 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.45334.1757593213360961494
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 05:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HQWsklM8;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BCKCfD800283
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Sep 2025 07:20:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757593212; i=@ti.com;
	bh=yNoXN4Ae9sVGIAWVJplmIEzEG4KFthmUsoqakHmhG8c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HQWsklM8rmq2GMoqkRUSkcpMu5qwSFEvXp9Qie4DWZrd4sz5CjG0CSDSlSJOvBX7x
	 UOsj+K1DQaSBw3d4/9odnxGF7bygYtxMln6RNNdIwWxlrYxS3HJnXT8bZJOB2YElL4
	 LajGVa+YCJg5rVhtlEGwDUdc/LjNXIUJIjkUyaTg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BCKCBp484431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Sep 2025 07:20:12 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 07:20:12 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 07:20:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BCKCts1041664;
	Thu, 11 Sep 2025 07:20:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4F26C13F52C; Thu, 11 Sep 2025 07:20:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>
Subject: Re: [meta-ti] meta-ti-bsp: recipes-security: optee: Update to 4.7.0 tag
Date: Thu, 11 Sep 2025 07:20:12 -0500
Message-ID: <20250911122012.4161644-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250911105736.450595-1-s-joshi@ti.com>
References: <20250911105736.450595-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Sep 2025 12:20:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18993

meta-ti / na / 20250911105736.450595-1-s-joshi

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti] meta-ti-bsp: recipes-security: optee: Update to 4.7.0 tag
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:42
            Subject: [meta-ti] meta-ti-bsp: recipes-security: optee: Update to 4.7.0 tag
    
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: recipes-security: optee: Update to 4.7.0 tag. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: recipes-security: optee: Update to 4.7.0 tag.
              meta-ti-bsp:
              recipes-security: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti] meta-ti-bsp: recipes-security: optee: Update to 4.7.0 tag
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Thu, 11 Sep 2025 16:27:36 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4f0d7923bcc70cc9fb6f18cc5fea3dcd77386072

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508271122
- Commit SHA: 3dad773982636ade2ba685089e351ce69a28f9dc

Patches
----------------------------------------
FAIL - [meta-ti] meta-ti-bsp: recipes-security: optee: Update to 4.7.0 tag
    error: patch failed: meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc:1
    error: meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc:1
    error: meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc:1
    error: meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc: patch does not apply
    Applying: meta-ti-bsp: recipes-security: optee: Update to 4.7.0 tag
    Patch failed at 0001 meta-ti-bsp: recipes-security: optee: Update to 4.7.0 tag




