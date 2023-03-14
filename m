Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EB1C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 17:25:26 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.658.1678814723607807051
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Mar 2023 10:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=u9hKexox;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32EHPLYQ001345;
	Tue, 14 Mar 2023 12:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678814721;
	bh=4/oYBTxhZtDZxNc5WjVWASykV9DDGUj60I+PCnAmhH0=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=u9hKexoxn328A3qif4E6KijnC30Lm6xsYsejIfNUpumzU3DXEjVK5cBQTVHz6JGgg
	 2aisAusveywsikQBTVtjIw/wdJtCR0fZ2KitBMUSdL4jQMy2IhQ1PCtJF79MunjXcA
	 MkT9ySOE6SreVa02gUKDUOBMHHhKKA7eMgBoVXjs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32EHPL1O047713
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Mar 2023 12:25:21 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 14
 Mar 2023 12:25:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 14 Mar 2023 12:25:20 -0500
Received: from rs-desk (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32EHPKoS006421;
	Tue, 14 Mar 2023 12:25:20 -0500
Date: Tue, 14 Mar 2023 12:25:15 -0500
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] [meta-ti][master/kirkstone][PATCH] linux-ti-staging:
 Add 6.1 recipe
To: <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Message-ID: <3QTIRR.5YU5672DIYH93@ti.com>
In-Reply-To: <20230314162027.28974-1-afd@ti.com>
References: <20230314162027.28974-1-afd@ti.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-wY98V0Qx7n67m+P4V+Jy"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Mar 2023 17:25:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15980

--=-wY98V0Qx7n67m+P4V+Jy
Content-Type: text/plain; charset="us-ascii"; format=flowed

On Tue, Mar 14 2023 at 11:20:27 -05:00:00, Andrew Davis via 
lists.yoctoproject.org <afd=ti.com@lists.yoctoproject.org> wrote:
> -PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
> +PREFERRED_PROVIDER_virtual/gpudriver ?= ""

For future reference, you can just comment out these lines. The 
variable being unset and equal to empty string should yield the same 
result.


--=-wY98V0Qx7n67m+P4V+Jy
Content-Type: text/html; charset="us-ascii"

<div id="geary-body" dir="auto">On Tue, Mar 14 2023 at 11:20:27 -05:00:00, Andrew Davis via lists.yoctoproject.org &lt;afd=ti.com@lists.yoctoproject.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">-PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/gpudriver ?= ""
</div></blockquote><div><br></div><div>For future reference, you can just comment out these lines. The variable being unset and equal to empty string should yield the same result.</div></div>
--=-wY98V0Qx7n67m+P4V+Jy--

