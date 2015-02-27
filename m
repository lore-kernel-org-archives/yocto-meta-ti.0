Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95698E00404; Fri, 27 Feb 2015 13:29:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 379D0E00321
	for <meta-ti@yoctoproject.org>; Fri, 27 Feb 2015 13:29:41 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1RLTePL006916
	for <meta-ti@yoctoproject.org>; Fri, 27 Feb 2015 15:29:40 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RLTdeh007446
	for <meta-ti@yoctoproject.org>; Fri, 27 Feb 2015 15:29:39 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 27 Feb 2015 15:29:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RLTa6i027231	for
	<meta-ti@yoctoproject.org>; Fri, 27 Feb 2015 15:29:38 -0600
Date: Fri, 27 Feb 2015 16:29:33 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20150227212931.GL6052@edge>
References: <1425066577-25435-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1425066577-25435-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH master] kernel .inc: fix the breakage due to S!=B separation in master
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
X-List-Received-Date: Fri, 27 Feb 2015 21:29:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Actually, this change is generic enough and works fine on daisy, where B==S


On Fri, Feb 27, 2015 at 02:49:37PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-kernel/linux/multi-kernel.inc    |  7 +++----
>  recipes-kernel/linux/setup-defconfig.inc | 20 ++++++++++----------
>  2 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
> index b3358f9..5d21d4e 100644
> --- a/recipes-kernel/linux/multi-kernel.inc
> +++ b/recipes-kernel/linux/multi-kernel.inc
> @@ -54,7 +54,7 @@ do_compileconfigs () {
>  
>          for configname in ${WORKDIR}/configs/* ; do
>              # Copy in alternative config
> -            cd ${S}
> +            cd ${B}
>              cp $configname ${WORKDIR}/defconfig
>  
>              # Build and Install this alternative kernel
> @@ -96,7 +96,7 @@ do_compileconfigs () {
>  
>          # Restore the regular 'defconfig'
>          cp ${WORKDIR}/defconfig.save ${WORKDIR}/defconfig
> -        cd ${S}
> +        cd ${B}
>          do_configure
>      fi
>  }
> @@ -106,8 +106,7 @@ do_deploy_append () {
>      install -d ${DEPLOYDIR}
>  
>      # Drop the regular defconfig along side the others for consistency
> -    cd ${S}
> -    cp .config ${DEPLOYDIR}/config-${PV}-${PR}-${MACHINE}.config
> +    cp ${B}/.config ${DEPLOYDIR}/config-${PV}-${PR}-${MACHINE}.config
>  
>      # add symlink
>      cd ${DEPLOYDIR}
> diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
> index 2c169cd..2b67bfc 100644
> --- a/recipes-kernel/linux/setup-defconfig.inc
> +++ b/recipes-kernel/linux/setup-defconfig.inc
> @@ -11,27 +11,27 @@ do_configure() {
>      # Always copy the defconfig file to .config to keep consistency
>      # between the case where there is a real config and the in kernel
>      # tree config
> -    cp ${WORKDIR}/defconfig ${S}/.config
> +    cp ${WORKDIR}/defconfig ${B}/.config
>  
>      echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
>      echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
>  
>      # First, check if pointing to a combined config with config fragments
> -    config=`cat ${S}/.config | grep use-combined-config | cut -d= -f2`
> +    config=`cat ${B}/.config | grep use-combined-config | cut -d= -f2`
>      if [ -n "$config" ]
>      then
> -        cp $config ${S}/.config
> +        cp ${S}/$config ${B}/.config
>      fi
>  
>      # Second, extract any config fragments listed in the defconfig
> -    config=`cat ${S}/.config | grep config-fragment | cut -d= -f2`
> +    config=`cat ${B}/.config | grep config-fragment | cut -d= -f2`
>      if [ -n "$config" ]
>      then
>          configfrags=""
>          for f in $config
>          do
>              # Check if the config fragment is available
> -            if [ ! -e "$f" ]
> +            if [ ! -e "${S}/$f" ]
>              then
>                  echo "Could not find kernel config fragment $f"
>                  exit 1
> @@ -43,12 +43,12 @@ do_configure() {
>      fi
>  
>      # Third, check if pointing to a known in kernel defconfig
> -    config=`cat ${S}/.config | grep use-kernel-config | cut -d= -f2`
> +    config=`cat ${B}/.config | grep use-kernel-config | cut -d= -f2`
>      if [ -n "$config" ]
>      then
> -        oe_runmake $config
> +        oe_runmake -C ${S} O=${B} $config
>      else
> -        yes '' | oe_runmake oldconfig
> +        yes '' | oe_runmake -C ${S} O=${B} oldconfig
>      fi
>  
>      # Fourth, handle config fragments specified in the recipe
> @@ -70,7 +70,7 @@ do_configure() {
>      # Now that all the fragments are located merge them
>      if [ -n "${KERNEL_CONFIG_FRAGMENTS}" -o -n "$configfrags" ]
>      then
> -        ( cd ${WORKDIR} && ${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config $configfrags ${KERNEL_CONFIG_FRAGMENTS} 1>&2 )
> -        yes '' | oe_runmake oldconfig
> +        ( cd ${WORKDIR} && ${S}/scripts/kconfig/merge_config.sh -m -r -O ${B} ${B}/.config $configfrags ${KERNEL_CONFIG_FRAGMENTS} 1>&2 )
> +        yes '' | oe_runmake -C ${S} O=${B} oldconfig
>      fi
>  }
> -- 
> 2.2.0
> 

