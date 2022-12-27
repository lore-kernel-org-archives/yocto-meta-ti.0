Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16CDC4167B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 17:55:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.162574.1672163741218679785
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Dec 2022 09:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OFtORNRu;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BRHteTI123837;
	Tue, 27 Dec 2022 11:55:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672163740;
	bh=GZ4MSbNvzglPWKJQmqDPNbir4WSWV0o/oUD3nCX+cRU=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=OFtORNRuetErrZjzqoBBmwEUoSWkzFOvB9PvC/EXH18zyxZvnQR/chbLVfFsvhyph
	 +qfGrpEgu2K5O8qTFas1FtdIjXb1gntDcGKsydmhKy6JSQQQiAtvXmv83W26XHUjQq
	 lW7fbEM1r/ZOIV0k2jWAN6foVzDruorrO3/bsCW8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BRHteMI016971
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Dec 2022 11:55:40 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 27
 Dec 2022 11:55:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 27 Dec 2022 11:55:39 -0600
Received: from [10.249.32.65] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BRHtam0009914;
	Tue, 27 Dec 2022 11:55:36 -0600
Date: Tue, 27 Dec 2022 11:55:30 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [master][PATCH v4] meta-ti-bsp:
 Graphics recipe overhaul
To: Paul Barker <paul.barker@sancloud.com>
CC: <reatmon@ti.com>, <denys@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Message-ID: <IS9KNR.MN0Y5UHMX769@ti.com>
In-Reply-To: <4b9d9f9f-3b1c-4584-0b57-1b3d04a2b10d@sancloud.com>
References: <20221215040632.1404997-1-rs@ti.com>
	<91ceba60-0648-18ae-3890-50006ab84532@sancloud.com>
	<DD29NR.846A5X9VPNPO3@ti.com>
	<4b9d9f9f-3b1c-4584-0b57-1b3d04a2b10d@sancloud.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-wYbkwRH+stWsJo2yg2+1"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 27 Dec 2022 17:55:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15505

--=-wYbkwRH+stWsJo2yg2+1
Content-Type: text/plain; charset="us-ascii"; format=flowed

On Fri, Dec 23 2022 at 14:42:12 +00:00:00, Paul Barker 
<paul.barker@sancloud.com> wrote:
> Understood. In the next version of this patch, please include the list
> of MACHINEs or SoC families which are addressed by these changes. I'd
> also recommend splitting this up into multiple commits if possible so
> it's easier for external subscribers to this list to understand the
> changes.

Roger. My only concern for that is making sure these patches are 
bisectable, and this is a sweeping change that can't really be split up 
into multiple compilable patches. Recipies being updated that rely on 
other repipies and machine feature unfortunatly means this is all or 
nothing.

On Fri, Dec 23 2022 at 14:42:12 +00:00:00, Paul Barker 
<paul.barker@sancloud.com> wrote:
> I'm happy to review & test graphics fixes for am335x/am65xx/am62xx 
> when
> they arrive as we're using those SoCs.

This patch currently applies to am62xx, j721s2, j721e.


--=-wYbkwRH+stWsJo2yg2+1
Content-Type: text/html; charset="us-ascii"

<div id="geary-body" dir="auto">On Fri, Dec 23 2022 at 14:42:12 +00:00:00, Paul Barker &lt;paul.barker@sancloud.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Understood. In the next version of this patch, please include the list
of MACHINEs or SoC families which are addressed by these changes. I'd
also recommend splitting this up into multiple commits if possible so
it's easier for external subscribers to this list to understand the
changes.
</div></blockquote><div><br></div><div>Roger. My only concern for that is making sure these patches are bisectable, and this is a sweeping change that can't really be split up into multiple compilable patches. Recipies being updated that rely on other repipies and machine feature unfortunatly means this is all or nothing.</div><div><br></div><div>On Fri, Dec 23 2022 at 14:42:12 +00:00:00, Paul Barker &lt;paul.barker@sancloud.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I'm happy to review &amp; test graphics fixes for am335x/am65xx/am62xx when
they arrive as we're using those SoCs. </div></blockquote><span style="white-space: break-spaces;"><br></span></div><div><span style="white-space: break-spaces;">This patch currently applies to am62xx, j721s2, j721e. </span></div></div>
--=-wYbkwRH+stWsJo2yg2+1--

