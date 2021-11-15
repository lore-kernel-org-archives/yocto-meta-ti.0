Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2372.1637017796492000778
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 15:09:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7754C40C2B;
	Mon, 15 Nov 2021 23:09:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d7sE8ObduR61; Mon, 15 Nov 2021 23:09:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6197340027;
	Mon, 15 Nov 2021 23:09:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0FD161746CD; Mon, 15 Nov 2021 18:09:54 -0500 (EST)
Date: Mon, 15 Nov 2021 18:09:54 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: "Siraswar, Yogesh" <yogeshs@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] mpm-transport: Do not use append with += operator
Message-ID: <20211115230954.GX10132@denix.org>
References: <20211104172934.4088591-1-raj.khem@gmail.com>
 <16B46967FE386BDB.15444@lists.yoctoproject.org>
 <20211115202445.GV10132@denix.org>
 <c4da11b7-79b6-e63d-e318-01908ea85432@ti.com>
MIME-Version: 1.0
In-Reply-To: <c4da11b7-79b6-e63d-e318-01908ea85432@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 15, 2021 at 02:52:31PM -0600, Siraswar, Yogesh wrote:
> 
> 
> On 11/15/2021 2:24 PM, Denys Dmytriyenko wrote:
> >On Thu, Nov 04, 2021 at 01:54:16PM -0400, Denys Dmytriyenko wrote:
> >>On Thu, Nov 04, 2021 at 10:29:34AM -0700, Khem Raj wrote:
> >>>this is undefined behaviour, mant times devs used them together to get
> >>>the missing space at the beginning of string which append/prepend needs
> >>>but thats not intended behaviour
> >>>
> >>>Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>
> >>Acked-by: Denys Dmytriyenko <denys@konsulko.com>
> >
> >Yogesh,
> >
> >I don't believe this patch has made it into master...
> 
> Yes, I have not sync master. Is this applicable for dunfell?

This fixes a warning in master, since bitbake now checks for mixing 
append/prepend/remove overrides along with +=
In dunfell it's not checked and no warning, but it's still not recommended, 
so it's up to you.


> >>>---
> >>>  recipes-ti/mpm-transport/mpm-transport_git.bb | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>>diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
> >>>index 38aefc24..3b80af34 100644
> >>>--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
> >>>+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> >>>@@ -21,8 +21,8 @@ PR = "r0"
> >>>  CC += "-fcommon"
> >>>  EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
> >>>-EXTRA_OEMAKE:append:k2hk += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
> >>>-EXTRA_OEMAKE:append:k2e += "HYPLNK_TRANSPORT=true"
> >>>+EXTRA_OEMAKE:append:k2hk = " HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
> >>>+EXTRA_OEMAKE:append:k2e = " HYPLNK_TRANSPORT=true"
> >>>  INSANE_SKIP:${PN} += "ldflags"
> >>>  S = "${WORKDIR}/git"
> >>>-- 
> >>>2.33.1
> >>>

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
