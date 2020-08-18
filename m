Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.76302.1597785781503819739
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 14:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BC91C40C35;
	Tue, 18 Aug 2020 21:23:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MimGXSQssw0; Tue, 18 Aug 2020 21:23:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 86F0040AB7;
	Tue, 18 Aug 2020 21:22:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DDC72174464; Tue, 18 Aug 2020 17:22:57 -0400 (EDT)
Date: Tue, 18 Aug 2020 17:22:57 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Alessio Igor Bogani <alessio.bogani@elettra.eu>
Cc: Denys Dmytriyenko <denys@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] Replace hard-coded lib with base_libdir variable
Message-ID: <20200818212257.GL17660@denix.org>
References: <20200814222804.GO13081@beryl>
 <20200815122131.19FC535014E4_F37D34BB@spam.elettra.eu>
MIME-Version: 1.0
In-Reply-To: <20200815122131.19FC535014E4_F37D34BB@spam.elettra.eu>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 15, 2020 at 02:21:18PM +0200, Alessio Igor Bogani wrote:
> Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
> ---
>  recipes-bsp/pru/pru-icss_git.bb | 320 ++++++++++++++++----------------
>  1 file changed, 160 insertions(+), 160 deletions(-)
> 
> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
> index 23097d97..eda235de 100644
> --- a/recipes-bsp/pru/pru-icss_git.bb
> +++ b/recipes-bsp/pru/pru-icss_git.bb
> @@ -53,11 +53,11 @@ do_compile() {
>  
>  do_install() {
>      CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -    install -d ${D}/lib/firmware/pru
> +    install -d ${D}${base_libdir}/firmware/pru
>      install -d ${D}${includedir}
>      cp ${CP_ARGS} ${S}/include/* ${D}${includedir}
> -    install -d ${D}${libdir}
> -    install -m 0644 ${S}/lib/rpmsg_lib.lib ${D}${libdir}
> +    install -d ${D}${base_libdir}
> +    install -m 0644 ${S}/lib/rpmsg_lib.lib ${D}${base_libdir}

Somehow I missed this part ^^^^
Why is this change? It has nothing to do with hardcoded /lib and it causes 
am335x platforms to break building other firmware images that link against 
rpmsg_lib.lib which is expected to be in ${libdir} :(


>  }
>  
>  FILES_${PN}-staticdev = "${libdir}"
> @@ -65,49 +65,49 @@ FILES_${PN}-dev = "${includedir}"
>  
>  do_install_append_ti33x() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${base_libdir}/firmware/pru
>      for i in 0 1
>      do
>          install -m 0644 ${S}/examples/am335x/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
> -                        ${D}/lib/firmware/pru
> +                        ${D}${base_libdir}/firmware/pru
>      done
>  }
>  
>  do_install_append_ti43x() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${base_libdir}/firmware/pru
>      for i in 0 1
>      do
>          for j in 0 1
>          do
>              install -m 0644 ${S}/examples/am437x/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${base_libdir}/firmware/pru
>          done
>      done
>  }
>  
>  do_install_append_omap-a15() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${base_libdir}/firmware/pru
>      for i in 1 2
>      do
>          for j in 0 1
>          do
>              install -m 0644 ${S}/examples/am572x/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${base_libdir}/firmware/pru
>          done
>      done
>  }
>  
>  do_install_append_k2g() {
>      install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${base_libdir}/firmware/pru
>      for i in 0 1
>      do
>          for j in 0 1
>          do
>              install -m 0644 ${S}/examples/k2g/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${base_libdir}/firmware/pru
>          done
>      done
>  }
> @@ -116,20 +116,20 @@ do_install_append_am65xx() {
>      for i in 0 1 
>      do
>          install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${base_libdir}/firmware/pru
>          install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${base_libdir}/firmware/pru
>          install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i}/TX_PRU_Halt_${i}.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${base_libdir}/firmware/pru
>      done
>      for i in 0 1 2
>      do
>          for j in 0 1
>          do
>              install -m 0644 ${S}/examples/am65x/PRU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${base_libdir}/firmware/pru
>              install -m 0644 ${S}/examples/am65x/RTU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${base_libdir}/firmware/pru
>  
>          done
>      done
> @@ -139,28 +139,28 @@ do_install_append_j7() {
>      for i in 0 1
>      do
>          install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${base_libdir}/firmware/pru
>          install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${base_libdir}/firmware/pru
>          install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i}/TX_PRU_Halt_${i}.out \
> -                   ${D}/lib/firmware/pru
> +                   ${D}${base_libdir}/firmware/pru
>      done
>      for i in 0 1
>      do
>          for j in 0 1
>          do
>              install -m 0644 ${S}/examples/j721e/PRU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${base_libdir}/firmware/pru
>              install -m 0644 ${S}/examples/j721e/RTU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
> -                            ${D}/lib/firmware/pru
> +                            ${D}${base_libdir}/firmware/pru
>  
>          done
>      done
>  }
>  
>  
> -FILES_${PN}-halt = "/lib/firmware/pru/PRU_Halt* /lib/firmware/pru/RTU_Halt* /lib/firmware/pru/TX_PRU_Halt*"
> -FILES_${PN}-rpmsg-echo = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt* /lib/firmware/pru/RTU_RPMsg_Echo_Interrupt*"
> +FILES_${PN}-halt = "${base_libdir}/firmware/pru/PRU_Halt* ${base_libdir}/firmware/pru/RTU_Halt* ${base_libdir}/firmware/pru/TX_PRU_Halt*"
> +FILES_${PN}-rpmsg-echo = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt* ${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt*"
>  
>  # Set up names for the firmwares
>  PRU_ICSS_ALTERNATIVES_ti33x    = "am335x-pru0-fw am335x-pru1-fw"
> @@ -171,55 +171,55 @@ PRU_ICSS_ALTERNATIVES_am65xx   = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-f
>  PRU_ICSS_ALTERNATIVES_j7       = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
>  
>  # Set up link names for the firmwares
> -ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "/lib/firmware/am335x-pru0-fw"
> -ALTERNATIVE_LINK_NAME[am335x-pru1-fw] = "/lib/firmware/am335x-pru1-fw"
> -
> -ALTERNATIVE_LINK_NAME[am437x-pru0_0-fw] = "/lib/firmware/am437x-pru0_0-fw"
> -ALTERNATIVE_LINK_NAME[am437x-pru0_1-fw] = "/lib/firmware/am437x-pru0_1-fw"
> -ALTERNATIVE_LINK_NAME[am437x-pru1_0-fw] = "/lib/firmware/am437x-pru1_0-fw"
> -ALTERNATIVE_LINK_NAME[am437x-pru1_1-fw] = "/lib/firmware/am437x-pru1_1-fw"
> -
> -ALTERNATIVE_LINK_NAME[am57xx-pru1_0-fw] = "/lib/firmware/am57xx-pru1_0-fw"
> -ALTERNATIVE_LINK_NAME[am57xx-pru1_1-fw] = "/lib/firmware/am57xx-pru1_1-fw"
> -ALTERNATIVE_LINK_NAME[am57xx-pru2_0-fw] = "/lib/firmware/am57xx-pru2_0-fw"
> -ALTERNATIVE_LINK_NAME[am57xx-pru2_1-fw] = "/lib/firmware/am57xx-pru2_1-fw"
> -
> -ALTERNATIVE_LINK_NAME[k2g-pru0_0-fw] = "/lib/firmware/k2g-pru0_0-fw"
> -ALTERNATIVE_LINK_NAME[k2g-pru0_1-fw] = "/lib/firmware/k2g-pru0_1-fw"
> -ALTERNATIVE_LINK_NAME[k2g-pru1_0-fw] = "/lib/firmware/k2g-pru1_0-fw"
> -ALTERNATIVE_LINK_NAME[k2g-pru1_1-fw] = "/lib/firmware/k2g-pru1_1-fw"
> -
> -ALTERNATIVE_LINK_NAME[am65x-pru0_0-fw] = "/lib/firmware/am65x-pru0_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-pru0_1-fw] = "/lib/firmware/am65x-pru0_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-pru1_0-fw] = "/lib/firmware/am65x-pru1_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-pru1_1-fw] = "/lib/firmware/am65x-pru1_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-pru2_0-fw] = "/lib/firmware/am65x-pru2_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-pru2_1-fw] = "/lib/firmware/am65x-pru2_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-rtu0_0-fw] = "/lib/firmware/am65x-rtu0_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-rtu0_1-fw] = "/lib/firmware/am65x-rtu0_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-rtu1_0-fw] = "/lib/firmware/am65x-rtu1_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] = "/lib/firmware/am65x-rtu1_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] = "/lib/firmware/am65x-rtu2_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] = "/lib/firmware/am65x-rtu2_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-txpru0_0-fw] = "/lib/firmware/am65x-txpru0_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-txpru0_1-fw] = "/lib/firmware/am65x-txpru0_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-txpru1_0-fw] = "/lib/firmware/am65x-txpru1_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-txpru1_1-fw] = "/lib/firmware/am65x-txpru1_1-fw"
> -ALTERNATIVE_LINK_NAME[am65x-txpru2_0-fw] = "/lib/firmware/am65x-txpru2_0-fw"
> -ALTERNATIVE_LINK_NAME[am65x-txpru2_1-fw] = "/lib/firmware/am65x-txpru2_1-fw"
> -
> -ALTERNATIVE_LINK_NAME[j7-pru0_0-fw] = "/lib/firmware/j7-pru0_0-fw"
> -ALTERNATIVE_LINK_NAME[j7-pru0_1-fw] = "/lib/firmware/j7-pru0_1-fw"
> -ALTERNATIVE_LINK_NAME[j7-pru1_0-fw] = "/lib/firmware/j7-pru1_0-fw"
> -ALTERNATIVE_LINK_NAME[j7-pru1_1-fw] = "/lib/firmware/j7-pru1_1-fw"
> -ALTERNATIVE_LINK_NAME[j7-rtu0_0-fw] = "/lib/firmware/j7-rtu0_0-fw"
> -ALTERNATIVE_LINK_NAME[j7-rtu0_1-fw] = "/lib/firmware/j7-rtu0_1-fw"
> -ALTERNATIVE_LINK_NAME[j7-rtu1_0-fw] = "/lib/firmware/j7-rtu1_0-fw"
> -ALTERNATIVE_LINK_NAME[j7-rtu1_1-fw] = "/lib/firmware/j7-rtu1_1-fw"
> -ALTERNATIVE_LINK_NAME[j7-txpru0_0-fw] = "/lib/firmware/j7-txpru0_0-fw"
> -ALTERNATIVE_LINK_NAME[j7-txpru0_1-fw] = "/lib/firmware/j7-txpru0_1-fw"
> -ALTERNATIVE_LINK_NAME[j7-txpru1_0-fw] = "/lib/firmware/j7-txpru1_0-fw"
> -ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "/lib/firmware/j7-txpru1_1-fw"
> +ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "${base_libdir}/firmware/am335x-pru0-fw"
> +ALTERNATIVE_LINK_NAME[am335x-pru1-fw] = "${base_libdir}/firmware/am335x-pru1-fw"
> +
> +ALTERNATIVE_LINK_NAME[am437x-pru0_0-fw] = "${base_libdir}/firmware/am437x-pru0_0-fw"
> +ALTERNATIVE_LINK_NAME[am437x-pru0_1-fw] = "${base_libdir}/firmware/am437x-pru0_1-fw"
> +ALTERNATIVE_LINK_NAME[am437x-pru1_0-fw] = "${base_libdir}/firmware/am437x-pru1_0-fw"
> +ALTERNATIVE_LINK_NAME[am437x-pru1_1-fw] = "${base_libdir}/firmware/am437x-pru1_1-fw"
> +
> +ALTERNATIVE_LINK_NAME[am57xx-pru1_0-fw] = "${base_libdir}/firmware/am57xx-pru1_0-fw"
> +ALTERNATIVE_LINK_NAME[am57xx-pru1_1-fw] = "${base_libdir}/firmware/am57xx-pru1_1-fw"
> +ALTERNATIVE_LINK_NAME[am57xx-pru2_0-fw] = "${base_libdir}/firmware/am57xx-pru2_0-fw"
> +ALTERNATIVE_LINK_NAME[am57xx-pru2_1-fw] = "${base_libdir}/firmware/am57xx-pru2_1-fw"
> +
> +ALTERNATIVE_LINK_NAME[k2g-pru0_0-fw] = "${base_libdir}/firmware/k2g-pru0_0-fw"
> +ALTERNATIVE_LINK_NAME[k2g-pru0_1-fw] = "${base_libdir}/firmware/k2g-pru0_1-fw"
> +ALTERNATIVE_LINK_NAME[k2g-pru1_0-fw] = "${base_libdir}/firmware/k2g-pru1_0-fw"
> +ALTERNATIVE_LINK_NAME[k2g-pru1_1-fw] = "${base_libdir}/firmware/k2g-pru1_1-fw"
> +
> +ALTERNATIVE_LINK_NAME[am65x-pru0_0-fw] = "${base_libdir}/firmware/am65x-pru0_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-pru0_1-fw] = "${base_libdir}/firmware/am65x-pru0_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-pru1_0-fw] = "${base_libdir}/firmware/am65x-pru1_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-pru1_1-fw] = "${base_libdir}/firmware/am65x-pru1_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-pru2_0-fw] = "${base_libdir}/firmware/am65x-pru2_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-pru2_1-fw] = "${base_libdir}/firmware/am65x-pru2_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-rtu0_0-fw] = "${base_libdir}/firmware/am65x-rtu0_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-rtu0_1-fw] = "${base_libdir}/firmware/am65x-rtu0_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-rtu1_0-fw] = "${base_libdir}/firmware/am65x-rtu1_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] = "${base_libdir}/firmware/am65x-rtu1_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] = "${base_libdir}/firmware/am65x-rtu2_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] = "${base_libdir}/firmware/am65x-rtu2_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru0_0-fw] = "${base_libdir}/firmware/am65x-txpru0_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru0_1-fw] = "${base_libdir}/firmware/am65x-txpru0_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru1_0-fw] = "${base_libdir}/firmware/am65x-txpru1_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru1_1-fw] = "${base_libdir}/firmware/am65x-txpru1_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru2_0-fw] = "${base_libdir}/firmware/am65x-txpru2_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru2_1-fw] = "${base_libdir}/firmware/am65x-txpru2_1-fw"
> +
> +ALTERNATIVE_LINK_NAME[j7-pru0_0-fw] = "${base_libdir}/firmware/j7-pru0_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-pru0_1-fw] = "${base_libdir}/firmware/j7-pru0_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-pru1_0-fw] = "${base_libdir}/firmware/j7-pru1_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-pru1_1-fw] = "${base_libdir}/firmware/j7-pru1_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-rtu0_0-fw] = "${base_libdir}/firmware/j7-rtu0_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-rtu0_1-fw] = "${base_libdir}/firmware/j7-rtu0_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-rtu1_0-fw] = "${base_libdir}/firmware/j7-rtu1_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-rtu1_1-fw] = "${base_libdir}/firmware/j7-rtu1_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-txpru0_0-fw] = "${base_libdir}/firmware/j7-txpru0_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-txpru0_1-fw] = "${base_libdir}/firmware/j7-txpru0_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-txpru1_0-fw] = "${base_libdir}/firmware/j7-txpru1_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "${base_libdir}/firmware/j7-txpru1_1-fw"
>  
>  # Create the pru-icss-halt firmware alternatives
>  ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
> @@ -228,55 +228,55 @@ ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
>  ALTERNATIVE_pru-icss-halt_append_am65xx = " am65x-txpru0_0-fw am65x-txpru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_1-fw"
>  ALTERNATIVE_pru-icss-halt_append_j7 = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
>  
> -ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> -ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_0-fw] = "${base_libdir}/firmware/pru/RTU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_1-fw] = "${base_libdir}/firmware/pru/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] = "${base_libdir}/firmware/pru/RTU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] = "${base_libdir}/firmware/pru/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] = "${base_libdir}/firmware/pru/RTU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] = "${base_libdir}/firmware/pru/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_0-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_1-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_0-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_1-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_0-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_1-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_1.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_0-fw] = "${base_libdir}/firmware/pru/RTU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_1-fw] = "${base_libdir}/firmware/pru/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_0-fw] = "${base_libdir}/firmware/pru/RTU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_1-fw] = "${base_libdir}/firmware/pru/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_0-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_1-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_0-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_1-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_1.out"
>  
>  
>  ALTERNATIVE_PRIORITY_pru-icss-halt = "50"
> @@ -284,45 +284,45 @@ ALTERNATIVE_PRIORITY_pru-icss-halt = "50"
>  # Create the pru-icss-rpmsg-echo firmware alternatives
>  ALTERNATIVE_pru-icss-rpmsg-echo = "${PRU_ICSS_ALTERNATIVES}"
>  
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt2_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt2_1.out"
> -
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
> -ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_0-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_1-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_0-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_1-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_0-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt2_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt2_1.out"
> +
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_0-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_1-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_0-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
> +ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_1-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
>  
>  ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo = "100"
>  
> -- 
> 2.17.1
> 

> 

