Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 440D0E0093F; Thu,  2 Mar 2017 09:13:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A299E0049D
	for <meta-ti@yoctoproject.org>; Thu,  2 Mar 2017 09:13:50 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v22HDcue018736;
	Thu, 2 Mar 2017 11:13:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488474818;
	bh=jRYB3NPb20jHh2VBSJdhnk3kfraBl761FKc9fu/+Rdk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Xcq45/ZkxpN8PO1TTos8Sxde5CMwqg/mpYLcJgkqQjcvdw15oz2ihueec7NUYYL02
	sRkuunJ+8owgxYAZRiyRUGPxn8Fi+pCYTolupGgQf1YwjsBvqOTLVyyJJdt+mta+Sv
	tc5HlzkfoGAOYlsOKwM8FapmDNK1e9wrI0190ogY=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v22HDbwx000928;
	Thu, 2 Mar 2017 11:13:37 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Mar 2017 11:13:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v22HDbUw009851;
	Thu, 2 Mar 2017 11:13:37 -0600
Date: Thu, 2 Mar 2017 12:13:36 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20170302171336.GQ12614@edge>
References: <1488443615-2456-1-git-send-email-gary@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <1488443615-2456-1-git-send-email-gary@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] beaglebone.inc: Update use of obsolete bitbake API
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
X-List-Received-Date: Thu, 02 Mar 2017 17:13:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ah, right, I forgot about this API change when pushing to master... Thanks.

On Thu, Mar 02, 2017 at 09:33:35AM +0100, Gary Thomas wrote:
> The bb.data.getVar() API has been deprecated & removed.  This change
> follows that change and allows MACHINE=beaglebone to work again.
> 
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  conf/machine/include/beaglebone.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/beaglebone.inc b/conf/machine/include/beaglebone.inc
> index f76ad3d..b10146d 100644
> --- a/conf/machine/include/beaglebone.inc
> +++ b/conf/machine/include/beaglebone.inc
> @@ -1,5 +1,5 @@
>  python () {
> -    layers = bb.data.getVar("BBFILE_COLLECTIONS", d, 1)
> +    layers = d.getVar("BBFILE_COLLECTIONS", True)
>      if not layers:
>          return
>      if "yoctobsp" in layers:
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

