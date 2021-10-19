Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1184.1634686889086612472
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 16:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0095540BE9
	for <meta-ti@lists.yoctoproject.org>; Tue, 19 Oct 2021 23:41:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-H1PWaBlIAn for <meta-ti@lists.yoctoproject.org>;
	Tue, 19 Oct 2021 23:41:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E50CA406B5
	for <meta-ti@lists.yoctoproject.org>; Tue, 19 Oct 2021 23:41:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5DAC11746A0; Tue, 19 Oct 2021 19:41:27 -0400 (EDT)
Date: Tue, 19 Oct 2021 19:41:27 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: Using [dunfell/master] prefix for patches
Message-ID: <20211019234127.GV10132@denix.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

All,

Please be aware that master branch of meta-ti has had an invasive change due 
to the new override syntax in upstream OpenEmbedded:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=e21c11b4a44417f67c78503bc3f954c175ac20e2

In short, overrides (e.g. VAR_append, VAR_am57xx-evm, VAR_k3, VAR_prepend_j7 
and so on) now use : instead of _ so it is easy to distinguish variable names 
containing underscores from actual overrides.

As it is customary for TI developers to develop against LTS and submit patches 
with [dunfell/master] tag to be up-ported to master by a layer maintainer, it 
may no longer apply to master branch as is. It is up to the maintainer to 
either correct the issue manually when cherry-picking commits from dunfell to 
master. Alternatively, you might want to make maintainer's life easier and 
submit separate patches for dunfell and master, e.g.:

https://lists.yoctoproject.org/g/meta-ti/message/14062
https://lists.yoctoproject.org/g/meta-ti/message/14063

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
