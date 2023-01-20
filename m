Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA0CC25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:50:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.83265.1674240627505593952
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 10:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lxCd+OZD;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30KIoMjA087406;
	Fri, 20 Jan 2023 12:50:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674240622;
	bh=5025geGtiknqMwolkcbLLBRGfQ9pcYg/jstEvoLvVdQ=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=lxCd+OZDzi9IyffTl8WOHKXwuAIQG08l37D3N5+uoFSIYGMwiI8TmpB1CVVUd/1dl
	 Pd7t/QpQTsGdZGQQNddrnIzPzZgX3ONjZs6qOKObAjh/7h62KG93Lm1sbqIwPr5UPr
	 GnOVLdCIcoti8J9ZpnwVrMJdl55Y7KAZlvBHJPVE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30KIoMLl063837
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Jan 2023 12:50:22 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 20
 Jan 2023 12:50:22 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 20 Jan 2023 12:50:22 -0600
Received: from res.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30KIoLNQ043267;
	Fri, 20 Jan 2023 12:50:21 -0600
Date: Fri, 20 Jan 2023 12:50:16 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [master/kirkstone][PATCH] all: Graphics
 recipe overhaul
To: Denys Dmytriyenko <denis@denix.org>
CC: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>
Message-ID: <SBSSOR.I33PHI6LU4AA@ti.com>
In-Reply-To: <20230120182636.GP22689@denix.org>
References: <20230119204026.1297616-1-rs@ti.com>
	<20230120182636.GP22689@denix.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 18:50:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15613

On Fri, Jan 20 2023 at 01:26:36 PM -0500, Denys Dmytriyenko 
<denis@denix.org> wrote:
> E.g. if you are copying the entire Mesa set of recipes, include files 
> and
> patches, it should have been a separate patch with just that w/o any
> modifications, clearly stating that this is a verbatim copy and 
> specify which
> repo and branch/tag they are being picked up from - openembedded-core 
> repo,
> kirkstone branch.
> 
> But then I would argue that a simple mesa_%.bbappend is smaller and 
> much
> easire to review. For example, I took your previous v4 revision of 
> the patch
> and dropped all copies of upstream Mesa, replacing it with a bbappend:
> https://patchwork.yoctoproject.org/project/ti/patch/20230119010333.3414485-1-denis@denix.org/

Right, sorry about that. You are correct that the duplication of mesa 
and mesa patches should have occurred in a separate patch, however it 
should not be a blanket BB appends. The reason this duplication exists 
is that upstream mesa will move faster than our modified versions (as 
much as I would like to avoid it) and this will prevent things from 
silently creeping forward and breaking. The umlibs are still dependent 
on particular, patched releases of mesa.

On Fri, Jan 20 2023 at 01:26:36 PM -0500, Denys Dmytriyenko 
<denis@denix.org> wrote:
> I looked at this repo - it's a personal copy of upstream Mesa with 
> Imagination
> PVR patches applied on top. Was it reviewed and approved by OSRB? 
> Were the
> patches made public before and/or permitted to be 
> published/distributed?

Those patches inherited the license of mesa and therefore did not need 
approval from OSRB. I did, however, get IMG's grace to release them 
anyway. The reason why it's a personal repo is there is certain 
functionality that I believe can be upstreamed and I believe hosting 
that process on freedesktop will help reduce friction and be a little 
more transparent about our efforts.

On Fri, Jan 20 2023 at 01:26:36 PM -0500, Denys Dmytriyenko 
<denis@denix.org> wrote:
> Only rogue?

Only rogue. I added all the necessary hooks for sgx but it still needs 
work before it can fall in line with my changes. The mesa layer needs 
some TLC and the umlibs will need some packaging changes. Thankfully 
SGX can now be disabled until we have it working by removing 
powervr-sgx-graphics from the distro features string.



