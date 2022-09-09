Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4040AECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 16:28:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1060.1662740901228078131
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Sep 2022 09:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H8gjVYkm;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 289GSJEQ060365
	for <meta-ti@lists.yoctoproject.org>; Fri, 9 Sep 2022 11:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662740899;
	bh=FpDN346oSaCQv7eBejULMRo6NAXmCy/kBDeavG6papc=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=H8gjVYkmqsfguCR2Bs4qLGMfO8mOcA+2dzhaxVEqolrLVCEw/vr2kxtTvh/Sjmu4A
	 qWtGls4qJKoqNzwLHgU+NfQrKvwI08wYDEjXFzrscORkdNzMZ2iL5jpf/W7v4KU0o6
	 PRddYn1gARE6QUhXLgHo3muBG6Wlbwlx1/Mx2NlI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 289GSJjh026449
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 9 Sep 2022 11:28:19 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 9 Sep
 2022 11:28:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 9 Sep 2022 11:28:19 -0500
Received: from res.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 289GSJOv075289;
	Fri, 9 Sep 2022 11:28:19 -0500
Date: Fri, 9 Sep 2022 11:28:13 -0500
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [meta-ti] [dunfell][PATCH] ti-sci-fw: Use d.getVar() in DEPENDS
 expression
To: Andrew Davis <afd@ti.com>
CC: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Message-ID: <13BYHR.0IQPEKD6T7ZE3@ti.com>
In-Reply-To: <6015a645-b1ea-c87c-2b1e-00870118dea1@ti.com>
References: <20220902201247.605908-1-rs@ti.com>
	<6015a645-b1ea-c87c-2b1e-00870118dea1@ti.com>
X-Mailer: geary/3.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Sep 2022 16:28:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15015

On Tue, Sep 6, 2022 at 13:37, Andrew Davis <afd@ti.com> wrote:
> I had originally done it this way (just due to copy/paste from 
> elsewhere), but
> couldn't think of a case that would cause mangling, do you have an 
> example?

Ah, sorry. I didn't actually spend the time to see if it was actually 
mangling from the variable or just Yocto moving away from this notation 
and python choking on the un-expanded variable.

https://docs.yoctoproject.org/dunfell/ref-manual/migration-2.1.html?highlight=d+getvar#variable-expansion-in-python-functions



