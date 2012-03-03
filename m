Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CF2FE01363
	for <meta-ti@lists.yoctoproject.org>;
	Sat,  3 Mar 2012 05:55:40 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0B00273AOBBHB1@vms173015.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Sat, 03 Mar 2012 07:55:24 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7E88720264; Sat,
	03 Mar 2012 08:55:23 -0500 (EST)
Date: Sat, 03 Mar 2012 08:55:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120303135523.GJ24667@denix.org>
References: <1330771988-13742-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1330771988-13742-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 1/3] SOC_FAMILY: add to MACHINE_OVERRIDES locally
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2012 13:55:40 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Mar 03, 2012 at 11:53:06AM +0100, Koen Kooi wrote:
> This breaks the hard dependency on Angstrom for getting a sane set of 
> recipes.
> 
> The variable name is kept the same and the actual code moved from 
> angstrom.inc to soc-family.inc to make it clear what it is doing and how.

Ah, nice workaround until/if it gets accepted upstream to OE-Core! Thanks, 
Koen.

-- 
Denys


> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  conf/machine/include/omap3.inc      |    1 +
>  conf/machine/include/omap4.inc      |    1 +
>  conf/machine/include/omapl138.inc   |    1 +
>  conf/machine/include/soc-family.inc |    3 +++
>  conf/machine/include/ti33x.inc      |    1 +
>  conf/machine/include/ti814x.inc     |    1 +
>  conf/machine/include/ti816x.inc     |    1 +
>  7 files changed, 9 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/include/soc-family.inc
> 
> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
> index 8fc0903..9cafe85 100644
> --- a/conf/machine/include/omap3.inc
> +++ b/conf/machine/include/omap3.inc
> @@ -1,4 +1,5 @@
>  SOC_FAMILY = "omap3"
> +require conf/machine/include/soc-family.inc
>  
>  require conf/machine/include/tune-cortexa8.inc
>  PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
> diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
> index 84b7742..a295352 100644
> --- a/conf/machine/include/omap4.inc
> +++ b/conf/machine/include/omap4.inc
> @@ -1,4 +1,5 @@
>  SOC_FAMILY = "omap4"
> +require conf/machine/include/soc-family.inc
>  
>  require conf/machine/include/tune-cortexa8.inc
>  
> diff --git a/conf/machine/include/omapl138.inc b/conf/machine/include/omapl138.inc
> index 4c22275..1949642 100644
> --- a/conf/machine/include/omapl138.inc
> +++ b/conf/machine/include/omapl138.inc
> @@ -1 +1,2 @@
>  SOC_FAMILY = "omapl138"
> +require conf/machine/include/soc-family.inc
> diff --git a/conf/machine/include/soc-family.inc b/conf/machine/include/soc-family.inc
> new file mode 100644
> index 0000000..39ca338
> --- /dev/null
> +++ b/conf/machine/include/soc-family.inc
> @@ -0,0 +1,3 @@
> +# Add SOC_FAMILY to machine overrides so we get access to e.g. 'omap3' and 'ti335x'
> +MACHINEOVERRIDES .= "${@['', ':${SOC_FAMILY}']['${SOC_FAMILY}' != '']}"
> +
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> index fb8bad3..f4954f5 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -1,4 +1,5 @@
>  SOC_FAMILY = "ti33x"
> +require conf/machine/include/soc-family.inc
>  
>  require conf/machine/include/tune-cortexa8.inc
>  PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
> diff --git a/conf/machine/include/ti814x.inc b/conf/machine/include/ti814x.inc
> index 23b6a1d..c53557f 100644
> --- a/conf/machine/include/ti814x.inc
> +++ b/conf/machine/include/ti814x.inc
> @@ -1,4 +1,5 @@
>  SOC_FAMILY = "ti814x"
> +require conf/machine/include/soc-family.inc
>  
>  require conf/machine/include/tune-cortexa8.inc
>  
> diff --git a/conf/machine/include/ti816x.inc b/conf/machine/include/ti816x.inc
> index 06cb7c0..2fe4006 100644
> --- a/conf/machine/include/ti816x.inc
> +++ b/conf/machine/include/ti816x.inc
> @@ -1,4 +1,5 @@
>  SOC_FAMILY = "ti816x"
> +require conf/machine/include/soc-family.inc
>  
>  require conf/machine/include/tune-cortexa8.inc
>  
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

