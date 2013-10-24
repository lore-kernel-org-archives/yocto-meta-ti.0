Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7CFD8E0175C
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 04:23:08 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 3E7CEF81217; Thu, 24 Oct 2013 05:23:08 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id BAD66F81216;
	Thu, 24 Oct 2013 05:23:06 -0600 (MDT)
Message-ID: <5269031E.4040504@mlbassoc.com>
Date: Thu, 24 Oct 2013 05:23:10 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <1382606978-9914-1-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1382606978-9914-1-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [PATCH] mesa appends: remove PROVIDES
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
X-List-Received-Date: Thu, 24 Oct 2013 11:23:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 2013-10-24 03:29, Andreas Müller wrote:
> These came in when mesa was reworked. Nowadays they are useless and what
> they try to do achieve is wrong: provider for virtual/libgsl should be
> mesa-gl. The appends were left in to avoid backward revision trouble in
> package feeds.

If this is the correct solution, I think these .bbappend files should be
removed completely.  They don't change anything and keeping them just to
retain the PRINC is useless because as is one cannot even build a system
which uses virtual/mesa, e.g. one using the X11 server.  In addition, the
main mesa recipe is about to be updated so they'll need changing again very
soon.

>
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>   recipes-graphics/mesa/mesa-omap3-common.inc | 7 -------
>   recipes-graphics/mesa/mesa_9.1.6.bbappend   | 3 ++-
>   recipes-graphics/mesa/mesa_git.bbappend     | 3 ++-
>   3 files changed, 4 insertions(+), 9 deletions(-)
>   delete mode 100644 recipes-graphics/mesa/mesa-omap3-common.inc
>
> diff --git a/recipes-graphics/mesa/mesa-omap3-common.inc b/recipes-graphics/mesa/mesa-omap3-common.inc
> deleted file mode 100644
> index 0340770..0000000
> --- a/recipes-graphics/mesa/mesa-omap3-common.inc
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -PRINC := "${@int(PRINC) + 1}"
> -
> -# avoid providing conflicts for libgles-omap3 compatibles
> -PROVIDES_omap3 = "virtual/libgl"
> -PROVIDES_ti814x = "virtual/libgl"
> -PROVIDES_ti816x = "virtual/libgl"
> -PROVIDES_ti33x = "virtual/libgl"
> diff --git a/recipes-graphics/mesa/mesa_9.1.6.bbappend b/recipes-graphics/mesa/mesa_9.1.6.bbappend
> index 164ec1b..8445337 100644
> --- a/recipes-graphics/mesa/mesa_9.1.6.bbappend
> +++ b/recipes-graphics/mesa/mesa_9.1.6.bbappend
> @@ -1 +1,2 @@
> -require mesa-omap3-common.inc
> +PRINC := "${@int(PRINC) + 1}"
> +
> diff --git a/recipes-graphics/mesa/mesa_git.bbappend b/recipes-graphics/mesa/mesa_git.bbappend
> index 164ec1b..8445337 100644
> --- a/recipes-graphics/mesa/mesa_git.bbappend
> +++ b/recipes-graphics/mesa/mesa_git.bbappend
> @@ -1 +1,2 @@
> -require mesa-omap3-common.inc
> +PRINC := "${@int(PRINC) + 1}"
> +
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

