Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E59CE0085D; Wed, 15 Feb 2017 05:53:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1338EE0082E
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 05:53:34 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1FDcE41012166
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 07:38:14 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1FDc9DO005615
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 07:38:09 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Feb 2017 07:38:08 -0600
Received: from [172.22.137.104] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1FDc8h4011932;
	Wed, 15 Feb 2017 07:38:09 -0600
Message-ID: <58A459AC.2050304@ti.com>
Date: Wed, 15 Feb 2017 07:37:48 -0600
From: Dan Murphy <dmurphy@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@yoctoproject.org>
References: <1487140318-116037-1-git-send-email-denys@ti.com>
In-Reply-To: <1487140318-116037-1-git-send-email-denys@ti.com>
Subject: Re: [morty/master][PATCH 1/2] linux-ti-staging: update to 4.9.10
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
X-List-Received-Date: Wed, 15 Feb 2017 13:53:36 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Denys

On 02/15/2017 12:31 AM, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging-rt_4.9.bb | 2 +-
>  recipes-kernel/linux/linux-ti-staging_4.9.bb    | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
> index 1355558..ecef4e6 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
> @@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
>  
>  BRANCH = "ti-rt-linux-4.9.y"
>  
> -SRCREV = "fca7cc6d34a3d18cbe5f54b77c0f5db12081acf8"
> +SRCREV = "eade06c1ea60e9069e35715b7b057eddae85a8e9"
> diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
> index 0c15c76..4f75415 100644
> --- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
> @@ -53,8 +53,8 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-lsk-linux-4.9.y"
>  
> -SRCREV = "b4aa954ead9260eaf7138755fc9d062a9f4630eb"
> -PV = "4.9.9+git${SRCPV}"
> +SRCREV = "74790f16e5ca9cb3dbbe8baa6086f35f7095694d"

I sent a similar patch but with an updated SHAs for both
You can take either one

> +PV = "4.9.10+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "a"


-- 
------------------
Dan Murphy


