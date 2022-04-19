Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F37C43217
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.1809.1650411264471884959
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 16:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LlfMJ2ey;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23JNYNN1116378
	for <meta-ti@lists.yoctoproject.org>; Tue, 19 Apr 2022 18:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650411263;
	bh=+ZZtDJSJMu1MIXRvyi/5a6wCd5YlmWxRLIsaMzqOVE8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LlfMJ2eyptcObrK0IqEOoWyZarowo1Rb3XPM8TOiBljeVrolyLa+Us/vy381iAF6e
	 eRTEZnvXYO1al+gqWJ+4QyrUoB7+ao8LCCV4iNhzSjcNmnhy61J4A0AZnj5kMjGJaB
	 gUAlOnK9d+5AlZdfKO1pFW4TpPAgWOBVPVVwszD4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23JNYNB1080722
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 19 Apr 2022 18:34:23 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Apr 2022 18:34:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Apr 2022 18:34:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23JNYLr4033526;
	Tue, 19 Apr 2022 18:34:22 -0500
Date: Tue, 19 Apr 2022 18:34:21 -0500
From: Nishanth Menon <nm@ti.com>
To: Devarsh Thakkar <devarsht@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <nikhil.nd@ti.com>,
        <nsekhar@ti.com>, <vigneshr@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <a-m1@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH] u-boot-ti: Use SRCREV to get short
 commit ID
Message-ID: <20220419233421.ngbixhxdyjqr7hbc@penholder>
References: <20220419154734.6346-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220419154734.6346-1-devarsht@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14607

On 21:17-20220419, Devarsh Thakkar wrote:
> Due to recent security update in git, we are
> not able to fetch revision currently using existing method:
> https://github.blog/2022-04-12-git-security-vulnerability-announced/
> 
> So instead, use the SRCREV to parse the short commit ID
> and set the UBOOT_LOCALVERSION variable.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti.inc | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index 231b7647..cc775e2e 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -1,14 +1,6 @@
>  # UBOOT_LOCALVERSION can be set to add a tag to the end of the
>  # U-boot version string.  such as the commit id
> -def get_git_revision(p):
> -    import subprocess
> -
> -    try:
> -        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE, universal_newlines=True).communicate()[0].rstrip()


I see a similar logic in
recipes-kernel/linux/setup-defconfig.inc as well.

Considering similar problem

https://lore.kernel.org/all/20220413155249.3458236-2-raj.khem@gmail.com/

was wondering as to what might be a better way to solve this?

There is also git rev-parse HEAD instances in oe-core as well and
bitbake(lib/layerindexlib/cooker.py) as well.

I wonder since we know cwd=p, could we use that to set
https://git-scm.com/docs/git/2.35.2#Documentation/git.txt-codeGITCEILINGDIRECTORIEScode
 (which if my understanding is right, came in around v1.5.5.1-319-g0454dd93bfb2)

OR maybe just set it to the base conf similar to what was done on
master oe-core/meta/conf/bitbake.conf (commit
02ecf3e2a98a614805f6f2574c2bf14162192d01 "bitbake.conf: Prevent git from
detecting parent repo in recipe")?

I am not sure if we should considering just side stepping this issue via
just not using the git to get the version string.. just my 2 cents.
> -    except OSError:
> -        return None
> -
> -UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
> +UBOOT_LOCALVERSION = "-g${@d.getVar("SRCREV", False).__str__()[:10]}"
>  
>  UBOOT_SUFFIX ?= "img"
>  SPL_BINARY ?= "MLO"
> -- 
> 2.17.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

