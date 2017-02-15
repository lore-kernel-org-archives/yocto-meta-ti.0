Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 255BEE0085D; Wed, 15 Feb 2017 05:43:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27DB0E0082E
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 05:43:06 -0800 (PST)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 3421368A01C; Wed, 15 Feb 2017 13:43:05 +0000 (GMT)
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id EFEF268A019;
	Wed, 15 Feb 2017 13:43:00 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id A233D67403CF;
	Wed, 15 Feb 2017 14:43:00 +0100 (CET)
To: meta-ti@yoctoproject.org
References: <1487165751-5963-1-git-send-email-dmurphy@ti.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <184f3aba-8806-6187-fdb9-5357bb94b5ad@mlbassoc.com>
Date: Wed, 15 Feb 2017 14:43:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487165751-5963-1-git-send-email-dmurphy@ti.com>
Subject: Re: [PATCH] linux-ti-staging: update to 4.9.10
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
X-List-Received-Date: Wed, 15 Feb 2017 13:43:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-02-15 14:35, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging-rt_4.9.bb | 2 +-
>  recipes-kernel/linux/linux-ti-staging_4.9.bb    | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
> index 1355558a..c6c06954 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
> @@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
>
>  BRANCH = "ti-rt-linux-4.9.y"
>
> -SRCREV = "fca7cc6d34a3d18cbe5f54b77c0f5db12081acf8"
> +SRCREV = "68704903155296c0b09ce0ea0de8909e7592de65"
> diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
> index 0c15c76a..416420c3 100644
> --- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
> @@ -53,8 +53,8 @@ S = "${WORKDIR}/git"
>
>  BRANCH = "ti-lsk-linux-4.9.y"
>
> -SRCREV = "b4aa954ead9260eaf7138755fc9d062a9f4630eb"
> -PV = "4.9.9+git${SRCPV}"
> +SRCREV = "1c74e8801cf58a30394ae92236895599f2c77253"
> +PV = "4.9.10+git${SRCPV}"
>
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "a"
>

Why are these different from the patch Dennys send earlier today
marked for morty branch?  Shouldn't 4.9.10 be the same in both trees?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

