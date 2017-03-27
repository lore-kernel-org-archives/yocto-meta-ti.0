Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9CEFFE00A0C; Mon, 27 Mar 2017 07:59:36 -0700 (PDT)
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
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E6E2E00890
	for <meta-ti@yoctoproject.org>; Mon, 27 Mar 2017 07:59:35 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2REx034032283;
	Mon, 27 Mar 2017 09:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490626740;
	bh=qsEqfEFxZFZci3//Ivjlacd4d07tnr5uCc27cd7Q38E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Iy+RgM/PnA5yRoBCsTptxxMx7+sBEhpkIFzfVz2JNlHV6tLYegXhN6DUAIVU284IO
	GOvjRktYwyexJ/o1RxZCavAu38L/X8NL7tvFcL2GLwVYJ6u5oa7C49f7/gDvT+ZL4P
	ybBdpCV+oAc01n6vFV1tFXkK6njJdxiZkhLsHAyY=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2REx0Dj017627;
	Mon, 27 Mar 2017 09:59:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 09:58:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2REwxWP017293;
	Mon, 27 Mar 2017 09:58:59 -0500
Date: Mon, 27 Mar 2017 10:58:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20170327145858.GX29187@edge>
References: <1490576320-39277-1-git-send-email-denis@denix.org>
	<1490576320-39277-2-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1490576320-39277-2-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/master][PATCH] layer.conf: add unzip to HOSTTOOLS
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
X-List-Received-Date: Mon, 27 Mar 2017 14:59:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I'll hold it for master and add a comment into the file.

On Sun, Mar 26, 2017 at 08:58:39PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> CCS install uses unzip
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  conf/layer.conf | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index a07e62f..2ec76c2 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -27,3 +27,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>      qmss-lld \
>      multiprocmgr \
>  "
> +
> +HOSTTOOLS += "unzip"
> -- 
> 2.7.4
> 

