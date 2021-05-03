Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.2012.1620082047518621129
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 May 2021 15:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 5B6B538C0892
	for <meta-ti@yoctoproject.org>; Mon,  3 May 2021 22:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8FCF040C56;
	Mon,  3 May 2021 22:47:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5gHT1bNxtbMC; Mon,  3 May 2021 22:47:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 595F8409B0;
	Mon,  3 May 2021 22:47:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 890711745DB; Mon,  3 May 2021 18:47:21 -0400 (EDT)
Date: Mon, 3 May 2021 18:47:21 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: praneeth@ti.com, yogeshs@ti.com, meta-ti@yoctoproject.org
Subject: Re: [dunfell PATCH] recipes-kernel: perf: Add a perf.bbappend to handle RDEPENDS on newer kernel
Message-ID: <20210503224721.GI21867@denix.org>
References: <20210503224303.15093-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210503224303.15093-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 03, 2021 at 05:43:03PM -0500, Nishanth Menon wrote:
> Commit 159cdb159ad0 ("perf-tests: add bash into RDEPENDS (v5.12-rc5+)")
> in upstream openembedded-core layer.
> 
> Copying over a snippet of description over:
> 
> Commit 1dc481c0b0cf perf test: Change to use bash for daemon test
> in upstream kernel
> Changes tools/perf/tests/shell/daemon.sh to be explicitly bash
> (it was already required, but was just skipped on various
>  distros).
> 
> We add it into our RDEPENDS for perf-tests to fixup 5.12+
> builds.
> 
> We already have relatively heavy RDEPENDS for perf tests (python3), so
> adding bash into the RDEPENDS isn't signifcant even for older perf
> builds that use the same recipe.
> 
> [OE patch by: Bruce Ashfield <bruce.ashfield@gmail.com>]
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> 
> This patch should NOT be applied to master, since master of OE-core has
> the fixup for this.
> 
>  recipes-kernel/perf/perf.bbappend | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 recipes-kernel/perf/perf.bbappend
> 
> diff --git a/recipes-kernel/perf/perf.bbappend b/recipes-kernel/perf/perf.bbappend
> new file mode 100644
> index 000000000000..9915a2997b71
> --- /dev/null
> +++ b/recipes-kernel/perf/perf.bbappend
> @@ -0,0 +1,2 @@
> +
> +RDEPENDS_${PN}-tests =+ "bash"
> -- 
> 2.31.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
