Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ECE18E0094C; Mon, 24 Apr 2017 11:00:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [198.47.27.77 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C47B3E00777
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 11:00:24 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OI0NmE027661
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 13:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493056823;
	bh=+SvMJHzKeNVF8vlr9fyGT3kU0BsCDYdM69+o6qvTv4c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HJ+5vRHH69LLsrgjE9nlxItNlVaEk/pxreHO0jQIM5QO+/XrBWX7v041WP5Wa8jZP
	YWW7py0ETs+bHQqfbl//Qd3stir7NzahxPh7iLy2yQNkTeRmz6S+ofMDl3iW5/dhHt
	JYb8Yf66i7oV7Mq12fVVliBXKGIZZ/EWvKp/vlW0=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OI0NTD030454
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 13:00:23 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 13:00:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OI0NOv027405;
	Mon, 24 Apr 2017 13:00:23 -0500
Date: Mon, 24 Apr 2017 14:00:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20170424180022.GF24846@edge>
References: <1493056283-45773-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1493056283-45773-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/master][PATCH] mpm-transport: Update to new version 2.0.4.0
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Apr 2017 18:00:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

What's the difference from this:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=c734db427cdb3a38614f5e132269a599fab9cdb1


On Mon, Apr 24, 2017 at 01:51:23PM -0400, Sam Nelson wrote:
> - Add INSANE_SKIP ldflags to avoid warning
> - Add no-preserve-ownership to avoid host contamination warning
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/mpm-transport/mpm-transport_git.bb | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
> index 0690807..bf02c0b 100644
> --- a/recipes-ti/mpm-transport/mpm-transport_git.bb
> +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> @@ -15,15 +15,16 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
>  
>  BRANCH = "master"
> -# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.03.00
> -SRCREV = "ba53217c5db1a6f9d21a0c8f50e9e30a6efa8be8"
> +# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.04.00
> +SRCREV = "e0e44fe55bef7ddf89f7ff3574f07fa906e72a37"
>  
> -PV = "2.0.3.0"
> +PV = "2.0.4.0"
>  PR = "r0"
>  
>  EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
>  EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
>  EXTRA_OEMAKE_append_k2e += "HYPLNK_TRANSPORT=true"
> +INSANE_SKIP_${PN} += "ldflags"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -43,7 +44,7 @@ do_install() {
>  	install -c -m 644 ${S}/include/* ${D}${includedir}/
>  
>  	install -d ${D}${libdir}/
> -	cp  -a ${S}/lib/* ${D}${libdir}/
> +	cp  -a --preserve=mode,timestamps --no-preserve=ownership ${S}/lib/* ${D}${libdir}/
>  
>  	install -d ${D}${sysconfdir}/mpm/
>  	install -c -m 644 ${S}/scripts/mpm_config.json ${D}${sysconfdir}/mpm/mpm_config.json
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

