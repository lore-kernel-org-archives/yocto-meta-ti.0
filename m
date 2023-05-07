Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1462DC77B7D
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 15:59:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.68372.1683475184082022627
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 07 May 2023 08:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1E8CA40C56
	for <meta-ti@lists.yoctoproject.org>; Sun,  7 May 2023 15:59:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8GLSdQQ0bGl for <meta-ti@lists.yoctoproject.org>;
	Sun,  7 May 2023 15:59:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0FD3D40ACD
	for <meta-ti@lists.yoctoproject.org>; Sun,  7 May 2023 15:59:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CA50E1638C9; Sun,  7 May 2023 11:58:59 -0400 (EDT)
Date: Sun, 7 May 2023 11:58:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: meta-ti mickledore plans
Message-ID: <20230507155859.GL9226@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 07 May 2023 15:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16497

All,

As you may know, Yocto Project 4.2 "mickledore" has just been released 
recently. As with the other non-LTS releases [1], meta-ti has no plans 
to branch off and separately support "mickledore". Currently active LTS 
branch in meta-ti is "kirkstone" (as "dunfell" is winding down), plus 
"master" branch being compatible with "mickledore".

[1] https://lists.yoctoproject.org/g/meta-ti/message/15137

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

