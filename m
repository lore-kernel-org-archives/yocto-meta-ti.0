Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C334CC6FA9D
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 18:01:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.30229.1677693686695468197
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 10:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WpPcal/D;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 321I1PoG037750
	for <meta-ti@lists.yoctoproject.org>; Wed, 1 Mar 2023 12:01:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677693685;
	bh=Ke1/njRurv2gQYCH5WtDkyyKN7MBk3XHaEk8OLiV/mw=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=WpPcal/DMVsWfglYca5IUBMiEaenGkHtUx2WWu7xfXRoqrwfAFKVchlKH7twR4A0h
	 2Qrmj/6zg3oMKxoEQ84kPQeO0wZ2BrzzxsWv0lI/ZjquYlWjU8IkL+oIgNY/sWtlp6
	 LFCjhLFAxoDyteH3sK1Dd4GONrl7eKVyTMKtsnS0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 321I1PTJ007275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 1 Mar 2023 12:01:25 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 1
 Mar 2023 12:01:24 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 1 Mar 2023 12:01:24 -0600
Received: from res-desktop (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 321I1OO5073058;
	Wed, 1 Mar 2023 12:01:24 -0600
Date: Wed, 1 Mar 2023 12:01:18 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [kirkstone][PATCH v8 0/4] Graphics, graphics, and more graphics
To: Ryan Eatmon <reatmon@ti.com>
CC: denys <denys@ti.com>, afd <afd@ti.com>, detheridge <detheridge@ti.com>,
        meta-ti <meta-ti@lists.yoctoproject.org>
Message-ID: <6QSUQR.GK2QP5NZGVZ31@ti.com>
In-Reply-To: <9c7225aa-4c4b-d1f8-4005-375058030774@ti.com>
References: <20230228003745.2884357-1-rs@ti.com>
	<9c7225aa-4c4b-d1f8-4005-375058030774@ti.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-eo6rZ7ofbPkW8d8TF0+E"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Mar 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15967

--=-eo6rZ7ofbPkW8d8TF0+E
Content-Type: text/plain; charset="us-ascii"; format=flowed

On Wed, Mar 1 2023 at 08:54:17 -06:00:00, Ryan Eatmon <reatmon@ti.com> 
wrote:
> Denys' series adds in a couple of other patches that assist in 
> cleaning up the flow for both kirkstone and master so I am going to 
> go with Denys' series.

Cool, I need to take a look at the weston and weston-init packages now. 
Weston-init upstream changed their install logic so they ship *either* 
the sysV init script or the systemd init script based on the selected 
init service and we have previously not made an effort to keep the two 
inits in sync.


--=-eo6rZ7ofbPkW8d8TF0+E
Content-Type: text/html; charset="us-ascii"

<div id="geary-body" dir="auto">On Wed, Mar 1 2023 at 08:54:17 -06:00:00, Ryan Eatmon &lt;reatmon@ti.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Denys' series adds in a couple of other patches that assist in cleaning up the flow for both kirkstone and master so I am going to go with Denys' series.</div></blockquote><div><br></div><div>Cool, I need to take a look at the weston and weston-init packages now. Weston-init upstream changed their install logic so they ship *either* the sysV init script or the systemd init script based on the selected init service and we have previously not made an effort to keep the two inits in sync.</div></div>
--=-eo6rZ7ofbPkW8d8TF0+E--

